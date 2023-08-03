Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07676F301
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:50:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6VFzvdxm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGybY0vxlz3c3j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 04:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6VFzvdxm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGyYJ1klTz3brg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 04:48:51 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-63d4b5890a0so8107616d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691088528; x=1691693328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tbNHE93nYjXEA/O+xALVAEDc6FnXESddWS3lWiWLV0=;
        b=6VFzvdxm3YrleojZUDMcow5FlyLkuGEPWo7uL1Sub4U4LzVMQhi5UpSPEaYtXxQig6
         R78lgZrOqqK6yg0QQv/JfRTYg+AsYws7jCkd8Bg1iujIIi9/A8JGaIKa3nySYUYxYXMD
         fDeqWcFIbb7KgTxygJUFLUFd9FltJ7Sx1WpUt7PJDnRkqFqEAYX3UY0X49kRyzwn5sdP
         I37qBWtWNXQq7xllL7dbKsCaawao2B5L/YEZK2kvud+xkjOMxt2YCSPKhd52vD+CcmjX
         qsvwDpR8y8XyjjIEENEG/wD83xbRHVmg+fosa7E0VP5fHwabw7hE0ggbCtQWbEI9pBLv
         f8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691088528; x=1691693328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tbNHE93nYjXEA/O+xALVAEDc6FnXESddWS3lWiWLV0=;
        b=HWpZx9rZanc60FLunfv1urmm2f1qjQsptz3pEj42h4FsMPtNGm7IJ8+y38xoNhZD3U
         7rEHrdvm3+gVFuBRvVCOSMCYu1qqbte5dW4xeQ5mucxqsScs3Bc1fL42LyvKVBonQUOr
         ZD9F2kLTvpW1hdGmTps6zIMgF6lANhjKjHOUVFznLirGcUzwPsqiiqGwLz8UhEAhWqf7
         clJdcEQBYfv25RUTw1IBaPmX30qYuRXSjd7+yXhQu7mFo1E3uVcKWDVTGknbypS6VFqn
         RvxwpX12wBbasjT67+Q8H8T/hAc63UQh1oNDWLrbMcILVbILzswJL8XKObbhlDVknM1D
         DRHA==
X-Gm-Message-State: ABy/qLZkVp4IAXJWFfHrhZ6eN0EuqErGp6nDvGNIS/uqDqINFpd/svSU
	Jq/r4JDvDBrj5H98hw3pxv6hHSdv2ZvS526A8DfRJw==
X-Google-Smtp-Source: APBJJlHVHOlFaAc7QLzwJ5MQyhcxQ7uez6gZPgXw7RdtP68eZ2qt3tpg4x+z+Z2XW9dTV2WAxlrUtvM5KRnWu0hSBto=
X-Received: by 2002:a05:6214:3011:b0:63d:a05:256a with SMTP id
 ke17-20020a056214301100b0063d0a05256amr21855102qvb.8.1691088527629; Thu, 03
 Aug 2023 11:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com> <31b387c5-c6a4-2911-b337-b7af6a15c29e@csgroup.eu>
In-Reply-To: <31b387c5-c6a4-2911-b337-b7af6a15c29e@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 11:48:36 -0700
Message-ID: <CAKwvOdm7ftWse5LVwM_0b_Zk_H-qavXsjsSyUmd0onZzvYcasw@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
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
Cc: kernel test robot <lkp@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 3, 2023 at 11:47=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 03/08/2023 =C3=A0 20:33, Nick Desaulniers a =C3=A9crit :
> > Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> > clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> > older, rather than using that instruction bare in inline asm, add it to
> > ppc-opcode.h and use that macro as is done elsewhere for other
> > instructions.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1891
> > Link: https://github.com/llvm/llvm-project/issues/64080
> > Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d008=
864dd2eddb437a92468 [0]
> > Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54=
a8c7ac665773ac1ada328713e8338f5 [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.co=
m/
> > Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Not sure why you changed the order of #includes , nevertheless

Habit to sort; can drop if maintaining git blame is more important
than cleaning that up.

>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> > ---
> > Changes in v3:
> > - left comment @ https://github.com/linuxppc/issues/issues/350#issuecom=
ment-1664417212
> > - restore PPC_RAW_TLBILX previous definition
> > - fix comment style
> > - Link to v2: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v2-1-21=
1ffa1df194@google.com
> >
> > Changes in v2:
> > - add 2 missing tabs to PPC_RAW_TLBILX_LPID
> > - Link to v1: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v1-1-84=
a1bc5cf963@google.com
> > ---
> >   arch/powerpc/include/asm/ppc-opcode.h |  2 ++
> >   arch/powerpc/kvm/e500mc.c             | 11 ++++++++---
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/inclu=
de/asm/ppc-opcode.h
> > index ef6972aa33b9..005601243dda 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -397,6 +397,7 @@
> >   #define PPC_RAW_RFCI                        (0x4c000066)
> >   #define PPC_RAW_RFDI                        (0x4c00004e)
> >   #define PPC_RAW_RFMCI                       (0x4c00004c)
> > +#define PPC_RAW_TLBILX_LPID          (0x7c000024)
> >   #define PPC_RAW_TLBILX(t, a, b)             (0x7c000024 | __PPC_T_TLB=
(t) |  __PPC_RA0(a) | __PPC_RB(b))
> >   #define PPC_RAW_WAIT_v203           (0x7c00007c)
> >   #define PPC_RAW_WAIT(w, p)          (0x7c00003c | __PPC_WC(w) | __PPC=
_PL(p))
> > @@ -616,6 +617,7 @@
> >   #define PPC_TLBILX(t, a, b) stringify_in_c(.long PPC_RAW_TLBILX(t, a,=
 b))
> >   #define PPC_TLBILX_ALL(a, b)        PPC_TLBILX(0, a, b)
> >   #define PPC_TLBILX_PID(a, b)        PPC_TLBILX(1, a, b)
> > +#define PPC_TLBILX_LPID              stringify_in_c(.long PPC_RAW_TLBI=
LX_LPID)
> >   #define PPC_TLBILX_VA(a, b) PPC_TLBILX(3, a, b)
> >   #define PPC_WAIT_v203               stringify_in_c(.long PPC_RAW_WAIT=
_v203)
> >   #define PPC_WAIT(w, p)              stringify_in_c(.long PPC_RAW_WAIT=
(w, p))
> > diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> > index d58df71ace58..7c09c000c330 100644
> > --- a/arch/powerpc/kvm/e500mc.c
> > +++ b/arch/powerpc/kvm/e500mc.c
> > @@ -16,10 +16,11 @@
> >   #include <linux/miscdevice.h>
> >   #include <linux/module.h>
> >
> > -#include <asm/reg.h>
> >   #include <asm/cputable.h>
> > -#include <asm/kvm_ppc.h>
> >   #include <asm/dbell.h>
> > +#include <asm/kvm_ppc.h>
> > +#include <asm/ppc-opcode.h>
> > +#include <asm/reg.h>
> >
> >   #include "booke.h"
> >   #include "e500.h"
> > @@ -92,7 +93,11 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *=
vcpu_e500)
> >
> >       local_irq_save(flags);
> >       mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
> > -     asm volatile("tlbilxlpid");
> > +     /*
> > +      * clang-17 and older could not assemble tlbilxlpid.
> > +      * https://github.com/ClangBuiltLinux/linux/issues/1891
> > +      */
> > +     asm volatile (PPC_TLBILX_LPID);
> >       mtspr(SPRN_MAS5, 0);
> >       local_irq_restore(flags);
> >   }
> >
> > ---
> > base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
> > change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f
> >
> > Best regards,



--=20
Thanks,
~Nick Desaulniers
