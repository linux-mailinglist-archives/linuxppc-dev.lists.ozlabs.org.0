Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B14570D96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhfLT5Qb1z3c56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ErppBv82;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ErppBv82;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhfKq2RL8z2xCB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:52:45 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id b11so11258982eju.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 15:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i2JP/AK/462flQNf3WkuAKr99hiwoo70NGIBG6Typ3w=;
        b=ErppBv825hWACq85NgILEoUpFIDS7zhQU4dBsF65NWh9mqK1QibzrTz5JjL/oe9P4P
         xddf9vJAS5jJevier0WxjtSRTzqNqYMTuFMbLyHy18aT7xPi4oZPjKUXEDf3BhSaLDa4
         4O3xw1J1KLXUrMcEs66ayBXSRlLIZbC064ewsp5aVZAPGfL0CMXNAFyBX/9qyBVJbAOu
         xoSUM1m6sng8YQvv6Z+b3Z5XjXwnY/UzydMHSmIOJ28NgRuG0eCkAIYDttY9WOuNkv9g
         v51CIgVGXO+hyPttpvZ9Y8r1QIuDcwQgPgw5HdmKK2Y4Fsxmh65jR/Qqh4XcEPpMGnwl
         PGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i2JP/AK/462flQNf3WkuAKr99hiwoo70NGIBG6Typ3w=;
        b=onXHNOBDG+sRZwtP2CEOa6SnlswOm4Yxvc8KsBV/v3OFLNy0DrdwINWULd+F53wsTk
         mG5mQWNxjyAaBWR/1fdHgdt33BOpz+Xzle0WhCSoqHOn6LgoQuFU2lrYof4feDeMYu+/
         7s0lagShZQm6YUg5bD3oRB4CQokGICP+E5RcP+kj297dQbv5KWp9GBMijsrWlmu76o7S
         dUgKGYa6X4lMVr6LhbsVdE5+WcUK4pG3FFDlYlK9o+YUb7GgrdEm+K5VVo5GbbB5BVH+
         T7OALSIKolFqJ47ALKuIj/pN4LdseZCMlQABwJJ6QWi792jteRNv0Nxg//wj43pY+LS1
         1S8Q==
X-Gm-Message-State: AJIora9VOA1xA2bxdgjq1GfYjxCx7uSZ3ClGlovbxlUjHtTFDyTk8aYH
	LKBoahKlcFPDwSiqXUMSMuIinPgZxqZ/ZK9CJnE=
X-Google-Smtp-Source: AGRyM1u3B9GaqsJzc2ZnGgAx20N9pPna/H/YyY3hApLIj/mDA7Feo0MOU0K0s1MJSpzYriYuHv0RZqEbB9CZJ8ZQIzU=
X-Received: by 2002:a17:906:8a45:b0:72b:31d4:d537 with SMTP id
 gx5-20020a1709068a4500b0072b31d4d537mr17046686ejc.170.1657579957647; Mon, 11
 Jul 2022 15:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220711034615.482895-1-21cnbao@gmail.com> <20220711034615.482895-3-21cnbao@gmail.com>
 <13b283fe-10f7-376f-9b8e-856e4d1e0ede@huawei.com>
In-Reply-To: <13b283fe-10f7-376f-9b8e-856e4d1e0ede@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 12 Jul 2022 10:52:24 +1200
Message-ID: <CAGsJ_4wW=3xsmB1jzcv=sD9OhhPc0v=+odp=JY80vEbMY6OZ_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: rmap: Allow platforms without mm_cpumask to
 defer TLB flush
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, Linux-MM <linux-mm@kvack.org>, =?UTF-8?B?6YOt5YGl?= <guojian@oppo.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, =?UTF-8?B?5byg6K+X5piOKFNpbW9uIFpoYW5nKQ==?= <zhangshiming@oppo.com>, =?UTF-8?B?5p2O5Z+56ZSLKHdpbmsp?= <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, x86 <x86@kernel.org>, linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, real mz <realmz6@gmail.com>, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, Darren Hart <darren@os.amperecomputing.com>, LAK <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, huzhanyuan@oppo.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 12, 2022 at 1:35 AM Kefeng Wang <wangkefeng.wang@huawei.com> wr=
ote:
>
> Hi Barry=EF=BC=8C
>
> On 2022/7/11 11:46, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Platforms like ARM64 have hareware TLB shootdown broadcast. They
> > don't maintain mm_cpumask but just send tlbi and related sync
> > instructions for TLB flush. task's mm_cpumask is normally empty
> > in this case. We also allow deferred TLB flush on this kind of
> > platforms.
> >
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>>
> > ---
> ...
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 169e64192e48..7bf54f57ca01 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -951,6 +951,9 @@ config ARCH_HAS_CURRENT_STACK_POINTER
> >         register alias named "current_stack_pointer", this config can b=
e
> >         selected.
> >
> > +config ARCH_HAS_MM_CPUMASK
> > +     bool
> > +
> >   config ARCH_HAS_VM_GET_PAGE_PROT
> >       bool
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 5bcb334cd6f2..13d4f9a1d4f1 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -692,6 +692,10 @@ static bool should_defer_flush(struct mm_struct *m=
m, enum ttu_flags flags)
> >       if (!(flags & TTU_BATCH_FLUSH))
> >               return false;
> >
> > +#ifndef CONFIG_ARCH_HAS_MM_CPUMASK
> > +     return true;
> > +#endif
> > +
>
> Here is another option to enable arch's tlbbatch defer
>

This option is even better than simply having ARCH_HAS_MM_CPUMASK
since arch might make decisions based on specific hardware characters.
for example,
https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-November/165468.html

+bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+     if (!radix_enabled() || cpu_has_feature(CPU_FTR_POWER9_DD1))
+         return false;
+
+     if (!mm_is_thread_local(mm))
+         return true;
+
+     return false;
+}

In this case, having MM_CPUMASK doesn't necessarily mean tlbbatch is needed=
.

> [1]
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20171101101735.23=
18-2-khandual@linux.vnet.ibm.com/
>
> >       /* If remote CPUs need to be flushed then defer batch the flush *=
/
> >       if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> >               should_defer =3D true;

Thanks
Barry
