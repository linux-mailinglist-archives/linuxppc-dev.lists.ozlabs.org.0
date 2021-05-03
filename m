Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1A3711A1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 08:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYY1P0YBZz30CY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 16:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bij5/m2g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bij5/m2g; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYY0w3jFxz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 16:27:11 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id r8so6167576ybb.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bKaLn3sRt0LhBhD4XxEbNh9+tRS5Kp+kFEKfHYl9d7M=;
 b=bij5/m2gQ5lHRaDAKBQU+ObnwbMdLB30evfnq78q6d3ZZFWnmTWKsm04A1ZERQ9p+W
 f7hpuHOLAQF3a21eGloXAZHjTHAlmlIGFbuqiQ2/y/noJmHYjkkYOApWIMuFWVLXqpH/
 LEtbh8NeZde6YLd5RRSpsC5EOmcERx4XilqSzQj6TRIjRCf16+frVEQ1OMQ8iHHSCMhy
 Gk9G6GEwHPJwubtYsnfBs4r0o1vb6NH5umRB72CE3+W3Vn5hLlxI83HImF49Un9P9S0Z
 v3cafx5UWE4Yx9TZQ0uwwQnN2ha7Me2Bt5Q4spXyQ1my6lzOKGR5W2QFtvgLZjQ/HZxM
 7AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bKaLn3sRt0LhBhD4XxEbNh9+tRS5Kp+kFEKfHYl9d7M=;
 b=oMohXXmdSIaHpGR/BAgwSIOAev77LZBgKe0SYocOtD/ntGAjZlbkjSKeMyT24Y59St
 FRTPv3b/BRS6KTIo2dXYhvScbiIhi3cp1zJwsxbQN5DjMU/AafvzOIf12XhXX0ZSasWU
 VDuQZv+eIRTTN28CH+MY8O9WLxlKLIsRPKpWP3AQhJnEsKjq6K/jqsOplHrswVlGDxmj
 oulpnflq7rrCQRCwyQ0goXYCvKGaJAtTYABM2g9EC4/EofoBBr77cxFASJAbEPw2hafX
 BYjD+RCYT+PufOu2DGzjf5QcsKrMoUQwDJgIFV5ZIkBhd8qGhtXzCBE3r/6xGrWdZctv
 RbLw==
X-Gm-Message-State: AOAM532bE8MJHfv0tpYNW3Zny/GVyJuYc4ICQDctEAGBW3LfCcuIeebl
 RFKQx2tDlYnOdpYfdNojhTjgGiBJuh39Br9vW/k=
X-Google-Smtp-Source: ABdhPJymsXp3CkCTWTqMqBkJz6g5pO4WU+ZexOQWkNG/UD2UELv9LdIYXR7lb6KYr52lZT8+JqHEink7nZpnHjikqDM=
X-Received: by 2002:a25:5146:: with SMTP id f67mr24070181ybb.332.1620023228018; 
 Sun, 02 May 2021 23:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-4-jniethe5@gmail.com>
 <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
 <CACzsE9q1QoSMVZD7yoE=3pHaRc-i14X2++ewFbBxSeZn-2u78A@mail.gmail.com>
 <6fa81d25-4313-5f15-23d9-06b314bb7d02@csgroup.eu>
 <CACzsE9r-FBSo9F79cKj9c3gE7g821AhoLsRPWwd=7eFm+gMpTw@mail.gmail.com>
 <e3997b2b-cc39-e4c7-4c8b-2d004333d26a@csgroup.eu>
In-Reply-To: <e3997b2b-cc39-e4c7-4c8b-2d004333d26a@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 3 May 2021 16:26:57 +1000
Message-ID: <CACzsE9rWVepY7v0ZFA=yG7-u5JSS=nUDDebHgVXL6Xu-BBPM+A@mail.gmail.com>
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

On Mon, May 3, 2021 at 4:22 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 03/05/2021 =C3=A0 08:16, Jordan Niethe a =C3=A9crit :
> > On Mon, May 3, 2021 at 3:57 PM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 03/05/2021 =C3=A0 07:39, Jordan Niethe a =C3=A9crit :
> >>> On Thu, Apr 29, 2021 at 3:04 PM Christophe Leroy
> >>> <christophe.leroy@csgroup.eu> wrote:
> >>>>
> >>>>
> >>>>
> >>>> Le 29/04/2021 =C3=A0 05:15, Jordan Niethe a =C3=A9crit :
> >>>>> If MODULES_{VADDR,END} are not defined set them to VMALLOC_START an=
d
> >>>>> VMALLOC_END respectively. This reduces the need for special cases. =
For
> >>>>> example, powerpc's module_alloc() was previously predicated on
> >>>>> MODULES_VADDR being defined but now is unconditionally defined.
> >>>>>
> >>>>> This will be useful reducing conditional code in other places that =
need
> >>>>> to allocate from the module region (i.e., kprobes).
> >>>>>
> >>>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >>>>> ---
> >>>>> v10: New to series
> >>>>> v11: - Consider more places MODULES_VADDR was being used
> >>>>> ---
> >>>>>     arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
> >>>>>     arch/powerpc/kernel/module.c          |  5 +----
> >>>>>     arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
> >>>>>     arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
> >>>>>     4 files changed, 19 insertions(+), 11 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/incl=
ude/asm/pgtable.h
> >>>>> index c6a676714f04..882fda779648 100644
> >>>>> --- a/arch/powerpc/include/asm/pgtable.h
> >>>>> +++ b/arch/powerpc/include/asm/pgtable.h
> >>>>> @@ -39,6 +39,17 @@ struct mm_struct;
> >>>>>     #define __S110      PAGE_SHARED_X
> >>>>>     #define __S111      PAGE_SHARED_X
> >>>>>
> >>>>> +#ifndef MODULES_VADDR
> >>>>> +#define MODULES_VADDR VMALLOC_START
> >>>>> +#define MODULES_END VMALLOC_END
> >>>>> +#endif
> >>>>> +
> >>>>> +#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_=
RWX)
> >>>>
> >>>> No no.
> >>>>
> >>>> TASK_SIZE > MODULES_VADDR is ALWAYS wrong, for any target, in any co=
nfiguration.
> >>>>
> >>>> Why is it a problem to leave the test as a BUILD_BUG_ON() in module_=
alloc() ?
> >>> On ppc64s, MODULES_VADDR is __vmalloc_start (a variable)  and
> >>> TASK_SIZE depends on current.
> >>> Also for nohash like 44x, MODULES_VADDR is defined based on high_memo=
ry.
> >>> If I put it back in module_alloc() and wrap it with #ifdef
> >>> CONFIG_PPC_BOOK3S_32 will that be fine?
> >>
> >> Thinking about it once more, I think the best approach is the one take=
n by Nick in
> >> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210502110050=
.324953-1-npiggin@gmail.com/
> >>
> >> Use MODULES_VADDR/MODULES_END when it exists, use VMALLOC_START/VMALLO=
C_END otherwise.
> >>
> >> I know I suggested to always define MODULES_VADDR, but maybe that's no=
t the best solution at the end.
> > Sure, let's do it like that.
> >>
> >> For kprobes, is there a way to re-use functions from modules.c in allo=
c_insn_page() ?
> > Probably we can use module_alloc() then the set_memory_ functions to
> > get the permissions right.
> > Something like we had in v9:
> > https://lore.kernel.org/linuxppc-dev/20210316031741.1004850-3-jniethe5@=
gmail.com/
>
> Yes, more or less, but using module_alloc() instead of vmalloc().
> And module_alloc() implies EXEC, so only the set_memory_ro() will be requ=
ired.
Yep.
>
> I see no point in doing any set_memory_xxx() in free_insn_page(), because=
 as soon as you do a
> vfree() the page is not mapped anymore so any access will lead to a fault=
.
Yeah, I'd not realised we had VM_FLUSH_RESET_PERMS when I added that.
I agree it's pointless.
>
> Christophe
