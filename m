Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A44702D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 15:29:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QyxY3L84zDqNC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 23:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qysm4VWwzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 23:26:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Qysg71slz9v0qB;
 Sat, 15 Jun 2019 15:25:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ypMTtY4H2cjl; Sat, 15 Jun 2019 15:25:59 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Qysg6612z9v0q9;
 Sat, 15 Jun 2019 15:25:59 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 9DA2B3FF; Sat, 15 Jun 2019 15:25:59 +0200 (CEST)
Received: from 37.170.137.36 ([37.170.137.36]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Sat, 15 Jun 2019 15:25:59 +0200
Date: Sat, 15 Jun 2019 15:25:59 +0200
Message-ID: <20190615152559.Horde.0lTFIZALxZ-RI75z94G3jA8@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] powerpc/mm/32s: only use MMU to mark initmem NX if
 STRICT_KERNEL_RWX
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <8736kb9fry.fsf_-_@igel.home>
In-Reply-To: <8736kb9fry.fsf_-_@igel.home>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> a =C3=A9crit=C2=A0:

> If STRICT_KERNEL_RWX is disabled, never use the MMU to mark initmen
> nonexecutable.

I dont understand, can you elaborate ?

This area is mapped with BATs so using change_page_attr() is pointless.

Christophe

>
> Also move a misplaced paren that makes the condition always true.
>
> Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/powerpc/mm/pgtable_32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index d53188dee18f..3935dc263d65 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -360,9 +360,11 @@ void mark_initmem_nx(void)
>  	unsigned long numpages =3D PFN_UP((unsigned long)_einittext) -
>  				 PFN_DOWN((unsigned long)_sinittext);
>
> -	if (v_block_mapped((unsigned long)_stext) + 1)
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +	if (v_block_mapped((unsigned long)_stext + 1))
>  		mmu_mark_initmem_nx();
>  	else
> +#endif
>  		change_page_attr(page, numpages, PAGE_KERNEL);
>  }
>
> --
> 2.22.0
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."


