Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F287446FE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 14:36:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qxm72k9QzDrfF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 22:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Jun 2019 22:34:19 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qxk31X93zDrcC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 22:34:18 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45QxbT3gzFz1rFDl;
 Sat, 15 Jun 2019 14:28:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45QxbT2NhDz1qqkh;
 Sat, 15 Jun 2019 14:28:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id TfqFOYFLjnQz; Sat, 15 Jun 2019 14:28:36 +0200 (CEST)
X-Auth-Info: OQbThpk8h3LyExLjWVy0gLSRfEJA3KB+AaHbnxoN4dOUOIKp68nqKB9ZJEV0X+1N
Received: from igel.home (ppp-46-244-181-62.dynamic.mnet-online.de
 [46.244.181.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 15 Jun 2019 14:28:36 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D72C52C0C9A; Sat, 15 Jun 2019 14:28:35 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 13/16] powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
X-Yow: Fold, fold, FOLD!!  FOLDING many items!!
Date: Sat, 15 Jun 2019 14:28:35 +0200
In-Reply-To: <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 (Christophe Leroy's message of "Thu, 21 Feb 2019 19:08:49 +0000
 (UTC)")
Message-ID: <877e9n9gng.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Feb 21 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index a000768a5cc9..6e56a6240bfa 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -353,7 +353,10 @@ void mark_initmem_nx(void)
>  	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
>  				 PFN_DOWN((unsigned long)_sinittext);
>  
> -	change_page_attr(page, numpages, PAGE_KERNEL);
> +	if (v_block_mapped((unsigned long)_stext) + 1)

That is always true.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
