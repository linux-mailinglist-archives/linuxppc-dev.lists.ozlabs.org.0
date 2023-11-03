Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C87E0C0E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 00:18:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kloNgxDf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMc9f1sm2z3d8n
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 10:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kloNgxDf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3hh9fzqykdmk7tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMc8p4VJyz300g
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Nov 2023 10:17:28 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b31e000e97so36317887b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Nov 2023 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699053445; x=1699658245; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wL2niLMenc8rXWamhCVdrH1GL3hMVyvGfUspx7X4DS0=;
        b=kloNgxDf9yIgHQr4Ky2ZzO5NYhim16+9BU3lpREL7yFlOQ3dTpQ0oNUMM/W6tC4ldl
         Jd9GLEquXcgRNrroqiVJBLEiuaaSG7XCAVNR4eVGXWJp8bNj7V/0+sM44GoknhqDvTWA
         bmwedEGnE1zNtlvtSvcwM6FiiHAMBsYNgzvnTSUbIzInkhsStQDw38DF88RojYCrnks0
         9l/oZ485jtrekX2P9FKmrtqPoFCMDCKmVMfLTcB9TIActCe9MaeWSfMTcZ+lJxcxJWGf
         sEx8HAF2zsPvTXs+f49BUe/pT5Rawsuz9fVPFo56mv7hFrKwrHEDP5TjHxeSs5l0yC22
         dxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699053445; x=1699658245;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL2niLMenc8rXWamhCVdrH1GL3hMVyvGfUspx7X4DS0=;
        b=VriyUEIr8ojuxmuWf2+4aQlZHEJTUB7psGlQppuY61JCbYw7oGj4v9GfQHOU95chsX
         p0abvwCcOHzBu+LmxPW7DG9U4XNlw88dhxKFX5+QNg2uomJ6f44PpxhHYvU7B24WJBvy
         u7hF2aroMDSOz2GzFDicT9hms9JRQmpXibf7Zm7sFDY7UIUDHPUpuS7CiSX2tnJZU7a1
         EnMjiuMRwHBWi2pYZXFOYXdVrx0IT9uE2492ZrbPkkxs0Nbgc3tZ8Xh32cixcxnBvV3e
         Svct/JquC3HvdSlOZKP/DP+fTfBSwa4rbYBRtMvYEiecvhxetRGkhc3BV+aw4H69s3+C
         ArzQ==
X-Gm-Message-State: AOJu0Yz3JSeuYoe1trSIw08nyTFknQzk0Yi0kWrPk66vkwKozl/gDwr0
	t/bJGYh1LjY84WDlYy0zr6QptBHT47c=
X-Google-Smtp-Source: AGHT+IGJDyi83TwJx+I35GsLQytKZmA4RJCyClEGAPsqdhhOEgS+Lm1oHaoRVNSHVuwQA3+7WVp40Ul4xUY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4958:0:b0:59f:3cde:b33a with SMTP id
 w85-20020a814958000000b0059f3cdeb33amr84737ywa.6.1699053444944; Fri, 03 Nov
 2023 16:17:24 -0700 (PDT)
Date: Fri, 3 Nov 2023 16:17:23 -0700
In-Reply-To: <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
 <ZULJYg5cf1UrNq3e@google.com> <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
Message-ID: <ZUV_g1_3pj62OgF-@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Fuad Tabba wrote:
> On Wed, Nov 1, 2023 at 9:55=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > E.g. a misbehaving userspace could prematurely delete a memslot.  And t=
he more
> > fun example is intrahost migration, where the plan is to allow pointing=
 multiple
> > guest_memfd files at a single guest_memfd inode:
> > https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com
> >
> > There was a lot of discussion for this, but it's scattered all over the=
 place.
> > The TL;DR is is that the inode will represent physical memory, and a fi=
le will
> > represent a given "struct kvm" instance's view of that memory.  And so =
the memory
> > isn't reclaimed until the inode is truncated/punched.
> >
> > I _think_ this reflects the most recent plan from the guest_memfd side:
> > https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.16=
89893403.git.isaku.yamahata@intel.com

Doh, sitting in my TODO folder...

https://lore.kernel.org/all/20231016115028.996656-1-michael.roth@amd.com

> Thanks for pointing that out. I think this might be the way to go.
> I'll have a closer look at this and see how to get it to work with
> pKVM.
