Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1D205A15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:02:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rvHc1ScgzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 04:02:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=b0gWdjg9; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rvFY3RpszDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 04:00:10 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id f139so2777766wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wcyp7xJ9VH6Ce5YmoH+01qglUFlPRs0bPBHrFHPBGrU=;
 b=b0gWdjg9shIjXDAXSuaxcUf0kvXH4yOK4YqHK+9dT9MEpAkVd6umkpXAERDfyobiWl
 iXYdhTzGdCZyETgQEnsKBMRw2uD1/6EG+a2gNOJxd+k6D/sDEhaX6N+anOTYiE5UTlEW
 9guLzwsJbj9ourTGn7rQyP3RVBIwQBwAZ/LZZzmAPQobTh1G7a54oM7BKIaUVWVU7sYR
 92sTnOH08HPqyhu7XVR11xnX2duZHFm8vCQNLqhX6EcurG9VD3S0w6GR/Cq7XgDKoDq9
 1VJ29HZZZHA+0Um8K2+yTGYbKt5FDsWkltk1RndhkdGr1x6j4EAOX4DINZmI1bfl6Cvx
 oAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wcyp7xJ9VH6Ce5YmoH+01qglUFlPRs0bPBHrFHPBGrU=;
 b=qaSkWD1oFZOwOk08jOsTCQIlXm51IEIAG8RQ5qOOOOFqnJESeTSlrXhIUVb4jVydyC
 HKjaOy4G4lEocvVorUrfNJZjMKUECFvGMBvM+ZZbKy7O39+oMJUQQTOgSGUgsXCQcHGk
 dKqP12gL0gV/Fuo1hQFrUcyoGwxwMove1nLmmhJamtFG8TrsRS9pryVOksILurtetd4n
 cQ7gMm0cs1FfVlSRIIn7z+gDI2lZ5B/I3eiksp4/EYWIT7zeZ9yOq2gwSfv6TeABykDm
 wUeFQVl+RCYS1Lkaq6fmz/GDl+WaIEq4IlzhB20EVBfdiPUFLUuwoaLSKfifkuIC1/r6
 kBVw==
X-Gm-Message-State: AOAM533gQSKQcbXEWzzs/Tvp/GPSEqcdjJejNLP1H9t8Lq+3jNHeHi8h
 7gBn2ohR4BBzLCQVuFSwhb6ncA==
X-Google-Smtp-Source: ABdhPJyBS+rhzsc1deZ1Ay1FOdoRDXOTCxrPOjQRzUCugXkZeGKEC8Ks241Yw7kTMxlqgYm+GZsCyQ==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr25343911wmj.84.1592935203860; 
 Tue, 23 Jun 2020 11:00:03 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
 by smtp.gmail.com with ESMTPSA id r1sm22986260wrn.29.2020.06.23.11.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 11:00:03 -0700 (PDT)
Date: Tue, 23 Jun 2020 19:59:57 +0200
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623175957.GA106514@elver.google.com>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623163730.GA4800@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.13.2 (2019-12-18)
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 06:37PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 06:13:21PM +0200, Ahmed S. Darwish wrote:
> > Well, freshly merged code is using it. For example, KCSAN:
> > 
> >     => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
> >     => kernel/kcsan/report.c:
> > 
> >     void kcsan_report(...)
> >     {
> > 	...
> >         /*
> >          * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
> >          * we do not turn off lockdep here; this could happen due to recursion
> >          * into lockdep via KCSAN if we detect a race in utilities used by
> >          * lockdep.
> >          */
> >         lockdep_off();
> > 	...
> >     }
> 
> Marco, do you remember what exactly happened there? Because I'm about to
> wreck that. That is, I'm going to make TRACE_IRQFLAGS ignore
> lockdep_off().

Yeah, I was trying to squash any kind of recursion:

	lockdep -> other libs ->
		-> KCSAN
		-> print report
		-> dump stack, printk and friends
		-> lockdep -> other libs
			-> KCSAN ...

Some history:

* Initial patch to fix:
	https://lore.kernel.org/lkml/20200115162512.70807-1-elver@google.com/

* KCSAN+lockdep+ftrace:
	https://lore.kernel.org/lkml/20200214211035.209972-1-elver@google.com/

lockdep now has KCSAN_SANITIZE := n, but we still need to ensure that
there are no paths out of lockdep, or the IRQ flags tracing code, that
might lead through other libs, through KCSAN, libs used to generate a
report, and back to lockdep.

I never quite figured out the exact trace that led to corruption, but
avoiding any kind of potential for recursion was the only thing that
would avoid the check_flags() warnings.

Thanks,
-- Marco
