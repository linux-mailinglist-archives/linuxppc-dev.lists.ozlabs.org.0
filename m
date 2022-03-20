Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB934E1DF0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 22:21:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KM9fX5dp6z3bXd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:21:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e+QDZFOY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e+QDZFOY; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KM9dw6FvKz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 08:20:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9451F6124C;
 Sun, 20 Mar 2022 21:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5749DC340E9;
 Sun, 20 Mar 2022 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647811248;
 bh=2polGcx4AD8GfFvR+v/6Gp6MCQ0HH8HWhgoMv5fTTZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e+QDZFOYV82/icqr1QmEbjgMGMZnPNZJbIZhlDQkOVT7xLmsQ3QvJIqEKp9qZjqqV
 7Z3mghJm4q3LLPHDEipOQW4i5n/CQbfUc8yXR/wA7Yhzmnx04iz6kZw//aQb21WEXa
 TFrsf9+Iab15PeAz7+eqD5gHb7wWLQ5pBwwNCd9butf+UtA0H9iXxLBvBUMQP3fYb/
 DmM9LqmmauefDO0Gn5HICWsGmjYB31xaOo346jzM5v6546aua262OfGWiMW/AqAl0M
 Tri5m98nhG/ajKpOJglzTmQUWGdShW3HmKow8eAyS9KML2XwuUzQdT0Tc5bvR1B0nc
 Kde7ydEp4Wiww==
Date: Sun, 20 Mar 2022 23:21:48 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: Re: [PATCH -next] tpm: ibmvtpm: Correct the return value in
 tpm_ibmvtpm_probe()
Message-ID: <Yjea7INzTZ2T9RWz@kernel.org>
References: <20220318060201.50488-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318060201.50488-1-xiujianfeng@huawei.com>
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
Cc: nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jgg@ziepe.ca,
 paulus@samba.org, peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 02:02:01PM +0800, Xiu Jianfeng wrote:
> Currently it returns zero when CRQ response timed out, it should return
> an error code instead.
> 
> Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index 3af4c07a9342..d3989b257f42 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -681,6 +681,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  	if (!wait_event_timeout(ibmvtpm->crq_queue.wq,
>  				ibmvtpm->rtce_buf != NULL,
>  				HZ)) {
> +		rc = -ENODEV;
>  		dev_err(dev, "CRQ response timed out\n");
>  		goto init_irq_cleanup;
>  	}
> -- 
> 2.17.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

This will require reviewed by from someone who knows this driver
better.

BR, Jarkko
