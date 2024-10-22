Return-Path: <linuxppc-dev+bounces-2474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF549A94CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 02:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXXyN2BgWz2xpl;
	Tue, 22 Oct 2024 11:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729556732;
	cv=none; b=NSjUBnVnzKFC19z+v9qDiuI+m+J1DRbaUG7nvqYa47Zm/cdnUEofYfT503KOpfpLMwXsb9kZK9xOYkm/UC4YmzdNnuE/wrryzson1sKdVcZMFG6MpE/o1dA6A3EMr3cGXnToybXW7M2P/0w7SzQ1edhY9Z1mSwbJQI51u2cKJdxOTNJSwH8Wk0ObokYpTCLN2VV+ak38msRVa23W2nb4anmvPvVt5c+AuZxbevEbKVPDBhMIaY2Go+ETO1gYOatXriKVy4+HOHiO4yjRTZtWjNoQFexgjZTR1PtliYCZuvpVDfpjyCxNf1PmKOznMQGec1zT2KegHjiqqTefW3dTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729556732; c=relaxed/relaxed;
	bh=MsmHAIiTKT1PsAHJrcn3wc4lWOtEN6U6cuZlArYcGvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k252rS7K4zgJiJRLFMGJm6/nGvZQh4RVfClgKUGiWNdNqCSIl6xXkAHsKzM3ijBTp22leVu1zJNtmIxaPsoLsaK7E3UrwRS7TioyAz1UJa5+961NZGnI/aw3I42nE+vxHqIK+9HUM8D3hrMfRSO7iJlZg45TwrLDagEa/EDgCARpWBexoCIujLGsgMvn3Z4IGWb8txO4S6WJ7RxuNiqBy0ViaEJDcb7ntUWD1LGl7w6T7UpNdWuA12zlxRYQezYvWusXnUfX5XpIaXK7/GaFFQ69APW53ttwRfgTGN+Jel0Syn5CAUombO2rXyuR5HboeBVeQJX7Ih4B8Ia2s7k+BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xO1+a1m6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=39vawzwykdhmjvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xO1+a1m6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=39vawzwykdhmjvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXXyL3pLlz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 11:25:28 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e292dbfd834so7658577276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729556727; x=1730161527; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsmHAIiTKT1PsAHJrcn3wc4lWOtEN6U6cuZlArYcGvA=;
        b=xO1+a1m69RH8lxj4vNqL7K4OuLdN48dQyNqq6GJmmwNQ9C116mItYkLt2T/Vum74WI
         P49wQQSbmsgZ9EQPNRA3J0tw7QC8WrFwNyzEp2odGvAbIvu9IaC2bYkLCpSH/WsdXBpY
         UmlxGrMBaV3Sv1vczQu4n1TfAFCDGEb+HcoaRuSVLVDvC83QnSbpgbd9aJ2a6nF3xitV
         cwKBa4ps4BuQEqnkAzwQ9Y6OoYBtr+dG9CEo1a+Megc4BCwuZ2pjHHCL6jf+jLPn/W2q
         Pj2OCwacPBaHso4FB6Ie8iRZQ5DOQP9gsUUQMhGC/voFoyBSud3kQO5W1V5JPdRgOoer
         WQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729556727; x=1730161527;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MsmHAIiTKT1PsAHJrcn3wc4lWOtEN6U6cuZlArYcGvA=;
        b=rVEFBgQWL4ajsiXyKWTJpbFDKzUGiSWZstl8WhElVp+bTCI4VAEpw1yWcNwFT1jFwi
         WL/OkbRsgKh0nay1n3E/B04yK+ivkPeLV39YQjpCXzeSyX7+WhFfMdtMn3bxawUVlThJ
         gU8Vgp17HjewdXRnLoHiAVEU08faFHrXwM6fw3jR0YKb3AQPw2NPemhwyp98bOqwGP/+
         6QLTcv3wo2glpiFIPU6dExIX5RRwZ3q7vcfQrajGhnNfiPV2PeP1C1zgi4FS8sL23IQv
         SRMaJyN37yQXwJJBOLFiD3cdJRl53RqhKkNpGA+uycRdyzD/nAgHsUDGT8s4DZiPK+SV
         Az+A==
X-Forwarded-Encrypted: i=1; AJvYcCUhYAfdJdduY1thik2/86kAdoFKXcl9yLS6DRJ52RG6Xavui/6VctYDB5C4ALMm5IyeViF4pJIF5HsS41E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzg/yhnTuMR/TQEsdild2g2wfh4hz0dH1CURpZBzBwQD2rmFeGN
	F/cmK+o4uxUP4hMK90wE17XCpspT+oRbVQEZGfrR9Mh128evI5ptitAc9SghwPvNfYBh3wDFw25
	rDw==
X-Google-Smtp-Source: AGHT+IFt751p/7pq+BSWT0h/wj8dy6pof7dpapFjoV1RFsMPc4iJ6WxDdC7RwTVAow0VYtv4igk8p4vJkHM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:aae9:0:b0:e29:1893:f461 with SMTP id
 3f1490d57ef6-e2bb0feddc7mr22594276.0.1729556726690; Mon, 21 Oct 2024 17:25:26
 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:25:25 -0700
In-Reply-To: <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
Message-ID: <Zxbw9XcFCHYR1Ald@google.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024, Paolo Bonzini wrote:
> On Thu, Oct 10, 2024 at 8:24=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > v13:
> >  - Rebased onto v6.12-rc2
> >  - Collect reviews. [Alex and others]
> >  - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
> >    refcount. [Oliver]
> >  - Fix a dangling comment. [Alex]
> >  - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is=
 (was?)
> >    eliminated in v6.12.
> >  - Drop check_user_page_hwpoison(). [Paolo]
> >  - Drop the arm64 MTE fixes that went into 6.12.
> >  - Slightly redo the guest_memfd interaction to account for 6.12 change=
s.
>=20
> Here is my own summary of the changes:

Yep, looks right to me.

> patches removed from v12:
> 01/02 - already upstream
> 09 - moved to separate A/D series [1]
> 34 - not needed due to new patch 36
> 35 - gone after 620525739521376a65a690df899e1596d56791f8
>=20
> patches added or substantially changed in v13:
> 05/06/07 - new, suggested by Yan Zhao
> 08 - code was folded from mmu_spte_age into kvm_rmap_age_gfn_range
> 14 - new, suggested by me in reply to 84/84 (yuck)
> 15 - new, suggested by me in reply to 84/84
> 19 - somewhat rewritten for new follow_pfnmap API
> 27 - smaller changes due to new follow_pfnmap API
> 36 - rewritten, suggested by me
> 45 - new, cleanup
> 46 - much simplified due to new patch 45
>=20
> Looks good to me, thanks and congratulations!! Should we merge it in
> kvm/next asap?

That has my vote, though I'm obvious extremely biased :-)

