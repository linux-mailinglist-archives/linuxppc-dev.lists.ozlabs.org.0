Return-Path: <linuxppc-dev+bounces-3152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A89C7B5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 19:39:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXBt10Dvz2yY9;
	Thu, 14 Nov 2024 05:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731523190;
	cv=none; b=nq9quO8nFT9hcfPJxtJMRQnhYkw3TZR54FwUwL6UwsXbzU3GQ6odZrldHa4qdaCuqWN4/5ipRDD5ATfhsL0n7NUz0I3eHtGlSHT+li4kTLR7zzxEaFXzMMBP0D5vLKrq0SxvFzqqwZiJQqcYlp/0ilC8GiD2uiFGmRRRz8KpL3MYBBKwVi0YHi2+6LyVZ/xhgsxkPvYSMbTt1CLDGfHx3bhjYLL7OHb/UyUXmr95Vh9Vi+4QOqJzZbTgqBtyYoO1tnfau3WmJG5eidQTYJ9AJaGnD2dko28NuCMTZEDquBSnj47V+3BE5Mm20UD00XmKiNxiQ+8ZYBgdcQMrdNZvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731523190; c=relaxed/relaxed;
	bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=HN1ZeMtyajTq6Ilgh+GGnl0PxnpET2oYZOSDCGZ5mh0dnDqj/wA8MB0DAgWWQExFBhTiX5kHefT7Y/vtg1vrO6zcm/nFAmg/Y8tkBAhkiQ74ChhTYn5yfewZJdFAa/z4EV5c1TJp0Hb9eQh3D2CtgcntBHnzHVunLB7w6l11o5335J1yDcwmG2NdlpJv1bllVOYNfVPKszAoHUUIQz80FQPo2UqTJlBynvstJTOcCQ/I8VLt9lithoDc+kQ3E7YBYsvq5B20Ge/BE5ITk7GvzeGD66oe/hFBEy4Ga7KxTT/ZJACk3pLyRkLwlvFCza81efdhOAs3fUhCT7uQjMSfLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eeI9WvDt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3b_i0zwskdggiurzutrkcoymuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eeI9WvDt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3b_i0zwskdggiurzutrkcoymuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXBr0gWtz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 05:39:46 +1100 (AEDT)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-83abf723da3so755517139f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731523184; x=1732127984; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=;
        b=eeI9WvDtMbvgNlqh18Y+WhibiUZ6aMXA0Fy5wd1DXWRtaZF1qWHRAK76FA3SntGBaw
         jh5Ul8Z6IA9p6lmQexaESdTq8VUsS9Ix0lQLvfv9BbH5Xq+ReKrtX9j0eMoqRFto6hpi
         9fjY7KJOoxFHxcXQQj2X0GPOwqnTbf/CihqDrEUwI63jnm+FOZg+iaGS1x69VC8Vl2DY
         N2aXP/09wWyg9DyMjFNUvXcz5Rg2e9Rp8WtyXPo/KLtMrF4kpTLUE5puz497zGveJAvT
         pZh+S1/IcYevsq3yGb2qQ0JSAWzkE+olZQxXuSqjXa3WsqoAl5l6tBmiFGhGb9zjLplE
         MZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523184; x=1732127984;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=;
        b=OGv2z85eicZ5IdbOyKj4deD3BFwb2C4kogKxNA5GxnXwQ3TL/y96TpiNdNCo/8M+vH
         KF4paWtW54vewGZZPT+c0a8UJY2wrB5j44ygCCgafJpNBP0LqfZRNDGxWZ1jqjQLM29p
         BnpaPR+63juVW/s32/y2fWfbYSwD2fiHji0kBrtKj5La2swUVhIdSxtHWax1m5fjhbqq
         ilBX1se5VGoH+W2gWqn4wSja1jiPZFBiMDOB5hS4Lv9wj+esB2bTOcyhSZ6JHw2pHc7o
         3zvwkAjzjSqG3Zw9c0pDDQeYDyOwg6Ao8Yve5YuRskntCqQjPGTQasxsMzk6NflX87gG
         fQOw==
X-Forwarded-Encrypted: i=1; AJvYcCXyjdpf4C7aQW0bK3Tjo2Gq8wjRRbdXO0/LvaZKrZwr028ATJwAK+Bnh+GqCA4mZPIV58g5I4zIvQ5uigA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yze6TqUmPHeSPdX9rmGHPAm4aIsgcSNvYIUff1LDCJioxB5NQpP
	pJW/vJ81i2THzS9ZgLrmUnKWwSb5RKOKrD61g+rW+Aox/HrMkX9JGYPN2aP0nncTP3WB3TtHrv+
	Ej4eyE13HXDUXk2r4ihseLQ==
X-Google-Smtp-Source: AGHT+IFqNa2jrXVUDfm9IE+oYt5yFt1zslo8K13JW/BJldIHrq7v5sp1QoU1+LNMj81fKDzjJdmH4l1lpTYb1/+IBg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:583:b0:83a:ac70:becf with
 SMTP id ca18e2360f4ac-83e03357885mr4245839f.3.1731523183650; Wed, 13 Nov 2024
 10:39:43 -0800 (PST)
Date: Wed, 13 Nov 2024 18:39:42 +0000
In-Reply-To: <gsnt34jv9el6.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Wed, 13 Nov 2024 18:24:37 +0000)
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
Message-ID: <gsntzfm37zbl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: peterz@infradead.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Colton Lewis <coltonlewis@google.com> writes:

> Peter Zijlstra <peterz@infradead.org> writes:

>> On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

>>> Isn't the below more or less what you want?

>>> static unsigned long misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags = 0;

>>> 	if (regs->flags & PERF_EFLAGS_EXACT)
>>> 		flags |= PERF_RECORD_MISC_EXACT_IP;

>>> 	return flags;
>>> }

>>> static unsigned long native_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags = 0;

>>> 	if (user_mode(regs))
>>> 		flags |= PERF_RECORD_MISC_USER;
>>> 	else
>>> 		flags |= PERF_RECORD_MISC_KERNEL;

>>> 	return flags;
>>> }

>>> static unsigned long guest_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long guest_state = perf_guest_state();
>>> 	unsigned long flags = 0;

>>> 	if (guest_state & PERF_GUEST_ACTIVE) {
>>> 		if (guest_state & PERF_GUEST_USER)
>>> 			flags |= PERF_RECORD_MISC_GUEST_USER;
>>> 		else
>>> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>>> 	}

>>> 	return flags;
>>> }

>>> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags;

>>> 	flags = misc_flags(regs);
>>> 	flags |= guest_flags(regs);

>>> 	return flags;
>>> }

>>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags;
>>> 	unsigned long guest;

>>> 	flags = misc_flags(regs);
>>> 	guest = guest_flags(regs);
>>> 	if (guest)
>>> 		flags |= guest;
>>> 	else
>>> 		flags |= native_flags(regs);

>>> 	return flags;
>>> }

>> This last can be written more concise:

>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;

>> 	flags = guest_flags(regs);
>> 	if (!flags)
>> 		flags |= native_flags(regs);

>> 	flgs |= misc_flags(regs);

>> 	return flags;
>> }

> This isn't right because it is choosing to return guest or native
> flags depending on the presence of guest flags, but that's not what we
> want.

> See perf_misc_flags in kernel/events/core.c which chooses to return
> perf_arch_guest_misc_flags or perf_arch_misc_flags depending on
> should_sample_guest which depends on more than current guest state.

This is in the next patch. Excuse me for not clarifying.

> But I will take some of your suggestions to split the functions out
> more.

