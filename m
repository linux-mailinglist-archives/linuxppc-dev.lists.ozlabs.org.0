Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7EE2C4E67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 06:25:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChR6b0BGmzDrBc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 16:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Ao43ezJo; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChNgZ44mzzDqpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 14:35:22 +1100 (AEDT)
Received: from suppilovahvero.lan (83-245-197-237.elisa-laajakaista.fi
 [83.245.197.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96B3520578;
 Thu, 26 Nov 2020 03:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606361719;
 bh=Pm86dA96vUB8ve/WV9A5oJB00MJ+s60jMcnkxr4UFJo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ao43ezJomqCbc8UXSXpuCxDN6NNJmTWH9EJcqzDgLvZaJZ9Wg6lnU4GQFDMO0AYw+
 d+DefLfOulwbgxAPWLfgHsJrqlzxao1dhx6WLIFrGh2fBDv5BqHqrlWxgIvK9vCWTA
 vNIrbJDnVXQs47LMpv0bSM8ltuFv7p9/om+dkb3g=
Message-ID: <4192b5a07ebd0539dd8244afe9e065b4996f4f4a.camel@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: fix error return code in tpm_ibmvtpm_probe()
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Wang Hai <wanghai38@huawei.com>, mpe@ellerman.id.au, 
 benh@kernel.crashing.org, paulus@samba.org, peterhuewe@gmx.de,
 jgg@ziepe.ca,  stefanb@linux.ibm.com, nayna@linux.ibm.com
Date: Thu, 26 Nov 2020 05:35:15 +0200
In-Reply-To: <20201124135244.31932-1-wanghai38@huawei.com>
References: <20201124135244.31932-1-wanghai38@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Nov 2020 16:24:11 +1100
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
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-11-24 at 21:52 +0800, Wang Hai wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before
> proceeding")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Provide a reasoning for -ETIMEOUT in the commit message.

/Jarkko

> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
> b/drivers/char/tpm/tpm_ibmvtpm.c
> index 994385bf37c0..813eb2cac0ce 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -687,6 +687,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev
> *vio_dev,
>                                 ibmvtpm->rtce_buf != NULL,
>                                 HZ)) {
>                 dev_err(dev, "CRQ response timed out\n");
> +               rc = -ETIMEDOUT;
>                 goto init_irq_cleanup;
>         }
>  


