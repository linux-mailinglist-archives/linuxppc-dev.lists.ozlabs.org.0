Return-Path: <linuxppc-dev+bounces-13349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED516C0FDC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 19:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwM4w4tCvz2yTK;
	Tue, 28 Oct 2025 05:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761588656;
	cv=none; b=bvcWunTL6E9S+ABb72NgalGGp4ClEBxwriGz1qHMyHroPNcCuukK8yo0VMFWMfopRXAXfPHApY2B6cKHthv0+InPriL5QxEuufrJPS6DWHgvFwG4Y+pLd6zJg60kyWUmZW8MfeyUxOv2W/5l5DRUhlstS3NUZ2ntD+Hb1zEpNp24k0moGtCXMFUcGfr+aYSR13khwNu2dytFhP56Dl38Rr9cdEB52WIjBdKiB6tcjpOYK3SJ5bwLQtGmTzXJiU4SXq61djHAghJXvs9LaFq+WThzOENNiMod8sRvG4xyREo1w+L8JFFAxI5T5GXLkq2ApUtR2S1YpZil3wwDMjX0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761588656; c=relaxed/relaxed;
	bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=csGjZtSkDgcfNObcba6lZ8TcUTbHi3aHNTx19jLxUyX967MnGo90W/RIt7Kv0UrFUhdr0ggS7nd7q/YWi1NRT9QH6mn6qQ4L8xg2HYQBYKEFj4A1gblIACb8b9VbOGqG7j0udw9h+kHKbmrweqG5Ts580J6VuIko/kXytYMzDCgm1H3PYYB1+hQWv3gm1eu9mjsH75yTNO4Eqqjpl4ERwXQK5yjIykpBQU5C1kFQmiKIn4kWGJft1QYGz+76/nE8CgtpXIJeGlkt4wB4igMgfXbpK+D4VQEIntwnORHxZ+AJgz18Xk2fNI3S+R4iGYEZbogDu9UcAuDDNg5u2AcLCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wY6w9rs/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3q7x_aaykdgqugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wY6w9rs/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3q7x_aaykdgqugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwM4v1P8wz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 05:10:54 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33d8970ae47so4450873a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 11:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761588652; x=1762193452; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=wY6w9rs/OtcJJu6SVvnkZGDGT+jur6Rvy5DGl/U10DT+r0waW3JlD4q5wjvk+62W9r
         ZSH/Q1zgCy50bGODAhvoWwMalv1IC/zpa92ySxIdgiQWppVRT7EJFIC6eS+g3UJ9u5cE
         RpUiTXCoVKXstehH3xTWwjT29RRFmQADvmncbUEEt4A8n2mrIhw3fNbyGfr9tmfdYb/E
         hUlkCIw9ds1Epa2YY1r2ROwNSsZ7++26nSbalbC1fpQRc20hPQxgN6/6roPIrKIXJTXZ
         c1rxZVjDBFTt+zpqA8TbAp7dPlBPdUrFrzeRCdpHfxLiuJIhpeN0sBOmGay/bSY7oxya
         uI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588652; x=1762193452;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=F6u6ahWcHrQEWhP37EQCw9U3lh6rqmnf1BhZdnflUhaRCy8ssAdz6Zfu4lLHcBOggD
         BzyVK56m7c6fS9iiUcW8KJVLYyVvl1YUDBvuLEJjEWYB/VORHnTpxBCFFxYxadzykHrr
         VJR5FQRRVvwUH55c1MwhdIpLP5GEj7M5pvU8P+xtYWxepoff15aurSwR3oFKP6ez8LKV
         8d9+iSQKYt8XCDzvLkri690O0kYxaQXdP8J+BIiA1zhM7/eldh3taKRc2FiN7kUQyrIy
         OWMgwj8WGkwp/kZpqnjX4xD+4OQ87/M/xfs88RnhuzBR1SHCLn9soiR2+midVzN1LN+u
         3RoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhdAPLlrhYZZBJdYEvrKDW3y5E3MYbJs0fcDGKUKvDj2q19ZwsiF0yGENVM9zBBNzpW4nqYolDamW2NF8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxH4Hqdowh6UeUwYgErZxF6Qo19fqfsqYsNOcSMJZWULYIsPeJv
	M9Zot0Pijzmloo3KEurzsOTogv8LTNyv+UZpGkENIaErhDFFtIBaTs3ciTRozIYPWKMd//Fkw/v
	EZTXSWg==
X-Google-Smtp-Source: AGHT+IFYM0pQ56UGeUzsOnJj3+Ow3Uhx6HMXZ6WjKUcRvfRsyB3bsUItowqHfr7m0JixZWoiV89rDaaCMlA=
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f81:b0:32e:52aa:3973
 with SMTP id 98e67ed59e1d1-340279e5fc5mr862252a91.8.1761588651707; Mon, 27
 Oct 2025 11:10:51 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:10:50 -0700
In-Reply-To: <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com> <aPuv8F8iDp3SLb9q@google.com>
 <aP86sdBZxXm5I17f@yzhao56-desk.sh.intel.com> <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Message-ID: <aP-1qlTkmFUgTld-@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"x86@kernel.org" <x86@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Vishal Annapurve <vannapurve@google.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "anup@brainfault.org" <anup@brainfault.org>, 
	Kai Huang <kai.huang@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org" <kas@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025, Rick P Edgecombe wrote:
> On Mon, 2025-10-27 at 17:26 +0800, Yan Zhao wrote:
> > > Ugh, I'd rather not?=C2=A0 Refresh me, what's the story with "v1"?=C2=
=A0 Are we now on
> > > v2?
> > No... We are now on v1.
> > As in [1], I found that TDX module changed SEAMCALL TDH_VP_INIT behavio=
r to
> > require exclusive lock on resource TDR when leaf_opcode.version > 0.
> >=20
> > Therefore, we moved KVM_TDX_INIT_VCPU to tdx_vcpu_unlocked_ioctl() in p=
atch
> > 22.
> >=20
> > [1] https://lore.kernel.org/all/aLa34QCJCXGLk%2Ffl@yzhao56-desk.sh.inte=
l.com/
>=20
> Looking at the PDF docs, TDR exclusive locking in version =3D=3D 1 is cal=
led out at
> least back to the oldest ABI docs I have (March 2024). Not sure about the
> assertion that the behavior changed, but if indeed this was documented, i=
t's a
> little bit our bad. We might consider being flexible around calling it a =
TDX ABI
> break?
>=20
> Sean, can you elaborate why taking mmu_lock is objectionable here, though=
?

It's not, I was just hoping we could avoid yet more complexity.

Assuming we do indeed need to take mmu_lock, can you send a patch that appl=
ies
on top?  I'm not planning on sending any of this to stable@, so I don't see=
 any
reason to try and juggle patches around.

> Note, myself (and I think Yan?) determined the locking by examining TDX m=
odule
> source. For myself, it's possible I misread the locking originally.
>=20
> Also, I'm not sure about switching gears at this point, but it makes me w=
onder
> about the previously discussed option of trying to just duplicate the TDX=
 locks
> on the kernel side.

Please no.  At best that will yield a pile of effectively useless code.  At=
 worst,
it will make us lazy and lead to real bugs because we don't propery guard t=
he *KVM*
flows that need exclusivity relative to what is going on in the TDX-Module.

> Or perhaps make some kind of debug time lockdep type thing to document/ch=
eck
> the assumptions in the kernel. Something along the lines of this patch, b=
ut
> to map the TDX locks to KVM locks or something. As we add more things (DP=
AMT,
> etc), it doesn't seem like the TDX locking is getting tamer...

Hmm, I like the idea, but actually getting meaningful coverage could be qui=
te
difficult.

