Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F77BB80D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 14:48:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ic48J16w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S27Wz5jyPz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:48:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ic48J16w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S27W32QR5z3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 23:47:42 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d862533ea85so2420758276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696596459; x=1697201259; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE5lcMpcuRWxeOB9S6L9Si7YaWv5hLYl1VeNlBZzT/8=;
        b=Ic48J16wP+UW1/uHqbyGIwDKuUPFhaqFP5lc84gJ989FSoQQ0UnVZFcRoyQMpO8REU
         DyY/0fXNilNcDgBcqusVtpPpf/FCuf5HCHyaz4VZbvC9SaXJM2TrmhfW45MbMiFOzdJF
         JcYVhRBff5o/F4/VaYG9VvweOSgyO6hhmWRdTRCVUIgHVxMqMuU54kihZtW/zDPqsf4C
         mgPWpK9uqQ5YDhT6eFy/7AZRAT8MmnISHA3Wh7JKp+xqO4GGvvrTCo10hSCmlnFyyHrf
         Kmrz+100Mww4aFqjQmU1S12mbelwnEFF5QmqYJG82J3p35lmeTFhXEO6S1MVIsITbaTz
         XQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596459; x=1697201259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE5lcMpcuRWxeOB9S6L9Si7YaWv5hLYl1VeNlBZzT/8=;
        b=ciVa3+svPQ5/Nk+4wmiYbRJl0UB2DxHLenO4xR6DYLggLHWGsx8e6IKcPro7EDnxmq
         ctG6KTnldGOxlpYkoC2TbSn7GEJ3+8hmrflE+I1rhGCEcjmoJXhWJztUS0Fr7045i+LW
         5Tlq5oB86MbX3cOiBcq6y2f4nBwVaHtkBmcnAw2Ob9/r2UOMx7lCRgwunFx7oD+Kldui
         ciI6iJMU76dpf3nEnMBPdmea4pzuxfFKmDi2cbN1s278bMNGXU2SHJD95YXlr9T4ZaST
         4O0Hl8W0uh8CXYA7XtqbjnuayRxXaRv6QOfvORSKvuL9JBNqkr86HTKza2lYjzvW01o9
         7EeQ==
X-Gm-Message-State: AOJu0Ywr7Y6v4uvyh1TbgzhuLNYGPB+jVCFEr3YZ9V8HCKWZ0sPExz1+
	dvQiOGFrlPXFB18a/PREhaUAYvUWQarrImFAA358kw==
X-Google-Smtp-Source: AGHT+IGILgsJf+f8eayHVHqX0rISrGr9tP06v0nLvKR1oTcr5riaw9zUWCGoAJpDUWeKMDK50UY6pLVZ+E+8O7Aw+dY=
X-Received: by 2002:a5b:807:0:b0:d47:8db3:8bcf with SMTP id
 x7-20020a5b0807000000b00d478db38bcfmr7283393ybp.49.1696596458614; Fri, 06 Oct
 2023 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
 <ZR99K_ZuWXEtfDuR@google.com>
In-Reply-To: <ZR99K_ZuWXEtfDuR@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 6 Oct 2023 13:47:01 +0100
Message-ID: <CA+EHjTyDPEY7B_a8GC7RS8gzfoT2q9kJqJPuHB58ZXQ_61NGkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
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
Cc: KVM <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, KVMARM <kvmarm@lists.linux.dev>, "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <q
 perret@google.com>, Liam Merwick <liam.merwick@oracle.com>, LinuxMIPS <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Fri, Oct 6, 2023 at 4:21=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Oct 05, 2023, Fuad Tabba wrote:
> > Hi Sean,
> >
> > On Tue, Oct 3, 2023 at 9:51=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > > > Like I said, pKVM doesn't need a userspace ABI for managing PRIVATE=
/SHARED,
> > > > just a way of tracking in the host kernel of what is shared (as opp=
osed to
> > > > the hypervisor, which already has the knowledge). The solution coul=
d simply
> > > > be that pKVM does not enable KVM_GENERIC_MEMORY_ATTRIBUTES, has its=
 own
> > > > tracking of the status of the guest pages, and only selects KVM_PRI=
VATE_MEM.
> > >
> > > At the risk of overstepping my bounds, I think that effectively givin=
g the guest
> > > full control over what is shared vs. private is a mistake.  It more o=
r less locks
> > > pKVM into a single model, and even within that model, dealing with er=
rors and/or
> > > misbehaving guests becomes unnecessarily problematic.
> > >
> > > Using KVM_SET_MEMORY_ATTRIBUTES may not provide value *today*, e.g. t=
he userspace
> > > side of pKVM could simply "reflect" all conversion hypercalls, and te=
rminate the
> > > VM on errors.  But the cost is very minimal, e.g. a single extra ioct=
l() per
> > > converion, and the upside is that pKVM won't be stuck if a use case c=
omes along
> > > that wants to go beyond "all conversion requests either immediately s=
ucceed or
> > > terminate the guest".
> >
> > Now that I understand the purpose of KVM_SET_MEMORY_ATTRIBUTES, I
> > agree. However, pKVM needs to track at the host kernel (i.e., EL1)
> > whether guest memory is shared or private.
>
> Why does EL1 need it's own view/opinion?  E.g. is it to avoid a accessing=
 data
> that is still private according to EL2 (on behalf of the guest)?
>
> Assuming that's the case, why can't EL1 wait until it gets confirmation f=
rom EL2
> that the data is fully shared before doing whatever it is that needs to b=
e done?
>
> Ah, is the problem that whether or not .mmap() is allowed keys off of the=
 state
> of the memory attributes?  If that's so, then yeah, an internal flag in a=
ttributes
> is probably the way to go.  It doesn't need to be a "host kernel private"=
 flag
> though, e.g. an IN_FLUX flag to capture that the attributes aren't fully =
realized
> might be more intuitive for readers, and might have utility for other att=
ributes
> in the future too.

Yes, it's because of mmap. I think that an IN_FLUX flag might work
here. I'll have a go at it and see how it turns out.

Thanks,
/fuad

>
> > One approach would be to add another flag to the attributes that
> > tracks the host kernel view. The way KVM_SET_MEMORY_ATTRIBUTES is
> > implemented now, userspace can zero it, so in that case, that
> > operation would need to be masked to avoid that.
> >
> > Another approach would be to have a pKVM-specific xarray (or similar)
> > to do the tracking, but since there is a structure that's already
> > doing something similar (i.e.,the attributes array), it seems like it
> > would be unnecessary overhead.
> >
> > Do you have any ideas or preferences?
> >
> > Cheers,
> > /fuad
