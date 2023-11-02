Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A37DF53F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 15:42:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Hae22E3x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLmmr65SMz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 01:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Hae22E3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3hlvdzqykdmu3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLmm24CjKz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 01:41:36 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da03ef6fc30so1219684276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698936092; x=1699540892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=Hae22E3xe/CERGdU/kKy3hi2vDlyvkXerTB012gnK8ZqzlBKjr3+xvR82N7W7W3MY5
         yVmRchpNFP6sJ33Pq43T7V/PHwAVbgs5Re+gPMkUn9OSRlYLCd5DOPd+jB9GWibl7f1g
         5anWBRLe+FX2kb8q/OpKHPCRCBacJAfKG1ezHAkpSVik8pPLLJxgA+pSI9uV7jpvrP4b
         XPq9Uff5zYx1B4YycsGGwagmIyIYGhtR2nektFGiz8IywUbcKHuVoGvh7BwknQior9vd
         qq6Ef9oS7eXCfWqn8VZYjBjYJFdKAwWesl2Ogr0mp6StjABjxZxCsk56Wl+hN6HJG/Gs
         YiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698936092; x=1699540892;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=NoJKnnFN7FzcQ18az+MG4LYp7pt/m6K0iEY2UDh8+hOJAXmnLiHL2aSGKnhRtXmVz+
         QWzgqLaBQOR5XNFE1WG9/J4mjlpZnyGHShX0TAOYA7WGrc1BA90fUnDCNB7YJ+dfMWLu
         XW+PCJs0ew7FWfLzySuF9TaOwDIipj2Qeb9S0oeoT86cxBk19cqd6jlcTuGgX6HMcVV4
         mEjDTJHLqb3DL8vk3cctUokIlxN1yL4L3gTIvvkkjWE8SB0th+rkK6Cs+u4oSg9JGKj1
         dNCvmmnpMEsfOCTkt/XBmfYGYLkDej2j28t8Em8N0OsFrRNrCoRcTFyj1SwtDBaMOTbi
         H9vw==
X-Gm-Message-State: AOJu0YzUxK1SAHRWUroI+1DHADGqC/cMvLJDHJ7uh+Y3dbXA1FHEPCdV
	EpsimVDy489pyG8Y2RxvaNf+0G1e1CI=
X-Google-Smtp-Source: AGHT+IGookYXrYm1A+ma3WZO34BPnkwMLXQzWy+6HX4P/l5wwOteWAD0NK2vYdNE8zwnCUE9EMm+eRT161A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2fce:0:b0:d9a:f3dc:7d19 with SMTP id
 v197-20020a252fce000000b00d9af3dc7d19mr331431ybv.11.1698936092597; Thu, 02
 Nov 2023 07:41:32 -0700 (PDT)
Date: Thu, 2 Nov 2023 07:41:30 -0700
In-Reply-To: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Message-ID: <ZUO1Giju0GkUdF0o@google.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
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
> Hi,
>=20
> On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifie=
r
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> >
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> >
> > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 ++
> >  virt/kvm/kvm_main.c      | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 96aa930536b1..89c1a991a3b8 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> >         gfn_t start;
> >         gfn_t end;
> >         union kvm_mmu_notifier_arg arg;
> > +       bool only_private;
> > +       bool only_shared;
>=20
> If these flags aren't used in this patch series, should this patch be
> moved to the other series?

If *both* TDX and SNP need this patch, then I think it's probably worth app=
lying
it now to make their lives easier.  But if only one needs the support, then=
 I
completely agree this should be punted to whichever series needs it (this a=
lso
came up in v11, but we didn't force the issue).

Mike, Isaku?

> Also, if shared+private is a possibility, doesn't the prefix "only_"
> confuse things a bit? I.e., what is shared+private, is it when both
> are 0 or when both are 1? I assume it's the former (both are 0), but
> it might be clearer.

Heh, I was hoping that "only_private && only_shared" would be obviously non=
sensical.

The only alternative I can think would be to add an enum, e.g.

	enum {
		PROCESS_PRIVATE_AND_SHARED,
		PROCESS_ONLY_PRIVATE,
		PROCESS_ONLY_SHARED,
	};

because every other way of expressing the flags either results in more conf=
usion
or an unsafe default.  I.e. I want zapping only private or only shared to r=
equire
the caller to explicitly set a non-zero value, which is how I ended up with
"only_{private,shared}" as opposed to "process_{private,shared}".
