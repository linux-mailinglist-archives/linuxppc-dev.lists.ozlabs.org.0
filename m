Return-Path: <linuxppc-dev+bounces-15742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9101D207E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 18:17:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drt8x5xj1z2xT6;
	Thu, 15 Jan 2026 04:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768411057;
	cv=pass; b=egRMClb6iUHrqXNnKC3GFelvEyTOdO13HMjXoD+BDR0SRG+jzMb8OhP917DdlsascM7iw+QoZQd960bf5bSFuaVAUmtWVTE1tA8Gr1V0l4lF2jGwzWCb4VwcwnY2tJOWx2eQAq2EVNe3v+MMwBibVkx8YwtZivIaLCt3Ne8gUqh41Z72mQtjD9qE7jea3KV3UJngODorYtgPa1MO+u6KSDfkhQe0fNgELE37dZuhmyktxXjNG/jY/ItZre8YH0m/pvS/6MImERbFSx6zswPtFyidFywoO5cVopHfaI0hksKqJBKJ3ykQNqJ84yUO/o7P+/irdrXMHO83Hrpo7yW/Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768411057; c=relaxed/relaxed;
	bh=OrV8jfbCjXAYih4AYA/C+5qm3A6i2kKxqZkwPT1aVfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lt7+DNQ0VqNLfpa3Za4OGmC/vJQQLMOFQrq3KjVsTxb0C/2siW+dElGGJ2vaHDNy+iE5BrBZEIgk2e+P8ZW5qC8LPeEnw+UggW8w1EL8TeIG24DcXWr3ZFkXaG30ahWBdF4i4rAEAnej48Y8Zac9ei5WtllDnhELevdUK8O2O/AuF2G47XbKEECRyX04W126xxfS0h9JJ6P6ilTew7qEnzhWYz6Xo9W2TgLeFh1Oe8xI/36nNgwZ3fQRtNituJDtnTRhTEf81LDP0lyqnDx2VOcO6h8l5ArACvKdpsyR6cwN6C17u5X26xOTsFm9c0Ev1NFrqS1EtYzQvmJlrxNs5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=cXCDlXUh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::2; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=cXCDlXUh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::2; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drt8t70LZz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:17:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElL820Urr035ZMeB87T+8gD+QOy2/NBzwutIM+3itzy5N7RjMTf+Y2iyVzQcLJhxdbOtDZ0ZB/ujDYgRwY7VRcYMJhUSZbX/IuPlp4khAvOzUD6OutXPd0PXaFqtqECOeSjYNUx+pLuiLehS+gzShhEH0Uu3wKPInaVijvV1XJTBc+RcONaF0GS09eJOIcVr4m7xmUDZLSCVcRGnH1DUVFu+HGJN6K2Iho0c/5X5aAHObeom8aRO1Z8F+NDeTsnXAThdclSyrUaRVPq5dvUI88FlGFrD1cfXQjiRzEo/Pw8e+9Cgy6I+tpxbzktk5HnMEMeql3aTs7vJ7Zg5fA7i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrV8jfbCjXAYih4AYA/C+5qm3A6i2kKxqZkwPT1aVfA=;
 b=dqmOxtVLWUkYmduu21/nPvL9m/9cQYSW6aG0/OOBdyzXd94XOtWipP/45xH+6g4W1yF4dDRC9AHRDgoWxkdGPQvBnH9gNb6uzozu7kyPk7mnd6OcKq2/laC/6w+6HfANH+TLiPATy78lgVOLXrOR8v3MFRwl4z7vLV8bl5PKc9xGpkUsi/5rPGvpURV709WQqa6yntwCbFUxVGmGt5XSiqacBdDbyIuc+v7X3pWW6u3+I/HMGboXfDjnnVaVUj+nHG7Bjz2XcdY9R86aGhJSBJQaPHj+Jrzv9GeT6A22T4tMJZWpXwLT5qfXGyahqnKLGpSvVSyVb1f7WWrDDau8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrV8jfbCjXAYih4AYA/C+5qm3A6i2kKxqZkwPT1aVfA=;
 b=cXCDlXUh9fO9vrbyfYFeYosvlnN1Ux3HdEtcO+wuYtLyrS/pgH3+S/SwYEf+xxgPM6PFPWSTIOMC9o1ZP3J9umzflcrY6s6xLADWiRCqkylyp+OFy0PB54nJmKEB6Pu2aUhTH99KRvsmv2mOAM9rOdcmbAj/BFWpRujPr6018yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5795.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 17:17:08 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 17:17:08 +0000
Date: Thu, 15 Jan 2026 02:17:07 +0900
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
Subject: Re: [PATCH v7 3/6] PCI: dwc: Allow glue drivers to return mutable
 EPC features
Message-ID: <m47oybaq4u2noqqd77czzgwwnmmquhvarjnxgijlhb5neulznt@dts3icronu6u>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
 <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
 <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY1PR01CA0203.jpnprd01.prod.outlook.com (2603:1096:403::33)
 To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e7e3ee-d389-466d-b0cc-08de5390bf35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Z98zphb8n7gN6B+ey08xghYBSl+LdXwISIhRlTLKyhwlv34XGaW3fRd8JGi?=
 =?us-ascii?Q?+LWm01k7fV3YBAEp/rdGTxZRpsW+njYdSZ0p+GAO+hkoBMkEhbO+FrXYVDfF?=
 =?us-ascii?Q?48W4RVApyTXu13i7JoCfjm+OhMO1FFolehi7ddJq0AhiS49U5gT+XIlvzcK6?=
 =?us-ascii?Q?xCHgpLebDGVcLdrAkSpmMIBky9x3dt3ZzdnEI2wbLZd09H56nDB8NyokIwaj?=
 =?us-ascii?Q?/4/cS60b8PBz/UNyEJb1ds6tti99E6m8gRgC1tO0UPl2AKx1qS5sPw9YZ6XE?=
 =?us-ascii?Q?F2J2c3XaFSN1JKmih5SE1WzUbq2iaq48EKbt4vgpaf05bFsHUVXIGuV2I5Sm?=
 =?us-ascii?Q?C61KjcV5h/a2LQ1FYwIF9PZnsmo6PFVmL2YM4RFgLVZ4UJd9TxhvAyu4gO41?=
 =?us-ascii?Q?n4xX6a+ifIsxeYEdE97wM4egKRj76thc7us+LjDn0SC6OHaHqSW1FlCiQkbC?=
 =?us-ascii?Q?H5gxVUx9y+r0LrPfrefKQ98o8uXGw5whj5cqnb0Gy23fdWguwm8i5HmQEIlk?=
 =?us-ascii?Q?9hbc17UEc8ih1gyuyMlPJf8o4fLi1fGUednuoPwq4yBe4COjwtJK1XG6Vfks?=
 =?us-ascii?Q?u190+MSMT35UIcVqpFaPJP+/tbuM7xDzGSaxInp3jmY0NGlHJmavK11hwTDr?=
 =?us-ascii?Q?koGCWqxa2rtHU51FBaMUW9D9S9REEwTDlXhRCT0GUfIoX4eVGe73wGSp4ZYh?=
 =?us-ascii?Q?reteEDAkIQoovo7042VPz+dErgBzONCiCsYLM85jJ9gFSBcEAUd5L991bOUh?=
 =?us-ascii?Q?9eMZsexaWzWRYQ93/+V8dEyAOqlrzAsg8t7TZDXiFp3nMrdGdSzdmTj/qVAz?=
 =?us-ascii?Q?M9+bb9lTRZw5TkbZK4s/5V2fY8zKUPXSe/XFsGp5ZxReNXr0BUevEcKk72TV?=
 =?us-ascii?Q?qhP7wU3WgFkGkx7RuafQ0r/AiJIOF9q3qk4YfGYdIS8MJVRIMrOdDjYuUR/e?=
 =?us-ascii?Q?mpPE1QEGuV+qECZYPLECzm/TuO57jedhO7XMXr8Ykh8z87SHwZrCD2KIZPIN?=
 =?us-ascii?Q?FTUzvxiLv3NlJiTNqr+J/AeRow7KmXONKCTRokyUFThvVz+n3DisWxH1XoIe?=
 =?us-ascii?Q?WiO6vdhDMLhnb/xl+saAmjYCfrFI+3EwaCeiECDyzLml1ocrLLVuyoSAOLuT?=
 =?us-ascii?Q?DKjhWeyPRQ7XqKyAasT8VvqaE8Wif5/1hwpWQDj1sojY4KlcZRO5ix0mXgyU?=
 =?us-ascii?Q?p8n6L6ZunqjpusQQY9UtmcaLG/eU44UyTQTKCHIkrHicgvlWPLmpTqj4wd8A?=
 =?us-ascii?Q?1fDhjYbaeeNv203W/LJ01KPQU4I0DdXw13tepWbZephan8itWKshg2TLqfSD?=
 =?us-ascii?Q?KnrRMvO+60TlvzAgwdhVVWo2EZd+1i37Xa7kbiyF+L3RIMW+X4y45wInKiTS?=
 =?us-ascii?Q?GQWsYZI/GYEVJj/miWenrR0bHtFcZzS9iIdsbe+im1RKkMfNWuKXy2I8J5SN?=
 =?us-ascii?Q?zC0RTzd8MCRfp+IvhN3w/1yvXks9u0Kq1AO16wJhx11xc+o1XTbYq34xkFXx?=
 =?us-ascii?Q?5z4ULy8Lyyu4FuKWp+nYLU3F8tdjraTW2zfuNMqcqSJQ7kgAwLG/ip3N10Q3?=
 =?us-ascii?Q?kljzMA/dQ/DuFMfPsR0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FpnCyh5OnKmLcKe5rxsFCKIAEk8Hmc45iBOR68V8fiz3/FEP1irqwu/dqVRc?=
 =?us-ascii?Q?c1KJ9dGHHAJZEz0tbiT3RDivOQpfI1CpF8Me3sC4pmY/eXvErXDWsMmRWJ/b?=
 =?us-ascii?Q?VIw7owPttM/nmMB4Jz3XiijikJ0g87wkwqdVfPW7kcAYOIq0f8NJvMOTQ6y0?=
 =?us-ascii?Q?iBvu8V1XedeDte6lgBcDCtjfBhPZraNSFlLzPwHKc5TS1jLUWfDEOQrRlgEv?=
 =?us-ascii?Q?59NF+OGvM4N7cZARGgHSjOhUzkTFRGoKC0AoTUB7BtP+69WRQ5WsGakSDPvy?=
 =?us-ascii?Q?Neh9vCFnLfThu3oHk1eEXUT9Jtl3UIWY++kTGlRoDEUfTjE+z+Zbs8dGieIN?=
 =?us-ascii?Q?zZDXI6YYmwLcB9lsxsZX4DZ51ShJ4wOAC8yTgY1928VaShXVR6GFd6qGE3D3?=
 =?us-ascii?Q?QLHV7FpSJXTTB/Krpd2DXQo+gqoke5U3sx7TfXN1AvycnJlSPXvENIxNitu/?=
 =?us-ascii?Q?DJ7dX/BOQ3ElI9FBWb3GURkaaDOAAAwJLMt4Y0F5VcyXQTQZC/eaxvrQo7tN?=
 =?us-ascii?Q?nk9yUsINZi/8Ah9/ZDyUx4dUzZJ6LQmb3Cf+f3aqiu4sr2FgC7kiI0G+gjR+?=
 =?us-ascii?Q?ZeCOkHfTInyCVCaXtEqhooA8ruqpr0DGdctZMjnu+k//up0y++WgB13rXGWF?=
 =?us-ascii?Q?6TcZATAUBW7hYtGaUaS7VcSIFzIYji9BMQeFYFWgpdXFCsZAUThlC8Xq15Pt?=
 =?us-ascii?Q?fjxpiWn4E4Vna8i2rso+MOb+cbkoZOSqE1NGXe1UP2NYNdNJthv5hxUqnPEd?=
 =?us-ascii?Q?9xfrC91SbxJP+ZSte3FrQC++vqY2gG2fyF7cMSQxrsNGbb1ZVIy95uZ5Sco9?=
 =?us-ascii?Q?lo5sHCUqJQ9t7M+cZuk1xI23VXadWWQpsBEGOTm8iMZVRzttuWKgfABVWTXo?=
 =?us-ascii?Q?EZGXMhwgkPRSs1t1XfOcM9kWoqWhvNJz8QfZiXrYXlZrrfPmJeVwlEMtSoZD?=
 =?us-ascii?Q?dqzYiX4qcMBVckjGTlpyNcm3YyIkxuzoKuS3wYweBP4wz/aWI5gOb8CelMcz?=
 =?us-ascii?Q?VSoMcIM668XbE+FsYLa49IcScBJS9Rs7w95NkgDgZi6m6z/oo2mRWlKFtuj8?=
 =?us-ascii?Q?cmndyjZ4AOACtxzT3HB6Oiypfpyl0pv+XCMnxodwBeQshg4Numxdaumtd0Se?=
 =?us-ascii?Q?6svOQIp1m/7eRqChYySze++SHayBa+sKsYisNhABRCDvZJbymemfN48aK3d/?=
 =?us-ascii?Q?fpzyT7pNLOd/64D/GOteLylzAtiLtQIl8QxCEXu+HY3I7OiREuvm1eHF3r52?=
 =?us-ascii?Q?AY/1JinqIzjivoAA9uizauPovrT8bxFXpazrMW83Sl968dvGXAevW0mJPdSV?=
 =?us-ascii?Q?K5eOayuJPWYGoT5gYaV0Q+dEyLhnbbKfHBz0RDaG2OclB+8QMiEGVcSEvyjo?=
 =?us-ascii?Q?mKXEuK7ayG8tfuLXUJAT4e1jK0tEo0VJ0cHU8fxMNb3Gx46D/kzrVfF0hZJC?=
 =?us-ascii?Q?WWTlsYbBfw6Gw5HRM47p5UpbuCCafekUbKn//DqEVDTaB5cbqhsS0KZVQN+t?=
 =?us-ascii?Q?Tv7omqI0Bouj/z5aYe/Q6g8J+i7LqkrkCA0triFx0KHQxmOU53AKWVObEQpd?=
 =?us-ascii?Q?gbwK7O90Yfic+HcjAffdB7AqawGPbpURCfTrNt1QAtlEdxRX5/OctgP0nmVi?=
 =?us-ascii?Q?oBp6z0jwG0DJEcjTJQHuLQktUBaT1s+MtQVYSiaqmkiehQ02y1HWUD5Bmygy?=
 =?us-ascii?Q?nqXMXvF02GO4pGSR6ZbUqhtU31Bu2vXpXqTo9VtzfoffV0BZGD9IOPSnE0+1?=
 =?us-ascii?Q?qDFt13DSI+D4eaVTwQ5wVZdetNrv2rBh4y0Utz+3ITffpkJ7PQOi?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e7e3ee-d389-466d-b0cc-08de5390bf35
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:17:08.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfOrW/TIscwuuZ8rbdv74JkLE3tFeOmSuQ9lmONdk0JszGW+iuGVYRyH8f23KzkTiFF7oATKFm/R5RLGgAIhsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5795
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 10:20:08AM -0500, Frank Li wrote:
> On Wed, Jan 14, 2026 at 12:29:00PM +0900, Koichiro Den wrote:
> > On Tue, Jan 13, 2026 at 03:38:45PM -0500, Frank Li wrote:
> > > On Wed, Jan 14, 2026 at 01:27:16AM +0900, Koichiro Den wrote:
> > > > The DesignWare EP midlayer needs to advertise additional capabilities at
> > > > the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> > > > in every DWC-based glue driver and without copying feature structures.
> > > >
> > > > Change dw_pcie_ep_ops.get_features() to return a mutable
> > > > struct pci_epc_features * and update all DWC-based glue drivers
> > > > accordingly. The DWC midlayer can then adjust/augment the returned
> > > > features while still exposing a const struct pci_epc_features * to the
> > > > PCI EPC core.
> > > >
> > > > No functional change on its own.
> > > >
> > > > Suggested-by: Niklas Cassel <cassel@kernel.org>
> > > > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
> > > >  drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
> > > >  drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
> > > >  .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
> > > >  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
> > > >  .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
> > > >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
> > > >  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
> > > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
> > > >  14 files changed, 60 insertions(+), 56 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > index 01cfd9aeb0b8..e67f8b7b56cb 100644
> > > > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > @@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features dra7xx_pcie_epc_features = {
> > > > +static struct pci_epc_features dra7xx_pcie_epc_features = {
> > > >  	.linkup_notifier = true,
> > > >  	.msi_capable = true,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &dra7xx_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > > > index 4668fc9648bf..fe1de30b3df6 100644
> > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > @@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
> > > >  	const u32 ltssm_mask;
> > > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> > > >  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
> > > > -	const struct pci_epc_features *epc_features;
> > > > +	struct pci_epc_features *epc_features;
> > > >  	int (*init_phy)(struct imx_pcie *pcie);
> > > >  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
> > > >  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> > > > @@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features imx8m_pcie_epc_features = {
> > > > +static struct pci_epc_features imx8m_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > @@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
> > > >  	.align = SZ_64K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features imx8q_pcie_epc_features = {
> > > > +static struct pci_epc_features imx8q_pcie_epc_features = {
> > >
> > > Is it more simple if
> > > #define DWC_EPC_DEFAULT	.dynamtic_map = true
> > >
> > > Add
> > > 	DWC_EPC_DEFAULT, into every epc_features.
> >
> > One corner case is that pci-layerscape-ep.c builds the pci_epc_features
> 
> It is our old platform. I checked code, it should be wrong. features should
> report EPC hardware capibility.

I'm not really sure whether commit cc255eb0bfbe ("PCI: layerscape: Modify
the way of getting capability with different PEX") was wrong.
Do you have a patch in mind?

> 
> > dynamically in ls_pcie_ep_init(), rather than providing a static definition
> > with an initializer. I think setting (ie. overriding) the bit centrally in
> > dw_pcie_ep_get_features() keeps things simpler.
> 
> In case one of chip have bugs, which need remove .dynamtic_map.

This is a good point.

Thanks,
Koichiro

> DWC_EPC_DEFAULT will be simple.
> 
> Frank
> >
> > Thanks,
> > Koichiro
> >
> > >
> > >
> > > Frank
> > >
> > > >  	.msi_capable = true,
> > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > @@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
> > > >   * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
> > > >   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
> > > >   */
> > > > -static const struct pci_epc_features imx95_pcie_epc_features = {
> > > > +static struct pci_epc_features imx95_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> > > >  	.align = SZ_4K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > > > index f86d9111f863..4292007a9b3a 100644
> > > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > > @@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > > > +static struct pci_epc_features ks_pcie_am654_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.msix_capable = true,
> > > >  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> > > > @@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > > >  	.align = SZ_64K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &ks_pcie_am654_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > index a4a800699f89..8d48413050ef 100644
> > > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > @@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > index f4a136ee2daf..84111d8257f2 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > @@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features artpec6_pcie_epc_features = {
> > > > +static struct pci_epc_features artpec6_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features *
> > > > +static struct pci_epc_features *
> > > >  artpec6_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &artpec6_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > index 12f41886c65d..60ada0eb838e 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > @@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features dw_plat_pcie_epc_features = {
> > > > +static struct pci_epc_features dw_plat_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.msix_capable = true,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &dw_plat_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > > index f87c67a7a482..4dda9a38d46b 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > > @@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
> > > >  	void	(*init)(struct dw_pcie_ep *ep);
> > > >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> > > >  			     unsigned int type, u16 interrupt_num);
> > > > -	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > > > +	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > > >  	/*
> > > >  	 * Provide a method to implement the different func config space
> > > >  	 * access for different platform, if different func have different
> > > > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > index 352f513ebf03..1f3c91368dc3 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > @@ -100,7 +100,7 @@ struct rockchip_pcie {
> > > >
> > > >  struct rockchip_pcie_of_data {
> > > >  	enum dw_pcie_device_mode mode;
> > > > -	const struct pci_epc_features *epc_features;
> > > > +	struct pci_epc_features *epc_features;
> > > >  };
> > > >
> > > >  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> > > > @@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > >  	.linkup_notifier = true,
> > > >  	.msi_capable = true,
> > > >  	.msix_capable = true,
> > > > @@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > >   * default.) If the host could write to BAR4, the iATU settings (for all other
> > > >   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
> > > >   */
> > > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > >  	.linkup_notifier = true,
> > > >  	.msi_capable = true,
> > > >  	.msix_capable = true,
> > > > @@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > >  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
> > > >  };
> > > >
> > > > -static const struct pci_epc_features *
> > > > +static struct pci_epc_features *
> > > >  rockchip_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> > > > index 60e74ac782af..e6de5289329f 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > > > @@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	}
> > > >  }
> > > >
> > > > -static const struct pci_epc_features keembay_pcie_epc_features = {
> > > > +static struct pci_epc_features keembay_pcie_epc_features = {
> > > >  	.msi_capable		= true,
> > > >  	.msix_capable		= true,
> > > >  	.bar[BAR_0]		= { .only_64bit = true, },
> > > > @@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
> > > >  	.align			= SZ_16K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features *
> > > > +static struct pci_epc_features *
> > > >  keembay_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &keembay_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > index f1bc0ac81a92..6ad033301909 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > @@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
> > > >  				    qcom_pcie_ep_link_transition_count);
> > > >  }
> > > >
> > > > -static const struct pci_epc_features qcom_pcie_epc_features = {
> > > > +static struct pci_epc_features qcom_pcie_epc_features = {
> > > >  	.linkup_notifier = true,
> > > >  	.msi_capable = true,
> > > >  	.align = SZ_4K,
> > > > @@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
> > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > >  };
> > > >
> > > > -static const struct pci_epc_features *
> > > > +static struct pci_epc_features *
> > > >  qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
> > > >  {
> > > >  	return &qcom_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > index 80778917d2dd..ff0c4af90eff 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > @@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > > +static struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > >  	.align = SZ_1M,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &rcar_gen4_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > index 2cecf32d2b0f..8a892def54f5 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > @@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	}
> > > >  }
> > > >
> > > > -static const struct pci_epc_features stm32_pcie_epc_features = {
> > > > +static struct pci_epc_features stm32_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > >  	.align = SZ_64K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  stm32_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &stm32_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > index 0ddeef70726d..06f45a17e52c 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > @@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features tegra_pcie_epc_features = {
> > > > +static struct pci_epc_features tegra_pcie_epc_features = {
> > > >  	.linkup_notifier = true,
> > > >  	.msi_capable = true,
> > > >  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> > > > @@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
> > > >  	.align = SZ_64K,
> > > >  };
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return &tegra_pcie_epc_features;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > index d6e73811216e..ddb5ff70340c 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > @@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
> > > >  	bool has_gio;
> > > >  	void (*init)(struct uniphier_pcie_ep_priv *priv);
> > > >  	int (*wait)(struct uniphier_pcie_ep_priv *priv);
> > > > -	const struct pci_epc_features features;
> > > > +	struct pci_epc_features *features;
> > > >  };
> > > >
> > > >  #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
> > > > @@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static const struct pci_epc_features*
> > > > +static struct pci_epc_features*
> > > >  uniphier_pcie_get_features(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > >  	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
> > > >
> > > > -	return &priv->data->features;
> > > > +	return priv->data->features;
> > > >  }
> > > >
> > > >  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> > > > @@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static struct pci_epc_features uniphier_pro5_features = {
> > > > +	.linkup_notifier = false,
> > > > +	.msi_capable = true,
> > > > +	.msix_capable = false,
> > > > +	.align = 1 << 16,
> > > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > +};
> > > > +
> > > > +static struct pci_epc_features uniphier_nx1_features = {
> > > > +	.linkup_notifier = false,
> > > > +	.msi_capable = true,
> > > > +	.msix_capable = false,
> > > > +	.align = 1 << 12,
> > > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_4] = { .only_64bit = true, },
> > > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > +};
> > > > +
> > > >  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
> > > >  	.has_gio = true,
> > > >  	.init = uniphier_pcie_pro5_init_ep,
> > > >  	.wait = NULL,
> > > > -	.features = {
> > > > -		.linkup_notifier = false,
> > > > -		.msi_capable = true,
> > > > -		.msix_capable = false,
> > > > -		.align = 1 << 16,
> > > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > -	},
> > > > +	.features = &uniphier_pro5_features,
> > > >  };
> > > >
> > > >  static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
> > > >  	.has_gio = false,
> > > >  	.init = uniphier_pcie_nx1_init_ep,
> > > >  	.wait = uniphier_pcie_nx1_wait_ep,
> > > > -	.features = {
> > > > -		.linkup_notifier = false,
> > > > -		.msi_capable = true,
> > > > -		.msix_capable = false,
> > > > -		.align = 1 << 12,
> > > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > -		.bar[BAR_4] = { .only_64bit = true, },
> > > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > -	},
> > > > +	.features = &uniphier_nx1_features,
> > > >  };
> > > >
> > > >  static const struct of_device_id uniphier_pcie_ep_match[] = {
> > > > --
> > > > 2.51.0
> > > >

