Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEEF76F0B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 19:33:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tTyyvMp5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGwtm5QMkz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 03:33:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tTyyvMp5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGwsj3FWKz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 03:32:56 +1000 (AEST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-447b64b0555so441879137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691083972; x=1691688772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72h1vSD+Gc7oxbDzRN4MWCfdaXi7NAc6IXTkZaqvVg4=;
        b=tTyyvMp5vOdRW2mdAvBQBi99WPmURpo41StkHq5tlTZ6bqF7oEAmRm3dz1zS7x3Z/C
         +cb+MrDauBBJXS2qfkcWaKseMq74s2AC1qmHfLxWsoHUIURILddgHVTLEGk/vB0Y1yn/
         M5Amrq/SY1zQmz0RoyWYcJmGA0UtYEyDUxU4Comj0sNgNLOLcWdI0O01vVDMsctFnW5W
         BTZdj/x8QTU4vUu1SWR/O8RlXHKeI8wpGpwBA2MxufltbuRJseCE6Db4274YxZhVx9Q9
         w365eX3RTokW5QbT07mKCGCkkTuSzqvPWisZNiu9pSy6QNE4fj5txB9hgkg6gQCCoBkp
         ozVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691083972; x=1691688772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72h1vSD+Gc7oxbDzRN4MWCfdaXi7NAc6IXTkZaqvVg4=;
        b=HzjDbuWpvpixW9Uugs0ZTULg0Tv92Zs5X5xfdlncfpT/+/Ge10TbE9mgzCo4ch5bP6
         yxd2FJUQrhtYpJHcNCj9riTs2T/l2hqQANkUCCer//C+yMH+JF9aG0qBfKT1jFXGsnJz
         qmt5dnAEv2mXwRosjy2rKDSCDvmOoIXZWTuiRTtSm0/+TZXzD1pofH48QH82JYO8lgzy
         jvrx4p5675YK8PdeC3EITafz7UgHtq9Fr5EhJVFAgd1T2dvtvUiuGZKs+XprenQ3RBjS
         7rr8A6GsOSzvdEaqz0AOVnfbbnfTkhJ+QW0KGyX9ZL8Kg6E8qIDFjC6oMEaLwzF3gqZt
         Tmfw==
X-Gm-Message-State: ABy/qLbciyXFx956Gnil0CUVS8ADYTUCnvpx2vHZys+OM1ANavv6mjpw
	VOJnk98cwEC5ckEmqDUgoHw80V3Yf0hs1DQ5Qehl6A==
X-Google-Smtp-Source: APBJJlEv8LYxVtcN3IWdatxyUj8MBicI/X51xRQ5cbz+ciVkP5fj605ez5Ocv9nOXp/7M1O/S3ixeQGC38TDQz3Nk1E=
X-Received: by 2002:a05:6102:3bc2:b0:447:55e6:15e7 with SMTP id
 a2-20020a0561023bc200b0044755e615e7mr5333218vsv.11.1691083971886; Thu, 03 Aug
 2023 10:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 10:32:40 -0700
Message-ID: <CAKwvOd=t=n+mo_73MSrHOC9GLHHvH_p4nAA4nZfmJULiH3GZ2g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/inst: add PPC_TLBILX_LPID
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 3, 2023 at 10:00=E2=80=AFAM <ndesaulniers@google.com> wrote:
>
> Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> older, rather than using that instruction bare in inline asm, add it to
> ppc-opcode.h and use that macro as is done elsewhere for other
> instructions.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1891
> Link: https://github.com/llvm/llvm-project/issues/64080
> Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d00886=
4dd2eddb437a92468 [0]
> Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54a8=
c7ac665773ac1ada328713e8338f5 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.com/
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  4 +++-
>  arch/powerpc/kvm/e500mc.c             | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index ef6972aa33b9..72f184e06bec 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -397,7 +397,8 @@
>  #define PPC_RAW_RFCI                   (0x4c000066)
>  #define PPC_RAW_RFDI                   (0x4c00004e)
>  #define PPC_RAW_RFMCI                  (0x4c00004c)
> -#define PPC_RAW_TLBILX(t, a, b)                (0x7c000024 | __PPC_T_TLB=
(t) |  __PPC_RA0(a) | __PPC_RB(b))
> +#define PPC_RAW_TLBILX_LPID (0x7c000024)

^ missing two tabs.

I'm also having issues with b4 and my external mailer setting the From
header correctly.  To test up local modifications to b4, I'm going to
send a v2.

> +#define PPC_RAW_TLBILX(t, a, b)                (PPC_RAW_TLBILX_LPID | __=
PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
>  #define PPC_RAW_WAIT_v203              (0x7c00007c)
>  #define PPC_RAW_WAIT(w, p)             (0x7c00003c | __PPC_WC(w) | __PPC=
_PL(p))
>  #define PPC_RAW_TLBIE(lp, a)           (0x7c000264 | ___PPC_RB(a) | ___P=
PC_RS(lp))
> @@ -616,6 +617,7 @@
>  #define PPC_TLBILX(t, a, b)    stringify_in_c(.long PPC_RAW_TLBILX(t, a,=
 b))
>  #define PPC_TLBILX_ALL(a, b)   PPC_TLBILX(0, a, b)
>  #define PPC_TLBILX_PID(a, b)   PPC_TLBILX(1, a, b)
> +#define PPC_TLBILX_LPID                stringify_in_c(.long PPC_RAW_TLBI=
LX_LPID)
>  #define PPC_TLBILX_VA(a, b)    PPC_TLBILX(3, a, b)
>  #define PPC_WAIT_v203          stringify_in_c(.long PPC_RAW_WAIT_v203)
>  #define PPC_WAIT(w, p)         stringify_in_c(.long PPC_RAW_WAIT(w, p))
> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> index d58df71ace58..dc054b8b5032 100644
> --- a/arch/powerpc/kvm/e500mc.c
> +++ b/arch/powerpc/kvm/e500mc.c
> @@ -16,10 +16,11 @@
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
>
> -#include <asm/reg.h>
>  #include <asm/cputable.h>
> -#include <asm/kvm_ppc.h>
>  #include <asm/dbell.h>
> +#include <asm/kvm_ppc.h>
> +#include <asm/ppc-opcode.h>
> +#include <asm/reg.h>
>
>  #include "booke.h"
>  #include "e500.h"
> @@ -92,7 +93,10 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vc=
pu_e500)
>
>         local_irq_save(flags);
>         mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
> -       asm volatile("tlbilxlpid");
> +       /* clang-17 and older could not assemble tlbilxlpid.
> +        * https://github.com/ClangBuiltLinux/linux/issues/1891
> +        */
> +       asm volatile (PPC_TLBILX_LPID);
>         mtspr(SPRN_MAS5, 0);
>         local_irq_restore(flags);
>  }
>
> ---
> base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
> change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
