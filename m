Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FE75D0D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:43:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Kleh8Qps;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6xkC4cmgz3cZh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 03:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Kleh8Qps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3o8o6zaykdeiwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6xjL0l25z3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 03:43:01 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c8f360a07a2so2020447276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961380; x=1690566180;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DBmD+NWofmGocm5Vnh+WkykM6ONviwwjpnheMJOIK8=;
        b=Kleh8QpsTsNUhesVcFKaorRemH2b7oCPrjs/EZvvDbSIhnU646cwazqZifDUNyxi+Q
         5JqV9CUAW8QaG2YIfQCin1qnHve1MgXICSxbyDPLV8MjQRP2Kpasi9pL5sbB8O7UYjBa
         jgRp3U3UDnkkD6e19TR7wMGjHPVEilwKuPvhlll1BPS6C8DVpWehyFU2WczctGneBM1v
         8h/JnmhFLy8tlfXVq6NzVrFmSK26MkEiOaRidvtVK6eqi9qhd/VP0gDfCAxADqhE52gi
         5Uc2vJ9HkSFyp91F1M5r9W96Us+3KtG0sWvhTTO0jFsQ1GbEx81tOU6Kjmmi3SIi/0Fk
         yy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961380; x=1690566180;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7DBmD+NWofmGocm5Vnh+WkykM6ONviwwjpnheMJOIK8=;
        b=Hy4hps6AnZz8YRkd49WDgTitPfe5kYyJhiMzP7KF2hbQzNdnhBLpU5QmzDjMoRnCLE
         /TAqYUbnp7zeY1mzxtEOoADc6X9Dz49zuSEVoiwVF8Dov6qLp9lzvxEVpwhYN30xCThg
         mh27J/bPmqRoT7RkyE9HEuydL2A2Xgrl6cJaYbxW1BXIs03mXry8oVwm4gT4W84tF2rM
         Jld4k+ULKSOwG3vpO5GycdIq2jvgNResQwKbmbIkJxdqofRJaxYwMtITaxOsQmnaDh+g
         FlTR6F+fDfFOXHfBe1MJMHEy0AE7xhO7jZrNhsv2lvNWEw/axfn0v3Fu8LnG4H5NgDYl
         ROxA==
X-Gm-Message-State: ABy/qLY6lTsBLVdbW57MbQtU/m3D9myoPizJtmFuCfcdJyhExkprlR/R
	HSIX5aG30Edkl+ESrkuxhjwt1DaXle8=
X-Google-Smtp-Source: APBJJlE/aF1pYHHKoAMy1+E4aY5+aL4FeQDb+p2ML0zhZVvr/Ah+OV80Lx1tRjSoeSb0qOhWhlHbRbztBVY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10cd:b0:c1c:df23:44ee with SMTP id
 w13-20020a05690210cd00b00c1cdf2344eemr19665ybu.0.1689961379855; Fri, 21 Jul
 2023 10:42:59 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:42:58 -0700
In-Reply-To: <29baac45-7736-a28c-3b2d-2a6e45171b8b@intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com> <29baac45-7736-a28c-3b2d-2a6e45171b8b@intel.com>
Message-ID: <ZLrDopLH+3vN8rE6@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023, Xiaoyao Li wrote:
> On 7/21/2023 11:05 PM, Xiaoyao Li wrote:
> > On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > > @@ -6255,12 +6298,17 @@ int kvm_init(unsigned vcpu_size, unsigned
> > > vcpu_align, struct module *module)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_async=
_pf;
> > > +=C2=A0=C2=A0=C2=A0 r =3D kvm_gmem_init();
> > > +=C2=A0=C2=A0=C2=A0 if (r)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_gmem;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_chardev_ops.owner =3D module;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_preempt_ops.sched_in =3D kvm_sched=
_in;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_preempt_ops.sched_out =3D kvm_sche=
d_out;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_init_debug();
> > > +=C2=A0=C2=A0=C2=A0 kvm_gmem_init();
> >=20
> > why kvm_gmem_init() needs to be called again? by mistake?
>=20
> I'm sure it's a mistake.

Yeah, definitely a bug.

> I'm testing the gmem QEMU with this series. SW_PROTECTED_VM gets stuck in=
 a
> loop in early OVMF code due to two shared page of OVMF get zapped and
> re-mapped infinitely. Removing the second call of kvm_gmem_init() can sol=
ve
> the issue, though I'm not sure about the reason.

Not worth investigating unless you want to satiate your curiosity :-)
