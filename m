Return-Path: <linuxppc-dev+bounces-16149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFsqGNY0cmmadwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 15:31:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616067F7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 15:31:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxk5t4j7Sz2ySb;
	Fri, 23 Jan 2026 01:31:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769092306;
	cv=pass; b=PGeYEvGI8gGrbdivMq+u9KsWLQvKrzJHV40enHO5SLjixj+P5q4JMMxL2vBiR7Kf6S/n+aqn9P9PGVK6i0fayiVHm5QFpmHX04rwLIgeo6DWaM+vquM9ToW1MVZowiDQC3PLVu/z2d/xPxkvCA9SvLQ+Qpub5L05LA/MAC98BDNhIbasIP1s2YNEun/SGaepn5qBz7IGXwevsuaHY38vul5AcaVYTGkNIR6FUZVD0V8EJWDfHkCBbdjemPkYH9qq0GcI6rSKErSsuiB+5nTwisDq2B8Du2KRqr8tNMqoWkCO4sGDZdQR4T1HE1fPKdIG4IpEs8rEhouAxL5q+OycxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769092306; c=relaxed/relaxed;
	bh=cqy3CBEdt4WLX4Y/E0rCWZrRKH4Q/lJ6YaQP0q+aDqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HYgnnjeHAP/Xlsg9GSadZ/UsjgegcfWMm1jISpfGVt5IVFegFwjCr7ocxuxnHDJWC5V3RBBC0uCs1nXp++DcJjgZyn+ILcHqunulEbiiRcUHBf1hzc0CI30ZTf2vtn1elv2koNaHEVoxOhhrW6J1+KIlABQWZoIfnfqGQObYOwz8YTD8x2j2Zu0YDQLdKbisvzzZBworz1zPM+QbBAcgorKZCz5Xdpa+Bg83n4/VqRgP0NUwNxzPmsrN7BJzKj4T7N5F9lh+gJYqwhTzfXPRdJ/Y2IuBLWzfLjPGayVhQ5z6aq2oH2XJit8n7+q4TbKvoFjQvzXt9iIg/qInmDjHkQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VwIANhrG; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VwIANhrG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxk5s1jqyz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 01:31:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNjOq6x1GOPfFVRcZ2WeoHAwS7WS5VbvopsBV36k8mBLz2/h/mftMFS2HNLu3PdMTKYTaGojBiyMSOBEu7/ztRw+rIr2UPNSYFWEB1HVezwO9zkNEarvOObTXgSScIJd/iWK5jaM37hr3JXPCDZjssSk4qTltoLgpQD8/eMQEjFUpcPaabX9Qscd2dMBQpHjGCnNl6naIjm3mH4PKxQeTUd8OpPC3nMwil53ehwgyIY1ZTbSoH4oYeSLqxvteXfP5vy6qkBDbqNGGS6AW4NAm4TX8g/mw/eYIMoY+Fq0Jr8sBWnVk1/3/cvSfafxOkWmcE9ZCS4RqCaY9AnaQK7LrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqy3CBEdt4WLX4Y/E0rCWZrRKH4Q/lJ6YaQP0q+aDqU=;
 b=WwRIa9GxjrVs1Kekv2340egv1+AT7vAXvXZPDFDCyieQEE8yVj/Eg/+uZzLO9Ki+B1utHct90Ui46CAaLbHyGTRZlvMk4EzK2Kk/931Vx+Y3V1vjO2iqkr6zBIXuE5G52FB2LZE3c1gpNpZahehHGz7PkZhpOLlL0loZ1FVJYlfgoZWhdNRrb32JxFrPkviYKMnhqf6K88ZL7W+ngfJ7MJtX9kF/Z69ce3XIaw/w9q+Og6E6IGrONek0vvvdpM9jVuh4HzJSK/Z77MsM+I3gU1qz005xvwENUFqiUc3A57tmHqlk45+poY0LzjZfJn2qgZ41LgGkLAhPYgJNDYVfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqy3CBEdt4WLX4Y/E0rCWZrRKH4Q/lJ6YaQP0q+aDqU=;
 b=VwIANhrGfYDzyHp7yRc4olT/Yly53/OgKgS1SG/HWp3ptCbh6TObRxP4N6hpOpXqC+hGmCcFIhlnWkwyETPsNCz5MXcyfyYogR2UvKycFDzZc6nTB68L1+go9oz9JW75DDgi16KGOLZ/5QYwVZj8GlXaflbrjOpj1QJpfE8KmqGVbEV+AWDlpxy1CrD0fJ1lCFOUpxRBxEqvBxblAec+pcnunQ7QRGIFC3BZuaXOzkVg5VJIQCg5o8XUYVDddWIR0FEnHBZgH8xUC45g4cU+TiMkcrZpgxLD4uSbw0uRFazjPvY55jmkRMpHSHzyZiHstq7B3cnUlGbB1IZYbyZzGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by DB9PR04MB8447.eurprd04.prod.outlook.com (2603:10a6:10:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 14:31:21 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 14:31:21 +0000
Date: Thu, 22 Jan 2026 16:31:17 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: declare fsl_mc_bus_dpdbg_type static
Message-ID: <35wqnfahblyadywortwsl2ul67p24ig6qwfrulgy7rnbznkbkp@5j46r4drpwng>
References: <628c49881b3a1df76cfd2f8fd2aad976692a465a.1768566053.git.chleroy@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628c49881b3a1df76cfd2f8fd2aad976692a465a.1768566053.git.chleroy@kernel.org>
X-ClientProxiedBy: AS4PR09CA0026.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::9) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|DB9PR04MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f32c21-6548-4c46-3a8f-08de59c2e979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8AKdKQifDcqYyGVZQlS7XgpXp1HP+zhThgvEVqAVUET0s3e7fKrSenOgHVk?=
 =?us-ascii?Q?uu+hWAfYfu9I3k/MsS99icUN7dtSpHnT/NmMNHFWu6dTZIOORCk1EF9wqLgS?=
 =?us-ascii?Q?G2fEq3SUe/F0wWVXtYdiH/UP/7xzfCL2BSlQ4PR9xEP6jwhdAs3DDrPPAIj9?=
 =?us-ascii?Q?mg+Auk3Aay6UPCeb6/ZZvmzrfpF7THuyUxS116Y9TVwtnll4Afo4D4+SOCpw?=
 =?us-ascii?Q?Blzea/1HalO3gau5HVbdXeqdcaIotihWjTkDcl+e5JlAvHXiHUKYcoNxRmni?=
 =?us-ascii?Q?UwjGJqaqDxs8JUymZNzTEbv2zRBR/YW1mm/AxPb0vpNm/qhxYrcPxvrGbsIE?=
 =?us-ascii?Q?jBUXDicpSg6hjRwufLRNMNuJHlE/uVpm29lUZDGoyJk4LlreP2pGusmkDFqR?=
 =?us-ascii?Q?VeNnTZwXdwxAVhMMCYOm4f5O3DoU3YxuLX+WVue+6dL4jrA5MIUP2yGpgK7P?=
 =?us-ascii?Q?jIesodDLrNrMr+lsWKejuVAOmGp9LXrpKA4Xsfe6IlUo+6rg07NDTCpQstkl?=
 =?us-ascii?Q?sd07a99m1lZjmjw9/HF8d9hKUP/ZLmlatJTk93iycZD6enUO9Gxu9ZEUDkBL?=
 =?us-ascii?Q?+/hmOTZTT3UDuSttyI8fuNYvqT9Qgv1CImdyabsakS2/MlbXUYZ+XAyLUtfJ?=
 =?us-ascii?Q?FlzNbGGAda2IWO9sbkGhn4B6yO2W20H/fPgBEyHZsrrBdynxZZF8BBG35voD?=
 =?us-ascii?Q?Li9/Q4keFYf/cJ8pW+cjyTciYfJNMQ+8v1fI37kCj/v0C0aT2pqiwHQJxEi2?=
 =?us-ascii?Q?bYl8TDUJQGZdI5lie1zhQKEQGnKmw8JabSYiIb8Vhx5BU3BlEThmykj5TJ2h?=
 =?us-ascii?Q?1lD9ohBTw2jg6tp1iEbJ0Y/Gg00yiEKIS//ZtTofG3b+bmqq5Yty8xqF78wh?=
 =?us-ascii?Q?TT1RTmTBrRwJ4xWYLIWJ2cqBlxp1i4wzhc5TDhEbgpL8jYDV9ccL0k8rrlTw?=
 =?us-ascii?Q?C6vdjfW6V33M+R3QbH0gYi1ixwqNcHaXF6Jsm4t0TqyW6tc9ZdHvGbH8dydy?=
 =?us-ascii?Q?K0kz2mX94nOr6hPvXZHIlEV0QzutT+93GdnGGWyPCED8z5BdUJO1DDwv3+a2?=
 =?us-ascii?Q?QYuCYvYSxSr6IhfJdV6jmLqg/1e3v8xhH96p+0EA/eRVExAKLeccxInupQex?=
 =?us-ascii?Q?zxOL+SVmYkIGBINzhRV8p2KOfigzdATQIUDENRvUF3vioU38jlloY8gjyK0G?=
 =?us-ascii?Q?Akm73yboBFj77LHCtwy4+wDO1LUsYCHBT2US2wtC3vPQkP0Mcu0TDXz/Ant9?=
 =?us-ascii?Q?2k1JufwuuBLYmvKoY6/4guGeToQwOURUh4WiWl97xSFtYrebghuPZM8pUn65?=
 =?us-ascii?Q?qSKUrQ4F8o4CIlX9TMUfa2W2qrohaptDFWm3IYJFUAMgAo+/9dPW/xOWrfgg?=
 =?us-ascii?Q?KnK8fmJh4Xbkj3r+5zD9aqytVDvLHyBsDPp8uN1eWsi4xtCJrvVVzCfTsbSh?=
 =?us-ascii?Q?3CfLoQ6GM88Pds5dJQmgaBHCj7nUspGn7y7TAi21U54yUamW5mGA190B73gb?=
 =?us-ascii?Q?Ig9CyIHLxKhCfF70oM8aAOAjkFcddAJ2Xk1Jp4ybHGyPIbNQec1MpNo9y/LZ?=
 =?us-ascii?Q?/HHy4kSVoBeO/ZlG1QA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ll4DsBZXL6S58q9IinKyLCAoRFcJpd9c4K7Q57nSGYWC5msz1M0/HGfYfrxh?=
 =?us-ascii?Q?IQ4doghI3EeGR12D6h6mD7uWY7dCD3nRZWJzEX7/xPDIq8onZayrPZgmyEzZ?=
 =?us-ascii?Q?9dDprIENLNOh8WS7WDbqi9vAtjx9YsEJYm4EtMUB6f2RmcvKFzXUIvOJtgi5?=
 =?us-ascii?Q?SODuNK4WFYZlB5HzzgudFt6vBh1zYqcF/GCRKaPfHKw9i4zshXwZ+b/aeZIY?=
 =?us-ascii?Q?UbiOJ8CxaUo2jORPHpDa2ygx5r/a9Wai+VWgLS9xbRt3z1Xz6d0uJVQXR9Tw?=
 =?us-ascii?Q?dVaVJDvxwjrT4K/l4qLs2y+V+Mq9gQTwTSnZSWzBk3IR0Q/R+pRq2khkkQMi?=
 =?us-ascii?Q?PtDDGF5fZgb0JbwSaRdQx5saL/X39vNI4gJBD0khTIMKAXfgJc7TM7Cy2Azy?=
 =?us-ascii?Q?SsHRM8vlZIxgkWm+ku8GG2VImMw/rAgv8bb0XHA5aT6oiltsImIR9WGGMb+A?=
 =?us-ascii?Q?WdKQrNGm1nrMBFUDx6DpKhnotJmJ8DQ5+zzN+pp7MOn0N+38EIG23qjzC1TX?=
 =?us-ascii?Q?14y6yKxPg8DK0dEKXhkrkDg6Y/4NaCr3RkxYZiqo2Hr2YX4FKxtTDCceazet?=
 =?us-ascii?Q?Ke3w5//a7lwmvMSCSsqFGoBTym0w+dZzrIbopE4JB/X9h9jJrEeqZQqVvx11?=
 =?us-ascii?Q?2HgXu4dZmDCxuGlr+bvsOTvmHGJGQOERYstSPi32keXLZPpOb2Sudrg/vbmv?=
 =?us-ascii?Q?MT4f4shrFSBsbI/H8bKAO+/wJC3Xnhwp8ZSX5mqW9hHwhrralnzJ9Dfvb7tt?=
 =?us-ascii?Q?c74Fgcm1YhvDJo6Tqo6t/rNGLCT6BUyTLAa4QG8umzGMAHRq5+MvFR1cCbnP?=
 =?us-ascii?Q?VAj/JJTv6N30VypaYQNFYikKiisVNNQsVMfdfUvqwiWg544BnF5huzTnUhiU?=
 =?us-ascii?Q?8xLW8hcy9+74AK6x99LVXM+dRI3C+hB2R/ci0xSZNd23Dw6b57Gn4Kg/ESwp?=
 =?us-ascii?Q?vZ9vfg8/79Ak5dGfJ62BxbLlZeR/uCPr2KCF7gri7O/4/NaHvbEZP9UPTa5c?=
 =?us-ascii?Q?WO7NUHfzISSM2K+EJseTK4+fbV7xpxWGKtY0E4mg17iWT7tE+ZluQkU9+Bgt?=
 =?us-ascii?Q?k2O9LcgtDNTGp3mGpPC5ucbBsBMVTWYUbbgVoBS3ffJv926BwQGUxzlRGeLB?=
 =?us-ascii?Q?2/n7RGIkHPYPriU6KzlFrdJOOauWp7evEU62RjnC5w06UauHV7WkpIyiq1G2?=
 =?us-ascii?Q?Nuiw0GfUu7zn6l9DvpfXiNNqACTLsWWjInnbzBSpXKRAGNFM5TWK0bVVPCjb?=
 =?us-ascii?Q?nbJDA9Z9tZvrinqUcWC4mRUrTWXmdMX4Pak41MKBRHxx7AmaKg11PqTjDuJL?=
 =?us-ascii?Q?CUW/ZpVr+ImkPKJ4QtxoJkBeBGUCOzuJs1lne0CMFqNTOTgfdoANNDIxaCmS?=
 =?us-ascii?Q?aFw3nqMC2Cxtmpi4enIqa8JMo5S4alZ8+Brll/b1/huRp3LBHbgf2ugLyN2p?=
 =?us-ascii?Q?pOzu+T9tI8UAKmd/Z4nn2l3f1HXB/BrrQoeFUlZt6S+Dm/7i1NiczrxqaLRY?=
 =?us-ascii?Q?wFeJbwRd9vsSfQsSPX+WiyG6aeBQlkZNdFU8LEoVeWJ+dtgtfIh9t6DwNZV3?=
 =?us-ascii?Q?s3ZBAPDiNLalmJ18orgJj7CozAVjtDbQ6U7eAn2DaQuMRsdNWEBJH8egKieD?=
 =?us-ascii?Q?S2GcujhpzmLOiN3sgr6UUwF9Osai5uiInp53oOxVSMrhWETeOHJaYa9TWIgx?=
 =?us-ascii?Q?RBstl6W2CtLrFBQuM4Te59AFVcvHvoylua/LPFC/xv2tz9ItedTGkTxhQtAc?=
 =?us-ascii?Q?H55U2d62GQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f32c21-6548-4c46-3a8f-08de59c2e979
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:31:21.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2mzZ9AIHp5pLntQe8wt2B39FKHHkDnHuJS6GpkeTkLRRVKYuOUB74bq7E7u7Qfg17PiPtTHjMhp4Sz6uyh0TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8447
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:gregkh@linuxfoundation.org,m:laurentiu.tudor@nxp.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16149-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 3616067F7C
X-Rspamd-Action: no action

On Fri, Jan 16, 2026 at 01:23:33PM +0100, Christophe Leroy (CS GROUP) wrote:
> Fix following sparse warning:
> 
>   CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
> drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
> 
> fsl_mc_bus_dpdbg_type is not used outside of fsl-mc-bus.c
> 
> Remove the EXPORT_SYMBOL and declare it static.
> 
> Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Thanks a lot for this patch. I'm sorry for the really late reply.

I did test this and I am ok with the approach but since it was already
applied, I'm not going to give a tag.

Ioana

