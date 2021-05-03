Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375737118E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 08:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYXnk4w5yz30DH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 16:17:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nronBTKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nronBTKV; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYXnF4H8Fz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 16:17:03 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id y2so6122117ybq.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v29MFBs+ar3BhYWJdK6Jk1jD8VwkXSCUI6vclUFL6GM=;
 b=nronBTKVJEUUTxXxY9oIusDHjMdZQawXNxyl/+XhA5tvHt11amnPk/5jzIs8jj6vd+
 /XvEqiNeP//v+vRUj90TbJfqOUbdR2joOEd1Q04aL0i7PjsFT5o8fqRwVWV4Zne2gqQS
 LRj3NcCXuwCzKIch8pd9Cxdks97aZug9HuleAi7u+QiLImYIkTJCYV1N6TBEA4vWjfyd
 YHR9qpXvH2egjkV9i44yI3E55KRSjI3mHLVgK4w0b6QE9pDk19M6q/ox38LRst1aIe71
 v4J7wxlLqNC1Z3D+1OOwf36DHLlks57S6M1Ati61uh7085DTGnlHIbnvVyCV479KdnQi
 w64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v29MFBs+ar3BhYWJdK6Jk1jD8VwkXSCUI6vclUFL6GM=;
 b=TuZ8zJsFpeMRtNKZr1vTq0o7hBYchzIrFmnuiV+aTHVlICikuqjXl3oxrXc8rVzpiQ
 Ocug/ubMpXBRxpXYvIxa5gpIdVddSR2Q9U3hlCOwpUgBezVhe/+d/CqD61L39iJT0TGu
 x7DncxiavaZvsubmII/rqYs0r84uEiVweLt/Ld6lgKNlmAuSsVDCKEDcIQ1benH+Jre0
 jgT+nxB5CGq1UNoRT/LsvXuMw0GGS8dzdk27kbBC+gXbQp62in2WyyBSn1sbwJutKWOC
 Qk5FvLuzcXD9mcO9+gTMfn04hv5Jtus6ZkXAVTadS/plJQhCmgft588cjek+BVmGEh7U
 1Mnw==
X-Gm-Message-State: AOAM533pDjYrXpezvPv+me1SjLBaDc+t/d11jdqU04nO7xxY22em2kpG
 LO5GuVjsFflYJXzlfbs3eUpXz6Ze/ThoJR1lY08=
X-Google-Smtp-Source: ABdhPJyuyfKGv/G0MoFi6sSlYEB8gLvmE90Ot3L3JImuTJg0HHsmQLmu1J8DMAh/Csia0NZhnqo1XpJ8jof03XNMTR0=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr24732184ybu.386.1620022619618; 
 Sun, 02 May 2021 23:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-4-jniethe5@gmail.com>
 <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
 <CACzsE9q1QoSMVZD7yoE=3pHaRc-i14X2++ewFbBxSeZn-2u78A@mail.gmail.com>
 <6fa81d25-4313-5f15-23d9-06b314bb7d02@csgroup.eu>
In-Reply-To: <6fa81d25-4313-5f15-23d9-06b314bb7d02@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 3 May 2021 16:16:48 +1000
Message-ID: <CACzsE9r-FBSo9F79cKj9c3gE7g821AhoLsRPWwd=7eFm+gMpTw@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] powerpc: Always define MODULES_{VADDR,END}
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 3:57 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 03/05/2021 =C3=A0 07:39, Jordan Niethe a =C3=A9crit :
> > On Thu, Apr 29, 2021 at 3:04 PM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 29/04/2021 =C3=A0 05:15, Jordan Niethe a =C3=A9crit :
> >>> If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
> >>> VMALLOC_END respectively. This reduces the need for special cases. Fo=
r
> >>> example, powerpc's module_alloc() was previously predicated on
> >>> MODULES_VADDR being defined but now is unconditionally defined.
> >>>
> >>> This will be useful reducing conditional code in other places that ne=
ed
> >>> to allocate from the module region (i.e., kprobes).
> >>>
> >>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >>> ---
> >>> v10: New to series
> >>> v11: - Consider more places MODULES_VADDR was being used
> >>> ---
> >>>    arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
> >>>    arch/powerpc/kernel/module.c          |  5 +----
> >>>    arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
> >>>    arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
> >>>    4 files changed, 19 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/includ=
e/asm/pgtable.h
> >>> index c6a676714f04..882fda779648 100644
> >>> --- a/arch/powerpc/include/asm/pgtable.h
> >>> +++ b/arch/powerpc/include/asm/pgtable.h
> >>> @@ -39,6 +39,17 @@ struct mm_struct;
> >>>    #define __S110      PAGE_SHARED_X
> >>>    #define __S111      PAGE_SHARED_X
> >>>
> >>> +#ifndef MODULES_VADDR
> >>> +#define MODULES_VADDR VMALLOC_START
> >>> +#define MODULES_END VMALLOC_END
> >>> +#endif
> >>> +
> >>> +#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_RW=
X)
> >>
> >> No no.
> >>
> >> TASK_SIZE > MODULES_VADDR is ALWAYS wrong, for any target, in any conf=
iguration.
> >>
> >> Why is it a problem to leave the test as a BUILD_BUG_ON() in module_al=
loc() ?
> > On ppc64s, MODULES_VADDR is __vmalloc_start (a variable)  and
> > TASK_SIZE depends on current.
> > Also for nohash like 44x, MODULES_VADDR is defined based on high_memory=
.
> > If I put it back in module_alloc() and wrap it with #ifdef
> > CONFIG_PPC_BOOK3S_32 will that be fine?
>
> Thinking about it once more, I think the best approach is the one taken b=
y Nick in
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210502110050.32=
4953-1-npiggin@gmail.com/
>
> Use MODULES_VADDR/MODULES_END when it exists, use VMALLOC_START/VMALLOC_E=
ND otherwise.
>
> I know I suggested to always define MODULES_VADDR, but maybe that's not t=
he best solution at the end.
Sure, let's do it like that.
>
> For kprobes, is there a way to re-use functions from modules.c in alloc_i=
nsn_page() ?
Probably we can use module_alloc() then the set_memory_ functions to
get the permissions right.
Something like we had in v9:
https://lore.kernel.org/linuxppc-dev/20210316031741.1004850-3-jniethe5@gmai=
l.com/
>
> Christophe
