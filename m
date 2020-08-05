Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4023CAEF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 15:21:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMC1s5KrzzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 23:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RZK5/PZX; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMBzh3Ls5zDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 23:19:28 +1000 (AEST)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BEA822D75;
 Wed,  5 Aug 2020 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596633566;
 bh=3MsIB79zBI0fO6hFED+2PELXN5lzdVBWP95KH0wBH9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZK5/PZXQyb5E2xDXei3LEsgNsjsWbhsLQmYNpOCHlPpt0GCwrSwYNqCYvD4kfeIP
 Hbpk+HWDzMbC0+cK8xnUE31SqMuhCjoSMDTuv+MHlP37YeDKS4CJVRAzciNnNhNaCk
 ptJnG0ENBNRlSaZjIhOZo9NHqiG1R18UllMX4O+k=
Date: Wed, 5 Aug 2020 18:49:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] dmaengine: Use fallthrough pseudo-keyword
Message-ID: <20200805131922.GZ12965@vkoul-mobl>
References: <20200727203413.GA6245@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727203413.GA6245@embeddedor>
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Zhang Wei <zw@zh-kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 KP Singh <kpsingh@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27-07-20, 15:34, Gustavo A. R. Silva wrote:

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 2c508ee672b9..9b69716172a4 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -1061,16 +1061,16 @@ static bool _start(struct pl330_thread *thrd)
>  
>  		if (_state(thrd) == PL330_STATE_KILLING)
>  			UNTIL(thrd, PL330_STATE_STOPPED)
> -		/* fall through */
> +		fallthrough;
>  
>  	case PL330_STATE_FAULTING:
>  		_stop(thrd);
> -		/* fall through */
> +		fallthrough;
>  
>  	case PL330_STATE_KILLING:
>  	case PL330_STATE_COMPLETING:
>  		UNTIL(thrd, PL330_STATE_STOPPED)
> -		/* fall through */
> +		fallthrough;
>  
>  	case PL330_STATE_STOPPED:
>  		return _trigger(thrd);
> @@ -1121,7 +1121,6 @@ static u32 _emit_load(unsigned int dry_run, u8 buf[],
>  
>  	switch (direction) {
>  	case DMA_MEM_TO_MEM:
> -		/* fall through */
>  	case DMA_MEM_TO_DEV:
>  		off += _emit_LD(dry_run, &buf[off], cond);
>  		break;
> @@ -1155,7 +1154,6 @@ static inline u32 _emit_store(unsigned int dry_run, u8 buf[],
>  
>  	switch (direction) {
>  	case DMA_MEM_TO_MEM:
> -		/* fall through */
>  	case DMA_DEV_TO_MEM:
>  		off += _emit_ST(dry_run, &buf[off], cond);
>  		break;
> @@ -1216,7 +1214,6 @@ static int _bursts(struct pl330_dmac *pl330, unsigned dry_run, u8 buf[],
>  
>  	switch (pxs->desc->rqtype) {
>  	case DMA_MEM_TO_DEV:
> -		/* fall through */
>  	case DMA_DEV_TO_MEM:
>  		off += _ldst_peripheral(pl330, dry_run, &buf[off], pxs, cyc,
>  			cond);
> @@ -1266,7 +1263,6 @@ static int _dregs(struct pl330_dmac *pl330, unsigned int dry_run, u8 buf[],
>  
>  	switch (pxs->desc->rqtype) {
>  	case DMA_MEM_TO_DEV:
> -		/* fall through */

replacement missed here and above few

-- 
~Vinod
