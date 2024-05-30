Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id A7D408D4435
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 05:36:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JYzvWvDL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqWv23XPZz87hH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 13:29:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JYzvWvDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqWtK1hgvz87PK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 13:28:25 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-43fe3289fc5so118491cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717039702; x=1717644502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyFUQdvGKe8UpOcfXmkz33OD4v6xcNcft6Wk6HjbLrw=;
        b=JYzvWvDLD3lQkuGa5KATCfi8vmE9yOmlZcit8XcwtyqFCRzrw2GTswuPTxogdi1RIp
         RGexfSFlveMzLc+6MZVz8AGrEaXbCoaTpkbggPGOkY9Z0vhYSG5taJiER+5oscTRYouI
         pE6ietcdgexDYU4G9eoQnoArdTlgWpuBuaIfvnEASE/nYAXYP0tLBuD+gxtEnbqtzGSj
         m2z05zN0aBOZH2asSdisEGunEs+Lt5FXPovoTbtu8ZtysuVLrDNad6T/S7Fn+o77FI4s
         ebS/9RycvNW/DCUFNcPyDX3kXTt3MiUvip2s4XVmVk6L9G3H5CDDALzO+4jcqfd7kStE
         SfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717039702; x=1717644502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyFUQdvGKe8UpOcfXmkz33OD4v6xcNcft6Wk6HjbLrw=;
        b=SxC4/YPR32ZLFSOwBrXQA0C6D7g2LlUcgycaGkYUi2jetg/ErjvY7kBnhR628Cj3HJ
         1N/l9o8uz8L8MX7udTwrTse8eurSsuyY4kS9DtJX0ymZguVEJ6/A6FxeaTvtZVLx8vfV
         zo4veJcbdxpaQ+SNTwIYISsuI/HZfMyLNx81PFIaUG2jhDx6uIPH2qgQ8X61CobEmzM2
         Sd0Gf4seHKCmVx1Pzrf2rGWgPnHcbPgBPSD9Hzm10pzXaAY7FPc9rDANV65DFrA4J+0J
         JQ+3Mwt1rdUQq+DtLKOPSr7fiUe4gsgsWvLi5xpipfyZxbrGsTCzErdbk+SEXTCqR/Jk
         o4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7yu/zsL2xq2hjpqQrlIV+eHUIr3i7LhqZxo1uBHH46UKqTW1RMnw7a07W74d8yyloaZoNypFB5OcDoqkIPIYA8RYtbqJxOtBqCJzs5Q==
X-Gm-Message-State: AOJu0YwfZ8gWcG6E5tzNusEsudeRKRVY/A91ebF0WPMrUhshGYMco+LT
	146AFlh+CtCiut+HNCH6iMH99xz2heSW/F36TdeJXh4Jh94PJ8PjduO5rwE/uOCc5jll2jyPfIw
	FAG4TDF3SSHP0JmrHdrtweW9vG++3h9NH9Z+p
X-Google-Smtp-Source: AGHT+IGBhNbFRaaD0WOEIsVSMflxCvd13kkSSK1hcGeX1B4TzLlXvTq7xC3rTsBmGx8uhqPHEIa2GYmfEXsD+JkYxAs=
X-Received: by 2002:a05:622a:90e:b0:43e:cb4:1d10 with SMTP id
 d75a77b69052e-43fe8e5f830mr1851431cf.14.1717039701993; Wed, 29 May 2024
 20:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-5-jthoughton@google.com> <ZlekYljG7KJwblUj@google.com>
In-Reply-To: <ZlekYljG7KJwblUj@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 20:27:45 -0700
Message-ID: <CADrL8HVZxoO33F2UJBoTjF_SXpxyZmH=RTM5G3stgo_kRPjazA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com
 >, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 29, 2024, James Houghton wrote:
> > For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> > walker used to take the MMU lock for us. Now make the architectures
> > take it themselves.
>
> Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rathe=
r than
> add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS=
, e.g.
>
> static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notif=
ier *mn,
>                                                          unsigned long st=
art,
>                                                          unsigned long en=
d,
>                                                          gfn_handler_t ha=
ndler)
> {
>         struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
>         const struct kvm_mmu_notifier_range range =3D {
>                 .start          =3D start,
>                 .end            =3D end,
>                 .handler        =3D handler,
>                 .on_lock        =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D false,
>                 .may_block      =3D false,
>                 .lockless       =3D IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LO=
CKLESS),
>         };
>
>         return __kvm_handle_hva_range(kvm, &range).ret;
> }

Thanks Sean, yes this is a lot better. I will do this for v5.
