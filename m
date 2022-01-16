Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652948FF63
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcTSs2J3jz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:58:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fmxgnOFp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=fmxgnOFp; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcTSF0ykfz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:58:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Y62WBf7WncHPVF1rPc3S4E5knHjrE+JJV2IuxkQAh3U=; b=fmxgnOFptHQcJCqzjXWVmbFkm9
 VO8Lo4wAfNHSboCGaSwhYHYTx29Y24Kn/kw5WUZtK0DSSLWxwGufDNVsbrqkJnHTj4CggAeMRx7jr
 TUlEkB0mudzVRSGnykFM10wFkj7THfBq3UPX86tuG1HAuogm/HSeMweyC6BiDPPOOMqo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n9DTN-001Yup-Iv; Sun, 16 Jan 2022 22:54:01 +0100
Date: Sun, 16 Jan 2022 22:54:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tobias Waldekranz <tobias@waldekranz.com>
Subject: Re: [PATCH net 4/4] net/fsl: xgmac_mdio: Fix incorrect iounmap when
 removing module
Message-ID: <YeST+TAREKIh2RXp@lunn.ch>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-5-tobias@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116211529.25604-5-tobias@waldekranz.com>
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, kuba@kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 16, 2022 at 10:15:29PM +0100, Tobias Waldekranz wrote:
> As reported by sparse: In the remove path, the driver would attempt to
> unmap its own priv pointer - instead of the io memory that it mapped
> in probe.

Hi Tobias

The change itself is O.K.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

But you could also change to devm_ so the core will handle the unmap,
it is very unlikely to unmap the wrong thing.

     Andrew
