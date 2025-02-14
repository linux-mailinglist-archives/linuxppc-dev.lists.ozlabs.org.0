Return-Path: <linuxppc-dev+bounces-6195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B9A35F67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 14:41:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvYBB1WNDz30YZ;
	Sat, 15 Feb 2025 00:41:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739540514;
	cv=none; b=h7hEHAsoYSRBKXyiI13Fypz9jU+ny6i0YUINOwPbJ7kNLDY/0nIIGYIpaA8l7oGjFxF6gzquUnCVtoCJO0IfiKMpj7HPO8WeaGcJ4q9lkDWtvsGvGJ9HxldbimK5sSsNdva/JFia0U8mWEAcG5hi697vGdtvs9qBU29w+pYpzC4n+DISz7olAgFB6X+33C1UJuG2aGCL9BINSUtHnw9C50rBLzP4/9Bqk2vwXGhNcokFovy0vaedV2S2xKLqB20iGGAddAnUnyve8JApHdwgSLdz/c4svV+ZvpV2uyHvkDH60WTOwZiTpHzcIPATTBPIneROatMvrQjXEVGhkEYWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739540514; c=relaxed/relaxed;
	bh=YjsHEfo/qiRRRbNh0TXBs04HjQPppZ55+bcTb3JVFDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5+vzKhmzJ6tcaAT8K8u4mHhT4pYJW94ENxTJI3lJd7GSmFGRT+vgetMAtDiuXix0AuY7NPDQEu+Tw6Begj4WfEA55iKOiF09PT1gFdl6juVc7NXpFKtioU+uSt4K5owfDY7vtCGXvqO5G/a42bMXDEQ6sHK3FyKSR0h4cio2yFxMiZt3YY25F6F9mUdjiJf38rIdr8ahp8B3OL23+YxIpQjOznTRKnzOBfx5UqoiK4EWOT5czJNNLbrfy4/UdmPjsQVKjr5vc8pxSNALQoOVqH/ipDrGg01M59GwWys5ReTr6q2UqoqdqHerVsn/JnhbRAw4Vq9DMF5QiuOu9zXgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5y3pZT9x; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5y3pZT9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 1625 seconds by postgrey-1.37 at boromir; Sat, 15 Feb 2025 00:41:52 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvYB86t81z30XR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 00:41:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YjsHEfo/qiRRRbNh0TXBs04HjQPppZ55+bcTb3JVFDE=; b=5y3pZT9xEJp+yHFLR6BVPnkZkj
	5VG5PWgvE0P+qCuoCReQzsiWT7pBT/zLHKnlAczalSXPzOQ4Scj2EXB6SeuV9kMWwxw3J+/6b+E1L
	ssDIxqUIUdheODYcVVb+sHG3EdwwH41GWndexQ8JLLW3vegHhXgWW+UMsf0LbwDBdl5k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tivWX-00E4X7-T8; Fri, 14 Feb 2025 14:14:29 +0100
Date: Fri, 14 Feb 2025 14:14:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: xiaopeitux@foxmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] net: freescale: ucc_geth: make ugeth_mac_ops be static
Message-ID: <8b45aa58-3128-44b0-9408-3d7794436cd4@lunn.ch>
References: <tencent_832FF5138D392257AC081FEE322A03C84907@qq.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_832FF5138D392257AC081FEE322A03C84907@qq.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 02:11:07PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> sparse warning:
>     sparse: symbol 'ugeth_mac_ops' was not declared. Should it be
> static.
> 
> Add static to fix sparse warnings.

While you are touching it, can it also be made const?

struct phylink *phylink_create(struct phylink_config *,
			       const struct fwnode_handle *,
			       phy_interface_t,
			       const struct phylink_mac_ops *);

phylink_create() will accept a const struct *.

	Andrew

