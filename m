Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C63F3660
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grx6x1ZsZz3cXq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=XMJxhivK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XMJxhivK; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grx6B65DHz3bP2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:25:20 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id o2so10590927pgr.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 15:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YqTJx2d+rK7r/727Mx+pw0RMm85LxTM+dupa4DkkVUg=;
 b=XMJxhivK8HayiVyEBDemyRelIu51Uql4arICrgl1Xtu+OpldaIQuiN92D0dB+2PvY2
 AoWaNBB7KO7F5FKoudHlgDL/hNd8A+FowUsdw3wL6BDm/iTL4Cc6YiTOferscwepyuQG
 9XzUtw99s5/KFwywXDFpqMheslrF3wDRzL/P2DgSQRR0RtQLiklqmvKdqBE5L3ZAbbaZ
 dmEsmdra+vDsgdRhVivluTSEwsP4y90ta1vlg9CE5AvtSTW6wIrc35O7x62Y6nnvox8U
 jQS6/7VhaJmZu5wZ3xMtHYlcMetnl4hW/FqOnidhXXsmNwQLT3BkojygGTev8rmNq1ca
 Ezdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YqTJx2d+rK7r/727Mx+pw0RMm85LxTM+dupa4DkkVUg=;
 b=RN19F3XtNgAZQjp32iLAud1my5r2AeWH4ocNx+2UMo3y5XKxORwzkYqF8z1t3uY5wb
 nP68NAbPNDoUYxvDMWHZczRci8EZxU7GVNlX/4O53mbiHh+uapZczc/P93tcJph4lDgo
 14lHMOuheDTypIOzkY9lPB/QrquLhiYPfnphRP9WtMGSYlqJxzOng8VIkUAABxNUfUmx
 0K2+3g09hB+3+/rTAz5o8/9Ja97pFG8dYtRThk0eHkXQ7wzUDn2kozI5341H4KJOpDPU
 a94MuFMMflE2KHuJ6WZsbWCddppNNd0jrOVuxELXsw/RsgQHa4kHntfkZhNT2g8J5aaI
 ZMYQ==
X-Gm-Message-State: AOAM532NxpslsQVY6Fi9spllU88gVHdeMtVXNzgeXSRICCto+FOaZxxj
 wMnTiaq3R0YDkkW78VXxa8Y4dQ==
X-Google-Smtp-Source: ABdhPJyV4IjFC28xX7oRVRErRr3HUFYCEi0w5LU0UmTHa8mL37R5Jfy+NpSbOUll/e+Fp+fYUTcY5g==
X-Received: by 2002:aa7:864e:0:b0:3e3:439b:c3fc with SMTP id
 a14-20020aa7864e000000b003e3439bc3fcmr9023525pfo.64.1629498318096; 
 Fri, 20 Aug 2021 15:25:18 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id o14sm9367987pgl.85.2021.08.20.15.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 15:25:17 -0700 (PDT)
Date: Fri, 20 Aug 2021 22:25:11 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
Message-ID: <YSArx+ppjIH+6/uK@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-5-seanjc@google.com>
 <1540548616.19739.1629409956315.JavaMail.zimbra@efficios.com>
 <YR7qXvnI/AQM10gU@google.com>
 <407716135.20250.1629484298288.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407716135.20250.1629484298288.JavaMail.zimbra@efficios.com>
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips <linux-mips@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 paulmck <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 20, 2021, Mathieu Desnoyers wrote:
> I still really hate flakiness in tests, because then people stop caring when they
> fail once in a while. And with the nature of rseq, a once-in-a-while failure is a
> big deal. Let's see if we can use other tricks to ensure stability of the cpu id
> without changing timings too much.

Yeah, zero agrument regarding flaky tests.

> One idea would be to use a seqcount lock.

A sequence counter did the trick!  Thanks much!

> But even if we use that, I'm concerned that the very long writer critical
> section calling sched_setaffinity would need to be alternated with a sleep to
> ensure the read-side progresses. The sleep delay could be relatively small
> compared to the duration of the sched_setaffinity call, e.g. ratio 1:10.

I already had an arbitrary usleep(10) to let the reader make progress between
sched_setaffinity() calls.  Dropping it down to 1us didn't affect reproducibility,
so I went with that to shave those precious cycles :-)  Eliminating the delay
entirely did result in no repro, which was a nice confirmation that it's needed
to let the reader get back into KVM_RUN.

Thanks again!
