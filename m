Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC276220194
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 03:03:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5zfG5YlxzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 11:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D+HAwEAA; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5zcR5q3MzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 11:01:59 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id r8so519320oij.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMjrBdOlZtOlrxQJblTz347f9wqhxv2y4/d6fAqMOvo=;
 b=D+HAwEAA+6YUuQyV3YTuVOAqodxiScvYI0sXW1JASdOzeCJAICLzKcpqPhLEItyi4r
 7EylnS7jWTeno/LtO8iu+rmRR8q2MX1QPELT1XKECJejL8yJLrzzyaj62WffiBvmlcaF
 HCRSXo6V1LAJ6CHlb/4qZF73E3jTXFr/4dheQvfBjX5UcX4PBILdSM0jnxYznV73/7IF
 CmDVWUphrNblgFrkRiuWjTgz6aLwQ5EOudh+GZ9ZgCqj/I4uw2CfJj2YUTy8HdblPZ3x
 hY53xPDvbUuBCRKGkfP38p3+7DAZEji1GMG2fuGO9R1bjrM9scSdeWyZFz2QG03ZCN6c
 5ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMjrBdOlZtOlrxQJblTz347f9wqhxv2y4/d6fAqMOvo=;
 b=eM75jiLEts5UXymi8bd90XMX30B51oXzW/eow+d4MMoXP07x6v3SryFQcBJgQ3YQGj
 AbUye3pzesc+UremANPa1hhFtaujw6Hs6zJNxi+O2gaD3Q53LK6RcCI7FbOvJb7k/Iua
 9NRlhDoHof38oInsOGtz9CLH8fXy3Sn3QLIvGlQbTM6DQce2OrXQbuXHttUlzlNC/Inp
 hVNLIBhuH2B94BrNa5xaVhZ2yvCxctzKP38/I8S+B6n44AWw+hgyD+qXBQqLhvA591tX
 6E23opo/b0iiRn718Epbne+5FKxC1PK9aNxmu5puU6NQ++09TkCmgknk1HvlOYmoXUO7
 RslA==
X-Gm-Message-State: AOAM5339iJu0hnjzVAcbENY+gLCprXh1IoCSSgc7ZR8mFK3os0f/JaD0
 E9WpfQjdDW0T3/51vVu34vbdXFSOi2efw/e1bEc=
X-Google-Smtp-Source: ABdhPJwOYkykZw/ONGCKTxD0t+RpZ4Uc2oSNkvC3dQpXIGSq/Ls3Qefimh42FXXZW3PnpHY6eA88e7wPjdf4e6SppF0=
X-Received: by 2002:a54:4418:: with SMTP id k24mr5878649oiw.126.1594774914392; 
 Tue, 14 Jul 2020 18:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
 <20200708045046.135702-2-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200708045046.135702-2-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 15 Jul 2020 11:01:43 +1000
Message-ID: <CACzsE9oCSRdfFbP0DjJ8M0092BNCKXHa5BzmksNGr6ebmfmzSg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] powerpc/watchpoint: Fix 512 byte boundary limit
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

On Wed, Jul 8, 2020 at 2:53 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> Milton Miller reported that we are aligning start and end address to
> wrong size SZ_512M. It should be SZ_512. Fix that.
>
> While doing this change I also found a case where ALIGN() comparison
> fails. Within a given aligned range, ALIGN() of two addresses does not
> match when start address is pointing to the first byte and end address
> is pointing to any other byte except the first one. But that's not true
> for ALIGN_DOWN(). ALIGN_DOWN() of any two addresses within that range
> will always point to the first byte. So use ALIGN_DOWN() instead of
> ALIGN().
>
> Fixes: e68ef121c1f4 ("powerpc/watchpoint: Use builtin ALIGN*() macros")
> Reported-by: Milton Miller <miltonm@us.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
I tested this with the ptrace-hwbreak selftest. Can confirm without
also changing to ALIGN_DOWN() then these tests will fail.
Tested-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/kernel/hw_breakpoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 0000daf0e1da..031e6defc08e 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -419,7 +419,7 @@ static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
>         if (dawr_enabled()) {
>                 max_len = DAWR_MAX_LEN;
>                 /* DAWR region can't cross 512 bytes boundary */
> -               if (ALIGN(start_addr, SZ_512M) != ALIGN(end_addr - 1, SZ_512M))
> +               if (ALIGN_DOWN(start_addr, SZ_512) != ALIGN_DOWN(end_addr - 1, SZ_512))
>                         return -EINVAL;
>         } else if (IS_ENABLED(CONFIG_PPC_8xx)) {
>                 /* 8xx can setup a range without limitation */
> --
> 2.26.2
>
