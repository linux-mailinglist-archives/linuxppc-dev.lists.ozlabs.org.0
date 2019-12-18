Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C3124915
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:08:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dH0m2LMBzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:08:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="m7ViOGlj"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dGy675CTzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 01:06:06 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x184so1281297pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 06:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=H+UBquKlXilLiuwiUcZlRnPLSCfq5BwjYOefNrMs6r0=;
 b=m7ViOGlj+UDt6nW5H2Jrr5vQ4sv8tVF14K5XNSGvP02F7KlPtyA7RFnjn7/P9O5INF
 3TNPG/7BZzthOCschy/kxxK10oz6yqr4TDAYFunoyPbepNqWg4YMMxOoUuLClwfSfrWS
 jmdTYSViyVry3KRsv1P+jXmfr/n/VNGwP0yjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=H+UBquKlXilLiuwiUcZlRnPLSCfq5BwjYOefNrMs6r0=;
 b=WwxSvLpM5tohufiNHrHh2i5hwIPuZ48AUqZzcilUUL4XFBTgPI+sA2mKcHA3jfcIgQ
 AU5gkzmmPKmL5HZZ6XlptxjdR25ubbgpFpQIytKhJcRNaSEn+t0mIoGonBGfise3SRvm
 JtxOOv1Ei7ink7j34Jsb3c7K83Ogh8t52u7xLzI22ilRbqMWVCnkqP7WKBqJ2asGMutZ
 U8xdE0qB3YTsssucc7RdhnGNTu6nF1vnaYQaKPHzwMLfkSDXgz8v1aPcLkb6OdKnstgf
 9w4WIU1mc8xzyAiCIeohtLjJG4PL/uyTY3E+HCKL1GrH1ZzsVYO8rjsoEpjxdoug5ZmD
 qgPQ==
X-Gm-Message-State: APjAAAWJvKvncWpAFCf4ikzzWymmSBxrDSOIy+ND3Uh1WW+NfP9HOyzu
 p2C7fRH/nQxZgxXO+cM5JG5UbA==
X-Google-Smtp-Source: APXvYqwthA/j6SvYPFGsYSWPcuPiKH5zLEeRtX3K8lWd2m2aYceD3Ouv00Ww7r0Ui1y4uz6RnAr4lg==
X-Received: by 2002:a65:68ca:: with SMTP id k10mr3353238pgt.222.1576677962923; 
 Wed, 18 Dec 2019 06:06:02 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-a084-b324-40b3-453d.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:a084:b324:40b3:453d])
 by smtp.gmail.com with ESMTPSA id q15sm3473148pgi.55.2019.12.18.06.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:06:02 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 08/18] powerpc sstep: Add support for prefixed VSX
 load/stores
In-Reply-To: <20191126052141.28009-9-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-9-jniethe5@gmail.com>
Date: Thu, 19 Dec 2019 01:05:58 +1100
Message-ID: <87lfr9u3sp.fsf@dja-thinkpad.axtens.net>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:

> This adds emulation support for the following prefixed VSX load/stores:
>   * Prefixed Load VSX Scalar Doubleword (plxsd)
>   * Prefixed Load VSX Scalar Single-Precision (plxssp)
>   * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
>   * Prefixed Store VSX Scalar Doubleword (pstxsd)
>   * Prefixed Store VSX Scalar Single-Precision (pstxssp)
>   * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Take this with a grain of salt, but I would proooobably squish the 3
load/store patches into one.

Part of my hesitation is that I think you also need some sstep tests for
these new instructions - if they massively bloat the patches I might
keep them as separate patches.

I'd also like to see a test for your next patch.

Regards,
Daniel

> ---
>  arch/powerpc/lib/sstep.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 9113b9a21ae9..9ae8d177b67f 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -2713,6 +2713,48 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			case 41:	/* plwa */
>  				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
>  				break;
> +			case 42:        /* plxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 43:	/* plxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 46:	/* pstxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 47:	/* pstxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 51:	/* plxv1 */
> +				op->reg += 32;
> +
> +				/* fallthru */
> +			case 50:	/* plxv0 */
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 55:	/* pstxv1 */
> +				op->reg = rd + 32;
> +
> +				/* fallthru */
> +			case 54:	/* pstxv0 */
> +				op->type = MKOP(STORE_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
>  			case 56:        /* plq */
>  				op->type = MKOP(LOAD, PREFIXED, 16);
>  				break;
> -- 
> 2.20.1
