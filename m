Return-Path: <linuxppc-dev+bounces-2272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0A99E0E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 10:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSRsv39zpz2yZN;
	Tue, 15 Oct 2024 19:22:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728980547;
	cv=none; b=Gn368Isb1lyhYgqVlk2Jx5Vgo6zGbt0PD/l0fFJ52T7h1xyId30FXui12W/bzGfSnpOifP4xcuDuJ3sH0xgJuf/c/TUVS5wYqlyfoP0flIY8KoBu8+B4KOosdWvxOh54s3Rj+KzuiFBHwkn5DYKSbAT1ZTJ4y+RfTXnDeI3XOUpJ3mogDDy7dh4CP0hpK8d9bnC9+qrGZdpF8DbsFbNj3RdZiP9AunfgEsd+tGO7DqxXmjwXuPnzo4sjplCdK7aFwp0TJWPlCBoTh4nPSXEE3kmdBp2ZmEz2dcyiw49rSLD92/jvVrn/WMnsysNz+HNwsJm/DmMmvnwnQkAzMU6Zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728980547; c=relaxed/relaxed;
	bh=gSbjcDDQQ4bzhuGeYvy25HeVmQJUWahcI9kmdF2A54o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=V5j61EhDAyyPz/dGhxbf1u2EIRoh2b9uIIe1hOkOTm3BURCzbbsYqDpS0V/4ifDi4lQMaehD7SyF2yVwGDEn4UMQaDe3+of6n6jvrKZN0i1uMlVhxAgN5P0yHOaHhqgGf4RefLjjUyG1HkideVipyMkJz0EQnxmN8fmSih7cD4CKYk55HSs9p7Y4Qa07nNVjwTzeuc8pRKzwOJ99jmD6imnDVbtBxaDkRHBvHxNnJKvvJZyoszxoOxSab9MhAuxNIFl6/hiD1mzSegq7+y4cM2eDWL4pl1wTPAYSPO3E/Z3XpiqoCRGY2FQugcson45uFdSnCdRa/7Pj0/BWvOOHnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=irH4/Nj7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=irH4/Nj7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSRss46n2z2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 19:22:23 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20caccadbeeso36958705ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728980540; x=1729585340; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSbjcDDQQ4bzhuGeYvy25HeVmQJUWahcI9kmdF2A54o=;
        b=irH4/Nj7VUe/5GVnGs0dlvc6G35lVOxjXGPRGWD8TwL0HhJLNfoACrK2d13VUrOvBI
         j3cIjFG8Hb1EAWs7n4rQv/L7Kyo7V6FA1qRwdm7V9hFVjx1aIF6JPlSzHJYNXQ7Ercng
         rV+FjaOP5XgryzRdTD3GbOcpIXd9maatS7m6wh5pAPOzcldGnHLhjfk/DcdDmDjImd+O
         hD/o2Ejim6N8pkPjFwOrgxDIwqEkwdz6ErIhyfpHDZDOxGZioXLXM65UGkRD4yIgrwsN
         BsOXvr485BphOmSf4vWvC1zT8M50j+Hzj2emGF71PcE/HWPamr3SB0c/8d6p1y+q/rFk
         t2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980540; x=1729585340;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSbjcDDQQ4bzhuGeYvy25HeVmQJUWahcI9kmdF2A54o=;
        b=XsqPOC7Dfbe0+Wq4OItKAamKiwJW1Dfwb2HlpRGGsvvJ8mYW9IK5WMTY72N2cbgqeN
         VJIMUp14CGQ8GaU0Gi9JNE1Uz4c+oah1ItgYk77DPCCaBqC643C6uL1BDsdhmbmkG8BS
         finbEqTm84wH2K8U5Y2uplAMLaT1kHMHo4Gr9OAzOUCkz40CCYPp/FbAffdof3GCvEOv
         HJixRMOTbB3bM4o07XxXpWFTo4dk50MAeOdflkEB049QEWaaN2irydUS68Vtbuo79j/p
         xui9JhIW7Jp43vfKMPNMEsK5dNZL/hV0+PIEvmwf3+G5aAhvT/FyBkB15BY7Pt+ema3k
         RPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV87BQCJIjWHrBCBCN6ArKrvWgw+oBnaLUHmEGYCCp4UhdUCF5WnY6ow6XsvoWCwttlAujr4Xpk1zqpeQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmecnKgdY4DKg41MGhCZKS29A3ahBZ7IL5D+t7z/+Nl+Ne/tSO
	mJDmLtWnu0VipPHuiuRA/+npfBTm5toqhVVZCsFFaqhH+wel41di
X-Google-Smtp-Source: AGHT+IHa2gX9C4jAt0fiNSJu1J2m6zAiD1t3r4LEmOIsmYCZ5gXCIMP/YN4CTViiCc9odAQA4YjWww==
X-Received: by 2002:a17:902:e5ca:b0:20c:805a:524 with SMTP id d9443c01a7336-20ca16be1b7mr170171755ad.39.1728980539523;
        Tue, 15 Oct 2024 01:22:19 -0700 (PDT)
Received: from dw-tp ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17fa48b9sm7087565ad.85.2024.10.15.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:22:18 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, Heiko Carstens <hca@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Disha Goel <disgoel@linux.ibm.com>
Subject: Re: [RFC RESEND v2 02/13] powerpc: mm: Fix kfence page fault reporting
In-Reply-To: <660a2cf7-24f9-4558-87df-5e4c13362380@csgroup.eu>
Date: Tue, 15 Oct 2024 13:49:46 +0530
Message-ID: <877ca9zskd.fsf@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com> <6bf523aa03e72d701d24aca49b51864331eed2d5.1728954719.git.ritesh.list@gmail.com> <660a2cf7-24f9-4558-87df-5e4c13362380@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 15/10/2024 à 03:33, Ritesh Harjani (IBM) a écrit :
>> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
>> /proc/kcore can have some unmapped kfence objects which when read via
>> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
>> functions define their own fixup table for handling fault, use that
>> instead of asking kfence to handle such faults.
>> 
>> Hence we search the exception tables for the nip which generated the
>> fault. If there is an entry then we let the fixup table handler handle the
>> page fault by returning an error from within ___do_page_fault().
>> 
>> This can be easily triggered if someone tries to do dd from /proc/kcore.
>> dd if=/proc/kcore of=/dev/null bs=1M
>> 
>> <some example false negatives>
>> ===============================
>> BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
>> Invalid read at 0x000000004f749d2e:
>>   copy_from_kernel_nofault+0xb0/0x1c8
>>   0xc0000000057f7950
>>   read_kcore_iter+0x41c/0x9ac
>>   proc_reg_read_iter+0xe4/0x16c
>>   vfs_read+0x2e4/0x3b0
>>   ksys_read+0x88/0x154
>>   system_call_exception+0x124/0x340
>>   system_call_common+0x160/0x2c4
>> 
>> BUG: KFENCE: use-after-free read in copy_from_kernel_nofault+0xb0/0x1c8
>> Use-after-free read at 0x000000008fbb08ad (in kfence-#0):
>>   copy_from_kernel_nofault+0xb0/0x1c8
>>   0xc0000000057f7950
>>   read_kcore_iter+0x41c/0x9ac
>>   proc_reg_read_iter+0xe4/0x16c
>>   vfs_read+0x2e4/0x3b0
>>   ksys_read+0x88/0x154
>>   system_call_exception+0x124/0x340
>>   system_call_common+0x160/0x2c4
>> 
>> Guessing the fix should go back to when we first got kfence on PPC32.
>> 
>> Fixes: 90cbac0e995d ("powerpc: Enable KFENCE for PPC32")
>> Reported-by: Disha Goel <disgoel@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/fault.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 81c77ddce2e3..fa825198f29f 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -439,9 +439,17 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>>   	/*
>>   	 * The kernel should never take an execute fault nor should it
>>   	 * take a page fault to a kernel address or a page fault to a user
>> -	 * address outside of dedicated places
>> +	 * address outside of dedicated places.
>> +	 *
>> +	 * Rather than kfence reporting false negatives, let the fixup table
>> +	 * handler handle the page fault by returning SIGSEGV, if the fault
>> +	 * has come from functions like copy_from_kernel_nofault().
>>   	 */
>>   	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
>> +
>> +		if (search_exception_tables(instruction_pointer(regs)))
>> +			return SIGSEGV;
>
> This is a heavy operation. It should at least be done only when KFENCE 
> is built-in.
>
> kfence_handle_page_fault() bails out immediately when 
> is_kfence_address() returns false, and is_kfence_address() returns 
> always false when KFENCE is not built-in.
>
> So you could check that before calling the heavy weight 
> search_exception_tables().
>
> 		if (is_kfence_address(address) &&
> 		    !search_exception_tables(instruction_pointer(regs)) &&
> 		    kfence_handle_page_fault(address, is_write, regs))
> 			return 0;
>

Yes, thanks for the input. I agree with above. I will take that in v3.
I will wait for sometime for any review comments on other patches before
spinning a v3, though.

>
>
>  > +			return SIGSEGV;
>
>> +
>>   		if (kfence_handle_page_fault(address, is_write, regs))
>>   			return 0;
>>   

-ritesh

