Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E956367298
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 17:39:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lcYk3VsrzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 01:39:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="pM5Hh4kg"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lcKQ4NTtzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 01:29:13 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id z4so8488181qtc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbIZ4fsnq/bMmsE1HOYvxUvp6AyyxU96K8pEGWgO1Z0=;
 b=pM5Hh4kgLt9RcG5UX8PPdOxYKCfmlBqPdN72rNJ7x/0KIScXNBki/H+h3I0d4lcdV6
 nypPvti7tSU9sfqkK3SgIDGMN7v9shbCMOEC0suFhhdUEr4Yg1gQH7MTXBqjUKV/KDMT
 +QgErgNZufptZIvx1+9HN4PRkHrVLa7/VrPI0+z8WK85xfHKnkiUrbfPYFX/VN6h4vEb
 gHRq43/vcLAk9RMy+9xFc2TA61O8y+CezknTfDHTxLpfGWUlduogiKcynU8k1MResXRa
 61xOMf9Da5xu5DnGU54yqXS2+EI4b0Ow5zmGR1ylDr0zQWFFiWXDT2HXdDaOyW73GKSG
 kXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbIZ4fsnq/bMmsE1HOYvxUvp6AyyxU96K8pEGWgO1Z0=;
 b=hPy+jQBBfWfFjQRaZFv2dNSR7zzEB0qcwhBBOwTxw/XZkDYpL4ol1d+6IRdSpGGGPP
 fdjF45cbgqjZsXQ3xswUmjC3fWM1joP/Dxk+ayi/t2oiZmYdASBaoBSya8ySZg3BvUZ9
 iQlm7YgsRAED0Lvxoz7bmkgUxMpVeeNyWKrOPFoj9T6ZAOC/6JjHBb/DmmS5GY6RGnE5
 ModZ7cPQYPtuOfSTOfYtIAA0X3FB/FEfBbcaq9QEtx2GbJYqZT8LdvV1W5cbVdHIdOM4
 hqeWVBGebxj2nxR1V18vJyxCq/TS4VyRY751x6CkXRubGxobaMJtH6HJxU6j/GCKypWi
 OwwA==
X-Gm-Message-State: APjAAAVFDDFBeF4lOK1+sJYEsOgdlYUFnFJzoiBajuEsf6cmoCiwuiHs
 kJ5x+kPoCNi7ufsZtjJQcx+6Ag==
X-Google-Smtp-Source: APXvYqx4GHYUh9QqZYC3BhOAfwgBw85mw+jPseU8wXr2ewenlgxU8gpnm9A2+7IF1NynsfUGiA1QSQ==
X-Received: by 2002:a0c:ea34:: with SMTP id t20mr7112177qvp.11.1562945350546; 
 Fri, 12 Jul 2019 08:29:10 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id u4sm4091905qkb.16.2019.07.12.08.29.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 08:29:09 -0700 (PDT)
Message-ID: <1562945348.8510.27.camel@lca.pw>
Subject: Re: [PATCH] powerpc/powernv: fix a W=1 compilation warning
From: Qian Cai <cai@lca.pw>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Date: Fri, 12 Jul 2019 11:29:08 -0400
In-Reply-To: <1558541369-8263-1-git-send-email-cai@lca.pw>
References: <1558541369-8263-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping.

On Wed, 2019-05-22 at 12:09 -0400, Qian Cai wrote:
> The commit b575c731fe58 ("powerpc/powernv/npu: Add set/unset window
> helpers") called pnv_npu_set_window() in a void function
> pnv_npu_dma_set_32(), but the return code from pnv_npu_set_window() has
> no use there as all the error logging happen in pnv_npu_set_window(),
> so just remove the unused variable to avoid a compilation warning,
> 
> arch/powerpc/platforms/powernv/npu-dma.c: In function
> 'pnv_npu_dma_set_32':
> arch/powerpc/platforms/powernv/npu-dma.c:198:10: warning: variable ‘rc’
> set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/platforms/powernv/npu-dma.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c
> b/arch/powerpc/platforms/powernv/npu-dma.c
> index 495550432f3d..035208ed591f 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -195,7 +195,6 @@ static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
>  {
>  	struct pci_dev *gpdev;
>  	struct pnv_ioda_pe *gpe;
> -	int64_t rc;
>  
>  	/*
>  	 * Find the assoicated PCI devices and get the dma window
> @@ -208,8 +207,8 @@ static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
>  	if (!gpe)
>  		return;
>  
> -	rc = pnv_npu_set_window(&npe->table_group, 0,
> -			gpe->table_group.tables[0]);
> +	pnv_npu_set_window(&npe->table_group, 0,
> +			   gpe->table_group.tables[0]);
>  
>  	/*
>  	 * NVLink devices use the same TCE table configuration as
