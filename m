Return-Path: <linuxppc-dev+bounces-1263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09192975CDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3vlR4c87z2xHb;
	Thu, 12 Sep 2024 08:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726092339;
	cv=none; b=MKIF3gGGKtzySaajWGNrxniWd+zw+w9kuCZbymQ1Uz3Z8Be+OwOEIKv5zqRdMeW6vfPUSuJFnjAdw+rX40+CWlgCV4U/42XBoTEJVTx5R8ryWzHEILFsV9760aWLDfKlO2Is+nWC3zVcSSiwQwKXMHArg/kY1gNZMGiP+B58Tso2eu6KHPGlWbKYTN7WIHCf0q7SaFyF0dEN8yxJ/vlLNsf8NN+X/jA48FDRxkggwUjtmdpGf7V50/0BqKzjIkCfVNpppjimGWz5fQxzm3NhdrmzQAO347LJWcdm1lVL4azyxy2vSl4P1pzCh+GLjF/GUa4AUvcgpIGm9idcxUtBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726092339; c=relaxed/relaxed;
	bh=uSnPM7Z73BdDwIKjWD3zfTeRtaq8wKDl6kU6LBNgXKw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=QDuZDGhJdbRXsxmO74JWhTxCrQ1l/2Q7NHHioKGFTmJGM21SRNGaW8B6rEremjMQqNPwkNLdCotH32nshGbfQdDzyR1ju4t+nDUnzIelCQrmYmCWReLzuX2Kles31olPWDhwtjKo4BKu9/rx6S0mCSL+IdrgcLgINYK5HvezHgNUmBBqIL1+5mjMsTUueeXLbkZTI/AGmc/kQbBDl/YBQRYQax4ylVjCTKW0B2x9SGAgoAo0tdVRJnpzFH9O01VZyutXze1UShuZTZeKumVZ2UXeEOhZmgrlz7NL/zEtfvbWZMTasE8PjDoJ+zxhWjd39ZdWE82sNmLS7MP28j4m5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RJLtWFXf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mbtizgskdb87jgojig9rdnbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RJLtWFXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mbtizgskdb87jgojig9rdnbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3vlR1R2nz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:05:38 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1d10fde51cso762919276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726092337; x=1726697137; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSnPM7Z73BdDwIKjWD3zfTeRtaq8wKDl6kU6LBNgXKw=;
        b=RJLtWFXfB37V1uFgtW7xDUgg3Ib5CysKXU2QK8OwaABixl3y1iVM/dSCrFBPVCp7wC
         CeVHJ2dez8YLSyrFaHNPrL3RAXUGOQyr57wnkVCx3M76Czo1xFwYTk+SYbthwbJku9Dh
         C9Sq17nbs08Nk96n3lqQTteI9sv8IpKc2K8lmUk/Jv1YRuBvSpPTDnLOEoFKs+Mn6vcJ
         kMLVIIkh+P3BKPe1IHp5gyWGvk9gSdX56U70+KrknXjX6Zd7U2CnhRUitnLNOloXATIg
         xluWaSOIgGN85P0IK+zhJAnAdT8cjdOTjbSlmofyb4ldKA46hWCVy6FLN1BiKqchG2ZZ
         Pbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726092337; x=1726697137;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSnPM7Z73BdDwIKjWD3zfTeRtaq8wKDl6kU6LBNgXKw=;
        b=MtXLnwYcp8bcUWEolrN0w1YJDszHATTonz87/RX3C4pU7kVTBepkpQtsCTEDBsd7K2
         BSqxskcmLUrT99sEay3CoojiSKP2A8RnCEAkrt7L6phezYXolHbZhpIrzyoBxyYNXZEJ
         uGB3f73FjTU+OJC/fY76LugRgGUgbvlZbjvJj4prnamd1LS4zq3gxeO7zqdE+2bKoTpb
         +eA9Bxdg4aaRN8zcTk4HNTuztoi+T457q5n8x4b2Ae8OA92U5WERXyOKcpbH3VD7q7aT
         vME/hvSURpwdBq6J/2x5IehL6kkC77j8QuniwMJPuS296kcFTe+o74hBnPSLCxOx0TaJ
         DlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh1qlVFpDBcd92bcammV70jBSCnaf6JFny7HiicIxDcFAE10WGyoQ9si9YanudZ/+gPlKiLXbQaZjDlzQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yywm5KUeC5WiI4kO66XJxiHsPUCrbdg+LPonAgK7FWsTuYlV77R
	kQ+Lw/56ttIWhmxmzE5MNR/H9+KcZ2vOs+2pXS2tiKhOWVE+lOdEbXyF1Zb+A+KGl8XTNBURp3J
	mVwt0KzDmLt2qdOCgRuhyKA==
X-Google-Smtp-Source: AGHT+IF9AOcID1tAjXrc0JMac0EDJz+dHtqrQkj3EUSn3vqGuyTbyD2exFl+z4P0Z9sNallPuFjPTF0m9Vi898GeuQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:aa87:0:b0:e0b:fe07:1e22 with SMTP
 id 3f1490d57ef6-e1d9db996f3mr4706276.1.1726092336807; Wed, 11 Sep 2024
 15:05:36 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:05:35 +0000
In-Reply-To: <Ztl4TDI98tnCkH0X@gmail.com> (message from Ingo Molnar on Thu, 5
 Sep 2024 11:22:20 +0200)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsnto74tdexc.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	will@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	naveen@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Ingo Molnar <mingo@kernel.org> writes:

> * Colton Lewis <coltonlewis@google.com> wrote:

>> Break the assignment logic for misc flags into their own respective
>> functions to reduce the complexity of the nested logic.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
>>   arch/x86/include/asm/perf_event.h |  2 ++
>>   2 files changed, 25 insertions(+), 8 deletions(-)

>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 760ad067527c..87457e5d7f65 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -2948,16 +2948,34 @@ unsigned long  
>> perf_arch_instruction_pointer(struct pt_regs *regs)
>>   	return regs->ip + code_segment_base(regs);
>>   }

>> +static unsigned long common_misc_flags(struct pt_regs *regs)
>> +{
>> +	if (regs->flags & PERF_EFLAGS_EXACT)
>> +		return PERF_RECORD_MISC_EXACT_IP;
>> +
>> +	return 0;
>> +}
>> +
>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>> +{
>> +	unsigned long guest_state = perf_guest_state();
>> +	unsigned long flags = common_misc_flags();
>> +
>> +	if (guest_state & PERF_GUEST_USER)
>> +		flags |= PERF_RECORD_MISC_GUEST_USER;
>> +	else if (guest_state & PERF_GUEST_ACTIVE)
>> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>> +
>> +	return flags;
>> +}
>> +
>>   unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>>   {
>>   	unsigned int guest_state = perf_guest_state();
>> -	int misc = 0;
>> +	unsigned long misc = common_misc_flags();

> So I'm quite sure this won't even build at this point ...

Must have been a wrongly resolved conflict after rebase. I had thought I
rebuilt before sending but something slipped.

It's fixed

> Thanks,

> 	Ingo

