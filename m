Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A41D3FA1C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 01:24:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxG4y1YnLz308J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 09:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BAuX2ol8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BAuX2ol8; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxG4C1Ycfz2yJd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 09:23:37 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so2981817pjz.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 16:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TQth0zKaZ1g898XhTaLjgqI+BqtTYpmEnIJq3AsLCJk=;
 b=BAuX2ol8F6dvdcYTLPau4K0GBYzUoQCSuqStZCATywk1xJsRcTN/zbnvR40BRHvYRj
 p2MT9UNw+pSe1w4FqYAzJww2vX26GF4Etd+uOuVWgHJFd4agO5hpaKs4rD3Z8IuIiQ64
 bceibC9z39TyoUF5r/ZBJugD41m33rR/4wmX0JjHH4Ox3VO0sQvCLcKc4rCPjZl3kpp/
 z2ewywcdb4obgJrlPAWwwSgAREPIfSw6ixPLrZU+orCqHvOzAJIbsJDGYnOKI/KJzI5+
 MS27DWV8OUcVAL9tLPc5IpbSctooG5g35qhato+7vW1AY9AOSyjT1rpopwB7U0ojjXOG
 jR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TQth0zKaZ1g898XhTaLjgqI+BqtTYpmEnIJq3AsLCJk=;
 b=A0zwt7ydzz0iUzr6Hmiu9aZakeWL45NChxTy360jTTVHTjqoU5Y4zK5YR/AoTKDQIj
 HOISiEHHY5yq1uqvcsds2nOUPvc5pOfp8EEnEQYLfYbtV8R55NCHDBiWF2PfDOdM1gcA
 9c5+J+rmUmxVVRTkVHwQjuZzpJUmobu1ifsCj80WFv2iIxdgPqJNDFyUQJjF2iBhJbHA
 qVdtc8wMKxkpm7GNL8tZ3tQl6Q+CXVF7ac2G1Ykpd7JpDgtHJW34znm6ar/N0lY+QVsC
 bnH9SQyFHE8js+Bt9n8NaY2enC5hg1JZW9zymM+u2rDCMiQBB7JHiczpJPHpcLGjqsTS
 Dvew==
X-Gm-Message-State: AOAM533DPCO6A4FO8bBH6zXhT/lNPBMPENtQfeURrd8rBPm4y4lI9cBR
 ZKst5JoCL63SNmS6c5RkHteoKA==
X-Google-Smtp-Source: ABdhPJwmCb6NSZOc/5AwINtm/0AHRKcukC2PPcNvrpcQ6DjdUz8MDW9KTFWzGmyEhc2uaUezQAIkrA==
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr10854117pjb.200.1630106614660; 
 Fri, 27 Aug 2021 16:23:34 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h13sm7335943pgh.93.2021.08.27.16.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 16:23:33 -0700 (PDT)
Date: Fri, 27 Aug 2021 23:23:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
Message-ID: <YSlz8h9SWgeuicak@google.com>
References: <20210820225002.310652-1-seanjc@google.com>
 <20210820225002.310652-5-seanjc@google.com>
 <766990430.21713.1629731934069.JavaMail.zimbra@efficios.com>
 <282257549.21721.1629732017655.JavaMail.zimbra@efficios.com>
 <YSblqrrpKcORzilX@google.com>
 <1700758714.29394.1630003332081.JavaMail.zimbra@efficios.com>
 <YSgpy8iXXXUQ+b/k@google.com>
 <339641531.29941.1630091374065.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <339641531.29941.1630091374065.JavaMail.zimbra@efficios.com>
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
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 dvhart <dvhart@infradead.org>, linux-mips <linux-mips@vger.kernel.org>,
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

On Fri, Aug 27, 2021, Mathieu Desnoyers wrote:
> > So there are effectively three reasons we want a delay:
> > 
> >  1. To allow sched_setaffinity() to coincide with ioctl(KVM_RUN) before KVM can
> >     enter the guest so that the guest doesn't need an arch-specific VM-Exit source.
> > 
> >  2. To let ioctl(KVM_RUN) make its way back to the test before the next round
> >     of migration.
> > 
> >  3. To ensure the read-side can make forward progress, e.g. if sched_getcpu()
> >     involves a syscall.
> > 
> > 
> > After looking at KVM for arm64 and s390, #1 is a bit tenuous because x86 is the
> > only arch that currently uses xfer_to_guest_mode_work(), i.e. the test could be
> > tweaked to be overtly x86-specific.  But since a delay is needed for #2 and #3,
> > I'd prefer to rely on it for #1 as well in the hopes that this test provides
> > coverage for arm64 and/or s390 if they're ever converted to use the common
> > xfer_to_guest_mode_work().
> 
> Now that we have this understanding of why we need the delay, it would be good to
> write this down in a comment within the test.

Ya, I'll get a new version out next week.

> Does it reproduce if we randomize the delay to have it picked randomly from 0us
> to 100us (with 1us step) ? It would remove a lot of the needs for arch-specific
> magic delay value.

My less-than-scientific testing shows that it can reproduce at delays up to ~500us,
but above ~10us the reproducibility starts to drop.  The bug still reproduces
reliably, it just takes more iterations, and obviously the test runs a bit slower.

Any objection to using a 1-10us delay, e.g. a simple usleep((i % 10) + 1)?
