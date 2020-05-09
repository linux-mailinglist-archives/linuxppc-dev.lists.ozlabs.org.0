Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C181CC0A0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 13:09:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K4Fz5C1GzDr9w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 21:09:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K4DS73GvzDr5l
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 21:07:49 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7E79D43D6C2C56BBBD76;
 Sat,  9 May 2020 19:07:38 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.154) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 9 May 2020 19:07:35 +0800
Subject: Re: [PATCH -next] soc: fsl: dpio: remove set but not used variable
 'addr_cena'
To: <Roy.Pledge@nxp.com>, <leoyang.li@nxp.com>, <youri.querry_1@nxp.com>
References: <20200508141028.38124-1-yuehaibing@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <bd4e87d7-3dc3-bef2-6eba-6599087604f1@huawei.com>
Date: Sat, 9 May 2020 19:07:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200508141028.38124-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pls ignore this duplicate.

On 2020/5/8 22:10, YueHaibing wrote:
> drivers/soc/fsl/dpio//qbman-portal.c:650:11: warning: variable 'addr_cena' set but not used [-Wunused-but-set-variable]
>   uint64_t addr_cena;
>            ^~~~~~~~~
> 
> It is never used, so remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index e2e9fbb58a72..0ce859b60888 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -647,7 +647,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
>  	const uint32_t *cl = (uint32_t *)d;
>  	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
>  	int i, num_enqueued = 0;
> -	uint64_t addr_cena;
>  
>  	spin_lock(&s->access_spinlock);
>  	half_mask = (s->eqcr.pi_ci_mask>>1);
> @@ -700,7 +699,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
>  
>  	/* Flush all the cacheline without load/store in between */
>  	eqcr_pi = s->eqcr.pi;
> -	addr_cena = (size_t)s->addr_cena;
>  	for (i = 0; i < num_enqueued; i++)
>  		eqcr_pi++;
>  	s->eqcr.pi = eqcr_pi & full_mask;
> 

