Return-Path: <linuxppc-dev+bounces-3151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 603669C7AFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 19:24:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpWsV0J3Tz2yfj;
	Thu, 14 Nov 2024 05:24:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731522285;
	cv=none; b=P73VOZvDHQ2s0NyVWY47tzSv0Ws3fEaVjKQUIC1pWenIB+wSPUVECviXZrVjj+6bgf5ASFQU5ARmYA40n22cyz09ocX+HYqADCzC9XLjMUB4Qs04vPKetI0C3Ky6uMDR58LKFUZGF1JXDx94RoOTqS0JS7gGKIp6Z//iy7XoUTJCmQEX9jqDpjgSziXsjITDiq7fJV5ZicrYVLBJe1Tp4wPWHeH/ShFxnuZ5Io7sws12paGIlTFf1qlBbvPc6Ism70Yl4euIoU+APdCEaPlmQX0ZusZZlWNMMO3dNPGHYHVVAL8Ai63XtSXfxauQuWG5sI9sy4JgMpDK2Q6kyhSN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731522285; c=relaxed/relaxed;
	bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=oasSKnm3AK+X2p+2In2+XkyuyZzMSaUKsT6fgOSMh7haN9VxUf7nTXq1eK112f9Em0gULY38fl+Wx/AzpIhv/3D5NU5aplpc6Kt3jToGs5PlPG80qeRj0dCEdYfDTgyInqE2BHuC2KUevHbrxxn6f/riNL9AUEMSycTcUtxwofQ6cAwPwmYiD0Gs2wtnFepZNFwdLCrRiC4nbfnFirzCY80Cfr6njulWM26SfXyLj9auP9tLtf5KJXVk7h//wFcOp4VxK6dh8Qvmanarlz1I6euigK0SLs1P85M+m9uBG+BcbrcT8jdcrCRZ1gX0Rjde9zK7E2UrgicTvqapoKitgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s77kyEuo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=35-40zwskdng6ifnihf8qcmaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s77kyEuo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=35-40zwskdng6ifnihf8qcmaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpWsS1l84z2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 05:24:42 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e293150c2c6so13189606276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 10:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731522280; x=1732127080; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=;
        b=s77kyEuovYgv0P4ztSNFPh9JleVSvNOXj0X+wC0UpBbJ64qfJNWQ/ot1ZCb9kETAHw
         EQjJ5eG4pV/Pvfl+Izt9bSqwWH9im3Uedf4m8znJbwgPOxW1oKQnhKvA3GX60Y3puzLS
         LqT/ELI/CCGP1uUwurGL2B8nsYM462BJdnu5djiDXAUKXtO7Tli3IO3+Dq/DiWhbGaMx
         aXxQmpaKZqW7GlqWhW64mzssgCo21hZvkvfgq+bFSioXfbTsRWHjI4afc6tdMjt+ATHf
         KuSc/7oKKHyH1UOe6WE84q1D9IjiRbztV/zrHU1QGiBXyazKvTuDeg2EmrbQFtw4pCNd
         kUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522280; x=1732127080;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=;
        b=Si4YEREAgKFXvBrpLkoCPpDB71AKQfYGQShYo6vOHTRzE5NjYfFbp6O+yn6vzzsLBz
         gzwTAV3xpi2bJwyIUJVgcPZPKPblaRmx9xbInvNoWeNVcktCmOcy9dLXrG8o9WC8NlTE
         h51yWU5ph3uGovcE5XHfY/evt/rmejV/zSmnga+VKNN/P5Q5vdAPVjAshPBR1SsONP3C
         z5aTs2n72UEKHvpoWpMe1KXoiZ/wz8zEKfM6ybuL1MLlTcMXHHeEbYp1Pas+NbtIoJa2
         r9NMq0fEbqzJXwtSxshbcTBM6o+jktDYr70jOcTyIfjINkGkj4Clbx3Z5Gd4OHHtkvAN
         zprQ==
X-Forwarded-Encrypted: i=1; AJvYcCVicw4nQjG/qmsTeSFE+X6pkhp2eUt6MqVTEk7cmb0MUjXsWQSMsECmNitzok+ujQ3RbsQJZ7bpe+atknw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1r22eSFEuORhRMeRiWsymRNfEg3g9Qq1MB36vjz7jUAB23dA3
	0L4RpTmsa7Dh6evN/zCjYIK+w+56W1M4uQZeGMHhyR+s5rwTwCE5Y7jf2050f0vpAg8t7XFkmP9
	GENfN9phU/nj+7yCOw2F93Q==
X-Google-Smtp-Source: AGHT+IESgEUveC8yQTk46ZdY46xE3OFDyejSgTzDblsZ0XI5Dgk48gNFxBwSyDJHjZLKVnBVYwtz3KJTaqWB5c2AfQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:6fc1:0:b0:e2b:cd55:11b3 with SMTP
 id 3f1490d57ef6-e35ed246250mr2982276.5.1731522279438; Wed, 13 Nov 2024
 10:24:39 -0800 (PST)
Date: Wed, 13 Nov 2024 18:24:37 +0000
In-Reply-To: <20241108193204.GC38972@noisy.programming.kicks-ass.net> (message
 from Peter Zijlstra on Fri, 8 Nov 2024 20:32:04 +0100)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsnt34jv9el6.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, will@kernel.org, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Peter Zijlstra <peterz@infradead.org> writes:

> On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

>> Isn't the below more or less what you want?

>> static unsigned long misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags = 0;

>> 	if (regs->flags & PERF_EFLAGS_EXACT)
>> 		flags |= PERF_RECORD_MISC_EXACT_IP;

>> 	return flags;
>> }

>> static unsigned long native_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags = 0;

>> 	if (user_mode(regs))
>> 		flags |= PERF_RECORD_MISC_USER;
>> 	else
>> 		flags |= PERF_RECORD_MISC_KERNEL;

>> 	return flags;
>> }

>> static unsigned long guest_flags(struct pt_regs *regs)
>> {
>> 	unsigned long guest_state = perf_guest_state();
>> 	unsigned long flags = 0;

>> 	if (guest_state & PERF_GUEST_ACTIVE) {
>> 		if (guest_state & PERF_GUEST_USER)
>> 			flags |= PERF_RECORD_MISC_GUEST_USER;
>> 		else
>> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>> 	}

>> 	return flags;
>> }

>> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;

>> 	flags = misc_flags(regs);
>> 	flags |= guest_flags(regs);

>> 	return flags;
>> }

>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;
>> 	unsigned long guest;

>> 	flags = misc_flags(regs);
>> 	guest = guest_flags(regs);
>> 	if (guest)
>> 		flags |= guest;
>> 	else
>> 		flags |= native_flags(regs);

>> 	return flags;
>> }

> This last can be written more concise:

> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;

> 	flags = guest_flags(regs);
> 	if (!flags)
> 		flags |= native_flags(regs);

> 	flgs |= misc_flags(regs);

> 	return flags;
> }

This isn't right because it is choosing to return guest or native
flags depending on the presence of guest flags, but that's not what we
want.

See perf_misc_flags in kernel/events/core.c which chooses to return
perf_arch_guest_misc_flags or perf_arch_misc_flags depending on
should_sample_guest which depends on more than current guest state.

But I will take some of your suggestions to split the functions out
more.

