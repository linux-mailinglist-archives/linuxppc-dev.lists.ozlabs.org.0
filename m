Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF68D4EAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 17:07:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AVtW63z+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqqP00SLgz3cyb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 01:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AVtW63z+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b8; helo=out-184.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 423 seconds by postgrey-1.37 at boromir; Fri, 31 May 2024 01:06:51 AEST
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqqNC4d5pz3cfg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 01:06:50 +1000 (AEST)
X-Envelope-To: linux@treblig.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717081147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmuU//dkJp7/bqMDC5bYlhcDNvJuvWDepZNNFMpTHfQ=;
	b=AVtW63z+BFg+N+i/VwF6voyhpXmTsIdi4tudn1OlsR1k9zDPA1VMDUJWt76QSW0eWIQkO6
	rq9EIF1DH6yZF4KtAQhnn/d9675jDbbrrxE8CZIB8j/PUfeIVRR5Mu1nghvPPznYxZW2Yh
	XLbrQnF24ylVS2WvPMpMZDkNCZwoezQ=
X-Envelope-To: camelia.groza@nxp.com
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev>
Date: Thu, 30 May 2024 10:59:03 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
To: linux@treblig.org, camelia.groza@nxp.com
References: <20240528231123.136664-1-linux@treblig.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240528231123.136664-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/24 19:11, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'cgr_comp' has been unused since
> commit 96f413f47677 ("soc/fsl/qbman: fix issue in
> qman_delete_cgr_safe()").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/soc/fsl/qbman/qman.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 7e9074519ad2..4dc8aba33d9b 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>  }
>  EXPORT_SYMBOL(qman_delete_cgr);
>  
> -struct cgr_comp {
> -	struct qman_cgr *cgr;
> -	struct completion completion;
> -};
> -
>  static void qman_delete_cgr_smp_call(void *p)
>  {
>  	qman_delete_cgr((struct qman_cgr *)p);

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
