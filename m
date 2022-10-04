Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D55F4774
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 18:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhjg60XVCz3bwQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 03:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=QTab0oCL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=QTab0oCL;
	dkim-atps=neutral
X-Greylist: delayed 512 seconds by postgrey-1.36 at boromir; Wed, 05 Oct 2022 03:22:23 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhjf72hnqz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 03:22:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6Nc03kCD580eoe7aqLtPYGYFRbTdfQEDrzlYxPtOCP8=; b=QTab0oCLBQCQu3bfPCz6/3RDvi
	HYnHz6RGyGOTRtwHtBTB6PaGjnCpZRV2QgUzchqqWGwb2q57yXI7jx6H8mH39pMX6E8PgTM6QBRHN
	SlUSj+3oTjYxvTBMhF6tgjevZeCYB4Z91SzhflffKtJZKhLLEX1DIK0ahHb7wW7f7tEJ4KuPW+MRl
	1A2iJ7xYh4lcHsk6BSc8zpSODpwC5UN1nXGHg/3OP7ubGDP4xBaImozA5rjJM2KXsB3oISgtXqfLL
	gpaCucWHwlzAtN6SPsB8MO/D4RwDlcjmL6/A0wqgr7tEASOYVaK2nb6NwcQfCDTqtLh2BkLgMgLjF
	XxsXU2/Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34582)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ofkXt-0008Fg-VQ; Tue, 04 Oct 2022 17:13:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ofkXq-0004Vq-IH; Tue, 04 Oct 2022 17:13:22 +0100
Date: Tue, 4 Oct 2022 17:13:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v6 6/9] net: dpaa: Convert to phylink
Message-ID: <YzxbogPClCjNgN+m@shell.armlinux.org.uk>
References: <20220930200933.4111249-1-sean.anderson@seco.com>
 <20220930200933.4111249-7-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930200933.4111249-7-sean.anderson@seco.com>
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 30, 2022 at 04:09:30PM -0400, Sean Anderson wrote:
> @@ -1064,43 +1061,50 @@ static struct phylink_pcs *memac_pcs_create(struct device_node *mac_node,
>  	return pcs;
>  }
>  
> +static bool memac_supports(struct mac_device *mac_dev, phy_interface_t iface)
> +{
> +	/* If there's no serdes device, assume that it's been configured for
> +	 * whatever the default interface mode is.
> +	 */
> +	if (!mac_dev->fman_mac->serdes)
> +		return mac_dev->phy_if == iface;
> +	/* Otherwise, ask the serdes */
> +	return !phy_validate(mac_dev->fman_mac->serdes, PHY_MODE_ETHERNET,
> +			     iface, NULL);
> +}
> +
>  int memac_initialization(struct mac_device *mac_dev,
>  			 struct device_node *mac_node,
>  			 struct fman_mac_params *params)
>  {
>  	int			 err;
> +	struct device_node      *fixed;
>  	struct phylink_pcs	*pcs;
> -	struct fixed_phy_status *fixed_link;
>  	struct fman_mac		*memac;
> +	unsigned long		 capabilities;
> +	unsigned long		*supported;
>  
> +	mac_dev->phylink_ops		= &memac_mac_ops;
>  	mac_dev->set_promisc		= memac_set_promiscuous;
>  	mac_dev->change_addr		= memac_modify_mac_address;
>  	mac_dev->add_hash_mac_addr	= memac_add_hash_mac_address;
>  	mac_dev->remove_hash_mac_addr	= memac_del_hash_mac_address;
> -	mac_dev->set_tx_pause		= memac_set_tx_pause_frames;
> -	mac_dev->set_rx_pause		= memac_accept_rx_pause_frames;
>  	mac_dev->set_exception		= memac_set_exception;
>  	mac_dev->set_allmulti		= memac_set_allmulti;
>  	mac_dev->set_tstamp		= memac_set_tstamp;
>  	mac_dev->set_multi		= fman_set_multi;
> -	mac_dev->adjust_link            = adjust_link_memac;
>  	mac_dev->enable			= memac_enable;
>  	mac_dev->disable		= memac_disable;
>  
> -	if (params->max_speed == SPEED_10000)
> -		mac_dev->phy_if = PHY_INTERFACE_MODE_XGMII;
> -
>  	mac_dev->fman_mac = memac_config(mac_dev, params);
> -	if (!mac_dev->fman_mac) {
> -		err = -EINVAL;
> -		goto _return;
> -	}
> +	if (!mac_dev->fman_mac)
> +		return -EINVAL;
>  
>  	memac = mac_dev->fman_mac;
>  	memac->memac_drv_param->max_frame_length = fman_get_max_frm();
>  	memac->memac_drv_param->reset_on_init = true;
>  
> -	err = of_property_match_string(mac_node, "pcs-names", "xfi");
> +	err = of_property_match_string(mac_node, "pcs-handle-names", "xfi");

While reading through the patch, I stumbled upon this - in the previous
patch, you introduce this code with "pcs-names" and then in this patch
you change the name of the property. I don't think this was mentioned in
the commit message (searching it for "pcs" didn't reveal anything) so
I'm wondering whether this name update should've been merged into the
previous patch instead of this one?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
