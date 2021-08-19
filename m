Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB273F23B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 01:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrLhW48vkz3cRF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 09:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=qPf6yOnP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qPf6yOnP; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrLgq3qxdz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 09:33:59 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id o10so4955501plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FSqOrapu64fBYafjbU5tjcyWOc2DrNI0dbheqGMVOMc=;
 b=qPf6yOnP+Rcz9FT3tKuWykTPcKe82BX3Np45gaPnFPSg6PdUJnLygVgfX+kzI3cJ9H
 jtESUvUqN1Ez+DTuoTUzsGouHIoQxocdabjlXnhhXdwEIL3SL3EPMESdP1tUYWRrWW5X
 56WH9AV8Z8I1+Dv+ob4dltRCZxxppIzcXuZZbDajZOYY+UHcUj8zqAQ2N2zC8ir+rqzQ
 7xRIzOV9hhvssqy3laN9jfhD8920m0bpiZR1ld4i0qnlmpXy3nqZRp+SXiFRJw3tk0Cb
 jAkYC7GX39D/8+SHQHrfwZ3zlTN2RbLaSSUFeut9erJLOEf2TnrtjesxTQV5Xd8hTAQL
 GItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FSqOrapu64fBYafjbU5tjcyWOc2DrNI0dbheqGMVOMc=;
 b=bc1KQK29vObd566HYDDa2VyCieR//jq09R/Zt7EQ5NoqU7UXjmy7Xq1Ddotd1Thziu
 GQmlTXmsx46WvPq4Sdm/3RxGAdUPb2Rm0GAnb6QtCsxf6TTdL2b/QxNzqNAj0DwUNyTR
 3WfJrfraphMZHdwkO80ShVZaJ+pjtNyrSdSRE15o1SbHEY87cmmgLwkMx9ChD5vDUdYw
 x4v9PPlmmjp+lFsDRyMSlBREf3KKccP1zxSmAVkIhrF8jxfn1BqjKiegLFEnwjpe4VNf
 oPqokKXpusEXxWh25oYvVqSN/r46cWLua602ahQJiPTXaJvllcdTsfrwOpO3zQKmTYQl
 jEjg==
X-Gm-Message-State: AOAM531jYe5K7g1mvrG660iax/IH55fEDjgqSbb4OwMwa+fiVg2QGhGK
 ABovlbnnA12XSpYNCX04iPaeOA==
X-Google-Smtp-Source: ABdhPJyN4VYmA4QdN+DQJ6bFcB8JQlcPHEw8dvqiqzL/oaDUmvZhZqDC612NpYT8Mg6IsLybHUWCkQ==
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr1336693pju.227.1629416036922; 
 Thu, 19 Aug 2021 16:33:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id j185sm4649122pfb.86.2021.08.19.16.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:33:56 -0700 (PDT)
Date: Thu, 19 Aug 2021 23:33:50 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
Message-ID: <YR7qXvnI/AQM10gU@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-5-seanjc@google.com>
 <1540548616.19739.1629409956315.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540548616.19739.1629409956315.JavaMail.zimbra@efficios.com>
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
 Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, paulmck <paulmck@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, rostedt <rostedt@goodmis.org>,
 Shakeel Butt <shakeelb@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 19, 2021, Mathieu Desnoyers wrote:
> ----- On Aug 17, 2021, at 8:12 PM, Sean Christopherson seanjc@google.com wrote:
> 
> > Add a test to verify an rseq's CPU ID is updated correctly if the task is
> > migrated while the kernel is handling KVM_RUN.  This is a regression test
> > for a bug introduced by commit 72c3c0fe54a3 ("x86/kvm: Use generic xfer
> > to guest work function"), where TIF_NOTIFY_RESUME would be cleared by KVM
> > without updating rseq, leading to a stale CPU ID and other badness.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> 
> [...]
> 
> > +	while (!done) {
> > +		vcpu_run(vm, VCPU_ID);
> > +		TEST_ASSERT(get_ucall(vm, VCPU_ID, NULL) == UCALL_SYNC,
> > +			    "Guest failed?");
> > +
> > +		cpu = sched_getcpu();
> > +		rseq_cpu = READ_ONCE(__rseq.cpu_id);
> > +
> > +		/*
> > +		 * Verify rseq's CPU matches sched's CPU, and that sched's CPU
> > +		 * is stable.  This doesn't handle the case where the task is
> > +		 * migrated between sched_getcpu() and reading rseq, and again
> > +		 * between reading rseq and sched_getcpu(), but in practice no
> > +		 * false positives have been observed, while on the other hand
> > +		 * blocking migration while this thread reads CPUs messes with
> > +		 * the timing and prevents hitting failures on a buggy kernel.
> > +		 */
> 
> I think you could get a stable cpu id between sched_getcpu and __rseq_abi.cpu_id
> if you add a pthread mutex to protect:
> 
> sched_getcpu and __rseq_abi.cpu_id  reads
> 
> vs
> 
> sched_setaffinity calls within the migration thread.
> 
> Thoughts ?

I tried that and couldn't reproduce the bug.  That's what I attempted to call out
in the blurb "blocking migration while this thread reads CPUs ... prevents hitting
failures on a buggy kernel".

I considered adding arbitrary delays around the mutex to try and hit the bug, but
I was worried that even if I got it "working" for this bug, the test would be too
tailored to this bug and potentially miss future regression.  Letting the two
threads run wild seemed like it would provide the best coverage, at the cost of
potentially causing to false failures.
