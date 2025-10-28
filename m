Return-Path: <linuxppc-dev+bounces-13357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D2C122AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWV4708Hz304H;
	Tue, 28 Oct 2025 11:29:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761611388;
	cv=none; b=jsEBPDILHMfS+2l6JC57o3w9SAIyKZBfr1L/ERnCldIaRX2yw2+nD1EqQU0aBV7OVb+hwYtTy4xeHDIFSsBzYPucoXVkmUir4qpU1XtX3RzrefVemtEdcIi2b4AB6kBw17xFEGiEQ6J/kMaofk4XQYtXppcc4vi9a3SeEMVnIntawzQ6yxwCwezhCZVulcwbzqlZDMxBaO1Y50lKT0ZOjWX0eP8AAuF6AFOYM5jHd8/3TPP24KbM9FTZzUPSfKHq2a6GIDJ1NqtdvNRGiMkmtcmXnGO482Xpj8zZb0GTt+GQwn657fJFCIQlEWCPMFCWtBEjz4wlOuTwJ7/EZrvg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761611388; c=relaxed/relaxed;
	bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HzqK5oRm+DT0sHXcqR4gWmyeAtqUOSG1kosxCMccI4unwcYuNvUd9ZWBj1NHFGgh2Ke5JUuqFaS187HDNcbWra3kcAvcWPp9ym3D9KsBuY5RQDGg2VyP8OhV1RO8PNi+IiM1XPFVT6heGYry+id/ECSwRSX1HzcErAZ9NY87W+wx+b7+yoKgTQOGpM/yPhxZSIgk/+Z2YUF9jDtqnHMS+bGmEdXzQgjvelX5NQ7g/OAzbc3aJG9wW9akuaIxr5T/e00DI8k+3ueU5R+RBavEHyJODWFKu0LirL0upJ4TfKXEANDdfvvYVxRX18lRydauW2zfewJcTYkiFl1s6Lh8Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vCrCgWKg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ea4aaqykdomxjfsohlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vCrCgWKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ea4aaqykdomxjfsohlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWV35PPJz2yFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:29:47 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3304def7909so4092831a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 17:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611384; x=1762216184; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=vCrCgWKgvHvA8Kg5dQU4xekJm1vFknZt1iTrpu6OBS3VC3giV0jSW5v1ssOMD1SnqY
         iJfiUe4wwAiEkvYk/6ZQQqwlSc/78yrmmQTAvnp5w8QcDyZfGNMOKU6gOEdztN0dUNbU
         ptl9LVistR47ebJbwUXRU5dk5UsEy3DA2vVd+Dyk1CKXZ5/F1EQ4rUU4OfEJxll6jOiF
         2F2Hv8/VCugW/VTPYyxw3E4r9A0Rp2tpWfiTWemeukwOXtpA2VgWw8Qgt/pWsZHOg2xR
         JlgsPTrj1Vaimlqtjwom51ymCDAAPmk1JJb7zFvc0xhdQYP2iRRNvYaupYt9tLhfq8Km
         /ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611384; x=1762216184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=H/Z+3Zfpes1/o7f5vPVS2FNEgGQIu7d7XG9Oa0Pus7rzG6wH1gidPl+MUS4q9pf5LV
         rJNkj5SRuSuALr0SBCjAsO3y8Y1go2n7Tlv4uKYkd8vdqm3NxEf39X2yeQ0bcYgDScMt
         CK54eSOR7ETekxQiEP8ugp59yHvNJvulN617ktighH2c5NpChqQPrk+Ow695xk7HAw3g
         gcou8ZoHV2Yfb4zBLhKIOqt1fA/NFvOB4gkKDwrShXk7y0lEUOwt+7d8IE6ZBzUZM+bv
         r8UdobmwruPEbRnH76Tik4aETxvGAQdGhpPZQyel0RxuXnKR8xUA8yQZn94+R0rbgzKc
         qCug==
X-Forwarded-Encrypted: i=1; AJvYcCX24Xu8K7zfVb5OmsDQKfieu9upLpdfJJc49YDTLjJjMGL0CrZpBJXMc4FQCuUEdLnOq4DM8L5m6mwTww4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyanjP+lGFIKhj060yneOtq/Wz0mr4a2yp7qEQ6o2PnXFtz+AJv
	osCIOUApwil9rudbkwvl3tr1RD8XUVW4c/OqdyYZRgutb2x91Zo3TY9LwCLIZseor0TqusDmtXs
	LuhTAQA==
X-Google-Smtp-Source: AGHT+IEcbPffJX+DPzKHtANj5YoID2qTNS+wCvJIhOFTengBDdmvUTitjaF5SaOhKDAJ4Iu3BAJZiOrVVlg=
X-Received: from pjqc14.prod.google.com ([2002:a17:90a:a60e:b0:33b:51fe:1a77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0f:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34027a0775bmr1898674a91.13.1761611384405; Mon, 27
 Oct 2025 17:29:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:29:42 -0700
In-Reply-To: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com> <aPuqYz3ly5a3__mf@google.com>
 <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Message-ID: <aQAOdiSUktmAJKsw@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/25/2025 12:33 AM, Sean Christopherson wrote:
> > On Fri, Oct 24, 2025, Binbin Wu wrote:
> > >=20
> > > On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > > > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spt=
e() as
> > > > providing a one-off helper for effectively three lines of code is a=
t best a
> > > > wash, and splitting the code makes the comment for smp_rmb()  _extr=
emely_
> > > > confusing as the comment talks about reading kvm->arch.pre_fault_al=
lowed
> > > > before kvm_tdx->state, but the immediately visible code does the ex=
act
> > > > opposite.
> > > >=20
> > > > Opportunistically rewrite the comments to more explicitly explain w=
ho is
> > > > checking what, as well as _why_ the ordering matters.
> > > >=20
> > > > No functional change intended.
> > > >=20
> > > > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> > >=20
> > > One nit below.
> > >=20
> > > [...]
> > > > +	/*
> > > > +	 * If the TD isn't finalized/runnable, then userspace is initiali=
zing
> > > > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the numbe=
r of
> > > > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.=
ADD.
> > > > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pa=
ges
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?
> > Yeah, updated (and then it gets deleted a few commits later :-) ).
> Oh, right, nr_premapped will be dropped later.
>=20
> Since the whole nr_premapped will be dropped, do we still need a cleanup =
patch
> like patch 12 which will be dropped finally?

We don't strictly "need" the cleanups, but IMO intermediate cleanups are of=
ten
worth doing even if they get thrown away, soo that the code is in a (hopefu=
lly)
better state when the "big" functional change comes along.  I.e. if code 'X=
' is
easier to understand than code 'Y', then theoretically/hopefully X=3D>Z is =
also
easier to understand than Y=3D>Z.

