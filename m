Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 176C18C99ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 10:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IHPcsPjX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjWBW49ymz3cb4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjW9g50kgz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 18:35:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dpZt6/Fkp6cxSrkFSrKcy3qvvymahFE/nlsFRXFz8oo=; b=IHPcsPjXdZVdyEsUSG0KgQGlU3
	FH9erA1GmVZuG4RGyjZqvkb5FKg8LwSxvysjdg8a1kOx7kuGbY73hOznZcdeHxRhnbc/z3Op9DDmj
	9QpdDlW5tJo04MBjsoaubEGcvbKPwOzkrLGADWbi/CIcEVimMOI9V9vcHwm1sS9BHynbh4mkqU2R9
	PSpIWPC3RAIgIUAvi+Ugc4DNkeGVWpb6kpPJxQRNWBmTEKO6jkzcn2/1Mp8ULl3p+YpB31DPGJQc4
	vSCUCqM4Gh5kO9leuk21HSn7x5QA2jHmqcuE9fiZb1wIKSBJPn7oypp/mnU2gHHKiS5SqMKuLDdLe
	8OBEWz3Q==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8yUc-0000000FpGq-26qt;
	Mon, 20 May 2024 08:35:38 +0000
Message-ID: <d8c56e37-38c6-454e-81be-a574b42c83be@infradead.org>
Date: Mon, 20 May 2024 17:35:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
Subject: Re: CVE-2023-52665: powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
To: Michael Ellerman <mpe@ellerman.id.au>, cve@kernel.org,
 linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org
References: <2024051725-CVE-2023-52665-1d6f@gregkh>
 <87zfslufoo.fsf@mail.lhotse>
Content-Language: en-US
In-Reply-To: <87zfslufoo.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/24 16:04, Michael Ellerman wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> Description
>> ===========
>>
>> In the Linux kernel, the following vulnerability has been resolved:
>>
>> powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
>>
>> Commit 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian
>> builds"), merged in Linux-6.5-rc1 changes the calling ABI in a way
>> that is incompatible with the current code for the PS3's LV1 hypervisor
>> calls.
>>
>> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
>> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
>>
>> Fixes run time errors like these:
>>
>>   BUG: Kernel NULL pointer dereference at 0x00000000
>>   Faulting instruction address: 0xc000000000047cf0
>>   Oops: Kernel access of bad area, sig: 11 [#1]
>>   Call Trace:
>>   [c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
>>   [c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
>>   [c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8
>>
>> The Linux kernel CVE team has assigned CVE-2023-52665 to this issue.
> 
> IMHO this doesn't warrant a CVE. The crash mentioned above happens at
> boot, so the system is not vulnerable it's just broken :)

As Greg says, with PPC64_BIG_ENDIAN_ELF_ABI_V2 enabled the system won't
boot, so there is no chance of a vulnerability.

-Geoff

