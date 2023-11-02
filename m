Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A747DF56F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 15:58:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q+nNlop9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLn7b6j0tz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 01:58:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q+nNlop9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLn6k2sFHz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 01:57:50 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0252578aso6103186d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698937067; x=1699541867; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oO6y6W0Hx2JX7rhY2F9inSHXy5EHTr89TCOrnU0rbjw=;
        b=q+nNlop9jIMbDD9PFG6gBWsNFU4t0BJhR/m9L6Qp0ZDTux8A/l0QzYA90RofXhu7y+
         5SnCMFDF3Vrebyers3fNa9aaafJfrlS7bNWOLkOPZHHKqlYzxjWAVV57feQQKdJd9zem
         HxRCd/e2Xrjf28n7FY8gkclDh7zenhOF+6XTm4OvKMe+siyLJfWA5FijL5W8DsVviJkn
         Q+e12jC5ulmxGiHD0Yeca1kIbowddOcY9cqPibKfpXJ3rmLkCtkbFfAyX4C+NULAwUzB
         TzNTh/QryunLBWiSs+c36/gV0ho/NLnQ7ah4UL+BamXZ0rjesoqHzmIm2mPivRRx2UpL
         r/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698937067; x=1699541867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oO6y6W0Hx2JX7rhY2F9inSHXy5EHTr89TCOrnU0rbjw=;
        b=t+56kiIjFvAS/sm7smRi0A7i4RN/j2DVs2lfdS3vtWnM8Zdpp0eWmKeFQMv1nVqnjx
         mU2xT0V3l4e0+lbX0YkrCe1z4F+roQ8tE3m614PqhjzlhnXcr8Zsvwq9Rz269xvswQhZ
         mGD/hfPcNEsCFiojjesWgna6L8eAlKjf7udrRq8D+pw7YWVWHfK+ZKKioXyOyVKLRSHJ
         R0llInNrRqd8SM6U+Z44lR6k+kY2ftpLGwGTrFptohywSsDmqlDXY+haITRaxsosG7pU
         dFZd3SdBbSFci1uHLxctP+z70fhNSfUGa+GKUC2iyx2T38PrJ6qzPEGnXxlR1vpqgCbP
         PbKg==
X-Gm-Message-State: AOJu0Yz9McD8VRD/+HlJ5dNU+DFurj+K7MD52wFuOyvV466z/k7p3e+1
	BQaNwNrlh8X2L5CaVBsfMn7AGLXpeVxfq/sA8vTCBg==
X-Google-Smtp-Source: AGHT+IHH5fWOUl6XWE3cRbRkmtci3EQG11sJ5sTElOUO4i3o8jogptvsMwjY2tQIjVOiF2P5A518xtVBqTDVb2uPT1o=
X-Received: by 2002:a05:6214:252d:b0:66d:1b2f:3f64 with SMTP id
 gg13-20020a056214252d00b0066d1b2f3f64mr24532994qvb.31.1698937066885; Thu, 02
 Nov 2023 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com> <ZUO1Giju0GkUdF0o@google.com>
In-Reply-To: <ZUO1Giju0GkUdF0o@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:57:10 +0000
Message-ID: <CA+EHjTwpVSyUC8oiii3EYU8pqEJ0D0NXA1EZt76wjfPBpk2rFA@mail.gmail.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 2, 2023 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Nov 02, 2023, Fuad Tabba wrote:
> > Hi,
> >
> > On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > Add flags to "struct kvm_gfn_range" to let notifier events target onl=
y
> > > shared and only private mappings, and write up the existing mmu_notif=
ier
> > > events to be shared-only (private memory is never associated with a
> > > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> > >
> > > Add two flags so that KVM can handle the three possibilities (shared,
> > > private, and shared+private) without needing something like a tri-sta=
te
> > > enum.
> > >
> > > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  include/linux/kvm_host.h | 2 ++
> > >  virt/kvm/kvm_main.c      | 7 +++++++
> > >  2 files changed, 9 insertions(+)
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 96aa930536b1..89c1a991a3b8 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> > >         gfn_t start;
> > >         gfn_t end;
> > >         union kvm_mmu_notifier_arg arg;
> > > +       bool only_private;
> > > +       bool only_shared;
> >
> > If these flags aren't used in this patch series, should this patch be
> > moved to the other series?
>
> If *both* TDX and SNP need this patch, then I think it's probably worth a=
pplying
> it now to make their lives easier.  But if only one needs the support, th=
en I
> completely agree this should be punted to whichever series needs it (this=
 also
> came up in v11, but we didn't force the issue).
>
> Mike, Isaku?
>
> > Also, if shared+private is a possibility, doesn't the prefix "only_"
> > confuse things a bit? I.e., what is shared+private, is it when both
> > are 0 or when both are 1? I assume it's the former (both are 0), but
> > it might be clearer.
>
> Heh, I was hoping that "only_private && only_shared" would be obviously n=
onsensical.
>
> The only alternative I can think would be to add an enum, e.g.
>
>         enum {
>                 PROCESS_PRIVATE_AND_SHARED,
>                 PROCESS_ONLY_PRIVATE,
>                 PROCESS_ONLY_SHARED,
>         };
>
> because every other way of expressing the flags either results in more co=
nfusion
> or an unsafe default.  I.e. I want zapping only private or only shared to=
 require
> the caller to explicitly set a non-zero value, which is how I ended up wi=
th
> "only_{private,shared}" as opposed to "process_{private,shared}".

I don't have a strong opinion about this. Having an enum looks good to me.

Cheers,
/fuad
