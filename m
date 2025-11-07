Return-Path: <linuxppc-dev+bounces-13909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A88C3E3DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 03:27:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2jct24vXz3bs7;
	Fri,  7 Nov 2025 13:27:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762482430;
	cv=pass; b=F8jfG3LE5Ad1pOpZt20FyyEu7rx76nGM0jl2Eevg6IQnlJHPkcjp6dWR4Up+HOxY1aQlCQJzCYNYJOnVoa5+/5l55kmtYSuavEUZ34zyGh5cJ3ma/ukQOO7vrJDmy5/M2MgvBYBE97V0QjGpsL/B78YrMH6VsNHyT47gdSaAsSTAseSdm59hZGiP9QKnttZpwrtimb2QtHLbzx8nvudL+sRP4oXTnHpnI9tF8Ep35tF1t8kPPwE/Dzu9PYxkhDtPJ+3ig3FdQQ9IrRQXqYmIZh3cvsNza5DC3zrqd8FC9hsazaA+LHMrYOwx3r51NrtQDmUxTZQ9jMEipGtCBbZvUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762482430; c=relaxed/relaxed;
	bh=MMDT61fMZULAV8zatrtVom0ptBo1O06NwhFNHwTJmGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bxaSMGOoyVqK1pTEvEE99uqyPC7ifCkrOEsLQRc8rIUZNFBb+vNXhuS728LtB+Rz/mlaGsqqJW21dpWryhrsjWpPYHz9zUMhub+4pBkrlV0AM9/Vx000OkTI0+NzvcltMNmmriSLB4JkegtfABxRJA46FNZBlC+u7G1eSFY+b7oqgNFuBZwAfeL27bXKpms+jtZDD3X44ym/ma3MiOZTC46MbtDjG/rnIZlnzPj12KKCt0P8G28mx6rhFpOmGmdmY+ankduN3dBzbURU7LhjmmpkvNTWoAq0KYy/hyxJxkGoXmBWihEkehQyXwUc5CVtcRAYUkZzWMer9MEEelbZ4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OTCSzePx; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=hongxing.zhu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OTCSzePx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=hongxing.zhu@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2jcr2y6Xz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 13:27:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxWKzob28vML1O2+LdzrXSmHHuj+p7i+9iuZJnaVrxWOV34HJnB0vVSEbK6/sxxnMpByMifYzHORIcpACvSkKzhhhq13ZlU+QOYDfPmIoa8vMoIvs6Ejs4KsHBoOtkj9HvL3yXfmprba37R7OuNJ2c6KGfv/wY4BluImfvqQRLqGw+wR5EXgx0jehdeYXUHUIttmyZvtUy4dq+QzGbKZv7+jg6YkGeIcxVXeGZLms8+q5X0EIC2O5eKePj9NpCmmyS3fU8SuaqXKHRinv1env6n/yX+Q4czmWvg8H7OjZj8hgV5dq/AP9LFwYldmG9uS98DTJTk9HrifE+LxpJscRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMDT61fMZULAV8zatrtVom0ptBo1O06NwhFNHwTJmGE=;
 b=LpEUiY1z1nh3owwcLayKta6sj1noEuLpXQoHR7A8W+XHx37o0vWS7iCd5HfkYJlcKtdrrzObztXJCctGeTjYY6iNNDVmLMeL5P+Ib0mlyXKbkMpoHuEBJHUD1LKTuLJ0V1HrAUgVp8Hy61RwMe3zzEDMdFm5CpmWklHSII+gZ7HZOH69vHQJnTNCWyQRrfhZnKDyM+EAx1fQONQVtoexpkGJRoyaw4t0JQQzwBQH/xeJdNAA5GjLM6YfQJgt8AD2fpptPFTlQ6Jj3C2Wni7PqIgBx/4qE2t3fwIw25iHZHDvOVVuATG6IAm1HVkuRPAeJMcRkISbNucKDQpY9xgiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDT61fMZULAV8zatrtVom0ptBo1O06NwhFNHwTJmGE=;
 b=OTCSzePx/ii3L/+4nb/xdrcuNU8Gyb2x9K+BhIslSfXWxDt1Q3a9GT+MvXzt1QkPmt1VWGNAjwU/GbcpaRkWOauLysrHUWBw+gHgrxGDF7b1Wb+TMvKlZv79j8r+BjmjP+8GAbrU60ay/Y1c0dgY91vpxBncy+jCiKp/YArsby17dgjjoHttZVI45n8B4C8IZQgg6juuq1RUXxj6ux/SMbJKQw1nH25SYeKGZT0JxrRs0O9H6WFT/SYLy7l1SNNDiaZoEn9EDM3X9OCXrxC34gqitC8bQz5VRotcBgWZvz+/sKu5X/duR0FO/Her2+zLtQgWwSknp75M72inhi5wWA==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 02:26:41 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 02:26:41 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Christian Zigotzky <chzigotzky@xenosoft.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, mad skateman
	<madskateman@gmail.com>, R.T.Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky
	<info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"hypexed@yahoo.com.au" <hypexed@yahoo.com.au>, Darren Stevens
	<darren@stevens-zone.net>, "debian-powerpc@lists.debian.org"
	<debian-powerpc@lists.debian.org>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, Lukas Wunner <lukas@wunner.de>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, luigi burdo
	<intermediadc@hotmail.com>, Al <al@datazap.net>, Roland <rol7and@gmx.com>
Subject: RE: [PPC] Boot problems after the pci-v6.18-changes
Thread-Topic: [PPC] Boot problems after the pci-v6.18-changes
Thread-Index:
 AQHcOHIWjWIT9DkJQUGQ294huL/k9bTAmXgAgBrKDACAAg+AAIAAJweAgACY44CAAztvgIADYnCAgACvLyCAAKR4gIAAelIw
Date: Fri, 7 Nov 2025 02:26:41 +0000
Message-ID:
 <AS8PR04MB8833C5AA0EB4DFD6C6B174058CC3A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References:
 <AS8PR04MB8833068EEAD864886D2C8AA88CC2A@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <20251106182505.GA1962607@bhelgaas>
In-Reply-To: <20251106182505.GA1962607@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|GVXPR04MB10969:EE_
x-ms-office365-filtering-correlation-id: 52e0de8a-d794-4fea-1b33-08de1da51671
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?TFIveEJFQ1ZWZ2dISFBYUzQyTk5qYmkrM0c3TFdvV2lzdU01T1pmelNyMytN?=
 =?gb2312?B?UktlbS9PNWtxWHovR2FkdGFwYkxaamtRTGNIQXltN1hxMzF3YjJGdTFybkQ4?=
 =?gb2312?B?RVRvWGw5UnprZ3EvYm1uQ05Ka0pPL2hsZGRZOHFFUzN2WDZ5ZHFIdXJIcHdv?=
 =?gb2312?B?ZlBVSjQzaE1YY0VIYTFrME1WY1ZiVkhhVWM3d1ZaaFdsWjhyUVZaQ3gxNXo5?=
 =?gb2312?B?S3VmZExXdy9zVEtoRVhxYW5KdXp1eGpvUHBKZFJ5elh4Vk9uSzFmcHJTZ3dn?=
 =?gb2312?B?YjNqcHMyNUg5eVMzR21Pelc1SGhsTFNLUThZTFcvNXEreHJTWis0bmZ1SUcw?=
 =?gb2312?B?LzJTQ2JLN25QOWwycUkwdEtoVVhCVENVc0RFbmNZUDVhNFFtWE1tZzNDSndV?=
 =?gb2312?B?ckt4MmRuNHU2d1k1VDFubm9jb1BNanVFdys0ZTI5ZkRneWFKOW1VQzhOSTls?=
 =?gb2312?B?YUxQcTBDc3B2YnliNTJwVTNUWjhrbUpMNUFWd3V2TzJPVW8zam01RUwzK2RF?=
 =?gb2312?B?Mm9sUS9EdElYV3ptSHk1Qk5GOXNhY2M5c25vRVBSSmkyaEFjcEpzMXh1T216?=
 =?gb2312?B?Ly8raS9qKzJyb0VaUnZoNTA2NWM0L1BvU2M2TUxqMmlYc3VyUm5HMVFrbUxC?=
 =?gb2312?B?bkhseTU2cXZIa0lEVEFHUURPM1RoV2VzT0VKeWdjRTlLVklHMW1ZK1N6LzNy?=
 =?gb2312?B?OVFEVFk5WHBDYkxOT0J0a2ltN2ZWLzRjQU12TjZ1cG43VmxMQnJBcWlhU24w?=
 =?gb2312?B?b1pXa0YwN2lpRzRmWDcwZ3c4TlhOdlV4c0Z2cFpwbzZEU2ZKd2tBdjEzc3Bp?=
 =?gb2312?B?YnJNUXlNOG4xd1BPWnJUTlNsL1h6cHk5anVsVXRkaVpiSnlha1lvVVYvM0Zs?=
 =?gb2312?B?TjVVTStwandmYUFqNUM3eUZ4bktMcVhDK0d4U01OZ05UUHNFMDE1b1VPRk5l?=
 =?gb2312?B?OWQrMVJpMWRnSzZnRmVUSVFoZEU2dEhUN0JjRStOdnFjUE5LZVpFT3YvcUFB?=
 =?gb2312?B?WDNwSFNzUkUxM1RjeFEzcWJ0OGIxUGV0RXFoRjVuKzRzZHA3VkJGV1QvbU42?=
 =?gb2312?B?dWh1TmlRby9CZ0l5MjVLanFHK3QrbXg3b0ZSRlVRTmR0Uzlmd0kvU29PQmZS?=
 =?gb2312?B?Ym9YM3p5UU5PakpiWk5jS09tKy91clBPUnJ5WVdLMjJnNVNIclhncytjb1dY?=
 =?gb2312?B?MFpRTUFQd3ZnTHZGN3ZkRGxTbHVwZitiZ0F2WU9ZSXZ6cGhqc29qa2dUVDZX?=
 =?gb2312?B?LzBoTWs1RUxIRkdXNUJLQ0N1Y2hQajRSRTFKdEVOajUwelFCbUs1NTNXWWZ6?=
 =?gb2312?B?YWdlK1hjbXpxWE56bmIzcWRJbS9LZWZmSUN5SVdkNlBWNnNaT2QzaVJBSWZ0?=
 =?gb2312?B?OTJkbmQyVXZ2eWVNYUQzTDl3T1BFRHZxcHEvYmdSZlBNbUVIekpuL0xHd0U4?=
 =?gb2312?B?ZyttN3czRmdkZGdFV085WWh1T2dZZEU5Qk9nRWlrZHlVeWhIZjYrY1VuRXdQ?=
 =?gb2312?B?dVcxU2ljVG1DdUkrQy9rS0t5RDJFU1NzMWNsTlB1K3A2OUY4MFBWRzJZODlI?=
 =?gb2312?B?Q1N3TE5MeG9pSFIzWHpTaEh5SWFJalEwS1ZPd0FuMmRaZ1NwRXp2NHNRblNq?=
 =?gb2312?B?UDFla3lNTDM3NEFoc09aZk8xbytCZ2tTZHkwNnI5RTh5WjVxWWlTcU1kOWFY?=
 =?gb2312?B?WW5kMlZRN250V2ZtRWJIQjdVK2RmQkswZk9EQUFQUzUxb0EwYWZLTUJvNzh1?=
 =?gb2312?B?WWRyZnBSRDkwbG84TzhhVURjMnREdjM2ZmZWeFhsQmhkTnNQUkRiTDAwYWJr?=
 =?gb2312?B?eHF5U0ZLWW1zWUo5b2FrTzFYOGxLdUJtK0g4ek92cG9rbjRxUEtsM2hFaERV?=
 =?gb2312?B?bCs3aXZpOG1mRUpxaUdqbjhVcldQRW1FcDB4V3JlMWxQQzNPSXQyNUE3WWFQ?=
 =?gb2312?B?MDdyUFRaM085a2hMU05hYWRPMmdwc1crZ05xVmFwaERBUmR3Wmg3c0JmOW5E?=
 =?gb2312?B?cXhGWllVVWJ5cjd5N0JicWdwbGRxSTVqdUFENVBVZnBPK3NWcWVoeUhtS01J?=
 =?gb2312?Q?D1uMUi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Y3NiRzU0UnpxTFE5N01CVG11M1VHMXk1TVV1UGpUMFlZZnZKRVFNSjgxWk5W?=
 =?gb2312?B?b1pqUjh2RXRuSzRiWndUUFFvWFAvUWp6alF0ckVLeUlpMVZaQmpBUjVkZDdI?=
 =?gb2312?B?SjBtRmNZNTRtbGtjbTNIaEhDZFg1cDVpZktmdE5SSWtwV2Z1bm40S1Bhd0tU?=
 =?gb2312?B?Wkt6ZkxMbk5ONWlUYUtQQjV6eUFEbzZqemFpRG52a2pnVXErcnlOcE04cDJV?=
 =?gb2312?B?dzBPeVdHTHJPQ0NNTmJJWEs2aS85Vi81UFNzOTNEYi9CbDlvWVlNQlFZYXQ3?=
 =?gb2312?B?T3JJSjM2TGpxRmdCaWR0RTdVelIybFBpMXhmek1ZRFhOZFRTa1l4YU1sdWpp?=
 =?gb2312?B?YlY1NXcrRTZQYk1Ubjk5Q3JjaGw5bmZKb1NnWGRyZitMKzVUWVBvL0F2ajlM?=
 =?gb2312?B?UkFQN2xWdnI1RjNPWDRXZ250dm9LcW93VGtVU2lXbXk3OXpnUDYxVmVITUVI?=
 =?gb2312?B?N3B2Q1dlNWU3VXp0YmdteXBoUDFaNGxBWVJpd0d2R3VJZmNoOTZwRXNpaGhD?=
 =?gb2312?B?UVlwOGtRbzFZbmJlYUY0Wk5COGxWSFZYbURmdXlOaVR4dE9vR3U0eGtRRGV2?=
 =?gb2312?B?N0MycElPWm9QdUlLSnZaQU9MT2xoZlA2NkxvUEFVb21HTDBUZmt2WTZaaGJv?=
 =?gb2312?B?N2JHdXBGY1RVc0Z5dGk0aVZIazBBeXpETXhTS1MvUlA0dFZWTkFtVnJvNExh?=
 =?gb2312?B?UGFqZDkzQzFSSEd0UzlXY3N3ZWlzQzM0bDlEL256TzVGaGxSVVlVOThKN1dp?=
 =?gb2312?B?Vms0WmhvNXl5OThnYXhiOFB3Q0RKSHNTVlZlYkJYbjU4MmpvNlpvaDRNMzFX?=
 =?gb2312?B?U1NXZ041MTRRUENxYTUrTTkwSFNXUS9qSU9xaWkxUVlGNjlVTGg0dDhPTXRq?=
 =?gb2312?B?aXNXZGx6TXJ5TmRGVjZ1QlNzN2k2NkR4M3NRaHN1ZDJaWW9sbkgvWVpqUDdB?=
 =?gb2312?B?eHMwQnV1TEhPS01lbzk5djBhSlVaNzlqbTZHSGIzNmd0Z0hiaFFRUDBUbEJp?=
 =?gb2312?B?NTB6QWlMUVBWdUJtLzF5NUx2bkJRdlZVVWZ5UU1UdW95V05jelA5Q2MwSmo2?=
 =?gb2312?B?TDVUb3VvMWluUkM4VDdlNTJIeXQ2eWsrdU4yM1BUK0oraXMySmtJdVM4U2Er?=
 =?gb2312?B?SU12Sm5tTStnbkdHTDJ3ZTUwV2loSVVvSWR6N1dXNmxuQzlwbW56MzY0UWpz?=
 =?gb2312?B?ZFNwZzMwb3dwYWFodUYrUUdML3B1NUowdGE4NWpmNmRUV3VLUS9ZVXg2ZGhE?=
 =?gb2312?B?NUkyUDk4YVdETVI1aU1wSThGYnhGbUo5aTJ6TFk1d0I4ZkwvSmsrU1Z3Y3Z4?=
 =?gb2312?B?VW9ZR1FhNUFpOUlMcXV6eE5pQ3dpbUVNK1oxUGEwcXVpZzdkVWVaRHNTWTlO?=
 =?gb2312?B?Q3BOcy83VmhyT3lPdmxoTXlzalJmWEtneXM4M3ZYTU1RWDZVbW1FOEsxNE5y?=
 =?gb2312?B?Q0sxeHU0NjRycjJIbGxPMTFDc1ZSbDc0MEJRcnhEZXJTcGhMcTZicXZOWm45?=
 =?gb2312?B?cHlocVNUTCtqdjlnQmVHMEhLTStPNnZRdkQ0WEVEcnpYVHFRRDVXT2RVd2gy?=
 =?gb2312?B?NUVmYUMxaEd3SXRYZ01ZZmUzNkdOejVmVWR3by9SbWp5OGMvSmk2bkYxQ1Nn?=
 =?gb2312?B?cHBFZjZPbUlodnF6NmszT2xsQXVQZHArd3pkL0oxV2xmZDZGcGNOazQ4Z04r?=
 =?gb2312?B?YVB5eWowSkljWjBFUkpUMzZWaXJSY3hid3NwMkFTRmsySll3RDZVbUpvRG11?=
 =?gb2312?B?dEhBVHozY3JXYktQNkE4Kzg3QXFoOWpOb1Q5T2t0TlpQbzhhYXdFazNSVDhZ?=
 =?gb2312?B?b3ZNK212blJ2U1IzajNTYVZLdzVucjlMRytCa0FDSHhYalg3UkhPYlk1UWc5?=
 =?gb2312?B?cU5RazVweFhSSDRlTnlmWW5BbkhkVVpraUVNREx0d0IyeFZQcGs1Y0lCS2Uw?=
 =?gb2312?B?V0tSZUZaS00zQXlTeis2RzhpVUQ3VXliS0N0a2plNHdIZDUwTy9veURmMmlW?=
 =?gb2312?B?L012UUNDZWlleE1YYWZYZzdJRnM5aGQ4M00wL3ZjRkRtWlhvZTlkd09jbStX?=
 =?gb2312?B?ZFZhSGgzaEIrSFQyM3VKdVBKNGMvbmNETURKUUpreko2cXhKYXlFWTJOQTlp?=
 =?gb2312?Q?p98kZ5+1VeC9Tt17lniggYLqS?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e0de8a-d794-4fea-1b33-08de1da51671
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 02:26:41.5939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioeRwUWSzWhlEAkdz2Z4cmC7H5lecQW/EdQa2zLrMMs0vsyIqyGHvxRNRXIuvK6xT3GIM4V8wYUFwo/oPTAYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCam9ybiBIZWxnYWFzIDxoZWxn
YWFzQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjXE6jEx1MI3yNUgMjoyNQ0KPiBUbzogSG9uZ3hp
bmcgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IENocmlzdGlhbiBaaWdvdHpreSA8
Y2h6aWdvdHpreUB4ZW5vc29mdC5kZT47IE1hbml2YW5uYW4gU2FkaGFzaXZhbQ0KPiA8bWFuaUBr
ZXJuZWwub3JnPjsgQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT47DQo+IGxpbnV4
LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IG1hZCBza2F0ZW1hbiA8bWFkc2thdGVtYW5AZ21haWwuY29t
PjsNCj4gUi5ULkRpY2tpbnNvbiA8cnRkMkB4dHJhLmNvLm56PjsgQ2hyaXN0aWFuIFppZ290emt5
IDxpbmZvQHhlbm9zb2Z0LmRlPjsNCj4gbGludXhwcGMtZGV2IDxsaW51eHBwYy1kZXZAbGlzdHMu
b3psYWJzLm9yZz47IGh5cGV4ZWRAeWFob28uY29tLmF1Ow0KPiBEYXJyZW4gU3RldmVucyA8ZGFy
cmVuQHN0ZXZlbnMtem9uZS5uZXQ+Ow0KPiBkZWJpYW4tcG93ZXJwY0BsaXN0cy5kZWJpYW4ub3Jn
OyBKb2huIFBhdWwgQWRyaWFuIEdsYXViaXR6DQo+IDxnbGF1Yml0ekBwaHlzaWsuZnUtYmVybGlu
LmRlPjsgTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Ow0KPiByZWdyZXNzaW9uc0BsaXN0
cy5saW51eC5kZXY7IGx1aWdpIGJ1cmRvIDxpbnRlcm1lZGlhZGNAaG90bWFpbC5jb20+OyBBbA0K
PiA8YWxAZGF0YXphcC5uZXQ+OyBSb2xhbmQgPHJvbDdhbmRAZ214LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQUENdIEJvb3QgcHJvYmxlbXMgYWZ0ZXIgdGhlIHBjaS12Ni4xOC1jaGFuZ2VzDQo+IA0K
PiBPbiBUaHUsIE5vdiAwNiwgMjAyNSBhdCAwODo0ODoxNkFNICswMDAwLCBIb25neGluZyBaaHUg
d3JvdGU6DQo+ID4gLi4uDQo+IA0KPiA+IEkgdGVzdGVkIHRoZXNlIHBhdGNoZXMgb24gaS5NWDk1
IEVWSyBib2FyZCB3aXRoIE5WTUUgc3RvcmFnZSBkZXZpY2UuDQo+ID4gQmVjYXVzZSB0aGF0IGku
TVg5NSBQQ0llIFJDIGZhaWxlZCBlbnRlciBpbnRvIEwyIHdoZW4gb25lIE5WTUUgZGV2aWNlDQo+
ID4gaXMgY29ubmVjdGVkIHRvIHRoZSBwb3J0IGlmIEFTUE0gTDEgaXMgZW5hYmxlZCBpbiBkZWZh
dWx0Lg0KPiA+DQo+ID4gVGhlc2UgcGF0Y2hlcyB3b3JrIGFzIGV4cGVjdGVkLCB0aGUgbDBzIGFu
ZCBsMSBjYW4gYmUgZGlzYWJsZWQgYWZ0ZXINCj4gPiBhZGRpbmcgdGhlIGZvbGxvd2luZyBxdWly
ay4NCj4gPg0KPiA+ICJERUNMQVJFX1BDSV9GSVhVUF9IRUFERVIoUENJX1ZFTkRPUl9JRF9QSElM
SVBTLCBQQ0lfQU5ZX0lELA0KPiA+IHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDFfY2FwKTsiDQo+
IA0KPiBUaGFua3MgZm9yIHRyeWluZyB0aGlzIG91dC4NCj4gDQpZb3UncmUgd2VsY29tZS4NCg0K
PiBTbyBpZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB0aGUgaS5NWDk1IFJvb3QgUG9ydCBoYXMN
Cj4gUENJX1ZFTkRPUl9JRF9QSElMSVBTLCBhbmQgaWYgQVNQTSBMMSBpcyBlbmFibGVkIG9uIGl0
cyBsaW5rLCB0aGUgbGluaw0KPiBkb2Vzbid0IGdvIHRvIEwyIHdoZW4gc3VzcGVuZGluZz8gIEJ1
dCBpdCAqZG9lcyogZ28gdG8gTDIgb24gc3VzcGVuZCBpZiBMMQ0KPiBpcyBkaXNhYmxlZD8NClll
cywgaXQgaXMuIFRoZSBWSUQgb24gaS5NWDk1IFBDSWUgaXMgUENJX1ZFTkRPUl9JRF9QSElMSVBT
Lg0KSWYgdGhlIEwxIGlzIGRpc2FibGVkLCB0aGUgbGluayBnbyB0byBMMiBvbiBzdXNwZW5kIHN1
Y2Nlc3NmdWxseS4NCkJ1dCBmYWlsZWQgZ28gdG8gTDIsIGlmIHRoZSBMMSBpcyBlbmFibGVkLg0K
DQo+IA0KPiBJIHdvbmRlciBpZiB0aGUgaXNzdWUgaXMgd2l0aCB0aGUgUkMgb3Igd2l0aCB0aGUg
TlZNZSBkZXZpY2UuICBUaGUNCj4gY29tbWVudHMgaW4gZHdfcGNpZV9zdXNwZW5kX25vaXJxKCkg
YW5kIHFjb21fcGNpZV9zdXNwZW5kX25vaXJxKCkNCj4gbWFrZSBtZSB3b25kZXIgaWYgdGhlcmUn
cyBzb21ldGhpbmcgd2VpcmQgYWJvdXQgTlZNZSBhbmQgTDIuDQo+IA0KVGhlIEwxIHN0YXRlIGNo
ZWNrIGluIGR3X3BjaWVfc3VzcGVuZF9ub2lycSgpIGlzIHJlbW92ZWQgaW4gbXkgbG9jYWwgY29k
ZXMgYW5kDQp0ZXN0cy4NCg0KPiBJIGFzc3VtZSB5b3UgZG9uJ3Qgd2FudCB0byBkaXNhYmxlIEww
cyBhbmQgTDEgZm9yICphbGwqIGRldmljZXMgd2l0aA0KPiBQQ0lfVkVORE9SX0lEX1BISUxJUFMg
dGhvdWdoLiAgQXJlbid0IHRoZXJlIGVuZHBvaW50cyB3aXRoIHRoYXQgSUQgdGhhdA0KPiBjYW4g
dXNlIEwwcyBhbmQgTDE/DQo+IA0KWWVzIGl0IGlzLg0KDQpJIHVzZWQgZG8gdGhlIHRlc3RzKEwy
IGVudHJ5L2V4aXQgd2hpbGUgTDEgaXMgZW5hYmxlZCkgd2l0aCBvbmUgSW50ZWwgODI1NzRMDQog
TklDIGFmdGVyIGZvcmNlIHJlbW92ZSB0aGUgd29ya2Fyb3VuZCBvZiBlMTMgZXJyYXRhLg0KDQpJ
dCB3b3JrcyBhcyBleHBlY3RlZCBpbiBzYW5pdHkgdGVzdHMgYXQgbGVhc3QuIFdoZW4gTDEgaXMg
ZW5hYmxlZCBpbiBkZWZhdWx0LA0KdGhlIEwyIGVudHJ5L2V4aXQgaXMgZmluZSBvbiBzdXNwZW5k
L3Jlc3VtZS4NCg0KPiBBbmQgSSBzdXBwb3NlIHRoZSBiZXN0IHRoaW5nIHdvdWxkIGJlIGlmIHdl
IGNvdWxkIGVuYWJsZSBMMHMgYW5kIEwxLCBidXQNCj4gdHVybiB0aGVtIG9mZiBiZWZvcmUgc3Vz
cGVuZGluZz8gIFRoYXQgd291bGQgcmVxdWlyZSBzb21ldGhpbmcgZGlmZmVyZW50LA0KPiBsaWtl
IHNvbWV0aGluZyBpbiBpbXhfcGNpZV9zdXNwZW5kX25vaXJxKCkgb3IgYQ0KPiBERUNMQVJFX1BD
SV9GSVhVUF9TVVNQRU5EKCkgcXVpcmsuDQpJdCdzIGEgZ3JlYXQgaWRlYSB0byBkaXNhYmxlIEFT
UE0gTDBzLCBMMSBldmVuIEwxU1MgYmVmb3JlIHN1c3BlbmRpbmcuIFNpbmNlDQpMMi9MMyBpcyBz
YXZpbmcgbW9yZSBwb3dlciBjb25zdW1wdGlvbiB0aGFuIEwwcy9MMS9MMVNTIGFueXdheS4gQW5k
IGl0IGNhbg0KYXZvaWQgdGhlIHByb2JsZW1zIG9uIHNvbWUgZGV2aWNlcyB3aGVuIGRvIEwwcy9M
MS9MMVNTIHRvIEwyL0wzIHN0YXRlDQp0cmFuc2l0aW9uLg0KDQpCZXN0IFJlZ2FyZHMNClJpY2hh
cmQgWmh1DQoNCg==

