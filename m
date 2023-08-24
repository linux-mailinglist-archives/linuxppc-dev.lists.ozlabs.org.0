Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4F7873D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 17:16:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FtVfL5Tf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWmrl0jwXz3c67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 01:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FtVfL5Tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ixtnzaykdnqi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWmqt6Bl9z30XM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 01:15:53 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7475f45d31so6086503276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692890145; x=1693494945;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCC0wwp7wWSIy0MrdACmgS4Vp0ye9VEhwI7wuPMec4A=;
        b=FtVfL5Tf+6L+aGO+3VLVFfVEdfsELAv/SkE1PTKpiAC3gFVBjTzmjrn/G6noL3tCwT
         nY/EAJeRp1nUZ1X8yuA3Jxf69ZaoSNHuvOQh3ULPUAYpMu4LVrXdZw1h4nH2PAlfwGQ5
         HGQOfNLw0wvbAHb80uzDgzcI3HY8lXjzMoOoHDVH4Pz8HXQOOW7DfntGjjOL04U2gBH5
         ZxYs546ol999Lp9xjtgeFXwtR0AaARSkkT0m/gVyhfqtUMb/pTpVMTXHfDw9wPW17NyP
         1E6e3/AVVS3EyluWhAt1DasCBBld/p7NdQ0UhAyRFy01f8SCDMvj/nvu0ZKPtEv3L+Gt
         UNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890145; x=1693494945;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BCC0wwp7wWSIy0MrdACmgS4Vp0ye9VEhwI7wuPMec4A=;
        b=N2knIYCeSySIfFexQCKbv/Bk6pEAbIxpm/mOg/jRnQkqa+sZgyg3uWCrZyD7wHWdqt
         l63lsUjvciVMd/+f8pmedzK9LbD4weTvFJR1qYDgJIl+0/51aWTeypzJ5hJSxAwtAAJE
         nPLvxE1v892x1trxIU4vlWDuGrS1GMrYrN4wq3guQbYdDDSVl+zJX2UW7Z7wRtdNxnyR
         wNz7Nv9/j3GJOatn24hAso3sGQIY3igBVMy0Q9w4AxFZA5wH75C3tZEqnCEmjUMV1J8F
         Imbc6ZZiYaTFYH7sY8upGkT6ZmdC215+c//Wu+baEZhzy2+km4kdfVk/678HuOM0ILfg
         NB6Q==
X-Gm-Message-State: AOJu0YxpAqv2MKPE4Wt/hvU3lUiRvv7TiDAWd8TKKkUM4HEskEKKxO6P
	ok+uenI9RzKJ+U0fYoBdjE479C2Lh+8=
X-Google-Smtp-Source: AGHT+IEE5MT+OR26AI25mjbMCPL/tYmhkhOKeyxLgW2HJM/WWK+y8/HYNn2t4mxnVIC7aAY/Rh8OZ4/3wmA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2484:0:b0:d74:cdd7:d491 with SMTP id
 k126-20020a252484000000b00d74cdd7d491mr186602ybk.5.1692890145678; Thu, 24 Aug
 2023 08:15:45 -0700 (PDT)
Date: Thu, 24 Aug 2023 08:15:44 -0700
In-Reply-To: <CAD=HUj7F6CUNt_9txEu0upB=PBwJzkL5dBhNs_BVHX1cicqBgw@mail.gmail.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705102547.hr2zxkdkecdxp5tf@linux.intel.com> <CAD=HUj7F6CUNt_9txEu0upB=PBwJzkL5dBhNs_BVHX1cicqBgw@mail.gmail.com>
Message-ID: <ZOd0IMeKSkBwGIer@google.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023, David Stevens wrote:
> On Wed, Jul 5, 2023 at 7:25=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.c=
om> wrote:
> >
> > On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > > @@ -4529,7 +4540,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vc=
pu *vcpu,
> > >
> > >  out_unlock:
> > >       read_unlock(&vcpu->kvm->mmu_lock);
> > > -     kvm_release_pfn_clean(fault->pfn);
> >
> > Yet kvm_release_pfn() can still be triggered for the kvm_vcpu_maped gfn=
s.
> > What if guest uses a non-referenced page(e.g., as a vmcs12)? Although I
> > believe this is not gonna happen in real world...
>=20
> kvm_vcpu_map still uses gfn_to_pfn, which eventually passes FOLL_GET
> to __kvm_follow_pfn. So if a guest tries to use a non-refcounted page
> like that, then kvm_vcpu_map will fail and the guest will probably
> crash. It won't trigger any bugs in the host, though.
>=20
> It is unfortunate that the guest will be able to use certain types of
> memory for some purposes but not for others. However, while it is
> theoretically fixable, it's an unreasonable amount of work for
> something that, as you say, nobody really cares about in practice [1].
>=20
> [1] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

There are use cases that care, which is why I suggested allow_unsafe_kmap.
Specifically, AWS manages their pool of guest memory in userspace and maps =
it all
via /dev/mem.  Without that module param to let userspace opt-in, this seri=
es will
break such setups.  It still arguably is a breaking change since it require=
s
userspace to opt-in, but allowing such behavior by default is simply not a =
viable
option, and I don't have much sympathy since so much of this mess has its o=
rigins
in commit e45adf665a53 ("KVM: Introduce a new guest mapping API").

The use cases that no one cares about (AFAIK) is allowing _untrusted_ users=
pace
to back guest RAM with arbitrary memory.  In other words, I want KVM to all=
ow
(by default) mapping device memory into the guest for things like vGPUs, wi=
thout
having to do the massive and invasive overhaul needed to safely allow backi=
ng guest
RAM with completely arbitrary memory.
