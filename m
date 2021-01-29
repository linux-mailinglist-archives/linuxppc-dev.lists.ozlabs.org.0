Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39369308BA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 18:38:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS4LF1fW2zDsTD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 04:37:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Egkn8VYL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS4J54zNBzDrpn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 04:36:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7881C64E06;
 Fri, 29 Jan 2021 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611941763;
 bh=UU3PVz9wczpUtXMLDgF1j7n5nGXjETwd6kHnGceGTmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Egkn8VYL5xQe4bwWplZcAw7ap+1YC4uCHmi759G/EtZ/DcRoGHVBcCJLPUA8cUKFs
 YA/r7Rgqog5WXiGx4WxNizNqM/YK5Om5JUQ03O1c0PbWtj1HzMIu8V4g91GeM7GV37
 jGvCoAnmLaqgivjZsnI0pB1NfyBTC4IhIA2U1hc0K1ucVlPpEiVqvnq1uZ9+nLYSrP
 hl9X7Lq+qfkDCb4yH7sONyua1KVpTWmd4zrkEfqdg6NYUivDAxaW3RZ4Ru3Hc73y2K
 exlTX14UqhOGxgPaUdR8QW6WuscoiToTo0QSDcWNXsyc47+CarIgAwmRwu17e/xjSN
 bYTMlSvs9nlBg==
Date: Fri, 29 Jan 2021 19:35:57 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] tpm: ibmvtpm: fix error return code in
 tpm_ibmvtpm_probe()
Message-ID: <YBRHfZeqAirQolIN@kernel.org>
References: <20210126014753.340299-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126014753.340299-1-stefanb@linux.vnet.ibm.com>
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
Cc: Wang Hai <wanghai38@huawei.com>, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, paulus@samba.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 25, 2021 at 08:47:53PM -0500, Stefan Berger wrote:
> From: Stefan Berger <stefanb@linux.ibm.com>
> 
> Return error code -ETIMEDOUT rather than '0' when waiting for the
> rtce_buf to be set has timed out.
> 
> Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Thanks! Should I add

Cc: stable@vger.kernel.org to this?

/Jarkko


>  drivers/char/tpm/tpm_ibmvtpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index 994385bf37c0..813eb2cac0ce 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -687,6 +687,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  				ibmvtpm->rtce_buf != NULL,
>  				HZ)) {
>  		dev_err(dev, "CRQ response timed out\n");
> +		rc = -ETIMEDOUT;
>  		goto init_irq_cleanup;
>  	}
>  
> -- 
> 2.25.4
> 
> 
