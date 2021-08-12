Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3973E9F44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 09:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GldDW2SYbz30Fg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 17:12:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KWqNs2Mz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+05ee741c295a7d1f89bd+6563+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GldCk1Bjdz2yNB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 17:11:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B2gGP1VQRHCk6MX5le6+GSdI6v6K4Z0HHWZKFL10rE0=; b=KWqNs2MzE3TrEoFEQpnBVNyN0g
 3jwYoTV2xVF97Q4jfnPDewLohje/W5KP+UVtzf70pRbNyVa0L9JR/HRVX++AjDpqrnODvsCq3iI6s
 s5hWoJJ7ZlojfvWMh/XXqY102KCc4s+2CULMGqM9r9FaqMI/S9tVa1ufKTY3vmbMdC+GxCI/13mMB
 m5AdxVnPALV6Jdrsa+eStgqDvqaVf+z0JdxyAI+Vm+PhT8v18Xohd1mTScUog28GAzhZYHaRa8eH8
 1bRc8324eOnZjmhS5fyzGdF12l4kFva4VJYN6JiZH4nOA3O5IbcKjh1RosqC6FmXil2UqOXUOVEK3
 /vMn+JfQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mE4oC-00EGqD-Lh; Thu, 12 Aug 2021 07:07:34 +0000
Date: Thu, 12 Aug 2021 08:07:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 4/8] PCI: replace pci_dev::driver usage that gets the
 driver name
Message-ID: <YRTIqGm5Dr8du7a7@infradead.org>
References: <20210811080637.2596434-1-u.kleine-koenig@pengutronix.de>
 <20210811080637.2596434-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811080637.2596434-5-u.kleine-koenig@pengutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 oss-drivers@corigine.com, Paul Mackerras <paulus@samba.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vadym Kochan <vkochan@marvell.com>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Salil Mehta <salil.mehta@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Simon Horman <simon.horman@corigine.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 11, 2021 at 10:06:33AM +0200, Uwe Kleine-K??nig wrote:
>  static inline const char *eeh_driver_name(struct pci_dev *pdev)
>  {
> -	return (pdev && pdev->driver) ? pdev->driver->name : "<null>";
> +	const char *drvstr = pdev ? dev_driver_string(&pdev->dev) : "";
> +
> +	if (*drvstr == '\0')
> +		return "<null>";
> +
> +	return drvstr;

This looks rather obsfucated due to the fact that dev_driver_string
never returns '\0', and due to the strange mix of a tenary operation
and the if on a related condition.


>  }
>  
>  #endif /* CONFIG_EEH */
> diff --git a/drivers/bcma/host_pci.c b/drivers/bcma/host_pci.c
> index 69c10a7b7c61..dc2ffa686964 100644
> --- a/drivers/bcma/host_pci.c
> +++ b/drivers/bcma/host_pci.c
> @@ -175,9 +175,10 @@ static int bcma_host_pci_probe(struct pci_dev *dev,
>  	if (err)
>  		goto err_kfree_bus;
>  
> -	name = dev_name(&dev->dev);
> -	if (dev->driver && dev->driver->name)
> -		name = dev->driver->name;
> +	name = dev_driver_string(&dev->dev);
> +	if (*name == '\0')
> +		name = dev_name(&dev->dev);

Where does this '\0' check come from?

> +
> +	name = dev_driver_string(&dev->dev);
> +	if (*name == '\0')
> +		name = dev_name(&dev->dev);
> +

More of this weirdness.
