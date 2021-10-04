Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E9421A2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNbFB0D5Zz3fbQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:37:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gM59//Us;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=new3-smtp.messagingengine.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=idosch@idosch.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gM59//Us; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQZf6Vc3z3djM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:06:50 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DCB33580A24;
 Mon,  4 Oct 2021 12:06:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 04 Oct 2021 12:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=UUDC4YPuEtCCTitozLyUXSQK64PbAa0gIhVIGJmIS
 k8=; b=gM59//UsggGrtqThRY9sJqyp8D+9kxjC+UvC7jenhj+AROpr2V0dfX/fq
 h6ehvCOLyj1zbY13J0RFv4HpMy6SMAEX5K/uwt2bcfpRtPSpV3rFp+/j5p5rgavJ
 NUyyosal30d0QXln5Q8fjxIIkwHXSAzv8sdGRmRetfikyw/8NylOSLiIaeHcXLZs
 YnaQzu/hGWx1xjutunU4A8MqMaIbIvUXaFJWF+sjfSBezb9G0uo907QDhO7iF4aw
 7fC70puO9Bw3YWecSEMZGNFm8zpFdi6oYbLiFHdf0ITrk8yAsZ2S/bYEurSItMlo
 SOkfWQhrsVpq5DpSXCXcRtiveKNYA==
X-ME-Sender: <xms:kiZbYZK76wrajKm36pl4y5bzwireSQ2PWq2QzmRyqpJBHcInWhTmoQ>
 <xme:kiZbYVIlcj87gCVjNNPK5QPTqd8t1YcvnICIJfanlnR6x2MMVbKa5jV0o1rEMslHs
 2KNk7EnlWn1VY0>
X-ME-Received: <xmr:kiZbYRvoGQyS69DlOaXpRPdTlLNyTDyV8yIB-2TQIn8Qxic2MNEvxz1D6gmBj2QJR9O2mzQBZIJXGdgSNGBPLYHwahPH7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepkfguohcu
 ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
 htvghrnhepvdffveekfeeiieeuieetudefkeevkeeuhfeuieduudetkeegleefvdegheej
 hefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 guohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:kiZbYaaBVxWoLW4HGq7VH3nQiN1XEhlUkUC98apwzk7l6Fx4FErx0w>
 <xmx:kiZbYQYcCWruVgLFP-TF0YGUHpZOeSxmY5m5m6oa68X5U2Ddai6Mag>
 <xmx:kiZbYeDufN_iwdYLwtcWcpJme_iAsTm2JZudp2486KUXMZDUiY1Kzw>
 <xmx:lSZbYbv6xGNDhED2lZiFwGSYztonTM5evW1J9XCSbgxJbNzywj8tBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 12:06:41 -0400 (EDT)
Date: Mon, 4 Oct 2021 19:06:38 +0300
From: Ido Schimmel <idosch@idosch.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 07/11] PCI: Replace pci_dev::driver usage that gets
 the driver name
Message-ID: <YVsmjpUYk8P1X6Fr@shredder>
References: <20211004125935.2300113-1-u.kleine-koenig@pengutronix.de>
 <20211004125935.2300113-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004125935.2300113-8-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:25:25 +1100
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
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vadym Kochan <vkochan@marvell.com>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taras Chornyi <tchornyi@marvell.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Simon Horman <simon.horman@corigine.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 04, 2021 at 02:59:31PM +0200, Uwe Kleine-König wrote:
> struct pci_dev::driver holds (apart from a constant offset) the same
> data as struct pci_dev::dev->driver. With the goal to remove struct
> pci_dev::driver to get rid of data duplication replace getting the
> driver name by dev_driver_string() which implicitly makes use of struct
> pci_dev::dev->driver.
> 
> Acked-by: Simon Horman <simon.horman@corigine.com> (for NFP)
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For mlxsw:

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Tested-by: Ido Schimmel <idosch@nvidia.com>

Tested with the kexec flow that I mentioned last time. Works fine now.

Thanks
