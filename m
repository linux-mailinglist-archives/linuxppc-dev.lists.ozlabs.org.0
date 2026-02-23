Return-Path: <linuxppc-dev+bounces-17044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK/eOHRInGmODAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 13:30:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC671761D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 13:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKKvP0cBXz2yFc;
	Mon, 23 Feb 2026 23:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771822555;
	cv=pass; b=cTy8rj2FvcG+w4dfDaex3206E6jaX2Q1pFxOHg/emAQhf65KGXkYRYtrcf1pf9CXAPnXPyPhLKEibXvoT3mxlhgmYLyt4GE24EdwDrLETPNgvifVxRbIcHAVeQQ+U4IPxt1I0wwTfy5SL+//nlK8vIKPVeB24s/NrHM1M/x/QR7c3K+M6tv6n4ciX85YnA+IEzGu3F8KbtlIL+kLId/f68ktoi5JNmRzhY6cyPID759CdDtMV4UbicvZ09lbuwl+I3dYds3t8qhewneGrsoN0jJWP8QM4Ulb19xRsruIQYp/4zx/yUqAjE8SBzBt+LYDh3bdGKWuG2SPrrFh27gcog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771822555; c=relaxed/relaxed;
	bh=jExHXGsOY93+6W8Z50OCXFxp+Q3XIA1lYeP0Ga1YxL8=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=Srn/ZRwWPsNSWrTX6HcRuKjSMQIPwzV2HFNvgf/JgbIwp6CV/amj4YFYSTCl/4fnxCsizwTn0Iiw81ZUu6Y0cFo5/RvaSMkKQH8RSbJ74LDSGUdD5x94hR8iqS+VRkmhLBzaUmC1qNtiYMQdE6tXjVRSwdE1g8TFNbxlEJCCfn7EuqdqUlhPTlnQMMJs7EZ0ORfRVltAeQPH+W72OJPmvpRkYSy0TLFCaO7MXT5gWAldPlNBPdIAkxctE/m1uc36fdZ0Jz8gNA+1Ct6vLddlGrFQtDX7pDYAae/d/uwxHvLytcLFcNYeoaWrZ7Cg1PGyyGH1jLK4XxBEHJX/n6O20Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ch4YdvBD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ch4YdvBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK7pd3gWkz2xlv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 15:55:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPJL9sVUtKc8uXTrg/6kvBhvKR3D0I/We50U22FLuRfHsTqqAwfQydV2wZwZyEy8G08piCjs/AUUqLin9OwE3Ujz5kjV1SW/ff3JoAAbekyWfwQE3O96ExixY+tIEidCeK/JMm+WR+6oao7M75/tu/QvvLI34d8ODKQe0Tvw/ubIaPUQ3IcMAk9epFoKXfAAhy096NMC30iOS36WTI7+2FHDrbNghoNV1K/7hNusffBCBdf+iJY0fyl5croop/VThBwaBX+2b94qiDsFyGZ/Ss/l5udqJxzGEvfHiRgHpjCsvQEVMgVhPE4YxjE/qobfdbxt+c0bMuUHmqANQePk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jExHXGsOY93+6W8Z50OCXFxp+Q3XIA1lYeP0Ga1YxL8=;
 b=a13s4SKW6inRE+LifOgVNEKqhXmUrARZ/u2+Sif3iRAv12zUguqgTuCPTls9ZhPpuN51SaKv9lomG+uWzt+s344G1Icz8073yRk1u0w1wP+T0kLNpa6aH0kP1XIY09FfhtdVKeHQMBu+Qwvr09XKgMzveZBQQHgXN1q2BKxfvnNEvXi0ZM9gq56iOzkQxDzb6ryZUN7J/NHAmTepaKQGh52Rr2WjLroEOFC2/KKzyrJqSOAwB9RpIOhxGmL+9STIJ/hriLJA/1YtzjkJyiXHTaaUvtqTeV5nV4QBIys0DIGOtSWRX0q1pqehpg1Cc+3znMDg1HeRW4UlgzAPIj0x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jExHXGsOY93+6W8Z50OCXFxp+Q3XIA1lYeP0Ga1YxL8=;
 b=ch4YdvBDXOhmVJ2QMBrSIk+MwvebBkaIydNpfIBd98oHj/wKi9p1oe14nZy6whSWF8GRCoWVm4dG0bAylbCrOQ27V0MQIxswJdFqCW1EySsuH/EZJFBLaFICKdFdXTQfqFqMtUplL+I0Sf9QdkNMcaLAvG/eZ54UK0g6wnr6PzuZob8oq7VzaNEWbIDD3+2lsVEu/jlsoNNXYYZtyEPODX/JcDnwG3gVTtw9nRR0grGfsObmo9dHxt+xNKbXTHFqpRqH1pkOOX4yr6kx5Q4E41dXzrr+HyMky2+QBQkPzsO59MN7Q/HERDKMx1druqxW6ALrL9QslXsJd9yMmAqxQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 04:55:19 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:55:19 +0000
Content-Type: multipart/alternative;
 boundary="------------i4v83qQnVd0V0ruUHQVnQrDa"
Message-ID: <49543234-a1d9-462b-aed1-15d66257957b@nvidia.com>
Date: Mon, 23 Feb 2026 10:25:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] PCI: dwc: Disable BARs in common code instead of in
 each glue driver
To: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Marek Vasut
 <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Koichiro Den <den@valinux.co.jp>,
 Damien Le Moal <dlemoal@kernel.org>, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-17-cassel@kernel.org>
 <aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PN4PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::11) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: f597cde5-7e05-4b3f-5d71-08de7297be0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzN4VEVkUXd1b2ppWnI2VTllTGhKa3BlenVCT0NXc1ZQcTArZUdkNWJwV3ZK?=
 =?utf-8?B?WlVYMGZ0SU5hSVhyb2NGUjJUN0lCV0hrZGlMM3BWTlVLT2JQUW5udnFXM1ZP?=
 =?utf-8?B?a0pZTWp3amhoMlhicTFmL3FuaEg2TExjR2FQcnFVSXFCRlNkcU1PbTJTbjRj?=
 =?utf-8?B?dmw3TGNHTDFWZ2M3REJLbGg1RzFnZnh0cFBDUzNFakdvQlVySFB1WVVid0Fw?=
 =?utf-8?B?SndPUXVHL053RzgweEVzMXNxbEU1VldsWVN0N2EwenQwV21NUjN4VHZ6M2FD?=
 =?utf-8?B?V0crZDd5WjcxVmdGaSs1dzhmZEg3T0FpZWdJb2RSTTFIMjdzT2JzWThzYkRn?=
 =?utf-8?B?aUJPOS8xaFNvODFhbHBJVE1OU1d4RVE5elAycWU0TER1NnF1VGo4ME5DVkVn?=
 =?utf-8?B?V1Y1V2ZRYmdHK20xT1luWkpBeGJUMGZONHg0a1ZWUnU5LzQxc1BVbzNKNjdB?=
 =?utf-8?B?TmhrWDBiYkpodm9rS1lWQ045dHM1SzVLcThNd0lFT3lNSDcvMHp3aktEYnlC?=
 =?utf-8?B?SzBjUXF4YkwwQURWckFUUHFld1oxWXJnNExGY21VMFR5V1hzVTRvU0N6VFRG?=
 =?utf-8?B?cnFLajVxZVJOSjVlSEs4MEcrOThGZk5lU0tMbHJOWlo2eE9wYzJ6RmJhUUhh?=
 =?utf-8?B?U3FscE5KVWt4R2V6amVwOEJWb0FXOGpHZWhDWTNiK0dEQTA5Tk9DbFNsTjVX?=
 =?utf-8?B?T1V1Q0lhUDhCdDkrSW5SV05GUzI5NGJiWkhZWGRBRlE2MXJDMjBaRytsR2xw?=
 =?utf-8?B?K2F2OEVWTHZvN2dISnNIU2hYaWQvVDl0UjlxMlpnaWNCQllVQVVsSkUvb1pX?=
 =?utf-8?B?ZmdGRnFDSk1VSUxqTjJnSzFjaS9kblViWmRsdmtJYmhwVGRUVmtxUXFrTERB?=
 =?utf-8?B?OWRUUzdtRi92QzVhU2U4NzBHNlJQbE5KN2ZUUGJLb0FnZ3hxdTBqLytmYUtl?=
 =?utf-8?B?dnBTZDZOT3BHcFpNRHg5MmRzZ0lkMGd1aWF5TVp3alMrZElYc2RMcURUM0dP?=
 =?utf-8?B?WkU2Wm9zc3JwR0xQaG96WEl6YmduQjRVWVpQUWdmUlo4R3NXTnZBNFdCR2M3?=
 =?utf-8?B?ZlFiZUVRbjlBbzZWRUl5eEx2cENJeUpnalNEbU1QNFFIYnJzQkFBN2t5eGpM?=
 =?utf-8?B?U0RKN215bUlINUJhR2R2ZkVrQW5qWUZ6N3RKZERFOEZZaTRSem16RGpmQnpu?=
 =?utf-8?B?eFNTdGNoU1FkakJYem9QejNqS3NVVW9nUjdPa1JOcHpycm9YdEt4cnJmY2F0?=
 =?utf-8?B?dFhrYVpOYWVyQnRpVGdhRVViV1pkNjluakcxbSsvNk80ZTlnK0ZzVTdXSXZx?=
 =?utf-8?B?NlFxc2FVaUlacXl5Y2hsWHZyNEpOZElTOXM0eXR1ZC9wOUM0OFArV2x5a1Vm?=
 =?utf-8?B?SzlDcUQ5U08xaXVkTXVVVEVPREJjVlJhcnV6T0tMZjQ1UGg0NEwrS3VVL3BP?=
 =?utf-8?B?UmxvUXI2WFBLTkJGdkZXcnNkbjFyK2VvSzhVUGpCZmNKWkZXdS9vL05SRGhw?=
 =?utf-8?B?K0FrN2xtS1BIamo0UUxHNUxHeTZkMXlHYitGK0lXRmg2MkhwdGJubUNBeE11?=
 =?utf-8?B?alY2Sjh3c2dmdCtrL3lHYXMwMzZDRDZxSE1lTzdCTHNDLzdtMitPYURNaVVX?=
 =?utf-8?B?VDkxbEtVZmJZa2ZWM0hCWkRTUHdrV0pKZjBSUFA2cEdac1ZuRlN6NEppQThq?=
 =?utf-8?B?dnc4M3dWZzRmR3JyNzVqakdDZzh3RlhBOWtrUGM5V3IvN0pVZ3FSU0lTSlIw?=
 =?utf-8?B?SndyWW5KeEdnc0Frbk44cEp5bGU5MWFyWTE1Nm5lNDczK09ORFg5cWJwZUY1?=
 =?utf-8?B?VURHaXpuclkxY1lmZmdGbURhQjVwOTQzamlYc2MwZEg3aCtqMEVNQU53YVdp?=
 =?utf-8?B?TGc4VXFCdTdIcUVJSThPdXN4aHRIVDRwVXBHU0tBQk9NNi9pRlZHNWFXcU5n?=
 =?utf-8?B?RTFxclRoYkRZMllIVVVRZnBCR1RNYXNReTcyVnNMZEVwRVBacUJ2bHhZYzUy?=
 =?utf-8?B?WTk2RkRpVGFMTldIcm1tZnh2cGU5MzNEbmpHV1o4K0F0cVFuSWwwejBPVnRq?=
 =?utf-8?B?ZGlHMXZXTzl6U0hwQkJxQ0VYZ3FLaHY1U0E5WmU0dEVhQmlDeWJPUlVtSlcw?=
 =?utf-8?Q?Ht3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0lzdUw4K1BIY3VnM1pOSkZ1SDlnelRYTUZWRmxOSG13MVlzQ2ErRHlNVlds?=
 =?utf-8?B?VW5NdHQzU04xME9uY2svYzBWZU5kZ2ozS0tockkwVU5pb215RXRwKzRsNndI?=
 =?utf-8?B?YzBLK3JCdkprSW5YNE1tWkdHVW0wWUtVbHNPZHNSUmc0RTJteUhnc2tENmYy?=
 =?utf-8?B?QnlHWWtMQlZ0bE9xZm82cEpubjRwa3ZhTnUrU3Fkb3pNQmRISUh5V1BMc2RG?=
 =?utf-8?B?S01rZ2lZLzdWTW51MU0zdmhVa1BDMDg1VzExdmZza0hzMGRUSnIvdk1NdDdU?=
 =?utf-8?B?ZlVQcW5XVUd6MEpjcmprT1Z0bm5xYkZpTFFKOGkzS2RoRHl1Vm05azZtSzY5?=
 =?utf-8?B?T1B3R1A1Nkc4UFRXMlFTRWtwTnpGcTRSanNsQ05QUkJBU052RUlTL2pUZnpF?=
 =?utf-8?B?VGoybWU2QXJxUWhoQ1dIOHgzUWpMVEZ0djJGOXVMNXM5aFZkTkppTlZ3VWlN?=
 =?utf-8?B?OHQ3NllWazdXdTRPZkdxc256WklTaFpTUjIrVCtRbVJnUW5CVUU4ZElZd0RG?=
 =?utf-8?B?ay8rL1VFUmwrb2ZjZzRtMTZPV2k2em9NekNtd3paSkZMM3VGaWJub0VXSG13?=
 =?utf-8?B?S096K0hkWUxNVG5jODdnZGQwbGJVV0VPbTdwU1VrUnkrZnRpRU1jYjZxRHZV?=
 =?utf-8?B?TnNRejNIVXA5elM5M3h5OWZFSHVadE80OXdSakRYcTdCRDlZTFBXek1xMDg0?=
 =?utf-8?B?dEZCKzA0TThuMjl4WmJmWkQvZDAxb0dIOUxoc0FVZVRFOHc5YS8wQVg2NjR6?=
 =?utf-8?B?alQvd3Nva1hrb2VwNnpMUithT0QvSHBVM0E4SWE3aDh5Smx2Q0N0YlFCdU01?=
 =?utf-8?B?RSthU05mdzd0Y2VscFNVeVpRZFRaQ3I3bm1rRTRXMy9JSjc1VFB0S3Y3QnRn?=
 =?utf-8?B?UzYyVVE1WmpoWldWQy9DVVk2aFU5RVgxNmo2ZE9kZUNFN0hqT2N2RVpZVGpU?=
 =?utf-8?B?Z0VpOTFtUW1WbWRudXJpV2N4OThKNEtXWDdEUGpudW8ra21PcDZqa1ZrWFNN?=
 =?utf-8?B?L2RyZ1RWTGZuWEdsTTY1WDhHM0RTSXVVRnFWWloyVFEzMkxEdzBYZS9saXF1?=
 =?utf-8?B?dTRZQnB5RHJQZFRJemxXRndWbHpocHRxaXdsa3o3V1B6Vkc4alljQUNmbUg0?=
 =?utf-8?B?S3ZIdHcwK1djeTRVTjZ1M09YYmhzdlZOaVBXN1dKbG56bHJ1eWNVem05KzFH?=
 =?utf-8?B?MHdWVFRZUXFBR1p2WWtUVEhjOVk1aEdzcEJycWdWa0hxdysvckNqNlZCUG9i?=
 =?utf-8?B?d3BnRGpjYjI5OURhTklaOFRxK2lZT01abmFSREI5aDc5ZWlvR0djdUZxcEE0?=
 =?utf-8?B?c2FaNzJPZ0VQeWU0eEJQUjltWWQwZ2wwR2NZWUs3MHc2ak1xMU9FOXF5NlhB?=
 =?utf-8?B?R283K3lxNjBlc25XUkk0Q0ZiM3VTV1k2cFhKRk9BNjBzVFQxMWZibk14RWJx?=
 =?utf-8?B?VjZhUW1zQlo2cGQrSFBZRWp3d2RrblZueVdKckVXaGROVlpWeHRqKzQwY2U2?=
 =?utf-8?B?WExPSk9YdWwvaHUzYWlVQUJndkF0UDVjQmlPRmZyTksvSXhmckxqYWtVQ2hk?=
 =?utf-8?B?UEpWSmdTS2JkbUZleThWbkdqZzUrQ0RwNlphcU1mL1hXWm01OVhGNHRHTEFD?=
 =?utf-8?B?ZzNWNTB5NEZ0My9aWmxrRlZCQmEvd2Z1My9IV3E5SG1rbmFLbjR4RzhBSTJI?=
 =?utf-8?B?TXBuTHBCYTNiL1hDcnJseHRsOVlYWTVON1YwbjNjYWhQSFpwZlVPcGg0czZW?=
 =?utf-8?B?dDhNSlhOUC9iN2NVdVNkTzFmNjN1Um1ZSEZSR3pzOUFwNjVlK0JTdVRwRW5N?=
 =?utf-8?B?ZE41K1FtNmZ4QXNYNUU2Rnp5Z2xRZ0U5WXhyd3JaVzNHbWxkN3NXVG5ZbGFs?=
 =?utf-8?B?RE1RVE8zWmI5c09YZGhNU3ord2J5bitmaEQ4KzMrcGRFVnhjdFgvWm41cGNO?=
 =?utf-8?B?RllFd1V5bmRyRVRZeGNyZW90bTBJV3VRQjlPbm15bUdPUWZKdncvTEgxc0Jo?=
 =?utf-8?B?U1RpTTJyVG4veGg1MUJKVVlWWnQ1ZWl3NDhUY0ttczYzcVhnSUI3SEVKVVU1?=
 =?utf-8?B?SDBRVTNjdW1IYXVYVE1aVEtRSGFXOWhzM0JEQmJhSHFrVVlCZTlBRnNPODgz?=
 =?utf-8?B?akl3ZTVCdGNIdmM3WlQ4Qmoyc1NEa3psS1V3OFlOTERMNWZ5azdURTBaaDBn?=
 =?utf-8?B?eVN0K2NQUm5kNHFkUGJKNlAxSGJQajlIMnNIdjJ3d0NBNjhycGFYOG9IQ1ZT?=
 =?utf-8?B?dTZMM2pPdU84ZFg0Zk02em1GQ0l0WERmdk1FVkQ4RWJCd1prRTdiSWFRSEg0?=
 =?utf-8?B?SmFIQ1pGcExxcVpaanF4ZEpqTE12R0RrazhhcDNLRXNoUDB6MnF2Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f597cde5-7e05-4b3f-5d71-08de7297be0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 04:55:19.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ65Y+rxr6Dk6T2dA0IkRCANx5k0TOFa710NjMa20y7KSiW7NPXg+1qjl2Wh2m+ZTI42Xu70nIomhBrshssKZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17044-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:cassel@kernel.org,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:jingoohan1@gmail.com,m:heiko@sntech.de,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-r
 ockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: AEC671761D1
X-Rspamd-Action: no action

--------------i4v83qQnVd0V0ruUHQVnQrDa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/02/26 4:30 am, Frank Li wrote:
> On Tue, Feb 17, 2026 at 10:27:12PM +0100, Niklas Cassel wrote:
>> The current EPC core design relies on an EPC driver disabling all BARs by
>> default. An EPF driver will then enable the BARs that it wants to enabled.
>>
>> This design is there because there is no epc->ops->disable_bar().
>> (There is a epc->ops->clear_bar(), but that is only to disable a BAR that
>> has been enabled using epc->ops->set_bar() first.)
>>
>> By default, an EPF driver will not be able to get/enable BARs that are
>> marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).
>>
>> Since the current EPC code design requires an EPC driver to disable all
>> BARs by default, let's do this in the DWC common code rather than in each
>> glue driver.
> Move this to DWC common code from each glue driver.
>
>> BARs that are marked as BAR_RESERVED are not disabled by default.
>> This is because these BARs are hardware backed, and should only be disabled
> Needn't "this is",  ... are not disabled by default because these BARS ..
>
>
>> explicitly by an EPF driver if absolutely necessary for the EPF driver to
>> function correctly. (This is similar to how e.g. NVMe may have vendor
>> specific BARs outside of the mandatory BAR0 which contains the NVMe
>> registers.)
>>
>> Note that there is currently no EPC operation to disable a BAR that has not
>> first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
>> to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
>> have to be added first.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Niklas Cassel<cassel@kernel.org>
Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>   drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
>>   drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
>>   .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
>>   drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
>>   .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
>>   .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----
>>   drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
>>   drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
>>   drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
>>   drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
>>   drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
>>   12 files changed, 24 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
>> index d5d26229063f..cd904659c321 100644
>> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
>> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
>> @@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>   	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>>
>>   	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
>>   }
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index ec1e3557ca53..f5fe5cfc46c7 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>>   	.stop_link = imx_pcie_stop_link,
>>   };
>>
>> -static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	enum pci_barno bar;
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -
>> -	for (bar = BAR_0; bar <= BAR_5; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>   				  unsigned int type, u16 interrupt_num)
>>   {
>> @@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
>>   }
>>
>>   static const struct dw_pcie_ep_ops pcie_ep_ops = {
>> -	.init = imx_pcie_ep_init,
>>   	.raise_irq = imx_pcie_ep_raise_irq,
>>   	.get_features = imx_pcie_ep_get_features,
>>   };
>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> index 5a03a8f895f9..1f5fccdb4ff4 100644
>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> @@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>   	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>>   	struct dw_pcie_ep_func *ep_func;
>> -	enum pci_barno bar;
>>
>>   	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
>>   	if (!ep_func)
>>   		return;
>>
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -
>>   	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
>>   	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
>>   }
>> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
>> index e994b75986c3..55cb957ae1f3 100644
>> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
>> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
>> @@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>   	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
>> -	enum pci_barno bar;
>>
>>   	artpec6_pcie_assert_core_reset(artpec6_pcie);
>>   	artpec6_pcie_init_phy(artpec6_pcie);
>>   	artpec6_pcie_deassert_core_reset(artpec6_pcie);
>>   	artpec6_pcie_wait_for_phy(artpec6_pcie);
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>>   }
>>
>>   static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
>> index 7e7844ff0f7e..5e47517c757c 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
>> @@ -1105,6 +1105,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>>   	dw_pcie_dbi_ro_wr_dis(pci);
>>   }
>>
>> +static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> +	enum pci_epc_bar_type bar_type;
>> +	enum pci_barno bar;
>> +
>> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
>> +		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
>> +
>> +		/*
>> +		 * Reserved BARs should not get disabled by default. All other
>> +		 * BAR types are disabled by default.
>> +		 *
>> +		 * This is in line with the current EPC core design, where all
>> +		 * BARs are disabled by default, and then the EPF driver enables
>> +		 * the BARs it wishes to use.
>> +		 */
>> +		if (bar_type != BAR_RESERVED)
>> +			dw_pcie_ep_reset_bar(pci, bar);
> Any bad impact if reset a RESERVED bar?
>
> Frank
HW reserved BARs like MSI-X/DMA will be permanently disabled.
Host doesn't see these BARs, Tegra194 ex:
BARs seen by host if reset_bar is skipped for BAR_RESERVED
         Region 0: Memory at 2b28000000 (64-bit, non-prefetchable) 
[disabled] [size=1M]
         Region 2: Memory at 2800000000 (64-bit, prefetchable) 
[disabled] [size=128K]
         Region 4: Memory at 2b28100000 (64-bit, non-prefetchable) 
[disabled] [size=4K]
BARs seen by host if reset_bar is applied for all types of BARs
         Region 0: Memory at 2b28000000 (64-bit, non-prefetchable) 
[disabled] [size=1M]
>
>> +	}
>> +}
>> +
>>   /**
>>    * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
>>    * @ep: DWC EP device
>> @@ -1187,6 +1209,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>>   	if (ep->ops->init)
>>   		ep->ops->init(ep);
>>
>> +	dw_pcie_ep_disable_bars(ep);
>> +
>>   	/*
>>   	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
>>   	 * PTM, this capability structure is required in exactly one
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
>> index 8530746ec5cb..d103ab759c4e 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
>> @@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
>>   static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
>>   };
>>
>> -static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>   				     unsigned int type, u16 interrupt_num)
>>   {
>> @@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
>>   }
>>
>>   static const struct dw_pcie_ep_ops pcie_ep_ops = {
>> -	.init = dw_plat_pcie_ep_init,
>>   	.raise_irq = dw_plat_pcie_ep_raise_irq,
>>   	.get_features = dw_plat_pcie_get_features,
>>   };
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index ecc28093c589..4e9b813c3afb 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
>>   static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>>
>>   	rockchip_pcie_enable_l0s(pci);
>>   	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>>   };
>>
>>   static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> index e55675b3840a..e8c8ba1659fd 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> @@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
>>   	return &qcom_pcie_epc_features;
>>   }
>>
>> -static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = BAR_0; bar <= BAR_5; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static const struct dw_pcie_ep_ops pci_ep_ops = {
>> -	.init = qcom_pcie_ep_init,
>>   	.raise_irq = qcom_pcie_ep_raise_irq,
>>   	.get_features = qcom_pcie_epc_get_features,
>>   };
>> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> index 9dd05bac22b9..1198ddc1752c 100644
>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> @@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>>   	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
>>   }
>>
>> -static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
>>   {
>>   	writel(0, rcar->base + PCIEDMAINTSTSEN);
>> @@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
>>
>>   static const struct dw_pcie_ep_ops pcie_ep_ops = {
>>   	.pre_init = rcar_gen4_pcie_ep_pre_init,
>> -	.init = rcar_gen4_pcie_ep_init,
>>   	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>>   	.get_features = rcar_gen4_pcie_ep_get_features,
>>   	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
>> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
>> index c1944b40ce02..a7988dff1045 100644
>> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
>> @@ -28,15 +28,6 @@ struct stm32_pcie {
>>   	unsigned int perst_irq;
>>   };
>>
>> -static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static int stm32_pcie_start_link(struct dw_pcie *pci)
>>   {
>>   	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> @@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
>>   }
>>
>>   static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
>> -	.init = stm32_pcie_ep_init,
>>   	.raise_irq = stm32_pcie_raise_irq,
>>   	.get_features = stm32_pcie_get_features,
>>   };
>> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
>> index 9f9453e8cd23..3a6bffaff9ea 100644
>> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
>> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
>> @@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
>>   	return IRQ_HANDLED;
>>   }
>>
>> -static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -};
>> -
>>   static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
>>   {
>>   	/* Tegra194 supports only INTA */
>> @@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
>>   }
>>
>>   static const struct dw_pcie_ep_ops pcie_ep_ops = {
>> -	.init = tegra_pcie_ep_init,
>>   	.raise_irq = tegra_pcie_ep_raise_irq,
>>   	.get_features = tegra_pcie_ep_get_features,
>>   };
>> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> index 5bde3ee682b5..494376d1812d 100644
>> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> @@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
>>   	uniphier_pcie_ltssm_enable(priv, false);
>>   }
>>
>> -static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
>> -{
>> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> -	enum pci_barno bar;
>> -
>> -	for (bar = BAR_0; bar <= BAR_5; bar++)
>> -		dw_pcie_ep_reset_bar(pci, bar);
>> -}
>> -
>>   static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> @@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
>>   }
>>
>>   static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
>> -	.init = uniphier_pcie_ep_init,
>>   	.raise_irq = uniphier_pcie_ep_raise_irq,
>>   	.get_features = uniphier_pcie_get_features,
>>   };
>> --
>> 2.53.0
>>
--------------i4v83qQnVd0V0ruUHQVnQrDa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/02/26 4:30 am, Frank Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810">
      <pre wrap="" class="moz-quote-pre">On Tue, Feb 17, 2026 at 10:27:12PM +0100, Niklas Cassel wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The current EPC core design relies on an EPC driver disabling all BARs by
default. An EPF driver will then enable the BARs that it wants to enabled.

This design is there because there is no epc-&gt;ops-&gt;disable_bar().
(There is a epc-&gt;ops-&gt;clear_bar(), but that is only to disable a BAR that
has been enabled using epc-&gt;ops-&gt;set_bar() first.)

By default, an EPF driver will not be able to get/enable BARs that are
marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).

Since the current EPC code design requires an EPC driver to disable all
BARs by default, let's do this in the DWC common code rather than in each
glue driver.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Move this to DWC common code from each glue driver.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
BARs that are marked as BAR_RESERVED are not disabled by default.
This is because these BARs are hardware backed, and should only be disabled
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Needn't &quot;this is&quot;,  ... are not disabled by default because these BARS ..


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">explicitly by an EPF driver if absolutely necessary for the EPF driver to
function correctly. (This is similar to how e.g. NVMe may have vendor
specific BARs outside of the mandatory BAR0 which contains the NVMe
registers.)

Note that there is currently no EPC operation to disable a BAR that has not
first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
have to be added first.

No functional changes intended.

Signed-off-by: Niklas Cassel <a class="moz-txt-link-rfc2396E" href="mailto:cassel@kernel.org">&lt;cassel@kernel.org&gt;</a></pre>
      </blockquote>
    </blockquote>
    <font face="monospace">Reviewed-by: Manikanta Maddireddy
      <a class="moz-txt-link-rfc2396E" href="mailto:mmaddireddy@nvidia.com">&lt;mmaddireddy@nvidia.com&gt;</a><br>
      Tested by: Manikanta Maddireddy <a class="moz-txt-link-rfc2396E" href="mailto:mmaddireddy@nvidia.com">&lt;mmaddireddy@nvidia.com&gt;</a></font>
    <blockquote type="cite" cite="mid:aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
 drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
 12 files changed, 24 insertions(+), 86 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..cd904659c321 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
-	enum pci_barno bar;
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);

 	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
 }
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index ec1e3557ca53..f5fe5cfc46c7 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.stop_link = imx_pcie_stop_link,
 };

-static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	enum pci_barno bar;
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-
-	for (bar = BAR_0; bar &lt;= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				  unsigned int type, u16 interrupt_num)
 {
@@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }

 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = imx_pcie_ep_init,
 	.raise_irq = imx_pcie_ep_raise_irq,
 	.get_features = imx_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 5a03a8f895f9..1f5fccdb4ff4 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
 	struct dw_pcie_ep_func *ep_func;
-	enum pci_barno bar;

 	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
 	if (!ep_func)
 		return;

-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-
 	pcie-&gt;ls_epc-&gt;msi_capable = ep_func-&gt;msi_cap ? true : false;
 	pcie-&gt;ls_epc-&gt;msix_capable = ep_func-&gt;msix_cap ? true : false;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..55cb957ae1f3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
-	enum pci_barno bar;

 	artpec6_pcie_assert_core_reset(artpec6_pcie);
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 }

 static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7e7844ff0f7e..5e47517c757c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1105,6 +1105,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }

+static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_epc_bar_type bar_type;
+	enum pci_barno bar;
+
+	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++) {
+		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
+
+		/*
+		 * Reserved BARs should not get disabled by default. All other
+		 * BAR types are disabled by default.
+		 *
+		 * This is in line with the current EPC core design, where all
+		 * BARs are disabled by default, and then the EPF driver enables
+		 * the BARs it wishes to use.
+		 */
+		if (bar_type != BAR_RESERVED)
+			dw_pcie_ep_reset_bar(pci, bar);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Any bad impact if reset a RESERVED bar?

Frank</pre>
    </blockquote>
    <font face="monospace">HW reserved BARs like MSI-X/DMA will be
      permanently disabled.<br>
      Host doesn't see these BARs, Tegra194 ex:<br>
      BARs seen by host if reset_bar is skipped for&nbsp;<span style="white-space: pre-wrap">BAR_RESERVED</span><br>
      &nbsp; &nbsp; &nbsp; &nbsp; Region 0: Memory at 2b28000000 (64-bit, non-prefetchable)
      [disabled] [size=1M]<br>
      &nbsp; &nbsp; &nbsp; &nbsp; Region 2: Memory at 2800000000 (64-bit, prefetchable)
      [disabled] [size=128K]<br>
      &nbsp; &nbsp; &nbsp; &nbsp; Region 4: Memory at 2b28100000 (64-bit, non-prefetchable)
      [disabled] [size=4K]<br>
      BARs seen by host if reset_bar is applied for all types of BARs<br>
      &nbsp; &nbsp; &nbsp; &nbsp; Region 0: Memory at 2b28000000 (64-bit, non-prefetchable)
      [disabled] [size=1M]</font>
    <blockquote type="cite" cite="mid:aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+}
+
 /**
  * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
@@ -1187,6 +1209,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep-&gt;ops-&gt;init)
 		ep-&gt;ops-&gt;init(ep);

+	dw_pcie_ep_disable_bars(ep);
+
 	/*
 	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
 	 * PTM, this capability structure is required in exactly one
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8530746ec5cb..d103ab759c4e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
 static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
 };

-static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				     unsigned int type, u16 interrupt_num)
 {
@@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 }

 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = dw_plat_pcie_ep_init,
 	.raise_irq = dw_plat_pcie_ep_raise_irq,
 	.get_features = dw_plat_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ecc28093c589..4e9b813c3afb 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
 static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;

 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 };

 static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index e55675b3840a..e8c8ba1659fd 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 	return &amp;qcom_pcie_epc_features;
 }

-static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar &lt;= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static const struct dw_pcie_ep_ops pci_ep_ops = {
-	.init = qcom_pcie_ep_init,
 	.raise_irq = qcom_pcie_ep_raise_irq,
 	.get_features = qcom_pcie_epc_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 9dd05bac22b9..1198ddc1752c 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 	writel(PCIEDMAINTSTSEN_INIT, rcar-&gt;base + PCIEDMAINTSTSEN);
 }

-static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
 	writel(0, rcar-&gt;base + PCIEDMAINTSTSEN);
@@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,

 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
-	.init = rcar_gen4_pcie_ep_init,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index c1944b40ce02..a7988dff1045 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -28,15 +28,6 @@ struct stm32_pcie {
 	unsigned int perst_irq;
 };

-static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int stm32_pcie_start_link(struct dw_pcie *pci)
 {
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
@@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
 }

 static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
-	.init = stm32_pcie_ep_init,
 	.raise_irq = stm32_pcie_raise_irq,
 	.get_features = stm32_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 9f9453e8cd23..3a6bffaff9ea 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }

-static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar &lt; PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-};
-
 static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
 {
 	/* Tegra194 supports only INTA */
@@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }

 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = tegra_pcie_ep_init,
 	.raise_irq = tegra_pcie_ep_raise_irq,
 	.get_features = tegra_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 5bde3ee682b5..494376d1812d 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
 	uniphier_pcie_ltssm_enable(priv, false);
 }

-static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar &lt;= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 }

 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
-	.init = uniphier_pcie_ep_init,
 	.raise_irq = uniphier_pcie_ep_raise_irq,
 	.get_features = uniphier_pcie_get_features,
 };
--
2.53.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------i4v83qQnVd0V0ruUHQVnQrDa--

