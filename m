Return-Path: <linuxppc-dev+bounces-4852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE699A060C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 16:53:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSssK44wQz30TC;
	Thu,  9 Jan 2025 02:53:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2414::619"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736351621;
	cv=fail; b=LUpAN3kKYCYl45Nb6n/SujrrIPgcJX4+Yu5PrUqHQjjfByEoQQgck1jbmAPcW7q160ZztZQ0Iss6sSmO+v98P84Imb+PYk8VSvTXbYhywYu4K7mKiNVcL5BxU2ltNF1p8+dG/ADMfswhTU6Bt3FxiKNEQIfOwqZrKpzzqmNeVkkSOceieyeIitJzUboys3j2w1KwFAqN3t7TZBaBYSjgRfx3EPGoUaHpwltnqfguqg7yzqCgMM4IYoz/1EekyWpi/S3n+wf9NWbuIy0cfYT2ugw1eCE827mghkBk2QtfSiZXodChIIR+8vnhHmLaz/GjNZgPfMG+7U+vz7zYge8DYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736351621; c=relaxed/relaxed;
	bh=cTApr0zrLdyxmEwvYgwYa82C8Dr1cY8Nllpz3/NU+/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fMD9YnWICMK+0pRVO7SeXVoyumXrYLpYOM28ekuy4OFo6u/UMy3RUNYndFr7kBZYa1QPWylHUddDqtVihelE3M3LkNoEMLmoEIMa25Ou3y/8izUVjL/ZnX4arWKBcgFslqzpBi24PYfjTd0Yj0m6Kq/JYoOv2o/LWnBFVBCL6q7PK2fZT7ayNH7aIN4hadUdDFfjrYqIRyIXCfJMzRPQQUdlH8KjyvhzjlCnXCZZFtO1OgjXQRo+0PKrwAiBj67x2p6yIb1POb4hqVaCzdFLxx8oqrrGbBu7YRisYxS/hSv66ty8E2YcLOjJIQyq7yRJ9WSPR1yup8IDAmLvN72sVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b8nIIA7J reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::619; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b8nIIA7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::619; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSssH2lJSz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 02:53:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/CnVsbpEYpwHVGVaz2MCFZh0AR/o+VlYQCq3yXcQGbDUaS3D6yMoc4+i5UPmxEfgFjbaKY8509NKGEWzVTl6fBxxa9wOavceeh5p1P8AtxdTZQYUX9FPi/5rRgViMb5KBgRDMtMAvHbL5ITpUydpMSY3DpgyBW/+HbHY/6WQcpjX4QITMhb7NmNGyy75YMYyzFKeR6jCFGV3LrLB8zfqfaAnzL2h/PqXyG4kvac8N84UGoESjob7H64WjpFJQPLxLhzdWDulyw8yekOoFfzXuB/K8WWszlT3Gl2vlJjJ2nWamQD2bQDYA29o7wGtRCfRd3KSF4WiMtdK4l6/q79DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IT/HknXo3ySuL8mSb75oV6pZjmx3QI/B/GnulJnmzp0=;
 b=W5TL7vslRRAofptQLeviuX1LPprHhnqwN4XypnPCXUWC24mLHhs8X4CmwoaxiTocSG0DyTcitJIjj321esIRsedOrg2XnQr+HALXjqrmuYGf4FC3i53Otzj7w+xHjbWDzMsQa+vK/fVnOcRc5KSKCEmsWG0mROl7TZ50d8jvCdyrmykIW9yyyZZyxmhJgVIhoTQ9SFAEusrwLEjElrcyepKGtru+cTHUJtdSupYzYJmZrgbAfgtVSuadZ101YZu9KmtS/0ozAsKexEsx5DFUgb+H42F3DBz9yI9ytm8kWqvTkm0VDvpBKSkTccwg1demleXFIfuYsyDh0T/XK1higA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT/HknXo3ySuL8mSb75oV6pZjmx3QI/B/GnulJnmzp0=;
 b=b8nIIA7JJHCU2OxWeGWbDeSpnmb2kNaGyOjoOSCOpzrHQSSkNS8v9YuhG31HsrjKjWM4kD6pUpki8jcCplBspKS7/yg7X//oCEPa+ALu4rcZlMDze0ItTvgFJDWdHtpgtjuN9sZK1rFP+LUsiXALCT4FVSoM2S69AJJ9DBQrhtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:53:13 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 15:53:13 +0000
Date: Wed, 8 Jan 2025 10:53:05 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 0/7] PCI: Consolidate TLP Log reading and printing
Message-ID: <20250108155305.GB1221136@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BN8PR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:408:80::41) To DM4PR12MB6373.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|PH7PR12MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d03d4d-b869-4e22-1974-08dd2ffc8ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?By9YjFMoWP2jZyuD16cTc5MNdQd025XOfHFQk0moMgYWRlBrv/Cc5lbAlY?=
 =?iso-8859-1?Q?S2wqb1rpjyyUY6Zd5DNP7OHylVLXPuKpuMgIcMxXxGt3OVWFq38zjNF1Qe?=
 =?iso-8859-1?Q?K/7YGMr7tzRwZ5okyjRigXiql047j9cp2XyowO/o1GUiMcTp/kpXV3r9Gm?=
 =?iso-8859-1?Q?0TaLu0881rwIaT62ZlNy+Z7Dej2ny5sIwb+iLbkeNOhlBjPc3jpAhwdhY1?=
 =?iso-8859-1?Q?mHO6/I9BoFjK/XG3wCFvZIS57dEkAwOVSvxbBRFlGzvs2bM3GrSq89HoP9?=
 =?iso-8859-1?Q?r8nA94iDOPGizfpc7V3+R6tGUifoudd3CSsmgc+CogGxiZ8jsbklBvxZEw?=
 =?iso-8859-1?Q?T6rNdAz9D9TszPbqQXOlA+ACT+98WT0MomiQ413n9b9Qf5XGBjvqQxoho7?=
 =?iso-8859-1?Q?L8VsQtKQsPFEl5XDOzrrLk4xIVJ6xPDUwo0RCAFstUJD7rPiX5Enu03JPO?=
 =?iso-8859-1?Q?nyOSo5RBGcWbpdzDDlhwGAc889qSZ0LHxUkGvdRLum+I/Pr15bQVJ/V+5D?=
 =?iso-8859-1?Q?2fOrbhstaDatSus+FkqPr19j+cpPSPgL1iKozEp8/aQonbv5viZDIoYNQh?=
 =?iso-8859-1?Q?71SaUiq/kxks+BQoFlQ1LrpffwDL375Fj6BBGei1M3uCks2WKVwXqbpNcB?=
 =?iso-8859-1?Q?ardMLV0GpsSCVaFR97KbVt5VuGpuvJ0nX+yN7gHXC3Nx6/GRwF+tjSVeT+?=
 =?iso-8859-1?Q?i0F2b18OZ0gwRRagcZsD3qEZ9ueYYIJ6knbvfCcRbxr5B/j0NeGBz/alio?=
 =?iso-8859-1?Q?FKJWZ/hLPFqoV1BJyrF/XEgY1bPQhxC3XQK0Cyp2ERZTIna2VndoHdYNpB?=
 =?iso-8859-1?Q?GT6rPG5ykWuPzNjpN/HXgg/lGOAet6fLqhRCZjb6FG1vrPBJIwpQaq6jhV?=
 =?iso-8859-1?Q?Jd7bRrFSAljLK03u8rGQDm6MwTGRUIz7JL9ahFoK8umo8oMQ0Clt3JR2Dz?=
 =?iso-8859-1?Q?ydlwxFW2WeEBLOmk527p3D/9QMShihJyp7ly4XJxtAr9Isx330PxtfQQ2E?=
 =?iso-8859-1?Q?bdVIW/fGFGGzvLHlCw57iX4r9Pjq8P4NahxVl6qbSqrvN3S2pGaH7IDkdR?=
 =?iso-8859-1?Q?C5uQGLIZSpnngTVYlAPklL84Iv6m1gxpke3Wj6RMgNBMAm8O2onCipk95X?=
 =?iso-8859-1?Q?uhK6QORF6UiOMNFm+wSkX3nxxePms2TUp4aGmcyLA+uzIzpOFjvLd8/lmn?=
 =?iso-8859-1?Q?sGL5Y0yVLYX8knDoW9yP+y54rk91CciY8Z+OvgDQg9RS7xzzA3zaxZJcOM?=
 =?iso-8859-1?Q?eeizLCXcKFoapfzaIYyq4UAR+UwF4ubaQT1lb/KvLSLWCQkHSEqOo5v/I0?=
 =?iso-8859-1?Q?bcEI+EhifK2TfFr1qj3zSbOiYVquhmbM2E8N3j9WIDHQrfsDnm/XDIwFXY?=
 =?iso-8859-1?Q?Hij+A2pAo99bEAOtIfOdePuxrH5tJtSwdxz7BQ8HydZf2qvMxJlJjZJuck?=
 =?iso-8859-1?Q?0BpoFDf9moGgeZbu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?NcalmPXdD5a5BoTXjMxaWQcHJJ1J2/gN6vLOqUZcKgCcuLJyLDEAsso+Yz?=
 =?iso-8859-1?Q?x3vW6gB83jAQhWUDXhJ9U6HA8qZOHmlnV/cUXNYwQO3Oz3WCiNIJb1DRaM?=
 =?iso-8859-1?Q?8UrdEwV48q4Fqqf2YrKz7uotVSwT+78Va4yrY2sQR67JXPU4mGXBRj1RhE?=
 =?iso-8859-1?Q?YKJG5dg9VtCM24QOtyC8XBXCWZ/E8AElmO5tsu1m8olEydmBMu6U0p9IG7?=
 =?iso-8859-1?Q?sYHHpSZaiV6aF8QQbSMeVofaBcjlAdzF7tLJcVt7TGFlLOWzVb6zxrziqy?=
 =?iso-8859-1?Q?78nivAU0XKqFzgggf+chhloye3ZLQv9X2UFUIwGS1OQ8g5gj9yDJrR/yX1?=
 =?iso-8859-1?Q?KZc89aLfaPL27LPDQxsTVhJm6AuICwvdEiHQfupak9avfwFyrx7wmsKfS3?=
 =?iso-8859-1?Q?7TGOBUEvyTCi7DesqS7ssYEb24Yx5g+Ugtq320krCZrDBqRNJgOwVB7BFX?=
 =?iso-8859-1?Q?EvHIkhes1q3rLFZ5w42RrqoxcA0mqnylnXCzVG/+Q9ijPv19R91GyqaytV?=
 =?iso-8859-1?Q?yrWJn6D1jQAbR3Zd1oTonRGMfmIC5Xn5DEI5p9ZBCDqAkzrdTJn4AjOVSB?=
 =?iso-8859-1?Q?JBRceePfnv0OdKehyAc0hMDjsHK0B20zHt74RHxqbhLNxGM7X/w6t7rmDG?=
 =?iso-8859-1?Q?BJ3CpDTHJ86n2v9v15byJc2TUrkrxVYIAovsR3MCGzlMiMCKDgf9Oj/aj0?=
 =?iso-8859-1?Q?lW+qSi0S4nxqU6JTGOn9T7qVDpkGf9To9yxm7KqcHeWWb+zoNMvrU7VP1t?=
 =?iso-8859-1?Q?3NfavxOZ/clJksXp5S/YHPZbIMjlQ5gWxkylA/XRM537uN2SVKs/TU6Vdu?=
 =?iso-8859-1?Q?D7izr4AQpCI2hs5lPVobAt5Wjo2PlqfY+rPE7uCrfAE4xhzO5ffS2zb78E?=
 =?iso-8859-1?Q?pJcKlzh70DgoTwr81SA0jl8ECAR8GF0AiVu1p+mWqpqrzuaL7C80/mS0sd?=
 =?iso-8859-1?Q?6XkGWjoHyTVlBhMJLjCiKGm7ksj/2V1uAAiu/iYLq1aYba5O/GG7xWQmIe?=
 =?iso-8859-1?Q?9+URfJvJVmbSaTd8TEaH4Q7MoiUjE5dgL0iaN0LTZotjztUfNtbmBYqJn6?=
 =?iso-8859-1?Q?2yDP30OQWHwH5li1Tz7upwIFGUdVnJP3v1TGuM/07FVxz0ATDs3QbmOu/y?=
 =?iso-8859-1?Q?fSI+OLwyjJT/lj1V2u2X7V0o2VHd4RIwwa5/iTzDg3m3T9kkoPgdqXhtFs?=
 =?iso-8859-1?Q?YtStJEcwGUjDshWAOxC2w70xK/NOyQkNtCheEcWrDnEgE04dxLlU+C+Ful?=
 =?iso-8859-1?Q?ylJhPyniTfuhsndx+owiI5F+c7exrkRfHtC1LnjfrG3l7j73tEOVxZ9d7Q?=
 =?iso-8859-1?Q?BN3G4Td5+BhKpYK3ZUs088/smw9d44IIw+Vng33eBZQYn0zt+yJokY22OD?=
 =?iso-8859-1?Q?5wOBYSy3xP3fWozB7jQf5Sl/xKIxOpIEpVGWA9R2heOGOego16kA3W8R+4?=
 =?iso-8859-1?Q?6IlXOObwIdLfCi8fKJtEX49ZMAV7BV6HNjfPqHezh9KJLApB5eg4QHv2t/?=
 =?iso-8859-1?Q?tP7QVKU3Lihn0zzRleGalsWkkrVnPy2jR1j21osSpJOa42PMrEdTVCXchF?=
 =?iso-8859-1?Q?8QgQ0KSnn0HD46LMjvJjw7KnPSRK9acpkiNF4+/gt9uvHnYR37Ekj5A9bl?=
 =?iso-8859-1?Q?YsU9nA1WGeRnvTBb5RIz6RWC+YB62XCkHO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d03d4d-b869-4e22-1974-08dd2ffc8ea3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:53:13.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MySMZX6F1WWPafGlELinLL8C8Q4vSV5yfi+x4x6cX2FCATPBFu86b7ZIm19YGxxijwUNDXymbMDpAPjR5iJ1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:40PM +0200, Ilpo Järvinen wrote:
> This series has the remaining patches of the AER & DPC TLP Log handling
> consolidation and now includes a few minor improvements to the earlier
> accepted TLP Logging code.
> 
> v8:
> - Added missing parameter to kerneldoc.
> - Dropped last patch due to conflict with the pci_printk() cleanup
>   series (will move the patch into that series).
> 
> v7:
> - Explain in commit message reasoning why eetlp_prefix_max stores Max
>   End-End TLP Prefixes value instead of limiting it by the bridge/RP
>   imposed limits
> - Take account TLP Prefix Log Present flag.
> - Align PCI_ERR_CAP_* flags in pci_regs.h
> - Add EE_PREFIX_STR define to be able to take its sizeof() for output
>   char[] sizing.
> 
> v6:
> - Preserve "AER:"/"DPC:" prefix on the printed TLP line
> - New patch to add "AER:" also  on other lines of the AER error dump
> 
> v5:
> - Fix build with AER=y and DPC=n
> - Match kerneldoc and function parameter name
> 
> v4:
> - Added patches:
> 	- Remove EXPORT of pcie_read_tlp_log()
> 	- Moved code to pcie/tlp.c and build only with AER enabled
> 	- Match variables in prototype and function
> 	- int -> unsigned int conversion
> 	- eetlp_prefix_max into own patch
> - struct pcie_tlp_log param consistently called "log" within tlp.c
> - Moved function prototypes into drivers/pci/pci.h
> - Describe AER/DPC differences more clearly in one commit message
> 
> v3:
> - Small rewording in a commit message
> 
> v2:
> - Don't add EXPORT()s
> - Don't include igxbe changes
> - Don't use pr_cont() as it's incompatible with pci_err() and according
>   to Andy Shevchenko should not be used in the first place
> 
> 
> Ilpo Järvinen (7):
>   PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
>   PCI: Move TLP Log handling to own file
>   PCI: Make pcie_read_tlp_log() signature same
>   PCI: Use unsigned int i in pcie_read_tlp_log()
>   PCI: Store # of supported End-End TLP Prefixes
>   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
>   PCI: Create helper to print TLP Header and Prefix Log
> 
>  drivers/pci/ats.c             |   2 +-
>  drivers/pci/pci.c             |  28 ---------
>  drivers/pci/pci.h             |   9 +++
>  drivers/pci/pcie/Makefile     |   2 +-
>  drivers/pci/pcie/aer.c        |  15 ++---
>  drivers/pci/pcie/dpc.c        |  14 ++---
>  drivers/pci/pcie/tlp.c        | 113 ++++++++++++++++++++++++++++++++++
>  drivers/pci/probe.c           |  14 +++--
>  include/linux/aer.h           |   3 +-
>  include/linux/pci.h           |   2 +-
>  include/uapi/linux/pci_regs.h |  11 ++--
>  11 files changed, 153 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/pci/pcie/tlp.c
> 
> -- 

Can you please include a base commit in future revisions?

I was able to apply the set to v6.13-rc6, but I was trying a couple of
the PCI repo branches before which didn't apply.

Thanks,
Yazen

