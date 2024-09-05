Return-Path: <linuxppc-dev+bounces-1039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AED96D303
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 11:22:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzv5j2MBvz2xwH;
	Thu,  5 Sep 2024 19:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725528153;
	cv=none; b=gHJhQGZ71XTdLkYOplWc6o6iKaREYpnIWuOG7lnz6pnP9XowBMWm0GD9ubIKAx0GkvAlYQXYQMY1gpLJo4XjH8Lpd8FcyAFBmeTnYk7yIPEukrjnUVIB3JorDiI/XYN/lTvJwQs9Wmhg6fg7JyMAajaXh8FJJIvsjYp/85MZdIJ2/8fW/X59LtrIkPEnMW0bzwAdicFRhvQAitzAUyoTmtsgotu2wsDYW5OqivRChWs/8+Bts3YXTGnmUxKLocd4SxO4y4SnYZZbQLwR7THfFFzsx+WPaL2030n+2m9Zc8Ya0teO1YAlKHekus2jqi89u2fR87nyWOtrW6zLFuZk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725528153; c=relaxed/relaxed;
	bh=8LgmwilwZTv00oKOBkFrZ/42OcenxN7DIQ4qoy+ip1I=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=LRYRr/MalXcPp/fGhpdJyOB/CdIWfkKHw3ddYtKG5BCNoArvIpnjhaMOS3thjMaKJD14BHbVvBPz97+zH5bNkARYjxIt4n/x5xRrfcgJhM3BTQXLgzd/tKLoniln4qgM3+0Fhj5rNkJzDsXELcDcc5r6A50TvucvFtXDA9Y2ohmgtdpta5+9HRDItoHdIkhvjdY9/liiPl8+SdzkkGvv9/6Y+pIVjhxYeoHdFB4aIsie8UJfcnqjAnYd88nHvCBUQBZme11S7JLAXkdh/bn3Jz+jriX+XRhjA3Fcata9bN5H/kL0YfIvTgINvZKoCaUeFfT8oUbDQAHpVF2s+lDJsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gwNuniQg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gwNuniQg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzv5h3S4mz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 19:22:31 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso3863925e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725528145; x=1726132945; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LgmwilwZTv00oKOBkFrZ/42OcenxN7DIQ4qoy+ip1I=;
        b=gwNuniQgoQSSPFLUT3eXwgJeA683PyYUMY1T3kWnX1F9Rfd4cysf0TQiDUdMrDakCm
         I/gfOA/ldXJzOnrhdtg4SNQzDL+Wr/w90QEe9Ee9ZwUtaAhS8J7l25capFGI+SEAjzIz
         a5OqNpMtzAO6Q1cCcMtTDtozSuNF3G1qTbHyl4Am5b7D+3XsEn6UWoONnsAInrs7Iu+r
         v8yoFJpM5WdlaCamw5wDtnU+wnq6ta8fxfc+Rf3aOAMSkHGYKqemKsfxr4MkRAOgTPRV
         g9jLdqlgzrON7o2SbLvHG5S9CtdsQRwJYlREL/6d+qYGZfa0yyjIogJi5txgP9kzE1Kt
         zDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725528145; x=1726132945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LgmwilwZTv00oKOBkFrZ/42OcenxN7DIQ4qoy+ip1I=;
        b=AkgtUU6dDQuF0oqdeL9K+ZYda4MMEF285Ggh3jksHo9CCHpEMA38wQVDLzOdIUh/tj
         27IKECDtQO3Jj6PIfbSO4XVuQ5cpABksPXt2k6/9DeAOvJURywFMScni6L9f829O+BTG
         bYA/majkFyqWAYWSVNhM0wfcG0OB9wZ1SYWoNBCiLQv+TxnYtLHP55KxguoHBMk4APMG
         hWZcJDk3Rw2aQF/XILozPA5baKgt9kB4Cgf32L9nKp9WK+hz5pNlL1JEdC75ho7Hbhdj
         wtrrDf+q3na1+Q9bjrs00aq39iYkmUClcEk0PBo2laMJDINJn0kYuctwQvTXoShgVO3a
         fFFw==
X-Forwarded-Encrypted: i=1; AJvYcCXojYFOHDc4IUSodjXpGbJwag4aR2Tg+1RoNAnmqZurEKeRSzSZsKXtQsPW1WNW93DGgS/EJgmaoAvWIOY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhpfTW3kSlrCUjo3qgg/r19QkM8KGfgVSTf23ZxBarU4Ow6cjF
	2ahjuZ/djhDpYVU/mT9HBsdQiuhX78DGLGPub+lLwp4CXUe6f5zj
X-Google-Smtp-Source: AGHT+IFUdfGNW49G4+DfGHtef+3iH+rTqtv4vp7wb8eaC9NCVgAim+dCJf5aeZgCMrKkgfBOdEZuqg==
X-Received: by 2002:a05:600c:19d2:b0:427:fa39:b0db with SMTP id 5b1f17b1804b1-42c8de9ddb6mr49602095e9.27.1725528144107;
        Thu, 05 Sep 2024 02:22:24 -0700 (PDT)
Received: from gmail.com (1F2EF525.unconfigured.pool.telekom.hu. [31.46.245.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a77sm266553755e9.45.2024.09.05.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:22:23 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 5 Sep 2024 11:22:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <Ztl4TDI98tnCkH0X@gmail.com>
References: <20240904204133.1442132-1-coltonlewis@google.com>
 <20240904204133.1442132-5-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904204133.1442132-5-coltonlewis@google.com>


* Colton Lewis <coltonlewis@google.com> wrote:

> Break the assignment logic for misc flags into their own respective
> functions to reduce the complexity of the nested logic.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
>  arch/x86/include/asm/perf_event.h |  2 ++
>  2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index 760ad067527c..87457e5d7f65 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2948,16 +2948,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> +static unsigned long common_misc_flags(struct pt_regs *regs)
> +{
> +	if (regs->flags & PERF_EFLAGS_EXACT)
> +		return PERF_RECORD_MISC_EXACT_IP;
> +
> +	return 0;
> +}
> +
> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +	unsigned long flags = common_misc_flags();
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		flags |= PERF_RECORD_MISC_GUEST_USER;
> +	else if (guest_state & PERF_GUEST_ACTIVE)
> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> +
> +	return flags;
> +}
> +
>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> +	unsigned long misc = common_misc_flags();

So I'm quite sure this won't even build at this point ...

Thanks,

	Ingo

