Return-Path: <linuxppc-dev+bounces-15484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FED0D2C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:37:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9Tk6cq0z2yFw;
	Sat, 10 Jan 2026 18:37:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.74.82 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767943800;
	cv=pass; b=aNphnqnlYFkUVi77noHusCXKKG+vys3zqpNirUo5C044Gv9/RIyPlB36MKbZhupXLmOrf3mbnGIbAxmRNJ/OjRfiIuvFHcQSSCxpEsh9XN/HLnvAut7m263g3BjpXRpgggeE5U+5qBK0sWO1PzRk9VlKnk3qkh87xOqr9uyn99BWhwBzDZqR5FnTozTHBKfuWf3335amQRpF/SqUswn4+rBkQ3EqI7oAYAPFN3GA0PxwmwEV0SlFSB8a/a2TTVuAtJJsMLQoAsnVDlT+hZDivmXpVlMGAKv4CmuW/yrm1i4idFgK5q9bd/xFySExNFR1pLcDhT0O/a48xv+A0Dd3Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767943800; c=relaxed/relaxed;
	bh=veU9tN9zvF09zNzl0P1xcmIqmWhRyWZWlSWTCLXzXPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dfAhQIv7JKdSAqmL5Dl1K/WRj+vgnAOMrlfczRhSrwYgOIjR0e380ysO4hEehkn/vsKyzuCZbbiOym8neUBkoLVhtc4FAvKSi+orbi9WGfFB242uB2bHC35MMa0AQVXRR0YllusVgRZaWdkBecubhQKZAW7ifCC9xw4cEPc+VFxmXT1LdwwdVSBTJF6MA4ADSebIGoCznUc9XgmnJC4ASg39k8fihHgt2oit51B6ouRzMNiNYzGx16pignN/Qn+lZwDxmCb2b7bfrEbyTMTdFKNQr9INEJbpcOrn3Qmb2ZKA3nLemwWtpmlwNNxdNwNKpPHPNWakLx3majL2UFj/Tw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=MSpFLE8b; dkim-atps=neutral; spf=pass (client-ip=40.107.74.82; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=MSpFLE8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=40.107.74.82; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021082.outbound.protection.outlook.com [40.107.74.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnYMB4Crwz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 18:29:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJWu0JDFgtRwniLm0OmAkbS11y0d1pgxmEtSQ8yYPd+43J4OvNHIcRMjRdpZ1Q+i+6rounpZv0jZXBm672nO/0mtSktpA3W9dHP1/01OdgPdH+8dQtVQ+NodBZcaHgOdZki+rWrdK21EU0UAQyzdqRHjy8PJpRife6vHHE81kcAJ2mdOn+qLBfTpZC3zX2PM2aNPtsWxOJ6/+8zAo90QZDgQKbcPE8NMKk6zeGlKvwENeQNtOxO1zd4O7IWvtEABCGToMuZLPUbHi78OrMbS4NfQ95C4WFKJjY+RrEFbTUFpub2PikDWr7jITQCVWWttSw6Rjbe4ao6viqeI5l56Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veU9tN9zvF09zNzl0P1xcmIqmWhRyWZWlSWTCLXzXPA=;
 b=lJPmX4TkrjCC90eFD21f1ZysXf+giemNBXrfW4bvlO/b3N/loAoS/+e1BRTACNn8MFLwrs7iDXqy+q0c8N0XiePClymzhEBZMz78E0vIGqgoepZRVhbcHW+Ydc7c6gcw1rN3O8V//XmjJ1z5uO4Y04zwpfCyCu2hWq3/xEggwrFbnbn3l0PV1GpoEFOvH2YRxdfptlFr60TUCXIKis+9eCUorTxZRb0mjCbPqJxm8jMbpJpAMf7uE92QwMhpQ5S1KkTATuYHi5Mp1SMB6KhmRSD5oHMA1HC3AfTiaKKIdTRvVQxZj53dhXR16noyT3/D9+likWQoLwS/OTZOxpmKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veU9tN9zvF09zNzl0P1xcmIqmWhRyWZWlSWTCLXzXPA=;
 b=MSpFLE8b5Qm18oi1ZMW8MraSipXiejbbWXnPZFBQcIpzBTy1R9ZPS0qGSVvZFMbLJ0FZjoDVmoLKP4mWxusbssatzNtwBJ6dY0x8XmHH3hPOBQFTPwKS4odyYRy676cZgbAeK/Ba2VH3qGEwTlKnAubYmjXyRRqxALwMU7mFQUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6304.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 07:29:16 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 07:29:16 +0000
Date: Fri, 9 Jan 2026 16:29:14 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
 <aWAZv3ZwdUmo4_wc@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAZv3ZwdUmo4_wc@ryzen>
X-ClientProxiedBy: TY4PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:378::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf8b417-ad3d-4b48-75e3-08de4f50cb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7rrogRkJRKyKCKDVsYAQGGuLq8eFtMKxxc3/z/t4amg3fsWv9WOY1nJGVbUf?=
 =?us-ascii?Q?+GeVqoPGM5Vif/AbtG29642poQmyQznw3L9Ye02mcR1fiiG44pxQMyQ0ZPPh?=
 =?us-ascii?Q?XQNi37eJm+NTGi6CWAWwZ+pImES58iqT5wtZ0VGkljsr+zcHc+MkK0zFEsAI?=
 =?us-ascii?Q?QEIXteMgCcqYmuUGo6czo1nufCPq9axNx960tky822PeINDQFuqw3uM/mwlV?=
 =?us-ascii?Q?JKbMARbwdcB2nDskuXhWAkPHlxsYpJws2RY3roHOuH+2Zk7DSm2f3kofBbwn?=
 =?us-ascii?Q?dyMLx3hCi3KJUj44DuW40+6Y3PKBHzo0H8AWyiwcBq1RZfNtlB0EyNRPgmzM?=
 =?us-ascii?Q?8Hu5MY/FJZJi/trI6STZEkmqk008k7BkadaN3uKXw9pBb4hy6qbQS9cmiYd3?=
 =?us-ascii?Q?jt+yGSAqZyk2rKvgVH9SmpiloOn7yKMf++cI6KVGUademMSmkKnh5WzAo4yS?=
 =?us-ascii?Q?hYdI+zGS8UJTlA75fW29HbkAL5L8581uXRxqqRiQF9MqQUVD/CJrCtZ20OJA?=
 =?us-ascii?Q?t29HYokGAcJPvvzeSfkaulPyGgfEfxQxrwCs2mDGtR4CGzKNLbpdn2uNUYht?=
 =?us-ascii?Q?aSMlAvCE0IMEh2vaKJD5hGv+WCZ1d1TYVi2qWKEQ4EaFqAA2HuAMsn5LPk5K?=
 =?us-ascii?Q?XVieH3YvYyIsZF3LNQPleniMkOwWku1c2gGTPpePgIerOeEQtRLI5SLQ9Dmw?=
 =?us-ascii?Q?b3RhIrvOF9NJKPd0yzplEfL07Hrxjthe2SMDzZtMyDK5rtyj6p2lq38B1Est?=
 =?us-ascii?Q?5MhH3N5CytQm7Tlo0OMlj5MNSg1CeTtrH3ogpokEV3EPC3fhynfG/iGcnTa9?=
 =?us-ascii?Q?1+h+w+NE/BFADgmlwPKm+3GTVBCEz3m90wHV2YWpAymBTtjEBi1uXbtWNW9R?=
 =?us-ascii?Q?bs9f3PNNbN8+3XzEo3+JIzx0TdALA1xZa75yqMzhVxCTLunnOzskc3gmqZVv?=
 =?us-ascii?Q?rOZT5YYxg0fUai2fGcojRSe7St8OYkNyeglbOTw8/+67vWTJL5fBNxNlbb4a?=
 =?us-ascii?Q?3a4QXLf3cKa78E2xVyLliOtrVe1yYXZCB1QKx3Xo9HXbavwIor0vqd6nSsYd?=
 =?us-ascii?Q?pZ3iJYur6fWd7Q3WQu2scf1wVrQjxjsaI+sisnr8I9brJ0DypzMDuboxAN05?=
 =?us-ascii?Q?9/MCDaMgDJcyZJ7F4b6xKSSvUTrjuXjQZgQ2/u/PbXKGPqqe8tw/jedqfpB9?=
 =?us-ascii?Q?o5dPbek8SngthU8OzUU+BwUDpU+qnc1jD8cQc7SDG3ewFLzKXgcTYWX8+cdg?=
 =?us-ascii?Q?A7nCHU/jrJhg7OCg467IRa2/uN0VUKF2m93XE5vcVRfPElRLOQxAAmtHI0EL?=
 =?us-ascii?Q?huOkpJ6IMZqrHWHl6z4ZVF/rnBJSOshaoPwxqj2FXuYS5WP4IcWPHMQt/76b?=
 =?us-ascii?Q?ZXvKBNYWFAo4qUFTVooWBImXxJri/83hR2kIBZSVkiziG/4wFSkUXcETaAiz?=
 =?us-ascii?Q?3Jvn0KGuIIhSJONHevGIbn/cdl763n+q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GF21yx6dHxf6HHDBRIl6KA9e7SQ72oMXM7pf+yTY+hrC/cW36qcete2yZ9aE?=
 =?us-ascii?Q?eJoojKQ1mBpxKpPnAyjkqZNGLYSOqASCQ1ghIRbCpOQvRBveOifZrkWtq6Zg?=
 =?us-ascii?Q?b+jTm+fFvK1TDFqvyUSyEzzr6k54WWIKPRA9PbWdxnh8dOkWVvd54uhMzvaK?=
 =?us-ascii?Q?YOmqbnV+mQNAC7yHAevQ/sMtm5T9D08aUE3spWPx+L1NXZXWi/LNrni1QGNY?=
 =?us-ascii?Q?olUtAKvSc0dWEzBc8M8ZQDoglkcVi/Ilb7r03y2p3rNQXjFnxtoTFC/FYwYv?=
 =?us-ascii?Q?QZvzUIGo+jEMzyF4s5Bv6yJybVGiQFETwx1HocKjjayOvDveuSeFqoTSrwfq?=
 =?us-ascii?Q?qP38Kaacg3Q9rNkTmRogVWjFGMqnEboCbwb88gtp8/VW0f0yd3ePtSYbBDfV?=
 =?us-ascii?Q?/JMmJFgpC6iSxiz7+XtOxY8eTl6OGmTTx3ARG0cSKiN1bqlwgFCIBZMI/ItK?=
 =?us-ascii?Q?F5epYZKdgmBuUSaiXq7Yi98f7nS6sX5BiBQIE+VjRXkmh8pN5aDLCIsJHf87?=
 =?us-ascii?Q?XnCSsV4dRyiHYtXiNTGtukqRRPUaKwHBOWYaopVfFiQp50yFobrfYIclxaA0?=
 =?us-ascii?Q?w6/VUMZUkJU6Yxqw9e89Dyjvz/dMnpSrC1zLyHeQFbEq0faVeLNOY8emDiX9?=
 =?us-ascii?Q?5LCSnvJRKkE6ATd2e3dwl4aP2vlnWCW6xJz4eDNz64o4LEaFrUcufMj0x9v/?=
 =?us-ascii?Q?qPTifm+8H44vofdBSMBHmAkWirPAYxxhOrqn2zd97R/F0kj/qv2MeQUuryR6?=
 =?us-ascii?Q?vuFvT76mqk8O9K3Zh5cSBjNxtEV/w7J5Bw1Nrfd7SX2NOgaf6D2KS+7K7083?=
 =?us-ascii?Q?YPVBZJ0O3xSDYdVY7oHO7i5TeiE5RivKEdHnxanUsy/ET1GvjZ5ad8UwSjrs?=
 =?us-ascii?Q?4GLRCPP9+ftSmO+rauqYBy1MrQgRQH37czGnWApbGzRS/m0cZAVO9vs/mNsC?=
 =?us-ascii?Q?3RPF42DkQdZ5kQt+lAGGs3LUjbaE/AZCaimWWziG46VFc/ALVw4lMQfL6WUJ?=
 =?us-ascii?Q?qt1xKtM59/Eig5JfbpIWHZ6dIhIfcGFp6JowOOYmAZeHLMMlOsdfAKdMUUoT?=
 =?us-ascii?Q?7dKlQKEUKuIBXgkUUjQ/xn9oUtxc6F4lxEFCKL8XdBv/71suco/Our9JfwW3?=
 =?us-ascii?Q?NWoo8u3Xl3N4X7/qVMecq1Iox6HQpD4Uab2fgrYyAuGKt9Y++4mQDk93+Xh/?=
 =?us-ascii?Q?2ZRUTqiu2b/f1owS6D2DwZ0EWzUcba9olPJdJGnUW0LlS3x68ONp2K7bt7kd?=
 =?us-ascii?Q?9rbx/gecNMD9peZ4zzJshNxteL/qS+aKwtUrHrbNeHzwD+P+YBNQpiuM78t9?=
 =?us-ascii?Q?/41E+GlEKpcZXlGTwCmjrEoGMZc2ftGH4XSdTew82Zl+0vBxFFx8DC/fi2kL?=
 =?us-ascii?Q?HfAO21Wm7705a4Uz+f3/NTDp479p15kQ5yH97Y0J0ZyVc44jUcia+lZCRIY3?=
 =?us-ascii?Q?fjJYJYAnLXaCgPxCZ/mNxz4gpyKQuz8gwNs5v8Ej3L9fWQPUgcQDL4r72qd5?=
 =?us-ascii?Q?jgwLcdJLTdQqiPrfVbFGfzuwLILQNzHhup66hZg3Pj1TjxJnDlhrRrBAvvaG?=
 =?us-ascii?Q?NnUgPQ8/PtT7lMLWNv12YkNFUmc9LEXkXSd32Zf8Cnjr/KMki9q4gu5ff9g5?=
 =?us-ascii?Q?rTT0uXK7YBFFZV5oAR8PvoS+IvaWyLUqHHAi99X9emeiT5uZyinnm580DJiS?=
 =?us-ascii?Q?wIm5sIdFPc4xMCdbTtYSzucgAZb1/4VEg0rCT4OJEzB3LvGqnX9HGWsBmIfV?=
 =?us-ascii?Q?3yhyLLlvD8gPLYjPclQZYBOrFczQSsJzuc4qpmHq/fNC5k2diyhT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf8b417-ad3d-4b48-75e3-08de4f50cb6e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:29:16.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AYi5gJQMuOfXriMSAot87G4ZilBhrugThcH60/g3mTMW9DxFdYj5duN0m/03k7Qsqd39WFR/AlJ752KyPSs7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6304
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 09:55:27PM +0100, Niklas Cassel wrote:
> Hello Koichiro,
> 
> On Fri, Jan 09, 2026 at 02:24:03AM +0900, Koichiro Den wrote:
> 
> (snip)
> 
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
> 
> Sorry for giving additional review comments.

Thanks again for the detailed feedback.

> 
> But there is one thing that I might not be so obvious for someone just
> reading this source. How is this API supposed to be used in practice?
> 
> Most DWC-based controllers are not hotplug capable.
> 
> That means that we must boot the EP, create the EPF symlink in configfs,
> and start link training by writing to configfs, before starting the host.
> 
> dw_pcie_ep_ib_atu_addr() reads the PCI address that the host has assigned
> to the BAR, and returns an error if the host has not already assigned a
> PCI addres to the BAR.
> 
> Does that mean that the usage of this API will be something like:
> 
> 1) set_bar() ## using BAR match mode, since BAR match mode can write
>    the BAR mask to define a BAR size, so that the host can assign a
>    PCI address to the BAR.

BAR sizing is done by dw_pcie_ep_set_bar_{programmable,resizable}() before
iATU programming regardless of match mode. I keep BAR match mode here just
because Address match mode requires a valid base address. That's why I
added the `if (!base)` guard.

> 
> 2) start() ## start link
> 
> 3) link up
> 
> 4) wait for some special command, perhaps NTB_EPF_COMMAND
> CMD_CONFIGURE_DOORBELL or NTB_EPF_COMMAND CMD_CONFIGURE_MW
> 
> 5) set_bar() ## using Address match mode. Because address match mode
>    requires that the host has assigned a PCI address to the BAR, we
>    can only change the mapping for a BAR after the host has assigned
>    PCI addresses for all bars.
> 

The overall usage flow matches what I'm assuming.

> 
> 
> Perhaps you should add some text to:
> Documentation/PCI/endpoint/pci-endpoint.rst
> 
> Because right now the documentation for pci_epc_set_bar() says:
> 
>    The PCI endpoint function driver should use pci_epc_set_bar() to configure
>    the Base Address Register in order for the host to assign PCI addr space.
>    Register space of the function driver is usually configured
>    using this API.
> 
> So it is obviously meant to be called *before* the host assigns a PCI
> address for the BAR. Now with submap ranges, it appears that it has to
> be called *after* the host assigned a PCI address for the BAR.

I agree. As I understand it, the current text seems not to reflect mainline
since commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar()
update inbound map address"), but anyway I should add explicit
documentation for this subrange mapping use case.

> 
> So I can only assume that you will call set_bar() twice.
> Once with BAR match mode, and then a second time with address map mode.
> 
> It might be obvious to you, but I think it makes sense to also have some
> kind of documentation for this feature.

Ok, I'll update Documentation/PCI/endpoint/pci-endpoint.rst accordingly.

Kind regards,
Koichiro

> 
> 
> Kind regards,
> Niklas

