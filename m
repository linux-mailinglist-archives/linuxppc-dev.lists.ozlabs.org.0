Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3618A69E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:32:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N7DN5GwdzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="UJfpyNDi"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N78c0FBwzDqR2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 23:29:19 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id u40so11266578qth.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vSCrsgtUDOrdMKexctcYwvLETgiF3cYlWaBb3HHaSbs=;
 b=UJfpyNDiEYeIfGsfuZHqmN1M22/sY3oHMoq+94AImqFUbIcEiMK18AUSiub89oF0DN
 6alIfIUEzABH9P29i54S9c3HRjoxEIWUFZlSXn4tbCzFtVnTtRGU7OBvWeVQ0Hz/vLW2
 Tmx0uTCD10/Uj09DGFmNsi70AorIqlmW9DvsbfINv9kmPzpQUm8VRfoeZaOpk7bkLtTz
 h7Qpp4kKpuHv5wS+X7ftnyS0ZTPad3uWxrg1KwoY5mKrAuIhyqWtjDxOwCdT9HKigZnY
 yV0mCdAJv0zY+I5VRRo5JeIQ90Bzn0cDW9nHSkv1dQjo6yHt6EC1UWUFAozXkCAPGQ0h
 hTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSCrsgtUDOrdMKexctcYwvLETgiF3cYlWaBb3HHaSbs=;
 b=AkzPiUSUGM9AyoV2HsyCbK3VXIPKbepLSqWxFaILlMvJslu6m2TB5Sm8fzZaITPari
 NpTZmsrSzl7G3qiCbd4lzxAIOeW+c/K+QXeA2wAa8Eqn0RkU9KDdzFlr9HbXrG0Yk4nv
 h+Kkz8Pj5eIapHkcLeiuwIj47Xbwqjwvzln/sAgAF2a6jKjHpB/gw1++iOivgiW+5YFy
 bCLCLt3+fRoouyFfcWHby5BAQD+C8q2Spbma3iXhnSHmDU1/zFvaTmpJyynEUOXnkwQa
 k+UDLNxdoMM9N+3BfYAUhXAeUqVT4t7rqWeEEQdevU+JuRXTacIWIkjYomj6oh6j/e2S
 Qr4Q==
X-Gm-Message-State: APjAAAWhm2Mel8OdiZZpx72DSY74OdsQp74JrTbLPjUWZqK7gPFXtD6o
 qcg4HHkFehxfU21mCCR2XJ9BpQ==
X-Google-Smtp-Source: APXvYqw/yxe4cj3zPsPpC0WLlYfi8qeZk7SV9W2df+c/k7Ixec4IezKnFBb6gQSOI8MGlLhcGrN34A==
X-Received: by 2002:ac8:7b99:: with SMTP id p25mr33996117qtu.243.1567517356351; 
 Tue, 03 Sep 2019 06:29:16 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id f34sm9330397qtc.19.2019.09.03.06.29.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 06:29:15 -0700 (PDT)
Message-ID: <1567517354.5576.45.camel@lca.pw>
Subject: Re: [PATCH] powerpc/powernv: fix a W=1 compilation warning
From: Qian Cai <cai@lca.pw>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 Christoph Hellwig <hch@lst.de>
Date: Tue, 03 Sep 2019 09:29:14 -0400
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I saw Christ start to remove npu-dma.c code [1]

[1] https://lore.kernel.org/linuxppc-dev/20190625145239.2759-4-hch@lst.de/

Should pnv_npu_dma_set_32() be removed too?

It was only called by pnv_npu_try_dma_set_bypass() but the later is not used
anywhere in the kernel tree. If that is a case, I don't need to bother fixing
the warning here.

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
