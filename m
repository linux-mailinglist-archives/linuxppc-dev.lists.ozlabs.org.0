Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C566CB77C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm0g32DbBz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 17:50:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AZ48P9iK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AZ48P9iK;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm0f84JvBz3cR7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 17:49:19 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id d13so9977573pjh.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679986158;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoJoR/Tf/+agVqq5N9U8KqDZp8Fzv4RWFRo0gu2tA7Q=;
        b=AZ48P9iKtAOuE/IwSmh2Ck/2zfCTv+eWgPUDJ0cf5kHzNha7iDWgNWNRS01gjOdwYC
         kfX5fP+Hs5mW0a+T4xymQY9FzGCaES8cgZPPRibRxlQJNIR+rjS0wNY3zMfnOC7f0Agr
         79ZMN11PM8u9yLNO6wC+NoxfdnP/+BEvb22kWbqx5DLsAy5oq7xEcZG9DOgZo4oy/ZLB
         WXAcBC1rVQZZEnQUhFXFt6yiWPUl0b66W1fgLxg698nGb1z4tANXjMcxJi6ycR3W8g3x
         X0Q3zM+leTj8Iw9drk0J+aylV5mF2jjkOMlzkPekpfJE+B6p5l9nfgXWJwDMNj3VXL7c
         xnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679986158;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eoJoR/Tf/+agVqq5N9U8KqDZp8Fzv4RWFRo0gu2tA7Q=;
        b=66i56ZS4CncKM2t4qRg3DlyR7rWR9jHmpSuNk4/vD0d8sci4V9OeSOHnpHz0RDUU9r
         qWK0LTjbBpCMbQDVbn5+rME2t3QUVWuXJLd+y7WCnV3LZeKnGEqXZmug/gNYf3m8UKvi
         RFJeI+1Uifqkh5yjS2c8hba+vOWEScHoz1ZFJp8XYiP9zor9AnzjgfY0N9yXCr5ZvLVx
         SC36YyxFZo6JGT0gWWjRXpv766OK2gU2NoQOJU/BxVezH/226hMIGcoZiDMLKlrefaFh
         65g2h5bcE4kXqoAdg4/UZiIEU6Jsbp5RGYUY01KpaIS6icdQj7R5waBGEPHZ7BVYCGRL
         Kfhw==
X-Gm-Message-State: AAQBX9c6ufPBD96tLE920XRSyNAsYlwtgUJvZFSONkDNZNrVnaqSpKk6
	1crCFnPzryRHMYpTwTBUKg7YRHdL/TI=
X-Google-Smtp-Source: AKy350Z+LDqWEtoWTPJU9FsP2NtYYVe8BuzAZmXcN48hzNNSaS1VZh4Wq103LSc5atUPPOs1hQqeiQ==
X-Received: by 2002:a17:903:124d:b0:1a2:4921:f9a1 with SMTP id u13-20020a170903124d00b001a24921f9a1mr8300053plh.44.1679986157837;
        Mon, 27 Mar 2023 23:49:17 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902788f00b001a25fe38789sm851168pll.60.2023.03.27.23.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:49:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 16:49:12 +1000
Message-Id: <CRHTDZZU72CJ.3QAHM67MV5G47@bobo>
Subject: Re: [PATCH 0/2] KVM: PPC: support kvm selftests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sean Christopherson" <seanjc@google.com>
X-Mailer: aerc 0.13.0
References: <20230316031732.3591455-1-npiggin@gmail.com>
 <87ilf0nc95.fsf@mpe.ellerman.id.au> <ZBs9tGkI5OQqtIqs@google.com>
 <CRGX867PJCBF.1MV46YLYXMBYZ@bobo> <ZCHV20oFkFzp/AZs@google.com>
In-Reply-To: <ZCHV20oFkFzp/AZs@google.com>
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

On Tue Mar 28, 2023 at 3:43 AM AEST, Sean Christopherson wrote:
> On Mon, Mar 27, 2023, Nicholas Piggin wrote:
> > On Thu Mar 23, 2023 at 3:41 AM AEST, Sean Christopherson wrote:
> > > On Thu, Mar 16, 2023, Michael Ellerman wrote:
> > > > Nicholas Piggin <npiggin@gmail.com> writes:
> > > > > Hi,
> > > > >
> > > > > This series adds initial KVM selftests support for powerpc
> > > > > (64-bit, BookS).
> > > >=20
> > > > Awesome.
> > > > =20
> > > > > It spans 3 maintainers but it does not really
> > > > > affect arch/powerpc, and it is well contained in selftests
> > > > > code, just touches some makefiles and a tiny bit headers so
> > > > > conflicts should be unlikely and trivial.
> > > > >
> > > > > I guess Paolo is the best point to merge these, if no comments
> > > > > or objections?
> > > >=20
> > > > Yeah. If it helps:
> > > >=20
> > > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > >
> > > What is the long term plan for KVM PPC maintenance?  I was under the =
impression
> > > that KVM PPC was trending toward "bug fixes only", but the addition o=
f selftests
> > > support suggests otherwise.
> >=20
> > We plan to continue maintaining it. New support and features has been a
> > bit low in the past couple of years, hopefully that will pick up a bit
> > though.
>
> Partly out of curiosity, but also to get a general feel for what types of=
 changes
> we might see, what are the main use cases for KVM PPC these days?  E.g. i=
s it mainly
> a vehicle for developing and testing, hosting VMs in the cloud, something=
 else?

I didn't have too much specific in mind, just generally a bit more
development activity.

As for use cases, I think broadly KVM is increasingly seen as a Linux
feature and expected to be there, even in so-called enterprise world.
For software and workflows designed around Linux virt, it can be
difficult or impossible to substitue the proprietary partitioning layer
in our firmware. So there is always someone who wants KVM for something.
It could be all of the above, and even just as a traditional hypervisor
hosting VMs in-house, there are people who would like to use KVM.

>
> > > I ask primarily because routing KVM PPC patches through the PPC tree =
is going to
> > > be problematic if KVM PPC sees signficiant development.  The current =
situation is
> > > ok because the volume of patches is low and KVM PPC isn't trying to d=
rive anything
> > > substantial into common KVM code, but if that changes...=20
> >=20
> > Michael has done KVM topic branches to pull from a few times when such
> > conflicts came up (at smaller scale). If we end up with larger changes
> > or regular conflicts we might start up a kvm-ppc tree again I guess.
>
> A wait-and-see approach works for me.  I don't have any complaints with t=
he current
> process, I was just caught off guard.

Okay. Complaints and suggestions to improve the process are always
welcome, so if something could be done better, feel free to ping
the list or powerpc maintainers offline.

> > > My other concern is that for selftests specifically, us KVM folks are=
 taking on
> > > more maintenance burden by supporting PPC.  AFAIK, none of the people=
 that focus
> > > on KVM selftests in any meaningful capacity have access to PPC hardwa=
re, let alone
> > > know enough about the architecture to make intelligent code changes.
> > >
> > > Don't get me wrong, I'm very much in favor of more testing, I just do=
n't want KVM
> > > to get left holding the bag.
> >=20
> > Understood. I'll be happy to maintain powerpc part of kvm selftests and
> > do any fixes that are needed for core code changes.If support fell away
> > you could leave it broken (or rm -rf it if you prefer) -- I wouldn't as=
k
> > anybody to work on archs they don't know or aren't paid to.
> >=20
> > Not sure if anything more can be done to help your process or ease your
> > mind. It (KVM and kvm-selftests) can run in QEMU at least.
>
> Updating the KVM/powerpc to include selftests would be very helpful, e.g
>
>   F:	tools/testing/selftests/kvm/*/powerpc/
>   F:	tools/testing/selftests/kvm/powerpc/

Oh good point, I should have included that. I'll send a patch.

> and ideally there would be one or more M: (and R:) entries as well.  I'm =
not
> all that concerned about the selftests support being abandoned, but the l=
ack of
> specific contacts makes it look like KVM PPC is in maintenance-only mode,=
 and it
> sounds like that's not the case.

Yeah, I guess the intention was to bring it a bit more under general
arch/powerpc maintainership but it does look a bit odd having a top
level entry and no contacts. We'll reconsider what to do with that.

Thanks,
Nick
