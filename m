Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D7919CF91
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:59:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tnmC45ZgzDrS2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tnkQ5dD3zDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:58:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ps9PQGj8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tnkP0CG9z9sP7;
 Fri,  3 Apr 2020 15:58:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585889886;
 bh=myGZfk5+8kS9+3QY0Gl2TRS7UtcpQlBFRKPmNbN1p7s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ps9PQGj8CIphQ8f5Qa14U0D7vOz/gHTuS9BaJxS6PEQUpS+iOJFCLkwAME/wax0Ug
 jfgoCogWTOd3CwQpMIEdVDJhXzTtVzSA1ZHk3vbAXoW1A0arU0j/n3es3H/Hc2D0xG
 z+MwMmXtUn0Li0aslk9CPXPgyLl5ymQWREN6zjoM2RV317YMpahnCglxCM9JvXNj1V
 snwJoA1+gpb/rXvU/rYhWGIi1btHk7R4xDvczEjmN4ErXWMKbweSSBPdujKVtd2LFP
 l6YmHVLfBhPQmzFojjdBh4BIkTIawqzAUjhWbJPxs2zFtS4tA18lcyiYH2gyUOQ4eO
 mnRTdO+EHFTRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: YueHaibing <yuehaibing@huawei.com>, benh@kernel.crashing.org,
 paulus@samba.org, gregkh@linuxfoundation.org, christophe.leroy@c-s.fr,
 allison@lohutok.net, armijn@tjaldur.nl, tglx@linutronix.de,
 aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com
Subject: Re: [PATCH] powerpc/mm: ptdump: Add missing include <asm/vio.h>
In-Reply-To: <20200402135828.37308-1-yuehaibing@huawei.com>
References: <20200402135828.37308-1-yuehaibing@huawei.com>
Date: Fri, 03 Apr 2020 15:58:12 +1100
Message-ID: <87sghlrwrf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

YueHaibing <yuehaibing@huawei.com> writes:
> gcc build fails:

What config? Custom?

> arch/powerpc/mm/ptdump/hashpagetable.c: In function =E2=80=98pseries_find=
=E2=80=99:
> arch/powerpc/mm/ptdump/hashpagetable.c:262:18: error: =E2=80=98H_SUCCESS=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98FL=
_ACCESS=E2=80=99?
>    if (lpar_rc !=3D H_SUCCESS)
>                   ^~~~~~~~~
>                   FL_ACCESS
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 65e701b2d2a8 ("powerpc/ptdump: drop non vital #ifdefs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/powerpc/mm/ptdump/hashpagetable.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptd=
ump/hashpagetable.c
> index b6ed9578382f..8ea5f9a3b658 100644
> --- a/arch/powerpc/mm/ptdump/hashpagetable.c
> +++ b/arch/powerpc/mm/ptdump/hashpagetable.c
> @@ -20,6 +20,7 @@
>  #include <asm/page.h>
>  #include <asm/pgalloc.h>
>  #include <asm/plpar_wrappers.h>
> +#include <asm/vio.h>

I don't think you want vio.h, hvcall.h has the definition of H_SUCCESS.

cheers
