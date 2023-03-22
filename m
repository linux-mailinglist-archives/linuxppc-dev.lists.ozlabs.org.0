Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79E6C52C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 18:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhbQ54MfKz3f3t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 04:42:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ES3MTTWV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3tt0bzaykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ES3MTTWV;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhbP70l41z3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:41:13 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id l1-20020a170903244100b001a0468b4afcso11033362pls.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679506870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YesdF1o+GzhDJuZ/Udj8ca6OlrwlbgmV+ssn/MViB3Y=;
        b=ES3MTTWVJF3Lh9miyIydYMrcdquqjUJ6i1dtVLAn9HvdFiW7C/QyBtdCE/0BVmIKgH
         w6st+X+tszk3NDXWw53/EQYGIAVOUgS2EmGWTB2b21oAw8mMThn8Lq3NbR4D8xa9Ex5W
         DAW36YpqcBa6iPM2REL2rxdGH1wW4ICNysGSfxLlirqGVqyK69b1abef6wBYCUOOhquI
         hp7L58cwWLIe0NtUUUi6//q4MXht6OYjPUJHcNQrLkD/sIS78oEaMtQKT8nt+1L+JN28
         Znfy7kT/t8aI0yxigNLVwKwPzLjAqs9GAlPmEuwczJQIXlHVKQWf9UldkRLaNke8wKIn
         i06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YesdF1o+GzhDJuZ/Udj8ca6OlrwlbgmV+ssn/MViB3Y=;
        b=0Mg3y9jR9HuV9jziw5NapUvMWhYLYjEotAl8qMu2djn1cikoiWjGN3Nu8zpy6oti6d
         uM2lIr44Wp5EgAyps5OJDk18ATJUM4OohQxmjhXCD4grmx0c7Oi4KJwTFMUPfcaHR8hG
         5qA4c4Mz5rIUGx5NG7u8CIU0QK5/SeMyKWzPtMkjhNAxCl0V57LNhkLdRqn3nZZp42Vf
         LDW0lnnMbAnHqkXxpsMInrmNEL9lHLttIuJFkZRpLh146i6DeYz2AdMWhfmm+s6tUSqK
         nV3V7kqv6l6NyLxHfDeNUbYOQ/ADgHaSU2l41liKiNrR1zMehSaBsX7zf3+aJMIc325V
         lrAA==
X-Gm-Message-State: AO0yUKUbHOpnL+AC0Qf/JrIlabiY+um037I+k2N3XkWUSv74Joipamj0
	8Nj6TeKMr5EVTryW0QY0pzQt69RxuC4=
X-Google-Smtp-Source: AK7set8qlHUyhwjwk3c90JV8Tq1N4wnyQ//6TF16RskTAhQJfsd+IUr4994tmY3YTrka7GXpTeNq0/ISbns=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6399:0:b0:50f:53aa:f662 with SMTP id
 h25-20020a656399000000b0050f53aaf662mr991438pgv.5.1679506869873; Wed, 22 Mar
 2023 10:41:09 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:41:08 -0700
In-Reply-To: <87ilf0nc95.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
References: <20230316031732.3591455-1-npiggin@gmail.com> <87ilf0nc95.fsf@mpe.ellerman.id.au>
Message-ID: <ZBs9tGkI5OQqtIqs@google.com>
Subject: Re: [PATCH 0/2] KVM: PPC: support kvm selftests
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 16, 2023, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > Hi,
> >
> > This series adds initial KVM selftests support for powerpc
> > (64-bit, BookS).
> 
> Awesome.
>  
> > It spans 3 maintainers but it does not really
> > affect arch/powerpc, and it is well contained in selftests
> > code, just touches some makefiles and a tiny bit headers so
> > conflicts should be unlikely and trivial.
> >
> > I guess Paolo is the best point to merge these, if no comments
> > or objections?
> 
> Yeah. If it helps:
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

What is the long term plan for KVM PPC maintenance?  I was under the impression
that KVM PPC was trending toward "bug fixes only", but the addition of selftests
support suggests otherwise.

I ask primarily because routing KVM PPC patches through the PPC tree is going to
be problematic if KVM PPC sees signficiant development.  The current situation is
ok because the volume of patches is low and KVM PPC isn't trying to drive anything
substantial into common KVM code, but if that changes... 

My other concern is that for selftests specifically, us KVM folks are taking on
more maintenance burden by supporting PPC.  AFAIK, none of the people that focus
on KVM selftests in any meaningful capacity have access to PPC hardware, let alone
know enough about the architecture to make intelligent code changes.

Don't get me wrong, I'm very much in favor of more testing, I just don't want KVM
to get left holding the bag.
