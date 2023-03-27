Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C66CAC0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 19:44:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlgDw6Zqcz3c3N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 04:44:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NRewYmiv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=33duhzaykddgmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NRewYmiv;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlgD22HHLz3cfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 04:44:00 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-54196bfcd5fso93511437b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679939037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlpSa++Ck7W+hH+1OiuQ4wL4Keih2CLgElX+Jr8IDOg=;
        b=NRewYmivbp7xrd5bl7JWEYaQ9BEiQxehXzYs4JPD27Ag/vs1+EGoigQA/eGrdDVwpI
         6HrxgSZwown5PltC2Waeqpp6KGdrJb/dSApcJ1OUEukUIu3e0Ezq/NVjnhkAzin2oeIi
         XSws12m/6pB4Il8LiHkXWqb8AJMCdtVH2B+cO5e4Nti183f4YVeFl+atpkWvaCwSlrLh
         LmtRmg6bJTE0Nq9XTncpVNfM5/aW7PEvzyPI3l+G5UFhZ8iI/LdGA8oPEpZSPXw4sf/Y
         oWbVtkgHQtAjTuo6pRD+inMv48nJ8KN5jmFbZAnYg8/yiZPVZ9a4faH4l6132Clgz6B7
         ZpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679939037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlpSa++Ck7W+hH+1OiuQ4wL4Keih2CLgElX+Jr8IDOg=;
        b=D3G3lEjWAurUfag5mXYTQ/ADESGNwjfX9bMFkSB0OuYnDCkLRXlnybAd+XmFUyIsD1
         YfeJcxJvNHw9EomuvzDpSXOL/rxKim6kwLvACiBuxE6Nir9SNDdbs/HROSvRRnF8P7J/
         duBBxS/3KibR4hTJWZK9YMkqdEADOEAJ1LPsYI8QWanY+1dT31kYvRYCxT6xVLH4BvI8
         ORzJyRtZc7axEap/gEeJxhjAQTi/N41EVI2xJwdnWMn1XwJzMx1sfcnqxxwwZCNNIAhJ
         zUvaEb4NZcX2jR4j8HY5d2Lzx5voXG+uRYeaIVMeO6rVq2UselxC5RuHTGgC/4g2GRjj
         cq5Q==
X-Gm-Message-State: AAQBX9cCk+D+UX8x2e/R1iGtFJh3WnGawKWrvbcJ/GU54a/5ZYAkl1N8
	GFlNvb/jugkEmWmp6F7fQjapohXDhgo=
X-Google-Smtp-Source: AKy350YnFdRnDAztI/QAWGplLtVR70FJRJ184l6fxPJaxU9DXrlOhocThQPENwgRN3HxnQV8PG1Jwq59fUM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr7834435ybu.5.1679939037193; Mon, 27 Mar
 2023 10:43:57 -0700 (PDT)
Date: Mon, 27 Mar 2023 10:43:55 -0700
In-Reply-To: <CRGX867PJCBF.1MV46YLYXMBYZ@bobo>
Mime-Version: 1.0
References: <20230316031732.3591455-1-npiggin@gmail.com> <87ilf0nc95.fsf@mpe.ellerman.id.au>
 <ZBs9tGkI5OQqtIqs@google.com> <CRGX867PJCBF.1MV46YLYXMBYZ@bobo>
Message-ID: <ZCHV20oFkFzp/AZs@google.com>
Subject: Re: [PATCH 0/2] KVM: PPC: support kvm selftests
From: Sean Christopherson <seanjc@google.com>
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023, Nicholas Piggin wrote:
> On Thu Mar 23, 2023 at 3:41 AM AEST, Sean Christopherson wrote:
> > On Thu, Mar 16, 2023, Michael Ellerman wrote:
> > > Nicholas Piggin <npiggin@gmail.com> writes:
> > > > Hi,
> > > >
> > > > This series adds initial KVM selftests support for powerpc
> > > > (64-bit, BookS).
> > > 
> > > Awesome.
> > >  
> > > > It spans 3 maintainers but it does not really
> > > > affect arch/powerpc, and it is well contained in selftests
> > > > code, just touches some makefiles and a tiny bit headers so
> > > > conflicts should be unlikely and trivial.
> > > >
> > > > I guess Paolo is the best point to merge these, if no comments
> > > > or objections?
> > > 
> > > Yeah. If it helps:
> > > 
> > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > What is the long term plan for KVM PPC maintenance?  I was under the impression
> > that KVM PPC was trending toward "bug fixes only", but the addition of selftests
> > support suggests otherwise.
> 
> We plan to continue maintaining it. New support and features has been a
> bit low in the past couple of years, hopefully that will pick up a bit
> though.

Partly out of curiosity, but also to get a general feel for what types of changes
we might see, what are the main use cases for KVM PPC these days?  E.g. is it mainly
a vehicle for developing and testing, hosting VMs in the cloud, something else?

> > I ask primarily because routing KVM PPC patches through the PPC tree is going to
> > be problematic if KVM PPC sees signficiant development.  The current situation is
> > ok because the volume of patches is low and KVM PPC isn't trying to drive anything
> > substantial into common KVM code, but if that changes... 
> 
> Michael has done KVM topic branches to pull from a few times when such
> conflicts came up (at smaller scale). If we end up with larger changes
> or regular conflicts we might start up a kvm-ppc tree again I guess.

A wait-and-see approach works for me.  I don't have any complaints with the current
process, I was just caught off guard.

> > My other concern is that for selftests specifically, us KVM folks are taking on
> > more maintenance burden by supporting PPC.  AFAIK, none of the people that focus
> > on KVM selftests in any meaningful capacity have access to PPC hardware, let alone
> > know enough about the architecture to make intelligent code changes.
> >
> > Don't get me wrong, I'm very much in favor of more testing, I just don't want KVM
> > to get left holding the bag.
> 
> Understood. I'll be happy to maintain powerpc part of kvm selftests and
> do any fixes that are needed for core code changes.If support fell away
> you could leave it broken (or rm -rf it if you prefer) -- I wouldn't ask
> anybody to work on archs they don't know or aren't paid to.
> 
> Not sure if anything more can be done to help your process or ease your
> mind. It (KVM and kvm-selftests) can run in QEMU at least.

Updating the KVM/powerpc to include selftests would be very helpful, e.g

  F:	tools/testing/selftests/kvm/*/powerpc/
  F:	tools/testing/selftests/kvm/powerpc/

and ideally there would be one or more M: (and R:) entries as well.  I'm not
all that concerned about the selftests support being abandoned, but the lack of
specific contacts makes it look like KVM PPC is in maintenance-only mode, and it
sounds like that's not the case.

Thanks!
