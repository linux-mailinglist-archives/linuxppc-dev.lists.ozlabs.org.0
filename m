Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A6745B13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 13:30:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bzAC5O3i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvkHV0ykWz3bPV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 21:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bzAC5O3i;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvkGb2S6xz309D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 21:29:27 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QvkGY3BDGz4wxR; Mon,  3 Jul 2023 21:29:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688383765;
	bh=39RVXUU5lB2TgVWJpbZecvyXinVpmzEajxt6j7I3cEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bzAC5O3ioZuX/Bjy+iGjMTBvtjN2OfgfaBLCFP5eCFocWzGc5+Jb1QNRqMd0Lg5Dg
	 zLpS1hoB4G/EpsDuFT+WrtDw/LISM+3Upsg86k2G5QhWB83NxKVwtJhQR9qxH5pjWz
	 rItN04lvNKeilvdFf5okUTIK/L6qmvdYgDrQYL2DxsGU537tKXsbMxQ26cXFZWplID
	 gvvYT75e0rAyDFCErWo+L0utmVH4gZBSwuuWOHdMoE8qBmotfnR6RpKIs3vjDJSWru
	 DDSKU9nConidzzs0eTlaOI1YCaj84tCCWMfZX7BL+9KSHvsidsfYX6rniCreU/0U7B
	 tRkZzGE7C16nQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvkGY1rz0z4wqZ;
	Mon,  3 Jul 2023 21:29:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/fadump: reset dump area size variable if
 memblock reserve fails
In-Reply-To: <ed637200-537f-70a5-bf40-ceefb2092e1e@linux.ibm.com>
References: <20230608092246.343761-1-sourabhjain@linux.ibm.com>
 <ed637200-537f-70a5-bf40-ceefb2092e1e@linux.ibm.com>
Date: Mon, 03 Jul 2023 21:29:17 +1000
Message-ID: <875y71w7w2.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mahesh@linux.vnet.ibm.com, Mahesh Salgaonkar <mahesh@linux.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> Hello Michael,
>
> Do you have any feedback or comments regarding this patch?
>
> Thanks,
> Sourabh
>
> On 08/06/23 14:52, Sourabh Jain wrote:
>> If the memory reservation process (memblock_reserve) fails to reserve
>> the memory, the reserve dump variable retains the dump area size.
>> Consequently, the size of the dump area calculated for reservation
>> is displayed in /sys/kernel/fadump/mem_reserved.
>>
>> To resolve this issue, the reserve dump area size variable is set to 0
>> if the memblock_reserve fails to reserve memory.
>>
>> Fixes: 8255da95e545 ("powerpc/fadump: release all the memory above boot memory size")
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index ea0a073abd96..a8f2c3b2fa1e 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -641,6 +641,7 @@ int __init fadump_reserve_mem(void)
>>   			goto error_out;
>>   
>>   		if (memblock_reserve(base, size)) {
>> +			fw_dump.reserve_dump_area_size = 0;
>>   			pr_err("Failed to reserve memory!\n");
>>   			goto error_out;
>>   		}

Shouldn't reserve_dump_area_size be set to zero at error_out, which
already clears fadump_enabled?

	return ret;
error_out:
	fw_dump.fadump_enabled = 0;
	return 0;
}


Otherwise the code immediately above will suffer from the same issue
won't it?

		if (fw_dump.ops->fadump_setup_metadata &&
		    (fw_dump.ops->fadump_setup_metadata(&fw_dump) < 0))
			goto error_out;

cheers
