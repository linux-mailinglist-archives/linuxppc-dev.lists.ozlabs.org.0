Return-Path: <linuxppc-dev+bounces-17151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBZQIquqnmntWgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:54:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98673193C4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:54:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLRgW63xYz3dRj;
	Wed, 25 Feb 2026 18:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772006055;
	cv=pass; b=lQfG4PMV7Nv7V510EtCMDcOCqHuqBEQsZsy7s2PX4zFmDKOnC2GDIHbedRTjsXwSd1vKnGBkgYt/+Mu9JtAm+xpZFR7LdVwnEq55L7q1okRHESLqzzXb7twsUoQZ200Ev3/rFiOjk8iHl8yyAnxOTWnvaAiFGxNwvypTAyAX1aQeao87CIpzmQHLjz2J27ija1HN2UT3FaDo9hA7GWG94xMBA6aLF5X4HMbmSXz5NNKmzzixvaoMI8tB/JIU+cgACJjaN+I/T8N1C/JzE+cgdPif14r5LmEwIJpngTrxFO+MWqO0is5/6kn3RbmiLpaxNAfWET/gsZZoozdt9HscIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772006055; c=relaxed/relaxed;
	bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OZ9wbGZUQRNVFmcETOtHPL9YIHY/wn8SQ/v5Cyqyta6sAtklS65JaO4njdIYM2kutiJRAhwir+CTbFAk9MbwuEr3LhmZHo7eL8G9fr+MjafFaCmVo4iCm8joR+VGUi0SQd5R8L8tKIfeSXnJr4jDvSqu1omU+VqjJiHC7SgzAW1NUai0v0Jy65JXBJQIfTB3ArDUKhju9O+h1HP2Bq05NnokTSQUJ8WFzZrxZ3FDqFJBwm2qxf8ZyV0GBvFySXTFnXx7XLTPPO9gmZ1x+9qWHUqWoilPD6xfb75CVhrLbMhO82hfPPJ0XO+j7M69PwrufOWq59SEfsb3FEdF8v8Huw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com; dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kMJUDRi4; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=peng.fan@oss.nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kMJUDRi4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=oss.nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=peng.fan@oss.nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLRgV3rmFz3dRH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 18:54:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqe3/Jr/plmvQLdWXvwhPZYF4z86uY1buT+DvLVkEVhE2KSz1BEaG2k0KBdDbZbL/MdPNJM6pTvQjMPrCx9ERvRcCgXwydZiSAglLG+i7cdjBi94i3layXunoeetiY/FlUHzTzfxX4LJ5nOIRYQkyXeFVJHYrhZCySBcm1wN8QTuYu+oXHjhywPS7QrzlTzxD5v4nHEmdhU0zHredyvsJrcRZieDuFIrFtdqk1WO2Uaf1UKGtcBiwrnTfyBVbaMTFqUyGmribEkQX34UmsxiQJzpWujcXTPjELECyN7zapgjbVOdArwtia7D5UCzrBM3PoifwcT3mF+wI0YZwwhFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
 b=g+35mKSQEKmH0XQ3jsG8zYVlIJ6knihQI/Fl+b4vJXC0b9cD9MsHYOgOTgiMBl49ZmLAuVt18trTyID+L3jYEankzqdyTWxSdJ/mgy3ePlNY/cbv8Z+s9J6ffDguQV9JpoXrrgmZ5JeuuA4y2/7PwMeWF/qoMbiRI2daDLlLvIWhZxfB7XGfkN7LLV86B7T296igcGqznroqHnao3gYczOK2AjQKr6fZe5IDu6VhIJTCAU7QIfvD1YLHP0w6scYOSGSEyz2dHINj5B7QiJNw0VWU84PPEJ0AF6f26AoAJW5UbMsHrHZwHlzCzYQrYCp7bpx1ZetAFei6UcqLrw1b0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
 b=kMJUDRi4tM3Z9S+6W0cS+F/36qC4mt86nujH+SBYpzAWYRXaDYuOE6YDnQfp5KCUQPSLbZoxput7BjQ48xW8deEmnUK7hdt2lzmWpLE4qy8uaQMbIxT/kjmoYwFCzUtAZy2Wlk4SIEgOhIgXN0l4cuzz1orB5zUfQ/lW6zrAhFJuVHl2ABqGbcbndDIKwMvHcl8A903/rBB/e//vFAv/pwv95Ni5qB0hPNEu3e1lcAs1dJo2XOSfinbctIVK0xqtDJz5fwK3B9oAbOJRLnDE8EHfsO2dbGxIjYZhy/cvicSy3afMhi+F3R0ewqBzZjDWIObGggEo57ckQDF/pjfHtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 25 Feb
 2026 07:53:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:53:47 +0000
Date: Wed, 25 Feb 2026 15:55:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Message-ID: <aZ6q+tVoJFslHIcP@shlinux89>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
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
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649d7b0-9a1b-4fda-decc-08de744301a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?83Y14lvjQKUqWFyIUcPHqzNt4fcDk+6y6vq6WR0RwXxfvg/2EOlC0yJTtbV2?=
 =?us-ascii?Q?fWlpnC8dsLYUfj2Tc0/n5sgdmL6KwGGH8AM5VzqStpOS2ohOE0+8af9L3L5R?=
 =?us-ascii?Q?PnqBn1USKIhcM+tCmeR3+sOEtVphrajyfFNmnX32C0A14QtggsgEAp5ZGGmc?=
 =?us-ascii?Q?Y/sVtqXkX9xsbh5UvVnz8Ga+8fzC3gajnxiFdblCc3pUfmUEHkcgkldOUuw3?=
 =?us-ascii?Q?4fXwN21Drcu8NfLgDDtX8RmamlzMK88ORGR6z3BnYvo2o5fJvEAzxiqLkh9P?=
 =?us-ascii?Q?XPRX3HEcvcVV5r4dJ1VBdMaThfS2w/LnXGVyn5oOXJa1tKP2EZWvc7aG/bBY?=
 =?us-ascii?Q?FEvzijLXZEXuSfAXHjfaSX6pR+5s56spTg4KXmnXJRpBlmzy/5YCche7lkX9?=
 =?us-ascii?Q?hHqFv18KQ0JLKGe44+cOPAcR8QGzbLdbJgn7jVl9E5TWOvHh9DuMHlAP2/WZ?=
 =?us-ascii?Q?8M7BYlZTrcX8wPoqYo7oOtxUjp+OpTcALtMqibrqNpriSLkKK3PGDQz5UMFW?=
 =?us-ascii?Q?WBssa6Ad67KXNlfVsUpz8O+NhsZcx678/AlYQqPGU3nZOqFkWR9oNrPE/t/7?=
 =?us-ascii?Q?8ItvyLV1xmUGrCfNbZv5XWGx4khCI0cZM2KwBm7HtL3Jo2/ILTDcoWskoNLi?=
 =?us-ascii?Q?e/CYpN0TniZVe+ApCgvFUk7fVskrSOPLKuJumYqtgEKgoCR58E32bOCQsx0V?=
 =?us-ascii?Q?4KnoTIyJoVEsV345y/elzEIlmQtvHTkI+LDb7+pG4KU6KkrJ35iXoRY1qL3O?=
 =?us-ascii?Q?sSCod3CayzdFCw6F0fdpS/aMXHIDkBwesreRYaVCzdRztQ4ABWRtDsbrfjFA?=
 =?us-ascii?Q?pUpp5LVAAITGiLHr4HwbfGptIOdun2AyZOa8hlWjeSQoj7ij9QvMjZmHYaS9?=
 =?us-ascii?Q?yRm9tE5IWXiMptaQxXY/y7yJF5SCfZD8YWkLGuDrpTnwuHIM8KGJwfqvjRFj?=
 =?us-ascii?Q?Su5JteznoFga8d5Zd4ULGq2oDfS50tPTPkv9eLw5N+Fh50QRqzkDPVpt5Qy+?=
 =?us-ascii?Q?O81AnTFGkakFcb9yMbkblJIwIvOj7d5bDt+ueaYeDaAqmDg01BWavwDiqj7Y?=
 =?us-ascii?Q?fxnOSMWofwb5qnmY8CepcjFX/pEUbhM/qzf2Ce6AHbcwwBTXFYcNWQS6OLI8?=
 =?us-ascii?Q?SnxrwUZArXu0di8AHtPxVkQVQahDhQ7ZXfatt8teudwSv/PMDu+zZO4dVLG+?=
 =?us-ascii?Q?IwiAym1Hg9XOoEt6VjPyeaBeaR5dWpRSLzfLq5wBj3t2AgMr5WVJaJiwqcIM?=
 =?us-ascii?Q?Pu3Dz12gvboiAvhh0pTluWa0IohKStWEreJDhO6Aq3QggoN0hGIgK3LF5Idt?=
 =?us-ascii?Q?tCpw6x9dDwK/r9YKo0CKwOlRYW2P86ES1hLmCI7A29zmCd56gB7PsCOjGm20?=
 =?us-ascii?Q?aqvmuAB00SCpLXeapXHjfNpAprH+vTuxOTr9O/CunS/4jwiNjHzwp/i1Rny4?=
 =?us-ascii?Q?YnXcUna8ZrwpLOhP49nRbkvHkPqtatYA9cowyfF5mLaZZjGbiF00v3QVGZmI?=
 =?us-ascii?Q?LPhMkHdJMBGtL9tZuy8khFZPZ77da1nXamf9n70PBBb3jfHFOaIgrA9ac3KO?=
 =?us-ascii?Q?xb7OwoVMzjf/A7cK4U5WrQNnyB+GdIa55cVO/b1c3+R8aiiT89dnQsALukk/?=
 =?us-ascii?Q?MwYxJJAdU7gdfE8XIFIxxE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XQwZbRbLd5ZMfYbE8awsc1Ifk8jjoufYdkCnjHzolNMISXpq8hD3qPaL/wG0?=
 =?us-ascii?Q?rrukLGl3TbT5Lu1iSaMW1mhocicW3ktkVxM9VZ+inSvILv6G3u8mOhCOnfqg?=
 =?us-ascii?Q?ye8VrmA5zk8anuiYjTrrKHFZuZLIgLjG8JMhsFA0Tr3fzK9oKxBtDhWryffB?=
 =?us-ascii?Q?5pVF8F6CUtgyApSgXOgTb0PNQCX7CZ823wsERUhw1DLX1B9OfYg9tdfxXY5g?=
 =?us-ascii?Q?A6Qw/iXg7J57V7G72nu7yxjGlHQo5JZYnnRP7wGsHp61vGys6hByVKmsymX3?=
 =?us-ascii?Q?UX7lPgcy0FxEGbsTCn12SohTugTHbyMSbRzmipYC/oFWrRPmfATKuaZ9sM5d?=
 =?us-ascii?Q?raAhmBEw6mH0qy2U4eFeOluaAc3kkLvtHTYJXUBtgf9QDEEGHYLpVHzWCBIw?=
 =?us-ascii?Q?k4QuzrM5mv3dGDE7vFswN/rOE0ySU3iQEFyTrxM7eCWpl/HuXqP8q7gLcjeA?=
 =?us-ascii?Q?x/ZdPIMMojI0wZdFErfvrs125R0OpZfgkGTtHTe90FT07V0Ss27JJD19BeZt?=
 =?us-ascii?Q?uc0bUVQU4yYCAaNYgvz0vr2spfLdLRipcHgRbODtW/rdvMMtNH3Fq2NG6Lkf?=
 =?us-ascii?Q?Y8UcTaWbGDa16CgzO8cH6HcIHhcUAyRcfRdK0YtB/qlFgfE6mXDJVbGTiuFd?=
 =?us-ascii?Q?yCED/hhWXx8SoQPzPtDWy7grzkyBUtqu4VIQhrjgzOEDi+VGulManwPMU/YS?=
 =?us-ascii?Q?IVfiNqICV7kWHocH9aFpWPuglI32IIzzoSdxtDUULHK2i0FgUIWMcHsyPM9X?=
 =?us-ascii?Q?91tFLecCriNeb/DpChcxJetVz6Weyb4rf5sHtWpwcHqfCMMqUG3mO0xEMBhh?=
 =?us-ascii?Q?U3Pzsqto491G2H11zaug/MATGFCgn0zxQIdS4ORcWeCRO8wUpJH9rn4o/tWh?=
 =?us-ascii?Q?EQNn/XF4sWroRpodqZGXXyiGANxgq6N9gPiIYjn2ifbZChDyT7ZmlroxOTd4?=
 =?us-ascii?Q?Kez/AB3ZJEKRdoVVHXZdQxKFnplRsnFQnG1sv6SEAg8geLhKfDVEiFv5Hf++?=
 =?us-ascii?Q?dHxS0riR3hXJPDuNRZLmNYfAjVzpW/mwRUI9RJIPl+sHBmqv1fcLYi1eEdZ7?=
 =?us-ascii?Q?h16fEq8RWTwn9GKGRLLoy5DyFkrDnAEMR97wHwdz1FaoSHNVgQ2Veg6++dFy?=
 =?us-ascii?Q?bJqWjACbbt1+tpwgB/7eYntXlaS28GvVYtkNvNWYSY5JEvwcqy16OjLR+TMp?=
 =?us-ascii?Q?q6EbbUV65KX4sgDNJ3BHmlXXx+fP3WZkNtcDGTYeK3vGTCWE24o+br20KRCT?=
 =?us-ascii?Q?rBfE2PoQ0WFn6J3yRxVoQDcywllmOhfmffXLHZmWCBrAzply4wkOKyuZBmvJ?=
 =?us-ascii?Q?yNaVfj6sOCDeR1SDYIjK9GAau3CcDIhW2CIFcochRhENHb9mzbXlm8UrbYVV?=
 =?us-ascii?Q?BNf5VMvY0IOeOIMTUGiNimXeeBtj3VQ3nP5IH636hipU66/TKZX/b4MT1Ljj?=
 =?us-ascii?Q?Hf9jMn+KOFQbKI1X+10qG1gV82ECsNuyOfmRsIgteU2rZWa9MHfpyTnWoiNH?=
 =?us-ascii?Q?U1VpALc2WH/LcVsVhvdZ/t+vBY8HZz5FU+v1oYuplQQ585e7C8VYQ5A0V2L8?=
 =?us-ascii?Q?421kpOCm15IKrgikjjG8XY5AjT/3F6kORDrqSwH9MYOrQSQ9+jHDbxifypXS?=
 =?us-ascii?Q?THcFrCIyDWeV51lubdC8YSTj7rjJGY9Z5SSdpBfd9aoRiJDBoFfkhy7jp4h4?=
 =?us-ascii?Q?0F11MSYboLcpQfydZk63aF6u0csnZXZCOaYRgdLGtSwwVhLgxF63EbHiGjPR?=
 =?us-ascii?Q?AUekt2FD6Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649d7b0-9a1b-4fda-decc-08de744301a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:53:47.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 882pbkHIOZlFN04X6CRhM5HiQpa7m0OgTzKmulFmof3qVqVMwqIPl/i+BvPzoNk2LW6H9tH95kqP+068oUTx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spam-Status: No, score=1.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17151-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,qualcomm.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 98673193C4C
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:37:21PM +0100, Bartosz Golaszewski wrote:
>Don't access of_root directly as it reduces the build test coverage for
>this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
>to retrieve the relevant information.
>
>Suggested-by: Rob Herring <robh@kernel.org>
>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

