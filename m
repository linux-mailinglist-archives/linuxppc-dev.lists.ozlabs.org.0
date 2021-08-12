Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49683E9F72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 09:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gldc26P6Zz3cJt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 17:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JYQ/0kDX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JYQ/0kDX; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GldbM4WhLz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 17:28:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GldbJ4Kwmz9sRN;
 Thu, 12 Aug 2021 17:28:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628753324;
 bh=HyJTfFqmFRObjIiJEFAn1BWI6SCwcu41W5r59B0/DhY=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=JYQ/0kDXr1OrQQHl4zGNJ2KdDj15nvgUU8gsWNmcJD0//gboLZX+CUOEVFXBhVdzZ
 3P3uAKvDWGd6atTxLhFDDpsE8Q8CzLTYekDnHIBMXYOsAi2whH0nFYX2SvaFJSmaaT
 Gf5C6SmbpHWiodgE2JYuj01sDxu4uSgE2uHaOYIk3ny0AGAi1+5WvfuTY7KLTVyWS7
 HyW/mLrVce2dWp6bsrB2SUuEoRSCxhznrHWAXsELwG+3PsqYjfUXs1NvdyYAYVIuCo
 DzrH3SPElVKvkLu8e8Svzex//1pRQfqaihjx3a7K4oxL2Mcu7pYovHUyJtCVNisln8
 hhGCSrrIeqtZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
In-Reply-To: <22c7c194-d75d-bf90-c8e5-83c995c7130c@csgroup.eu>
References: <20210810045307.11892-1-aneesh.kumar@linux.ibm.com>
 <22c7c194-d75d-bf90-c8e5-83c995c7130c@csgroup.eu>
Date: Thu, 12 Aug 2021 17:28:41 +1000
Message-ID: <87o8a3m89i.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 10/08/2021 =C3=A0 06:53, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_cei=
ling.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/book3s64/radix_tlb.c | 48 ++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>=20
>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book=
3s64/radix_tlb.c
>> index aefc100d79a7..5cca0fe130e7 100644
>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>> @@ -17,6 +17,7 @@
...
>> +
>> +static int __init create_tlb_single_page_flush_ceiling(void)
>> +{
>> +	debugfs_create_file("tlb_single_page_flush_ceiling", S_IRUSR | S_IWUSR,
>> +			    powerpc_debugfs_root, NULL, &fops_tlbflush);
>
> Could you just use debugfs_create_u32() instead of re-implementing simple=
 read and write ?

Yeah AFAICS that should work fine.

It could probably even be a u16?

cheers
