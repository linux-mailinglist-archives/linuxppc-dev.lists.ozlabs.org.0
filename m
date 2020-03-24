Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2151903E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:43:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mcXl3QnZzDqFt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mcW24kZbzDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:41:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bvDvGTG9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mcW21Lfbz9sRf;
 Tue, 24 Mar 2020 14:41:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585021310;
 bh=H6/itYAfy5Zw7sfa+Et/FKqLqq3c0OxUkcczCOcjPnA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bvDvGTG9TWCECh4NbKeeMxa5EH2WXXULDFMRMCsRiuYoywkrzl8QqiNcXU9XSp16m
 wmivvqiCW4mbe7hBJWcghicI0Hy05EjK4RVlDGiQAxb+AyAG2/F6QCRVzaD2uczQME
 Fzbu9HAVqcHZmaZI+CMkQWZ3o7lHatvNTzSou7KekCCXcIW8gVOrJAucHfaSkBJLKU
 NlMp6OFh41C8F1+EBa78caGSKbIr04cGYAGGOsC4mnExzD3V6qC6NPnUPlsbQb3xCi
 WOpHmcWOgQg3O1cOePLSvBhEYLvtAvnnIF10sL357L5mEdwgPPJKhYux+G1tK736an
 64kxy8bunolbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Haren Myneni <haren@linux.ibm.com>,
 herbert@gondor.apana.org.au
Subject: Re: [PATCH v4 3/9] powerpc/vas: Add VAS user space API
In-Reply-To: <875zevw61j.fsf@dja-thinkpad.axtens.net>
References: <1584934879.9256.15321.camel@hbabu-laptop>
 <1584936142.9256.15325.camel@hbabu-laptop>
 <878sjrwm72.fsf@dja-thinkpad.axtens.net> <878sjrclmz.fsf@mpe.ellerman.id.au>
 <875zevw61j.fsf@dja-thinkpad.axtens.net>
Date: Tue, 24 Mar 2020 14:41:55 +1100
Message-ID: <87zhc6xvuk.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Daniel Axtens <dja@axtens.net> writes:
>>> Haren Myneni <haren@linux.ibm.com> writes:
>>>> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
>>>> new file mode 100644
>>>> index 0000000..7d049af
>>>> --- /dev/null
>>>> +++ b/arch/powerpc/platforms/powernv/vas-api.c
>>>> @@ -0,0 +1,257 @@
>> ...
>>>> +
>>>> +static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
>>>> +{
>>>> +	struct vas_window *txwin = fp->private_data;
>>>> +	unsigned long pfn;
>>>> +	u64 paste_addr;
>>>> +	pgprot_t prot;
>>>> +	int rc;
>>>> +
>>>> +	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
>>>
>>> I think you said this should be 4096 rather than 64k, regardless of what
>>> PAGE_SIZE you are compiled with?
>>
>> You can't mmap less than a page, a page is PAGE_SIZE bytes.
>>
>> So if that checked for 4K explicitly it would prevent mmap on 64K
>> kernels always, which seems like not what you want?
>
> Ah. My bad. Carry on then :)

Well you were just quoting something from Haren, so I think it's over to
him.

cheers
