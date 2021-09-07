Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C8402AEB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 16:39:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3nw91ZZ9z2yfn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 00:39:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dDM249O1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=dDM249O1; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3nvR255Jz2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 00:38:40 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id y17so8304593pfl.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qhhCof7Bxt7WkPbfZU7ElxFgFbYJKUpmBYIoqT3FQG0=;
 b=dDM249O1jyYEP+sPZcNiaaYYByaEMpzFEK/dirlDIZo1llr4qtiA9AwONG4gfWFxuh
 GI+LHZeQL/xeGEQ7Yfkgt3/vvEePqhDwrmKdVjtWDvjOavLauOARfD2emyCkCFDIZ3e5
 RZJODDFiVIiw9T1gza4f7jn3IWawg1iNUGGJLjWdnuO+yJ9asXLrHQr2+tGWyM13pjym
 1+byStjxJrGiqSwx/wJlrs7mmw75bxC4tAQmD1XUWS2Kmf6OB7eQm5ViyURea6XHmtW+
 mck5xXQNXvsw8NgSA/A4XmTbdZUQ2dwVHhPiE7RfQH0O5+QpGIXptx+UdEU6zgDpgmg+
 vWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qhhCof7Bxt7WkPbfZU7ElxFgFbYJKUpmBYIoqT3FQG0=;
 b=t+WkEE0IJt70aKWfeNH0/hQVktHQ7uLk278new1uToUo0xykFb/tRcq2tvAIoKy879
 DeOpPbFTCabeF3OtLpNyjCTy/sIW17+L+QZdbheq6NJzD9cwLPEtoHHX4nvzZ8OcaEvX
 cZoQMxfsvyHH/pUnKbjC5LReOwRSs7Rt1NBoNMAdKcu9e0FnPd3uDlYCroey8hWIZF9M
 fHIaHds1DTFnhfgqBRcnq2eGFzfGxE35iRxM9WabltrqY+sIIXgHHam70bOavJTZpXKb
 BzxqZK9wtpNEyHgmoF3g6DuQKPHWdZZevm61za4UvcSyjufgDX8CLQiOO9T2NBl62jkb
 stoA==
X-Gm-Message-State: AOAM531j6ZLaC2K88xWvkWbqhnGgH9DMEBFP1NWFwnkSeGqvt/gT2WVL
 XtGcCA2TyDPhCIsGzHD4OJDOwg==
X-Google-Smtp-Source: ABdhPJzl5tT+vIOlvAuqK2CqdOtw1QALWHjYejAcBedH1JDRDyFV2NrE6Q9L+J99MDm/UGDNVHbaHA==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr17484810pgf.228.1631025516087; 
 Tue, 07 Sep 2021 07:38:36 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id j6sm13428682pgq.0.2021.09.07.07.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 07:38:35 -0700 (PDT)
Date: Tue, 7 Sep 2021 14:38:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
Message-ID: <YTd5Z91j9N2LuuIr@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
 <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
 <425456d3-4772-2a1b-9cf3-a5b750b95c2e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425456d3-4772-2a1b-9cf3-a5b750b95c2e@redhat.com>
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
 linux-s390 <linux-s390@vger.kernel.org>, Shakeel Butt <shakeelb@google.com>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips <linux-mips@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 paulmck <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 06, 2021, Paolo Bonzini wrote:
> On 20/08/21 20:51, Mathieu Desnoyers wrote:
> > > Ah, or is it the case that rseq_cs is non-NULL if and only if userspace is in an
> > > rseq critical section, and because syscalls in critical sections are illegal, by
> > > definition clearing rseq_cs is a nop unless userspace is misbehaving.
> > Not quite, as I described above. But we want it to stay set so the CONFIG_DEBUG_RSEQ
> > code executed when returning from ioctl to userspace will be able to validate that
> > it is not nested within a rseq critical section.
> > 
> > > If that's true, what about explicitly checking that at NOTIFY_RESUME?  Or is it
> > > not worth the extra code to detect an error that will likely be caught anyways?
> > The error will indeed already be caught on return from ioctl to userspace, so I
> > don't see any added value in duplicating this check.
> 
> Sean, can you send a v2 (even for this patch only would be okay)?

Made it all the way to v3 while you were out :-)

https://lkml.kernel.org/r/20210901203030.1292304-1-seanjc@google.com
