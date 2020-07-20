Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C743225648
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 05:47:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B973M2y7pzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 13:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J4Zx4MgO; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B971S6jr7zDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 13:46:04 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id w17so11121649otl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BUo91yORQpmQrJaOYjYlutMzILGTSt8GTjjWtCRYY+Y=;
 b=J4Zx4MgOZIL/gGkGJMyP+FNGO8dyF8LKnVLl3pQaMc7wo0FnO7t3tO+pQhTVc6fZmJ
 TAGQGJ1yacVYHJh7J5w5HKFaHv3Fz/b+rc5Wu2Qk/k7vKjAIIKe3Ua9NXby6Rh0QXbmn
 COtWCMuoyBZjkUJYblsgKyOS4+VfBTE6AO9n/6NHvnfjzhLB2Oz56OXdEdKf3me6ISkj
 CMiTHZ6niEY7TyizY6v9cHPrvvPX9JRNRT4+BzAqqMxXtdZpZ/CsnVTTBhPFVlYw/6hj
 Gkv80XPRO0Mzx8ybt5DNeOm9pUTjejxdN23+z9d+pRqF7SpNrH0Bf+PnIn4k628Vql5o
 EfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUo91yORQpmQrJaOYjYlutMzILGTSt8GTjjWtCRYY+Y=;
 b=tgwQwjpCYKiJLQHRvqqPpmYcDlgw5yK1irhDQGjET3wHuPy1OYrNV9R8HoFJVvjY3l
 f/D6rAWJF+kVC/vaE5UfjZCTRtn5ME2ALZngAfKsqVUMagmdi2JaN2tPOsBSfib054+t
 st1bIuKRA6tzQZT66mf3PYr785dzLkhWTqRlizzuclErdAqT2WfWHio6Se9OF55vuxiC
 sBxTJH7bo1jr3XCfqqg3dbeAtBU6st4NmmPtPAe1elRYDrUQP7LArDwKSKsqindRa5EJ
 1YcyuBf9whaNlUuwbfaEJdlRJmGTYqlTEE/8T0ay/ynSncMDYWbe3FrbIBirBZpzZwdf
 WcBA==
X-Gm-Message-State: AOAM533W05eJ4j9dWiEnawKbjiBO3iK88nCn2j4CRL7Tsc3x5TtwFICk
 3KjT0KMb7kSSRxMxKIvAu61dyKuOb7QCTHaxXuQ=
X-Google-Smtp-Source: ABdhPJw9jkRfB/fLMAKvjcGMQ0RpmsQS2Kcfu7xbtbkIOAM7bX0lwvqv7pPKnqhfETHAI3VawfiCv2I1KfiLMyZiQfs=
X-Received: by 2002:a9d:6a12:: with SMTP id g18mr19560641otn.155.1595216761606; 
 Sun, 19 Jul 2020 20:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 20 Jul 2020 13:42:42 +1000
Message-ID: <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> So far Book3S Powerpc supported only one watchpoint. Power10 is
> introducing 2nd DAWR. Enable 2nd DAWR support for Power10.
> Availability of 2nd DAWR will depend on CPU_FTR_DAWR1.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cputable.h      | 4 +++-
>  arch/powerpc/include/asm/hw_breakpoint.h | 5 +++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index 3445c86e1f6f..36a0851a7a9b 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -633,7 +633,9 @@ enum {
>   * Maximum number of hw breakpoint supported on powerpc. Number of
>   * breakpoints supported by actual hw might be less than this.
>   */
> -#define HBP_NUM_MAX    1
> +#define HBP_NUM_MAX    2
> +#define HBP_NUM_ONE    1
> +#define HBP_NUM_TWO    2
I wonder if these defines are necessary - has it any advantage over
just using the literal?
>
>  #endif /* !__ASSEMBLY__ */
>
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index cb424799da0d..d4eab1694bcd 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -5,10 +5,11 @@
>   * Copyright 2010, IBM Corporation.
>   * Author: K.Prasad <prasad@linux.vnet.ibm.com>
>   */
> -
Was removing this line deliberate?
>  #ifndef _PPC_BOOK3S_64_HW_BREAKPOINT_H
>  #define _PPC_BOOK3S_64_HW_BREAKPOINT_H
>
> +#include <asm/cpu_has_feature.h>
> +
>  #ifdef __KERNEL__
>  struct arch_hw_breakpoint {
>         unsigned long   address;
> @@ -46,7 +47,7 @@ struct arch_hw_breakpoint {
>
>  static inline int nr_wp_slots(void)
>  {
> -       return HBP_NUM_MAX;
> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_TWO : HBP_NUM_ONE;
So it'd be something like:
+       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_MAX : 1;
But thinking that there might be more slots added in the future, it
may be better to make the number of slots a variable that is set
during the init and then have this function return that.
>  }
>
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
> --
> 2.26.2
>
