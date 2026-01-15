Return-Path: <linuxppc-dev+bounces-15772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C0D233FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGqc2dP4z309H;
	Thu, 15 Jan 2026 19:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768466940;
	cv=pass; b=Qywoj5X5/Cbiqv2nF80pyhri6wD5d7HJltMYe2Qmxyb6ZO+N3aV+fXtIU/9GdVA/x7FpPHDtgJNaDWh7396QELst+v8f5wH0r1V8M0fmjk3ZHOCUSRpSw8YwD4pZnYkN6qujQzzTExHR5R9CUOCiC0pPg3wjwxU3RoWveZSZlNCrCSmKXSSfj4xwexvJKd1oAqSZMlnpWuDsdv6x8T0GmBeM09NY3MQuqW/kBXyirSS1+hVHWJbbMWxehrv+6Sljt6+IcsYqiBBpFyBzwpQai5Mq/Kk9mwK7mSezM4dJOodyG3H5aR4NOc6RInkomtas/Ek97DafTqmuZiiowTwOyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768466940; c=relaxed/relaxed;
	bh=vj6HCua9VgNVLHRLuKsELNBlr1wn7+0YzCgIrfJMghI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e2YjNsJw8dCrT5rKJ8+W4BQQX44iOIdEDN2jss2+F3vy1LxMuaeRNuO+ShxWkJcNGKYqlO74BlF+/+8uAtZZsuk0vPrw9E1F9r76uW9vX9RO8IlKZwmMBrPS6c3bkSxOMYhI2hGF9sWEYn9pZy5nE/TOMTr6MeLBnm6N77avp0BJ/k4DrkhezwL2jFC8pL05lJxeADDrv5BXnNLay83LJVN2Ecosvpfk2LylO4L2DBhZ1fdp4vg3jrTo03xRMU0D56z2k/gQ86kmUpnLjzcZ+xwYu+kplolB1Ifb1mMMMf5r/xYZxkhERiZwdbuDJ4DB2N9RdTeGFVzM6zef1TLCuw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=nU3esTXL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=nU3esTXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGqY5NSPz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:48:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCZg6MS3FpjSL0FSPnxfWk4wl9hNClJiIkuFwV9hkpG40SAsHSarYohYf2QbaxvG4XL6nLYn9mwMIVIvovcGsjQKTCnYNw2xLVcS5ZjV+L0CPuDFoli9rF4RAwcDA+AUfAy3p38tOdZTlaux8Rpkl1ggzNmJR8WRvhgAYB/RBEsYVeG7vkjcJs6SQuk2y9rDsNjfM26qwXvd1pXg4BhBC8gKV0jIEJwZNnfpzpTojlyNOexOb5hAN5GBWm6UG/Nca6VLod9+Mpf/qP3PJjLhFPTdLE8lpcvnWF4H6pJH3JI3nUvRem+Sy2nldYd0hSRzQTxrZi65AjTq+7yEPdGu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj6HCua9VgNVLHRLuKsELNBlr1wn7+0YzCgIrfJMghI=;
 b=x/k7PbgYqUUz/kCOqDa8F4NzE0SsGV50rE+ri0zU8GnVpAz+yjDAbKIoXwmK/QHOBjX/Xlvb4DqWW3KUNWxGyQfw2O09PKJ+JJTWuvmAJnITMzFJ6CORnDrNhhk9xTeusAYN88mrXM48WWZ23Pa/gK2dIZpovqwLpNnk8MTwBfqrPh+IXXGdYcFnjxWQQFeqgqrzdm5/2f9saJr+rInqdJyoiI1U8Kp9YTV3I6HYWJvnLHSX3dZHVuM9azC0TGrHTICS52Ok9JW5jZ0O9I0KHRGb9r92DPadggd7brHkdNN8rFTgnJsDJnhmNl+o51YSvjky+TNzmY8Md8XRlvxiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj6HCua9VgNVLHRLuKsELNBlr1wn7+0YzCgIrfJMghI=;
 b=nU3esTXL3F6PXL0p7iFvGacMAbyb+XolAj1Bn4lFja4TsN+O0HSCEVsuPlL+h31DGhbUTzfeBx+Xt90efVQYKLouk0YdhOfDN9mC7cPxA+ozEj0h11B/FMG5R6aE7/O6fyimhlc/4yc3nlolEQt4lB0m3SpoR9A+v/fiXXbMzO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB2911.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:48:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:48:28 +0000
Date: Thu, 15 Jan 2026 17:48:27 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@nxp.com>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, cassel@kernel.org, 
	vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <g4txrmmww3werfhho6t625ciqknvyhvqhndceyf6z2pqiygnlr@2pktdkpwrcas>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
 <aWaw4M6FGYWPo1ME@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWaw4M6FGYWPo1ME@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB2911:EE_
X-MS-Office365-Filtering-Correlation-Id: caad76d8-208b-450c-bf3e-08de5412da6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3H7drZXyXtfDUzHWOyena2WzwVkKthZUg0H9/2TPqWhqqHr3f/c+O2a4IpOb?=
 =?us-ascii?Q?Bt57kgbRwFG27VYe1QAMOGbKcHv4/Jx9eiQFCwh8DGtjM+k8k08L4HrQLn59?=
 =?us-ascii?Q?Gf7aELhf7e1f4qF7XjaHyJBfdyzfuo/vb6eumqvmhQV1/c9KqDJ7y9CIrg+n?=
 =?us-ascii?Q?lqwPLwKiFfc4ZLr4P7Dbrg4JE4TPPaBJsBYrWsPNWw8vqfw+THCyyN1cMYs0?=
 =?us-ascii?Q?GaqVBVcUTOYnqA7OuPHBG5sE2Ks8arzQPDz957eynJXks4OIRcaplhhkW4Qd?=
 =?us-ascii?Q?lV2gLDmCHOJu+ocR0SiQtwXsG4932AMrBXEJsD7N5eCw304Fil3+RML0oBZt?=
 =?us-ascii?Q?cFYZJ+dOKM6ha7NdXq2rCVhmHI+z46zkBEwyuVyPfnCMB4ozHDVQpE/Uxr34?=
 =?us-ascii?Q?ioPaRaPQSpwSnI8wy0M+g97JVFy4SfjCGhxn9BlRvVju4sV4g3IqkO8hUhMM?=
 =?us-ascii?Q?sXVJfgf+PWOjq9MWHnzbihEGRZKOZ37JLYd1gc+SxmnysE1IF8Z0GlznDlbQ?=
 =?us-ascii?Q?tiocftZaRm1yzjnh4amlroo4PWdlkXv9Iw44be3j1YmOEChy6TE+va03M5e5?=
 =?us-ascii?Q?oHUDyYSRso1fIzPn6TR8WhcjdkaSA+EPnSV12Yd9FBwbLevz1LGQAs0204yu?=
 =?us-ascii?Q?OfB8W8Li40VDf6WijLErlLYgoI8p5B6KMgVQEm+nUvH4dVc7+KUyNFYxpj/a?=
 =?us-ascii?Q?qiL4OpCb3A1ejn009YUGPyzd/whiJpdwr+RTpnNMSWlp40ImOMKmSAerKdsf?=
 =?us-ascii?Q?jqPihf6hTTlvQRZKEMFf6+XBUXv4V8UxPaJ8od81do3yEd2QojdqMLCCbiRw?=
 =?us-ascii?Q?PseOEZnaPoIXpaD83WmlYRAyGM9hNPsoj8sHeKh0DU9Po3YvPhPNrxXLnNs2?=
 =?us-ascii?Q?oWtwHXS2gmbPSNdXcEmkOSa3Xy/o/sNPKlWsgpyZhCRvDswgruT759dXdiI9?=
 =?us-ascii?Q?3NcjYjL9rx+OZS0iXdEsVAsLlF56H/2KHxpuaf9pmnEGC2es9oFzWoD0Fqo8?=
 =?us-ascii?Q?D7iSk3XdOTVAD+T6iSh80Tl9FLowxJEXUldPDjHpBay+J0WgxMS9t6UklpT0?=
 =?us-ascii?Q?1Rp2qf4WNKIZajj4otpzgw4CWT44RLz/RTNZYFWlIIOIL8mOXr38y6cz6tDB?=
 =?us-ascii?Q?2SZ0vYRyFEcXTQy8riXqQs26WNfYVUf2LxfIMmFdg/x3xT8h+CgMNxkggvtA?=
 =?us-ascii?Q?v9wyZ9sssyrauIWbCWMLD3hZgAdJBiFjv6eaHXmE4t0SItfJDidOWtx09PJt?=
 =?us-ascii?Q?Jw4vQ4XNiUc/ioWbZL/mkGoc6VsVPbFUgJz0oqSQGzM8iu3KflgLgEuLMHZ8?=
 =?us-ascii?Q?vsSwlSOyLiMZmfs2u+Gx0NXQhnJpzxPzkJzpjubSRnqaHbiATQnGB4Lq4R3T?=
 =?us-ascii?Q?D9fQvZ3kup3Pb6KGtf++eUgIfjBjvGZGnDXhOMpxv+NBw32hCs7e06i4MFE8?=
 =?us-ascii?Q?aKSL+7+OsvUb/Z90A6OYua0SEI1qSGfhrl/+jYrV6CQfOKOubshbRw9fijTK?=
 =?us-ascii?Q?ObLDtEEXnFarNPs1xh7cb5ovCcr0aHiluq544WGvc7CDf57PJwDbL6l2FJtl?=
 =?us-ascii?Q?eDtyedf5fwXJc3etoJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sfHGT59pOT3JP3tOX1CeUJam/r5hncWu7YSjbZhI5wYXSOznu+nF8pUARj4b?=
 =?us-ascii?Q?tx5InepPJaV6wvYp3BLklD78Wxgk19XN9u2njsoUlip2zlosJWX2CN4zDxk/?=
 =?us-ascii?Q?ZSPTpNfNXKNplc2/tnjEsIDmxGkNRsNXEqTDmQDmoSkEZznU59vk8ojuvgYe?=
 =?us-ascii?Q?b57ybEpbO8e+Ci6nsmastLdRRoYUo8gnXoYSVigyX+rM7AzQKAOaREyB4AYy?=
 =?us-ascii?Q?rDp88FTsEE24M6OR0+DdF2BxXuryDQVgMdE/sSq4Cr9bCTPIesVFwduD9Mvl?=
 =?us-ascii?Q?2dpoUXidTsLWmxTGNZLERTZMVZ1qSOJR1W+EoaU0mvrPyMbzMf1lJJMJq7dA?=
 =?us-ascii?Q?00F2I7U3DrWnIkUW13NHe1q9qBJvyV7Myi0dgZ3JLT7iFSlVOANQrF+Dg6Za?=
 =?us-ascii?Q?Y7WjXzsDcyJJIUfqg/NcmrIDfdPiLamFZoUa1TuJGdtILjWBohP5M8JrbG5n?=
 =?us-ascii?Q?PbmoBsmvTUzmpbIgv9wIugmDhqpDdICAiWyuLkLJ9QQhHJdk4323plPoYDFg?=
 =?us-ascii?Q?mDqmQntjSWqBXIH/JXCEt0ij50en+cz6qPRrowkBRR5Rw/bK+hn2xh3oPZTk?=
 =?us-ascii?Q?RONuj/B+xN6tleG/APSIuj31U900Yu/suXOJkMmFCpVaJMuBhEgcFcxLMmYp?=
 =?us-ascii?Q?TynjLn+AJMxdu4qX6MmtloU1TzSLqpQ/O3RzQ5ja1WiWEfcQIJskd/Qe5K0q?=
 =?us-ascii?Q?OH0DuJ5bePyAL8KdYlFoAOd9rjZSp8CZ9TiPjCViiI7i8ltu+3fNP5KNgysP?=
 =?us-ascii?Q?9LnzdntjLKzZx+z/TZnoE3lB/0CKAkZUYrXICjk2rH1HE7dx7n74HKPS37Xj?=
 =?us-ascii?Q?rKx93gTXyFrkYRGA11kxzKESk7UKxdOhd7J/LcW86K7fvjcOgPkEjlDPR8oA?=
 =?us-ascii?Q?vrydgiyK41RGeAKPHMUGWDauGSsBE2A5j2T3d35qTkDkILnjVwSK6kvdDt/H?=
 =?us-ascii?Q?ddTdq3DSIqvDKKpm9zS+uBufRR13qAk2zu8wBh320MOy6gfwEPzssnZG9whY?=
 =?us-ascii?Q?d4ySU4pv1V3hKE+ju7LvUxp/O8hvvPQ6WZbxqjtVeCwoX1a7KsWonDaUPs6T?=
 =?us-ascii?Q?r0I2Vb0NPKXnRDRPb1BJjHWD6cKYIzkqeucxEjehfTwIIkhCQusMkZPAX0my?=
 =?us-ascii?Q?o+cE/aAc/r3ADWdeyaqT/6Y61TkGacwgPUdF/1r2k6GXB3IF8Vb1MkJmVm+e?=
 =?us-ascii?Q?8ZsrxpWRuitjd3fzYi+VULZ8tWiLfvJElHvPAcau6bb14Ak4dCaOTBhbZlfX?=
 =?us-ascii?Q?vQ0DsPw2g1q6fwxGHZSnwm5upkNGErUJsFgtYHXBs6iX0Yr515Tw6fNyiM0K?=
 =?us-ascii?Q?X3ZtWgqCrhr0v9b4bmd556cAz9fyDvqgRAmM3+pwsnBxUVPUYLyX+3FLwulm?=
 =?us-ascii?Q?pchpOYdgMCW76Chj4set+/DtVby7cMGYeZZtvIwnDOA1viEPb2xmTIA+0vU2?=
 =?us-ascii?Q?rs+soNOmVoVjU5IpUYb6Gm3T26aLrgT44eoTkShJ1s0srYEEg7U6s72D7w+u?=
 =?us-ascii?Q?LpnjpaakUEM9fI9LWcCFVosL1wITnV0imsZd9IWiq/POznAm/5c+cCgNh4Gg?=
 =?us-ascii?Q?LwfcFWlP0mcGcJDW/37jGFu1cZAjibqiOBgVkP8MCxCgpJsZIodml8zsMqeJ?=
 =?us-ascii?Q?H27jhsDn7RH1tDK0UgtjakSqFGAJJORX46aaU7YXgGUE7igiYEAeiib6paSs?=
 =?us-ascii?Q?1V9muAYENGIsQ1ShEz0fYvo81+igyEn7+dwX2ISk5BbcYdsGQHSirEUWsygJ?=
 =?us-ascii?Q?OKfX+qxloXV0izrn/yBsJgI4vDtV2wEEcJI+ZGOWt7muVJfzBxvd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: caad76d8-208b-450c-bf3e-08de5412da6d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:48:28.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gVCPRTkeOo4PAYudtqPyWFiD3ldm7YAWSQygbiwjZ1OD3znoExAGLxMrL/fGTmsLgUeIhMniy089/6Yx8cXrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2911
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 03:53:52PM -0500, Frank Li wrote:
> On Wed, Jan 14, 2026 at 01:27:18AM +0900, Koichiro Den wrote:
> > Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> > subranges using Address Match Mode IB iATU.
> >
> > Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> > introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> > use_submap is set, read the assigned BAR base address and program one
> > inbound iATU window per subrange. Validate the submap array before
> > programming:
> > - each subrange is aligned to pci->region_align
> > - subranges cover the whole BAR (no gaps and no overlaps)
> > - subranges are sorted in ascending order by offset
> >
> > Track Address Match Mode mappings and tear them down on clear_bar() and
> > on set_bar() error paths to avoid leaving half-programmed state or
> > untranslated BAR holes.
> >
> > Advertise this capability by setting subrange_mapping in the EPC
> > features returned from dw_pcie_ep_get_features().
> >
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  .../pci/controller/dwc/pcie-designware-ep.c   | 230 +++++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-designware.h  |   2 +
> >  2 files changed, 222 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 0e5a8d200b00..b2ea2c2c986f 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  	return 0;
> >  }
> >
> > -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> > -				  dma_addr_t parent_bus_addr, enum pci_barno bar,
> > -				  size_t size)
> > +/* BAR Match Mode inbound iATU mapping */
> > +static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> > +				 dma_addr_t parent_bus_addr, enum pci_barno bar,
> > +				 size_t size)
> >  {
> >  	int ret;
> >  	u32 free_win;
> > @@ -174,6 +175,208 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> >  	return 0;
> >  }
> >
> ...
> > +static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
> > +				      const struct pci_epf_bar_submap *submap,
> > +				      unsigned int num_submap, size_t bar_size)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > +	u32 align = pci->region_align;
> > +	size_t expected = 0;
> > +	size_t size, off;
> > +	unsigned int i;
> > +
> > +	if (!align || !IS_ALIGNED(bar_size, align))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The array is expected to be sorted by offset before calling this
> > +	 * helper. With sorted entries, we can enforce a strict, gapless
> > +	 * decomposition of the BAR:
> > +	 *  - each entry has a non-zero size
> > +	 *  - offset/size/phys_addr are aligned to pci->region_align
> > +	 *  - each entry lies within the BAR range
> > +	 *  - entries are contiguous (no overlaps, no holes)
> > +	 *  - the entries exactly cover the whole BAR
> > +	 *
> > +	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for
> > +	 * offset/phys_addr, but validating up-front avoids partially
> > +	 * programming iATU windows in vain.
> > +	 */
> > +	for (i = 0; i < num_submap; i++) {
> > +		off = submap[i].offset;
> > +		size = submap[i].size;
> > +
> > +		if (!size)
> > +			return -EINVAL;
> > +
> > +		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
> > +			return -EINVAL;
> > +
> > +		if (!IS_ALIGNED(submap[i].phys_addr, align))
> > +			return -EINVAL;
> > +
> > +		if (off > bar_size || size > bar_size - off)
> > +			return -EINVAL;
> > +
> > +		/* Enforce contiguity (no overlaps, no holes). */
> > +		if (off != expected)
> > +			return -EINVAL;
> 
> submap[i].offset is unnecessary, you can use expected += size as off.
> code logic will be simple.

Will fix this. as per my earlier response:
https://lore.kernel.org/all/ngvqrju3bi6sugynhksxsci6rmgqevzpoijjflp2373c6uxlum@vyepxqghbzvn/

> 
> Frank
> > +
> > +		expected += size;
> > +	}
> > +	if (expected != bar_size)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +/* Address Match Mode inbound iATU mapping */
> > +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> > +				  const struct pci_epf_bar *epf_bar)
> > +{
> > +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > +	enum pci_barno bar = epf_bar->barno;
> > +	struct device *dev = pci->dev;
> > +	u64 pci_addr, parent_bus_addr;
> > +	struct dw_pcie_ib_map *new;
> > +	u64 size, off, base;
> > +	unsigned long flags;
> > +	int free_win, ret;
> > +	unsigned int i;
> > +
> > +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> > +		return -EINVAL;
> > +
> > +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> > +					 epf_bar->size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> > +	if (!base) {
> > +		dev_err(dev,
> > +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> > +			bar);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Tear down any existing mappings before (re)programming. */
> > +	dw_pcie_ep_clear_ib_maps(ep, bar);
> > +
> > +	for (i = 0; i < epf_bar->num_submap; i++) {
> > +		off = submap[i].offset;
> > +		size = submap[i].size;
> > +		parent_bus_addr = submap[i].phys_addr;
> > +
> > +		if (off > (~0ULL) - base) {
> > +			ret = -EINVAL;
> > +			goto err;
> > +		}
> > +
> > +		pci_addr = base + off;
> > +
> > +		new = devm_kzalloc(dev, sizeof(*new), GFP_KERNEL);
> > +		if (!new) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> 
> Simple alloc an array struct dw_pcie_ib_map[num_submap] should be simpler
> than link list and alloc some small news.

I'll do so in v8. Thank you for the review!

Koichiro

> 
> Frank
> > +
> > +		spin_lock_irqsave(&ep->ib_map_lock, flags);
> > +
> > +		free_win = find_first_zero_bit(ep->ib_window_map,
> > +					       pci->num_ib_windows);
> > +		if (free_win >= pci->num_ib_windows) {
> > +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> > +			devm_kfree(dev, new);
> > +			ret = -ENOSPC;
> > +			goto err;
> > +		}
> > +		set_bit(free_win, ep->ib_window_map);
> > +
> > +		new->bar = bar;
> > +		new->index = free_win;
> > +		new->pci_addr = pci_addr;
> > +		new->parent_bus_addr = parent_bus_addr;
> > +		new->size = size;
> > +		list_add_tail(&new->list, &ep->ib_map_list);
> > +
> > +		spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> > +
> > +		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
> > +					       parent_bus_addr, pci_addr, size);
> > +		if (ret) {
> > +			spin_lock_irqsave(&ep->ib_map_lock, flags);
> > +			list_del(&new->list);
> > +			clear_bit(free_win, ep->ib_window_map);
> > +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> > +			devm_kfree(dev, new);
> > +			goto err;
> > +		}
> > +	}
> > +	return 0;
> > +err:
> > +	dw_pcie_ep_clear_ib_maps(ep, bar);
> > +	return ret;
> > +}
> > +
> >  static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
> >  				   struct dw_pcie_ob_atu_cfg *atu)
> >  {
> > @@ -204,17 +407,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> >  	enum pci_barno bar = epf_bar->barno;
> > -	u32 atu_index = ep->bar_to_atu[bar] - 1;
> >
> > -	if (!ep->bar_to_atu[bar])
> > +	if (!ep->epf_bar[bar])
> >  		return;
> >
> >  	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
> >
> > -	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> > -	clear_bit(atu_index, ep->ib_window_map);
> > +	dw_pcie_ep_clear_ib_maps(ep, bar);
> > +
> >  	ep->epf_bar[bar] = NULL;
> > -	ep->bar_to_atu[bar] = 0;
> >  }
> >
> >  static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
> > @@ -408,8 +609,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  	else
> >  		type = PCIE_ATU_TYPE_IO;
> >
> > -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> > -				     size);
> > +	if (epf_bar->use_submap)
> > +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> > +	else
> > +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> > +					    epf_bar->phys_addr, bar, size);
> > +
> >  	if (ret)
> >  		return ret;
> >
> > @@ -638,6 +843,9 @@ dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
> >  	/* All DWC-based glue drivers support dynamic inbound mapping */
> >  	features->dynamic_inbound_mapping = true;
> >
> > +	/* All DWC-based glue drivers support inbound subrange mapping */
> > +	features->subrange_mapping = true;
> > +
> >  	return features;
> >  }
> >
> > @@ -1128,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  	struct device *dev = pci->dev;
> >
> >  	INIT_LIST_HEAD(&ep->func_list);
> > +	INIT_LIST_HEAD(&ep->ib_map_list);
> > +	spin_lock_init(&ep->ib_map_lock);
> >  	ep->msi_iatu_mapped = false;
> >  	ep->msi_msg_addr = 0;
> >  	ep->msi_map_size = 0;
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 4dda9a38d46b..969b1f32dddf 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -479,6 +479,8 @@ struct dw_pcie_ep {
> >  	phys_addr_t		*outbound_addr;
> >  	unsigned long		*ib_window_map;
> >  	unsigned long		*ob_window_map;
> > +	struct list_head	ib_map_list;
> > +	spinlock_t		ib_map_lock;
> >  	void __iomem		*msi_mem;
> >  	phys_addr_t		msi_mem_phys;
> >  	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
> > --
> > 2.51.0
> >

