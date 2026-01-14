Return-Path: <linuxppc-dev+bounces-15678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA447D1C429
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:29:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drWng0vccz2yFq;
	Wed, 14 Jan 2026 14:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.228.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768361382;
	cv=pass; b=lqXvehPr0XfTbzNLo/RLhJDWfqrbNYJCO0mZjuJ0F75Lq8dxmAuPOlxCUXylIsN6p6kireu+dC6tbYU9xau+lCGCu5L1G77xeYH/mE7kRCU27NdAA8v9Xta1kG0lEI0pI6p/BeTpNU06kyXFJ3Awun6Vb0pb7G7oj0w6vH8oiaHXkC4M29a02HwHz9D46FuvdxL66LWELcYmsHYlPZJnbAcCm3faVozt6ndqjF1hqog0RRLysPmcOwrks0guAmh8tAt5KSrEYf+WKMMREdNWlvZlYA88sIpFiEnYZVJabMV2hskgP7j/v8oQo40YcldlkMsHtfFitCwoW4gTvwb87w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768361382; c=relaxed/relaxed;
	bh=9vuqgoC5x+sRV+WskZaJmhbs1E8PuvgbAw+5K5OHM8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T+H8RDwj0U+2QPOHIj5HUt75UoVhYtRspuil54/hBMj7yDF+eTNkKD9HVOs9iGYpwKGMBP0GkzTDH9s/0DVpeV0OCv7rpne0XO9t2S0jd91TTH1buG9GkOnaVlge2PrSwgnIWHmi6Qj7KS4qH9y6aZzu96mDiFfxTb6QMBDa2L+RP/L8HrIPO9x0Sdwaj15X61Tf+WJpYQo8XVQR19cuyNWzUy44F6/R+YVD0lAuF4vbMecSEMSJKMLdQ5PDeYWs1m1WSswBjCfGf9FyBXmqguo3SvQQkk9jD7EsBCCvp4IqL79Wnyry7Kt06AbbMEbu8B38RB4qoiUHNqKgxyvVJQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=iz32B57j; dkim-atps=neutral; spf=pass (client-ip=52.101.228.90; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=iz32B57j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.228.90; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020090.outbound.protection.outlook.com [52.101.228.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drWnd6Vcfz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:29:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6ARRwCYiz8Dq4aflX9QHcBZMGZe/MJqsfnZUI3evfgVy0JZvDTJtwCM8VmAvAqFWQwkJLyM03ukLgSAMJHCy+3OYFhR8LNPLAN7WFP0ZJ9k6pF0X6PFajah5uDh+Ogc78hloubRru1QJjMwwXdHPcKxw5Fg4/34LoNjg7XnXt5c+3Og4ND6zJpZywwBg57qU+s8SfQK+8iMu6/hD0NccsEGmsJLTV9EZfCeWNB4IeFqfnD4y7k0q6s9UJc+NKEq+ltKiMW6K2fq5zX3wLpJXT4xAXe9y2p+ZVe/7kwWrePCeZOa91lz3gkmZVTZaupfwd1PR6hBZTo+yfVNLykK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vuqgoC5x+sRV+WskZaJmhbs1E8PuvgbAw+5K5OHM8I=;
 b=OjJP1olymFSgtwD4S+tZ0ef39bLMPt/SDdcrnqhfSSmEUxiDvk5RIuGDeg8C0FkRbyLWqqSMN+TYUeyihSkijGBL9nxMt47jxAj17WwlBnLZyQRChUGzUjqYCvQqrN8tdoq2T//NShnJdxBhxCLBFAnGfs/MlOGGaa2xCKJjQAVL2z8KQ3GTSP1Qn/SrduIF2ZQ+KYaMcLHKgKL7uJeQGixRCohEOqYGnW4VlH6xK1jtxha6VXu4NUPMgkXWMYZXJX1braHmsg3g6CMqECk1UpVFEw2sjeYs0NzfIS+10yPOnKIud6VmcCf0bSmh4HeoWd4qoQJGKrpyU9oCZghhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vuqgoC5x+sRV+WskZaJmhbs1E8PuvgbAw+5K5OHM8I=;
 b=iz32B57jHzr5ulW3vYp9EX4yGz4sq4r7/sD/iXiA+STH0L+mA4hP1/LSfUZ2PeN+FhgNUBQuYlthyDPWKVSopLeCCKBCgsTBMB4qMvWyB/zdJ8wYEkCHyhnNTkkIRfeDjmkULcbZqpKmHK6F4JGMps138L4+58nB5XodoGSheLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY3P286MB2917.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 03:29:01 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:29:01 +0000
Date: Wed, 14 Jan 2026 12:29:00 +0900
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
Message-ID: <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY3P286MB2917:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b619e0-3685-4da6-9a25-08de531d0f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9WJ8UxdQl9a3wdWIYcb47l9Iov5BVQmUKMH80O6LnaaKL3oJcUyA+mPzQTCw?=
 =?us-ascii?Q?ppzXCi8fWgPkAkNZPXLHwXhC41y6loqeNfQH7PLed7esqHjq0AKI4WeXIxGB?=
 =?us-ascii?Q?j1uKkDQczBgG76n+ygwYaUlhveg9h0lAV1tcnlc7iSQ4UuKxGhZsUcREfb96?=
 =?us-ascii?Q?igniDOJFVoLTiArzLSl3/r5OhYpAZO7OwwlA0Qp/CVj2DBVDB3mE6I7vaS5n?=
 =?us-ascii?Q?rzVe6ZfcZ1ydzKazRMcgbS6TdYVCTDF9k21hnu2L+e+W75tRHDS87mzdIU05?=
 =?us-ascii?Q?NCHC+berJiHxrsZJbBMWo14nHU+3DrHAkHUhqdLQ/HOe/IBm9MAFrcjGWn3Z?=
 =?us-ascii?Q?k4vzRuAEssFk0bSBisWeMxIjR8M14tYdtMsmWxUl4d67qSzRctJ7b/4ryAx7?=
 =?us-ascii?Q?G1YgEIen1O5HdgXQhDdSMUyjt0URXnAGD860xbhQLHYExVNbWVxFpBnu4UAn?=
 =?us-ascii?Q?9yZhof2/RVr4zAhOJo8fhqkEvBElwGRxpb45vP2dv9fOvSs3lUbulX9ebptY?=
 =?us-ascii?Q?38eTZ87GdR0nQmJo6hBfGeWH583i8V/O5CBrNj/h8xMpkrHw/EL1Evm6sThO?=
 =?us-ascii?Q?LFcaObid76FAS+qBSVS/D9V+HG5h4oUGoFSxHeTqysmGm7ghOuXEq4Y9xbXk?=
 =?us-ascii?Q?tAOOpBCruOpvZMTX2NarDwMBrJHiLVkzAmxKiNsH+1+lrXIaiocEji6vP/mL?=
 =?us-ascii?Q?2zzQjaCAkF4s8VXNQWL56xdZg0zIB752MIUTKjNfvyLyyjb2ORFU7wfINhdN?=
 =?us-ascii?Q?bI8r/PzStSpxt/YKSbPM0wrmXfMn85HNhR5nJlkiLbCkYKER9kxQfTv0d3CX?=
 =?us-ascii?Q?Kx4sP9TdV19JR/5kUuiCo3S5/xpGIKCewc0lGNyKmF5TXL8RffPs3ZOLlvxM?=
 =?us-ascii?Q?Sx8Wf5Wj1MOQZkKbgFRmx79oP7Feo8W4HRfRlcqkJFyWlffeALr5jcBLmYl+?=
 =?us-ascii?Q?bgMBP3TfBSgtoJwzI6Z/Q3xR63rsFS8sskAjYD99ZdmNgY4i1DLOBv3s4JJx?=
 =?us-ascii?Q?UaZasPtFJbAqHGxJaAd4ae2lInN7npS7I7nskWYZRCaY9xT8hNPWY9J3kPBF?=
 =?us-ascii?Q?JkosAzXbOu75k+DfMpveKaA186iyXy2oil3gEKNxDru38hRUxJ7oJXGMwnc3?=
 =?us-ascii?Q?eC2pb5eMXrg4RDzdi+ORWLaVfaSXweCmFlTd6aC3jImpgv5eZGONQbyffHTp?=
 =?us-ascii?Q?Lv6tQSLezQIrugSyVN5kOYaxhjhjglrfs2NSj6V65bza7WmU7bn9qpuxYiLi?=
 =?us-ascii?Q?qZF2bh7qOJ75gKQsMx49SiE3H9Q7mFK0qlmn6UbeeE5IoOLTz3wLuQCQemX7?=
 =?us-ascii?Q?5D4CqSueT8KXX9ROXJsWAG1AsMmj+n9s90l7NXbp69mnt/XyBwkzlOZ4Tvm+?=
 =?us-ascii?Q?ZKFmEh/vyQcfV+zCTKDyH6oPKib++jik+EBpBGMFC5n4aEzyuyCJ77oSmwVw?=
 =?us-ascii?Q?1SqaRD/js21tb4qZnXCsY+S/EMysOLkw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cTOlNPEvOoIHYZxIohI9Y9zxCMdGYGDM3IgBdLXBDDzvRuv0Fu/MzQRC6xqP?=
 =?us-ascii?Q?mpquodz+htRdhVrUH7InEz/o9p/OYXrspmy7NbI7aVVA2ZmdXAYpZXuodYJX?=
 =?us-ascii?Q?nJddHtUYld7lPWBiGeXu0mlB3s314vnDypNsz8cMHe08+Ei95LpK0b3XRsYq?=
 =?us-ascii?Q?C4dQl94LAyb872AVmkp5d1V3jn1bYSmUJdcVlw+qP8Pd0AzhDash18lXjGq/?=
 =?us-ascii?Q?n4Hah6uHV7mWm5x1BXeibQGbz5PFljMJOxGI48TdZMHXjRXxsqmvYnIrRpfw?=
 =?us-ascii?Q?3fnTQBTMUK1GmR8mlLDuwqsmaOIW+rJXmB3U/an8+5XM1KBIr8BtmdvUiko6?=
 =?us-ascii?Q?lzlOFINAY3mu4Nxn9I4pCwB/Ft3l8lLNUs2O2CStA2uz0gLRgk3N6BSSrSuk?=
 =?us-ascii?Q?Lw8JefsReCt8AKFDWyGk+bGTZWc8lFjMTVg1uD3wSnR5B+S6YMv9k5L0edc+?=
 =?us-ascii?Q?Cvd6qdYvcF5Np1bALnXrEGfghEfgEHSH5ge6ic6Y9C4I5WslbjXWcJgggMzq?=
 =?us-ascii?Q?OrOduKkTQQDfIJ+S58UvSccMxBIHcBJZcnK3GpGQ83tv7tzO5r0TXrwocKQQ?=
 =?us-ascii?Q?hVG6vjIsMyaQizugQr5bAedC44QBRPoDt+T81qlkEAKjyg9EsNAE+XxpfYzv?=
 =?us-ascii?Q?16FjsfMMSfmvdUbfUHBuyrvmo5pXYNwZzGJJvOSK72PA6C7nZtbHQhbECyhw?=
 =?us-ascii?Q?WddX5XV21AM1WYdtgdd81g7w1tSOQfdteh0/qacHvnMqMpXFH+8gM+IqTT76?=
 =?us-ascii?Q?/c735VYMON1tU1hdjM00UlHgBaTOTDt58C9uCQLy1oAUtPoCHrkuaCX6d7j5?=
 =?us-ascii?Q?CdODN+YAk+wjMYKANY8DOgTJDQm7CPVjNAC6WDo3kH6ccul2PIHw9eda4kaT?=
 =?us-ascii?Q?qsOgg3rwPnO2bGizFC7bBPNicY1uEfUOaHBd6mNZWewMSEzW1bPI+6OOHkO5?=
 =?us-ascii?Q?Vpty5L2gkSFCPe3FEj/AgvJYwhehYn/CwJ4Id6t8AQyQuZqd/QkM6ApVPj6y?=
 =?us-ascii?Q?IY3VXOoGw+pAfu5u+eDaqFpLGkBODHHf55QeGWZxHuJkznTJaKN91V/Q8GKz?=
 =?us-ascii?Q?gmViwEeK7gZZIqvEvnKqSsj8JhuBbZnioJGHriessVNP+pSlOYcGSLgEGaii?=
 =?us-ascii?Q?diLyhUF/iyBESjGArWyAiOy0N5HcLGo+x52pDSK93kxCrymGb2Yq2l7GVp33?=
 =?us-ascii?Q?cXR1xzO/d+1/OLc4exROE4eEKsJljcEe7Vmg6jc8LtR/BGgQ4Mm+Nip6DTuk?=
 =?us-ascii?Q?D+osNHP9UCoecqa95tq+JtAjyOZygsZTaS7eqS6hW3M2D9eLfDS11EalCYW6?=
 =?us-ascii?Q?bLm0GbwKK3RhnwTRiNRc3wNIb2xuxJmQG2k3M+Oi1p+kgQwfvpxl44MSSmNx?=
 =?us-ascii?Q?bqqQq1ha5AUz3G8KG+X4ispEqIdvkhu2R0mvSXBXUqcqh3zliZiKlLrRLOlh?=
 =?us-ascii?Q?YHqmgdojp/ZWl+G5UA1u8En3s3ZAeVmLe+1qiaSVRUpToAmBw0WEJiD176lQ?=
 =?us-ascii?Q?kUe71DN+kGVIE7T6IkCQsiTtpTMCVl8Y8x4k27+qjKgbqXpx5wk5eRtQyfVu?=
 =?us-ascii?Q?Ozb2/VSTWUHliDaH4PoK9KjNSHpQN/JYpWCW+UlI0Ueh8CCsMorcQAsti/wm?=
 =?us-ascii?Q?ITQDLLqq308zDSE6QYyT1MD3ZaF7IpGMeTBCxjZiCKHvj51vciMVYNC+0siw?=
 =?us-ascii?Q?wmJyTEgGg86f3GISviB54rIhRFRz0Y57fB9q6X2UOyJJrgQtk4GNz2xM0mQy?=
 =?us-ascii?Q?yB+SIrB4fP/Jkqi2J6hhCh7igCzPx3xgvx/pGI46SL6OTFShVDm3?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b619e0-3685-4da6-9a25-08de531d0f91
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:29:01.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl8wOcfusqkga1i2ajcY1KSu98OlZmS9xWIb53xPCayEtgv/VgCKZWUP0rNLmn+dEht5DZ9wq0a6b9pxos8+sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2917
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 03:38:45PM -0500, Frank Li wrote:
> On Wed, Jan 14, 2026 at 01:27:16AM +0900, Koichiro Den wrote:
> > The DesignWare EP midlayer needs to advertise additional capabilities at
> > the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> > in every DWC-based glue driver and without copying feature structures.
> >
> > Change dw_pcie_ep_ops.get_features() to return a mutable
> > struct pci_epc_features * and update all DWC-based glue drivers
> > accordingly. The DWC midlayer can then adjust/augment the returned
> > features while still exposing a const struct pci_epc_features * to the
> > PCI EPC core.
> >
> > No functional change on its own.
> >
> > Suggested-by: Niklas Cassel <cassel@kernel.org>
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
> >  drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
> >  drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
> >  .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
> >  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
> >  .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
> >  drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
> >  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
> >  drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
> >  drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
> >  14 files changed, 60 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > index 01cfd9aeb0b8..e67f8b7b56cb 100644
> > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > @@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features dra7xx_pcie_epc_features = {
> > +static struct pci_epc_features dra7xx_pcie_epc_features = {
> >  	.linkup_notifier = true,
> >  	.msi_capable = true,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &dra7xx_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 4668fc9648bf..fe1de30b3df6 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
> >  	const u32 ltssm_mask;
> >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> >  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
> > -	const struct pci_epc_features *epc_features;
> > +	struct pci_epc_features *epc_features;
> >  	int (*init_phy)(struct imx_pcie *pcie);
> >  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
> >  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> > @@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features imx8m_pcie_epc_features = {
> > +static struct pci_epc_features imx8m_pcie_epc_features = {
> >  	.msi_capable = true,
> >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > @@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
> >  	.align = SZ_64K,
> >  };
> >
> > -static const struct pci_epc_features imx8q_pcie_epc_features = {
> > +static struct pci_epc_features imx8q_pcie_epc_features = {
> 
> Is it more simple if
> #define DWC_EPC_DEFAULT	.dynamtic_map = true
> 
> Add
> 	DWC_EPC_DEFAULT, into every epc_features.

One corner case is that pci-layerscape-ep.c builds the pci_epc_features
dynamically in ls_pcie_ep_init(), rather than providing a static definition
with an initializer. I think setting (ie. overriding) the bit centrally in
dw_pcie_ep_get_features() keeps things simpler.

Thanks,
Koichiro

> 
> 
> Frank
> 
> >  	.msi_capable = true,
> >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > @@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
> >   * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
> >   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
> >   */
> > -static const struct pci_epc_features imx95_pcie_epc_features = {
> > +static struct pci_epc_features imx95_pcie_epc_features = {
> >  	.msi_capable = true,
> >  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> >  	.align = SZ_4K,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index f86d9111f863..4292007a9b3a 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > +static struct pci_epc_features ks_pcie_am654_epc_features = {
> >  	.msi_capable = true,
> >  	.msix_capable = true,
> >  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> > @@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
> >  	.align = SZ_64K,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &ks_pcie_am654_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > index a4a800699f89..8d48413050ef 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > index f4a136ee2daf..84111d8257f2 100644
> > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > @@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features artpec6_pcie_epc_features = {
> > +static struct pci_epc_features artpec6_pcie_epc_features = {
> >  	.msi_capable = true,
> >  };
> >
> > -static const struct pci_epc_features *
> > +static struct pci_epc_features *
> >  artpec6_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &artpec6_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > index 12f41886c65d..60ada0eb838e 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > @@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features dw_plat_pcie_epc_features = {
> > +static struct pci_epc_features dw_plat_pcie_epc_features = {
> >  	.msi_capable = true,
> >  	.msix_capable = true,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &dw_plat_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index f87c67a7a482..4dda9a38d46b 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
> >  	void	(*init)(struct dw_pcie_ep *ep);
> >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> >  			     unsigned int type, u16 interrupt_num);
> > -	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > +	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> >  	/*
> >  	 * Provide a method to implement the different func config space
> >  	 * access for different platform, if different func have different
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 352f513ebf03..1f3c91368dc3 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -100,7 +100,7 @@ struct rockchip_pcie {
> >
> >  struct rockchip_pcie_of_data {
> >  	enum dw_pcie_device_mode mode;
> > -	const struct pci_epc_features *epc_features;
> > +	struct pci_epc_features *epc_features;
> >  };
> >
> >  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> > @@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > +static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> >  	.linkup_notifier = true,
> >  	.msi_capable = true,
> >  	.msix_capable = true,
> > @@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> >   * default.) If the host could write to BAR4, the iATU settings (for all other
> >   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
> >   */
> > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > +static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> >  	.linkup_notifier = true,
> >  	.msi_capable = true,
> >  	.msix_capable = true,
> > @@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> >  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
> >  };
> >
> > -static const struct pci_epc_features *
> > +static struct pci_epc_features *
> >  rockchip_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> > index 60e74ac782af..e6de5289329f 100644
> > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > @@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	}
> >  }
> >
> > -static const struct pci_epc_features keembay_pcie_epc_features = {
> > +static struct pci_epc_features keembay_pcie_epc_features = {
> >  	.msi_capable		= true,
> >  	.msix_capable		= true,
> >  	.bar[BAR_0]		= { .only_64bit = true, },
> > @@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
> >  	.align			= SZ_16K,
> >  };
> >
> > -static const struct pci_epc_features *
> > +static struct pci_epc_features *
> >  keembay_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &keembay_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index f1bc0ac81a92..6ad033301909 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
> >  				    qcom_pcie_ep_link_transition_count);
> >  }
> >
> > -static const struct pci_epc_features qcom_pcie_epc_features = {
> > +static struct pci_epc_features qcom_pcie_epc_features = {
> >  	.linkup_notifier = true,
> >  	.msi_capable = true,
> >  	.align = SZ_4K,
> > @@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> >  };
> >
> > -static const struct pci_epc_features *
> > +static struct pci_epc_features *
> >  qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
> >  {
> >  	return &qcom_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index 80778917d2dd..ff0c4af90eff 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > +static struct pci_epc_features rcar_gen4_pcie_epc_features = {
> >  	.msi_capable = true,
> >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> >  	.align = SZ_1M,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &rcar_gen4_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > index 2cecf32d2b0f..8a892def54f5 100644
> > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > @@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	}
> >  }
> >
> > -static const struct pci_epc_features stm32_pcie_epc_features = {
> > +static struct pci_epc_features stm32_pcie_epc_features = {
> >  	.msi_capable = true,
> >  	.align = SZ_64K,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  stm32_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &stm32_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > index 0ddeef70726d..06f45a17e52c 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features tegra_pcie_epc_features = {
> > +static struct pci_epc_features tegra_pcie_epc_features = {
> >  	.linkup_notifier = true,
> >  	.msi_capable = true,
> >  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> > @@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
> >  	.align = SZ_64K,
> >  };
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	return &tegra_pcie_epc_features;
> > diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > index d6e73811216e..ddb5ff70340c 100644
> > --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > @@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
> >  	bool has_gio;
> >  	void (*init)(struct uniphier_pcie_ep_priv *priv);
> >  	int (*wait)(struct uniphier_pcie_ep_priv *priv);
> > -	const struct pci_epc_features features;
> > +	struct pci_epc_features *features;
> >  };
> >
> >  #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
> > @@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >
> > -static const struct pci_epc_features*
> > +static struct pci_epc_features*
> >  uniphier_pcie_get_features(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> >  	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
> >
> > -	return &priv->data->features;
> > +	return priv->data->features;
> >  }
> >
> >  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> > @@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
> >  	return 0;
> >  }
> >
> > +static struct pci_epc_features uniphier_pro5_features = {
> > +	.linkup_notifier = false,
> > +	.msi_capable = true,
> > +	.msix_capable = false,
> > +	.align = 1 << 16,
> > +	.bar[BAR_0] = { .only_64bit = true, },
> > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_2] = { .only_64bit = true, },
> > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > +};
> > +
> > +static struct pci_epc_features uniphier_nx1_features = {
> > +	.linkup_notifier = false,
> > +	.msi_capable = true,
> > +	.msix_capable = false,
> > +	.align = 1 << 12,
> > +	.bar[BAR_0] = { .only_64bit = true, },
> > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_2] = { .only_64bit = true, },
> > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_4] = { .only_64bit = true, },
> > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > +};
> > +
> >  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
> >  	.has_gio = true,
> >  	.init = uniphier_pcie_pro5_init_ep,
> >  	.wait = NULL,
> > -	.features = {
> > -		.linkup_notifier = false,
> > -		.msi_capable = true,
> > -		.msix_capable = false,
> > -		.align = 1 << 16,
> > -		.bar[BAR_0] = { .only_64bit = true, },
> > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > -		.bar[BAR_2] = { .only_64bit = true, },
> > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > -	},
> > +	.features = &uniphier_pro5_features,
> >  };
> >
> >  static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
> >  	.has_gio = false,
> >  	.init = uniphier_pcie_nx1_init_ep,
> >  	.wait = uniphier_pcie_nx1_wait_ep,
> > -	.features = {
> > -		.linkup_notifier = false,
> > -		.msi_capable = true,
> > -		.msix_capable = false,
> > -		.align = 1 << 12,
> > -		.bar[BAR_0] = { .only_64bit = true, },
> > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > -		.bar[BAR_2] = { .only_64bit = true, },
> > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > -		.bar[BAR_4] = { .only_64bit = true, },
> > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > -	},
> > +	.features = &uniphier_nx1_features,
> >  };
> >
> >  static const struct of_device_id uniphier_pcie_ep_match[] = {
> > --
> > 2.51.0
> >

