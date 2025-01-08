Return-Path: <linuxppc-dev+bounces-4873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E88ECA0673A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 22:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT1Qd3Txcz2yHL;
	Thu,  9 Jan 2025 08:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2414::60a"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736372073;
	cv=fail; b=Zk2kFJsvWZxQTEqamIXGpi1sA7Slty4l1NV+3V8Acezg5lUNyY2nMAwyTaZkN28Wo/ohDUfZAAjGuTj2jM17/x9rLZQptOv1S7z1SzZ005xFVn3ouepRHVe/etY0mc4CoaXrnYorh6mzA8/PhY2QpC8VEZ1y9I2ktd1bTHeA3XEpQO/e4HVgHpvFV+venJTkEsrVawtW4VdrYnPyO3wN7Mm8rmfZF0iYwxwO464SpydZdC3TNCfwrI/UbZkG+gM+JfmENFmYs3ylb/hY7PSuaF08naeQnPfPV/kcCtmMrQNr5Snu99xd6NNpbA5n+4+AGFeK7w6aHD18IPofhHUQUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736372073; c=relaxed/relaxed;
	bh=aIU+mJEUiN5/9w0hAwn6G82VIwYqZioMHSDcjzNQvmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gOqxEzKYZw/nZ1poP+7D+h6kT3sZyp5NAy1zCjLkTouJrw8T3lYqE+sdnnLJjWeYxaXn8v/pwTeGTUUT2bxO1F1Ewgj1qCGQmJkzrQX7tCZXHfa0/LT07SNrkUiaRz697W8B7F7U6vboRozUEFkiu+BdAu37SEBdN9KdLotWrHbQNq/piK52usC51hOfeEV9JaJP8ptoBsGprkA7bz05dzJRakgqbA5puW7sDPuFZaLd5kmdwy7sF4zZ6y8AveEeMOmUQJlmEN36SxUEK2cLGhJYhvOQJirKaSUXVaNujPmQF9DibqHynT6lHb+9QKM8/rquequ3saLXNn8UlUlMIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XTi0vppo reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::60a; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XTi0vppo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::60a; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT1Qb0LS8z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 08:34:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6XbHERRFuC7G0n/iwdbqwMNySV4qGztQF1+YVAYJt77rdITq0irg70YCt4lRP551Wy5bHXPIRfcBAlOKlxArX8/7ZahNANcnwRsfNgFWuvIuCI2KEpsyaPX7b/aZkAmXtRsZgM4CokpQ2aw/Xtvr8BStuO+9xaejRfGrBCOsdKYHVFb27YC26OOqMRsu8mIENWBi4x9396t23UMn6CTqFs6jPry/s4EjlAbikkseVlTvvsuy1tWP/Mwqu/oRH6x8VezmzKBgVk6sz0pjpvvEOpEg7eHULQ9Xj0y4HdcULfiOVNcUBjCircOArcn4X5GqEBaB+c7yoZSWo2gbbRaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDD4YIoy6Z3hBGF36o6ApWhHtkpkuUMzS6EIr6E7mdM=;
 b=RfR2s5QbljIxjg3NqlCVfS+9PhDfpaIias05CeOtPEYI6h0e6zxZulihT+ceoO9iOr2X9+uDiECAOkWhk0kvM20uF1UqRli7ljWy6jbpkfABIFwocflY/HFMGYfhCF+bsfXc4fJPQNGXdRBMANs/RN99TI/R4ZGR+OlmJGh5R/u7eJcwC/1cTk8Ikkov49M6yGbl19+R+aPxzLyoVDr6RsBQmUOA2ITXelypdap7CmvSupR6/JIAqfSZLr0FuNh04o5QgKJA3sSQsd0R650NRXlSOd8RfQLilMiDKqWT8A2lsZ4jJmvlgLUUlCysrgzzSOhTC2TJ5PKJrKH3eEIZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDD4YIoy6Z3hBGF36o6ApWhHtkpkuUMzS6EIr6E7mdM=;
 b=XTi0vppoNhGQ3F5J4oc1RmjelSjfaotobZ5XAKl+VimbP18p/CqsetwA0boNGiN1RVQxStfZOsdU9dArbmRgyQOzsAUgihVx04IU7K4mxD+3KvwxCRQmotyn80DqhTRTSMgjOMBuT21rzDiU0XjfhT0I+akerbBZhIRtECJDCB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Wed, 8 Jan 2025 21:34:07 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 21:34:07 +0000
Date: Wed, 8 Jan 2025 16:33:59 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/7] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <20250108213359.GC1342186@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-7-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-7-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BLAPR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:208:32e::19) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: af95ae55-deef-4703-8b22-08dd302c2e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?p0AbWN+EMsM1a98R4cBD/eLMJOjZeaAW1yoHZLvhj1B2lreaGAzJP9T6tc?=
 =?iso-8859-1?Q?hDQQYc01T97B59nxpfbyy02/NizMN+V/ntL4Cuo+IkST4cgusqjxJzNOSY?=
 =?iso-8859-1?Q?YWWk/XkqfmDAX2trQbDuNGB7UrqHUBgeKsMoHr7BbF6sWNA+9BGP8syeMa?=
 =?iso-8859-1?Q?ynoUs179fvXqa6pmnKdswnPeWg2SE7rBX+9+zPE3pXoZlQNiaXz+kuRQ6m?=
 =?iso-8859-1?Q?ruKgqeOoqgnlQ57DVxHhUcQtMMrWQhIQPSYzF2CFpMptQct/EBzBoJjKLX?=
 =?iso-8859-1?Q?v4XcgjZ4s0FAqUyyXVWkpmqhqhnt1nnaOZk6snOnpvVgpyOnQyH4qokgrZ?=
 =?iso-8859-1?Q?vdElBdJKpLWS+6c7TAzvLHLVpr/2Gni7C3e/3LkYI6F6jbnwNqlru7rSy9?=
 =?iso-8859-1?Q?DyruVKQBWgasceKsHJeftn4hW1Gr5ozedbt3s8Kzl5kLlv1vwZyB5zPidh?=
 =?iso-8859-1?Q?NotG9EQQr98wfEgJW2dXQEeglbHoNo3/wlAvl15ITKAA/IB5HgKps7Uucb?=
 =?iso-8859-1?Q?glZaQmFrmppolbigFp6idhS8yiX4DDqeKTaM/g//CpPQ4CqkUbxDsrND4J?=
 =?iso-8859-1?Q?X28+zNST3gCSPBNdCAK+1RxEM7Os4U/PULPMltCk3C2+RgTJ+SvkXVT8Mv?=
 =?iso-8859-1?Q?8FN/mbgNIGU5V8MHzGuUzHFZrvcrat7rkz8H+p5tmCkWOVZ1tKoPskkxvC?=
 =?iso-8859-1?Q?UfKQvK9P+S5FduZ3VHIR/6a26KbuFvPSC8QkPLEAot3LQ3CiTmVSsOwsHy?=
 =?iso-8859-1?Q?EOGx5G6THsopNCQ0xCws3b/nw5Kh5InClhiR6f7xi7b2TX24YPmxMqoqYn?=
 =?iso-8859-1?Q?TkCEx1kOQIHhnAKY3TdPYGOsNj7i68IL7sg9panWUEtwQbIg9xa/XQ4Ka4?=
 =?iso-8859-1?Q?INv4nS3As6J+0V7VDQCGlRtbVQSssQjxlt0ULVwm7zK4DlicQe/cS2HrhL?=
 =?iso-8859-1?Q?9wWFmv9sqoqLaTgW075rohnXlgpPpytA6ASRVG95nm9QE+pqz8+zKecIdt?=
 =?iso-8859-1?Q?BzzbY43aDvYdpocobQsWAv0wegJCZFnsjplslJYN8cFQCmpDfqQPufZNKH?=
 =?iso-8859-1?Q?3tXcV3jZfCSJzIf13fPJQhe2utnZuTgepxzx8weZXN7ZHLOaKnb34Cv1th?=
 =?iso-8859-1?Q?/+Rq+UZMDfhsdyqSq0qQBKZnramkIGeHsYNIgWtfaemkKn8lE8KBgyptbf?=
 =?iso-8859-1?Q?c7wSZU0Q+s44C3YTBiqAsmQlSGAMUnCyiatx8iIfvtcok+n1N627yrWG2p?=
 =?iso-8859-1?Q?uNExXcJv4yuXKTBA+SZ7U/SOaDrwr4D+qMbTE9/jgIhkPQO+JrCnGp5IkU?=
 =?iso-8859-1?Q?kWgqt7PGy8ERrQFlYtPoXk8JXLsgx9uSV/VjHr1ab4MZ0aFI3BtHei2SV4?=
 =?iso-8859-1?Q?YtstCJNVKOQrRnkRX6Vvi3PRnS4frlaCRvSd0zr2NCtReTKEdgBLgMNpIK?=
 =?iso-8859-1?Q?j8SSrsPkr3qO17L/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FmRgWqUjSgM7C2hVZ6JmfmbyjjSZmVCidD9hrM8DBZnB8APCFWn9wj05Nn?=
 =?iso-8859-1?Q?Yyabgdg24tZUM1hccL5xh6eN3vtClqcBj+ec4ur7uaL3jFnsmNISkIJ2FJ?=
 =?iso-8859-1?Q?GLAFp3shYpxnHDGYxGIzHbrdskgW3LzgzhsrO7/Pfldq3xPIiQAmw3B9c0?=
 =?iso-8859-1?Q?+a5F/YR9JxnRyN69qmFVa06h9/CZ07pqKvLyOWXyeIhnAPp1go/NSSFrGJ?=
 =?iso-8859-1?Q?4R+tfsao1PJ1PZ217Qhp5o1d2X1A4JSFnEu8kLto4wrT8edzdqAPjKwtfL?=
 =?iso-8859-1?Q?Dl7y2DnXIawwgwFY7EiDknVCE3y1cJwMd2B9yJWaziHLRsaWnLfbOGXGex?=
 =?iso-8859-1?Q?9tunRB4ZwQ2vY62O5MPAbrCuNkUGkgnBUq5ItVeTUlUgbV8v2GF0bDSTw6?=
 =?iso-8859-1?Q?WiOct093RzanKPgo9TfByZet0nG2aEBlf0+0qfi40/AyCIbywqZzAUPsQf?=
 =?iso-8859-1?Q?6ZIEvzAb90KL31tg5AawiL/VcQksXytwLj3EkZp41Lf3BkvZ5KTH22jKRW?=
 =?iso-8859-1?Q?j4SOl5q5CdOJB7vCXvwQ+0qhRlbs7hTuIF9JphzxDGSRMaTywl6g5NOLfI?=
 =?iso-8859-1?Q?8O0hJP6Hn9wCy+Ok7Yd3PaFn2lr/vFtd0Rw8+fsx0BlTSg/LW2f6885XpI?=
 =?iso-8859-1?Q?3iJJVEYBVx+z0P2J1TQ5WlROVJaXyEyPEWF+ZpsdBYDjwJO0MTnPr5HXuJ?=
 =?iso-8859-1?Q?fufLFJIJTEluxkdfofGry0nOUiyejqvEPYIRJY879EJaW8fk+WLrnd8krB?=
 =?iso-8859-1?Q?UY1eUyqeFQSy4GXBOc9m5CacN8ajZOySbZNAuednMfNLNqQ9tONzd4lXZn?=
 =?iso-8859-1?Q?bADwZIdsLDNj5zN6iWlcm4l30yqqPB6iQb5SevBLUKt6Wb0u6AJn6jOnc8?=
 =?iso-8859-1?Q?UBNgzGuIEcwFsmXqUeUtCa8djsqVQ7dbW8aPiuc+YgrYlCtBG+y33qPCu5?=
 =?iso-8859-1?Q?EtceWSepCVqIQrJxAgdqlQlqfUNkFpmVLAPh9FycabrhEgvDwIUXd46EDx?=
 =?iso-8859-1?Q?zQVwcglPWlnox2vzDqMWuIQbA34jxgvsJWCCVCDsup49zsirHau9p8Dux4?=
 =?iso-8859-1?Q?XWiw0Hj+O90QOJ1cu+LbNxC0s+wDmBWcuPhwRKuSJrwcSqPP5O51x7PPXg?=
 =?iso-8859-1?Q?XXI8hxiSP63IxT3d18UZK2KV7+pFZl5n2VAnrl+EKM/ZqGvGEKKqjFRS1U?=
 =?iso-8859-1?Q?pkzFw76dR28bffqx40M8qwDuvnWzCk2jOfKnD3Kv3fx7OA/EUURk7QH3p0?=
 =?iso-8859-1?Q?V9ExYylAOqnqH1x0Ah1l9kbfqvQcslgPr1Ja8x6IK4p45wAiAy5W69oq8a?=
 =?iso-8859-1?Q?Ieo65EkoyuzkUfkz65wYLhcsyC2k7WsXgm344aXixKyZ7/4kErHM4ZWEzh?=
 =?iso-8859-1?Q?C76fhgxZYDyU8ZC8UDoWc+yma7NHGLheI7rn4ISgIYAet5TcjCwXS8jZJd?=
 =?iso-8859-1?Q?FWpA4EDK/Q3DDAFTg9QrmSm+wxR8GQ6BBQJt1U/oHVfb6yGaXYvuZsbYvX?=
 =?iso-8859-1?Q?L1IZow6sgrxiACaoRoD41XpXlDauMKKVcxaE0GTeRLfryi0e6OY4tPaZqt?=
 =?iso-8859-1?Q?HLkkCTGJyS89fYMITHxnahIUqpgqX8wlZ1iDNF1y9Kq1+G4FKX+DR0IaCg?=
 =?iso-8859-1?Q?GNCCFhNbDARtvdoBxWblcq2E655X973i5H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af95ae55-deef-4703-8b22-08dd302c2e5a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 21:34:07.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQ3qraf316Gxp3onUJR0olCbWl+NmQitVk2OgiRjyt764sbXDuJwynrtpFHcbu6DXSiIjZTQBMbiBgU5stzJCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:46PM +0200, Ilpo Järvinen wrote:
> pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> 
> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The relevant registers are formatted identically in AER
> and DPC Capability, but has these variations:
> 
> a) The offsets of TLP Prefix Log registers vary.
> b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> c) AER TLP Prefix Log Present (PCIe r6.1 sec 7.8.4.7) can indicate
>    Prefix Log is not present.
> 
> Therefore callers must pass the offset of the TLP Prefix Log register
> and the entire length to pcie_read_tlp_log() to be able to read the
> correct number of TLP Prefix DWORDs from the correct offset.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/pci/pci.h             |  5 +++-
>  drivers/pci/pcie/aer.c        |  5 +++-
>  drivers/pci/pcie/dpc.c        | 13 +++++----
>  drivers/pci/pcie/tlp.c        | 51 +++++++++++++++++++++++++++++++----
>  include/linux/aer.h           |  1 +
>  include/uapi/linux/pci_regs.h | 10 ++++---
>  6 files changed, 67 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 55fcf3bac4f7..7797b2544d00 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -550,7 +550,9 @@ struct aer_err_info {
>  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>  
> -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +		      unsigned int tlp_len, struct pcie_tlp_log *log);
> +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
>  #endif	/* CONFIG_PCIEAER */
>  
>  #ifdef CONFIG_PCIEPORTBUS
> @@ -569,6 +571,7 @@ void pci_dpc_init(struct pci_dev *pdev);
>  void dpc_process_error(struct pci_dev *pdev);
>  pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>  bool pci_dpc_recovered(struct pci_dev *pdev);
> +unsigned int dpc_tlp_log_len(struct pci_dev *dev);
>  #else
>  static inline void pci_save_dpc_state(struct pci_dev *dev) { }
>  static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 80c5ba8d8296..656dbf1ac45b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1248,7 +1248,10 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  
>  		if (info->status & AER_LOG_TLP_MASKS) {
>  			info->tlp_header_valid = 1;
> -			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
> +			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
> +					  aer + PCI_ERR_PREFIX_LOG,
> +					  aer_tlp_log_len(dev, aercc),
> +					  &info->tlp);
>  		}
>  	}
>  
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 2b6ef7efa3c1..7933b3cedb59 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -190,7 +190,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pdev)
>  static void dpc_process_rp_pio_error(struct pci_dev *pdev)
>  {
>  	u16 cap = pdev->dpc_cap, dpc_status, first_error;
> -	u32 status, mask, sev, syserr, exc, log, prefix;
> +	u32 status, mask, sev, syserr, exc, log;
>  	struct pcie_tlp_log tlp_log;
>  	int i;
>  
> @@ -217,20 +217,19 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
>  
>  	if (pdev->dpc_rp_log_size < 4)
>  		goto clear_status;
> -	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG, &tlp_log);
> +	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
> +			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
> +			  dpc_tlp_log_len(pdev), &tlp_log);
>  	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
>  		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
> +	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++)
> +		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.prefix[i]);
>  
>  	if (pdev->dpc_rp_log_size < 5)
>  		goto clear_status;
>  	pci_read_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_IMPSPEC_LOG, &log);
>  	pci_err(pdev, "RP PIO ImpSpec Log %#010x\n", log);
>  
> -	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++) {
> -		pci_read_config_dword(pdev,
> -			cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
> -		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
> -	}
>   clear_status:
>  	pci_write_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_STATUS, status);
>  }
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 65ac7b5d8a87..302ba99e64e6 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -11,26 +11,67 @@
>  
>  #include "../pci.h"
>  
> +/**
> + * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log length
> + * @dev: PCIe device
> + * @aercc: AER Capabilities and Control register value
> + *
> + * Return: TLP Header/Prefix Log length
> + */
> +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)
> +{
> +	return 4 + (aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?

Another place for a "BASE_NR_*" define. I incorrectly said "MAX_NR_*" in
a previous patch. But "BASE" or "STD" seems more appropriate.

> +		   dev->eetlp_prefix_max : 0;
> +}
> +
> +#ifdef CONFIG_PCIE_DPC
> +/**
> + * dpc_tlp_log_len - Calculates DPC RP PIO TLP Header/Prefix Log length
> + * @dev: PCIe device
> + *
> + * Return: TLP Header/Prefix Log length
> + */
> +unsigned int dpc_tlp_log_len(struct pci_dev *dev)
> +{
> +	/* Remove ImpSpec Log register from the count */
> +	if (dev->dpc_rp_log_size >= 5)
> +		return dev->dpc_rp_log_size - 1;
> +
> +	return dev->dpc_rp_log_size;
> +}
> +#endif
> +
>  /**
>   * pcie_read_tlp_log - read TLP Header Log
>   * @dev: PCIe device
>   * @where: PCI Config offset of TLP Header Log
> + * @where2: PCI Config offset of TLP Prefix Log
> + * @tlp_len: TLP Log length (Header Log + TLP Prefix Log in DWORDs)
>   * @log: TLP Log structure to fill
>   *
>   * Fill @log from TLP Header Log registers, e.g., AER or DPC.
>   *
>   * Return: 0 on success and filled TLP Log structure, <0 on error.
>   */
> -int pcie_read_tlp_log(struct pci_dev *dev, int where,
> -		      struct pcie_tlp_log *log)
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +		      unsigned int tlp_len, struct pcie_tlp_log *log)
>  {
>  	unsigned int i;
> -	int ret;
> +	int off, ret;
> +	u32 *to;
>  
>  	memset(log, 0, sizeof(*log));
>  
> -	for (i = 0; i < 4; i++) {
> -		ret = pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
> +	for (i = 0; i < tlp_len; i++) {
> +		if (i < 4) {
> +			off = where + i * 4;
> +			to = &log->dw[i];
> +		} else {
> +			off = where2 + (i - 4) * 4;
> +			to = &log->prefix[i - 4];
> +		}
> +
> +		ret = pci_read_config_dword(dev, off, to);
>  		if (ret)
>  			return pcibios_err_to_errno(ret);

Could we do two loops? Sorry if this was already discussed.

	for (i = 0; i < min(tlp_len, BASE_NR_TLP); i++, where += 4, tlp_len--) {
		ret = pci_read_config_dword(dev, where, &log->dw[i]);
		if (ret)
			return pcibios_err_to_errno(ret);
	}

	for (i = 0; i < tlp_len; i++, where2 += 4) {
		ret = pci_read_config_dword(dev, where2, &log->prefix[i]);
		if (ret)
			return pcibios_err_to_errno(ret);
	}

>  	}
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 190a0a2061cd..dc498adaa1c8 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -20,6 +20,7 @@ struct pci_dev;
>  
>  struct pcie_tlp_log {
>  	u32 dw[4];
> +	u32 prefix[4];

Another place for "BASE_NR_*".

>  };
>  
>  struct aer_capability_regs {
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 14a6306c4ce1..82866ac0bda7 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -790,10 +790,11 @@
>  	/* Same bits as above */
>  #define PCI_ERR_CAP		0x18	/* Advanced Error Capabilities & Ctrl*/
>  #define  PCI_ERR_CAP_FEP(x)	((x) & 0x1f)	/* First Error Pointer */
> -#define  PCI_ERR_CAP_ECRC_GENC	0x00000020	/* ECRC Generation Capable */
> -#define  PCI_ERR_CAP_ECRC_GENE	0x00000040	/* ECRC Generation Enable */
> -#define  PCI_ERR_CAP_ECRC_CHKC	0x00000080	/* ECRC Check Capable */
> -#define  PCI_ERR_CAP_ECRC_CHKE	0x00000100	/* ECRC Check Enable */
> +#define  PCI_ERR_CAP_ECRC_GENC		0x00000020 /* ECRC Generation Capable */
> +#define  PCI_ERR_CAP_ECRC_GENE		0x00000040 /* ECRC Generation Enable */
> +#define  PCI_ERR_CAP_ECRC_CHKC		0x00000080 /* ECRC Check Capable */
> +#define  PCI_ERR_CAP_ECRC_CHKE		0x00000100 /* ECRC Check Enable */
> +#define  PCI_ERR_CAP_PREFIX_LOG_PRESENT	0x00000800 /* TLP Prefix Log Present */

I didn't think to mention this in a previous patch, but could/should we
use GENMASK() for bitmasks updates? I know it's a break from the current
style though.

>  #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
>  #define PCI_ERR_ROOT_COMMAND	0x2c	/* Root Error Command */
>  #define  PCI_ERR_ROOT_CMD_COR_EN	0x00000001 /* Correctable Err Reporting Enable */
> @@ -809,6 +810,7 @@
>  #define  PCI_ERR_ROOT_FATAL_RCV		0x00000040 /* Fatal Received */
>  #define  PCI_ERR_ROOT_AER_IRQ		0xf8000000 /* Advanced Error Interrupt Message Number */
>  #define PCI_ERR_ROOT_ERR_SRC	0x34	/* Error Source Identification */
> +#define PCI_ERR_PREFIX_LOG	0x38	/* TLP Prefix LOG Register (up to 16 bytes) */
>  
>  /* Virtual Channel */
>  #define PCI_VC_PORT_CAP1	0x04
> -- 

Thanks,
Yazen

