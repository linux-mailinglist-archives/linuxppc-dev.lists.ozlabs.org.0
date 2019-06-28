Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB35A119
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 18:38:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b2WD3jVxzDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 02:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b2TL1TbFzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 02:36:21 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45b2T752xSz1rbl1;
 Fri, 28 Jun 2019 18:36:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45b2T73RcSz1qqkS;
 Fri, 28 Jun 2019 18:36:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id n7J9Kz3WHeh7; Fri, 28 Jun 2019 18:36:10 +0200 (CEST)
X-Auth-Info: FbI/r/p3yKWuGrAJhFwnTdgCUcRVkGegtTm0TfgwdMIrmWt2MpT/uULs66KQ1B9c
Received: from igel.home (ppp-46-244-173-158.dynamic.mnet-online.de
 [46.244.173.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 28 Jun 2019 18:36:10 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 8F21D2C0C61; Fri, 28 Jun 2019 18:36:08 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH v2 02/12] powerpc/ptrace: drop unnecessary #ifdefs
 CONFIG_PPC64
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
X-Yow: LBJ, LBJ, how many JOKES did you tell today??!
Date: Fri, 28 Jun 2019 18:36:08 +0200
In-Reply-To: <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
 (Christophe Leroy's message of "Fri, 28 Jun 2019 15:47:51 +0000
 (UTC)")
Message-ID: <874l49mzuv.fsf@igel.home>
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 28 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> index f5f1ccc740fc..37d7befbb8dc 100644
> --- a/arch/powerpc/include/uapi/asm/ptrace.h
> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> @@ -43,12 +43,11 @@ struct pt_regs
>  	unsigned long link;
>  	unsigned long xer;
>  	unsigned long ccr;
> -#ifdef __powerpc64__
> -	unsigned long softe;		/* Soft enabled/disabled */
> -#else
> -	unsigned long mq;		/* 601 only (not used at present) */
> +	union {
> +		unsigned long softe;	/* Soft enabled/disabled */
> +		unsigned long mq;	/* 601 only (not used at present) */
>  					/* Used on APUS to hold IPL value. */
> -#endif
> +	};

Anonymous unions are a C11 feature.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
