Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248747BB080
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 05:22:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CR0iuFWP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1tyQ71gZz3ccW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 14:22:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CR0iuFWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lx0fzqykdnqi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1txZ0NP0z3c4R
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 14:21:20 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59f4f2a9ef0so25211827b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Oct 2023 20:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696562477; x=1697167277; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GCfD3J/utVXt7fNFcXS7tndSxc76Lg25lhLquZNVGo=;
        b=CR0iuFWPtUldTYzXYpsDwiZcEIwCFsXQAdu1rWCmlZMpPCsIq9qZXd3j5N9ursujEE
         j/WHbBAdDFKz0qNoU7SFliNniJWLr50ngRZ3wLIGjhukowgGY5UQH/sXt05mWf5EwifM
         8hEu8JHS6dUWRc2xbfKClXiMKfF/DJzZhYcjn+8OwyFMOIJjuC/8pxc7Bhgp2cCqqWhQ
         g8Q6FJlp2Xy/KYE/SNEU/SiEix1xujgmBAE3PX38duFf8/1LjJt0WSNljd3Fu6I4tYTt
         Bjt0FqY4buYhKv829xKGdtCJ5xB7nej0PyuqxzV7x/DxLwJwkKgaslp6stGAOrSGBXUB
         5lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696562477; x=1697167277;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+GCfD3J/utVXt7fNFcXS7tndSxc76Lg25lhLquZNVGo=;
        b=XeXWO5F9VUHcm9UUL2yBNuR68E68ObBX2euL2rLqJDVvZgBKB6H+5QUnW+jQwmHl2X
         7OJ7xqTnzTPjQxbupeB/ibwTZBO2w7xQ+9GsE0+xRTYDNeLD3wZGFRHuwxg5G1xRTw5a
         nMVUuHKMmWB63GSxeZI3gX+G2nJjRcfIPrPF7W3XuRkVpcg92bLSr8GIJeFtRynkMJmi
         PuUAWQHdvHnDGXiO7MYIXhfE/rTNThE0y3iN0gWGr09H+lRq+WQNBJhIBqdNSWj/hwkg
         tCQGnydyLYVNhJ14MzLUO1fDPthp8UXclubhUD93j0pFmDox1W+aX3NEBNigcGZ53EYX
         iyRg==
X-Gm-Message-State: AOJu0YwejWLirUTNEVFYHJoygb4vdKypEdQbDebYC1rKqG0ilk4XK9Ja
	0jEzSvFHwDM1QAl061cBdq3BHrNHqGc=
X-Google-Smtp-Source: AGHT+IHbgJX1dul2brLKqtxy3zNH4Wq8osuz6z+RCm0MrNAV7Qoo4mqOPY/NVTlIcosnwAkmq4EHKfjNEDc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ae41:0:b0:d78:a78:6fc7 with SMTP id
 g1-20020a25ae41000000b00d780a786fc7mr101904ybe.6.1696562477545; Thu, 05 Oct
 2023 20:21:17 -0700 (PDT)
Date: Thu, 5 Oct 2023 20:21:15 -0700
In-Reply-To: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
Mime-Version: 1.0
References: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
Message-ID: <ZR99K_ZuWXEtfDuR@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Cc: KVM <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, KVMARM <kvmarm@lists.linux.dev>, "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <q
 perret@google.com>, Liam Merwick <liam.merwick@oracle.com>, LinuxMIPS <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 05, 2023, Fuad Tabba wrote:
> Hi Sean,
>=20
> On Tue, Oct 3, 2023 at 9:51=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > > Like I said, pKVM doesn't need a userspace ABI for managing PRIVATE/S=
HARED,
> > > just a way of tracking in the host kernel of what is shared (as oppos=
ed to
> > > the hypervisor, which already has the knowledge). The solution could =
simply
> > > be that pKVM does not enable KVM_GENERIC_MEMORY_ATTRIBUTES, has its o=
wn
> > > tracking of the status of the guest pages, and only selects KVM_PRIVA=
TE_MEM.
> >
> > At the risk of overstepping my bounds, I think that effectively giving =
the guest
> > full control over what is shared vs. private is a mistake.  It more or =
less locks
> > pKVM into a single model, and even within that model, dealing with erro=
rs and/or
> > misbehaving guests becomes unnecessarily problematic.
> >
> > Using KVM_SET_MEMORY_ATTRIBUTES may not provide value *today*, e.g. the=
 userspace
> > side of pKVM could simply "reflect" all conversion hypercalls, and term=
inate the
> > VM on errors.  But the cost is very minimal, e.g. a single extra ioctl(=
) per
> > converion, and the upside is that pKVM won't be stuck if a use case com=
es along
> > that wants to go beyond "all conversion requests either immediately suc=
ceed or
> > terminate the guest".
>=20
> Now that I understand the purpose of KVM_SET_MEMORY_ATTRIBUTES, I
> agree. However, pKVM needs to track at the host kernel (i.e., EL1)
> whether guest memory is shared or private.

Why does EL1 need it's own view/opinion?  E.g. is it to avoid a accessing d=
ata
that is still private according to EL2 (on behalf of the guest)?

Assuming that's the case, why can't EL1 wait until it gets confirmation fro=
m EL2
that the data is fully shared before doing whatever it is that needs to be =
done?

Ah, is the problem that whether or not .mmap() is allowed keys off of the s=
tate
of the memory attributes?  If that's so, then yeah, an internal flag in att=
ributes
is probably the way to go.  It doesn't need to be a "host kernel private" f=
lag
though, e.g. an IN_FLUX flag to capture that the attributes aren't fully re=
alized
might be more intuitive for readers, and might have utility for other attri=
butes
in the future too.

> One approach would be to add another flag to the attributes that
> tracks the host kernel view. The way KVM_SET_MEMORY_ATTRIBUTES is
> implemented now, userspace can zero it, so in that case, that
> operation would need to be masked to avoid that.
>=20
> Another approach would be to have a pKVM-specific xarray (or similar)
> to do the tracking, but since there is a structure that's already
> doing something similar (i.e.,the attributes array), it seems like it
> would be unnecessary overhead.
>=20
> Do you have any ideas or preferences?
>=20
> Cheers,
> /fuad
