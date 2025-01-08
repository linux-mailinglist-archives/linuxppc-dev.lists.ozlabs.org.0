Return-Path: <linuxppc-dev+bounces-4855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B647A06116
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 17:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSt7X6QbZz30V0;
	Thu,  9 Jan 2025 03:06:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2413::62c"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736352360;
	cv=fail; b=gD9/HkMaNDMPCEAxCbkYr7XXb8OYw+R3djy9CDuSosT4mLtySJ0BNCz9wGv+dwZJb0mr0tfEYnlXawVqRXRyswA85Xwr84+A3EepSt66NJRixqlWm/Us3VKXnPJ2lg7KgKo2/R6gMdNJvP/Rn5fg+Qz4SIehTl7XxtSDV+kL/mlAN5SfXui31H1dPVbE08I4dwewvPNLthzzgEyoJ9QA2yT86/sByROhIxWohgPBLwdHBOqFjVhXwOg0W2UQ/7K24nohHmwUPYDLTm4b6mFR22fFWWvOyQeKvTZFKkgKdSZfCHzFrrTLfN2FDaTZo3zW/SLOozGSPkgt/2Hh3lxmMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736352360; c=relaxed/relaxed;
	bh=jA8mhnIaMqRxYR0tXqTy/eQmQ/AZz8tuiDPdbAqVcnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PEUcE1ROyWZVdKx1f6pN8x71LSD+/FVgYECclsGJZuoV95fbya9+jmdsMleVS7rzhDA/DLDlroFX/vmizH9H/sLqIqg0LRDCS6wucvS0QlSL8BeraGqgOuGNEXPOXSt3xk+2iH+B3Ubykd3QN993wQB3MgnrMHqKkGG0BpvavQYCVJz+/S6VykEbOu/gx6Ss/IPMJCKmVjcwZSLh1jVCYGDJQP9dklJvH6W8+xTJOvhAagDXsVL7ANVMoWY5ahuyeaXz/KtoOEzi2BRPP6sX6JKc+cwiYyotg78WXi9FbcwD/aAb9MMQdVe2e9lSOX/0jIH/PqllKd0IbDNo8Sm5qQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TfJ6A2Ge reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::62c; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TfJ6A2Ge;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2413::62c; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSt7W5VXHz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 03:05:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzM8vIDpHxdHxbhVahWqaX9IsD0+OmQIK6MFId3ahwBpaCtFNRQxUd7euJzYRvDRWNithM1mN0WAJUSRyz0zPW1x69yneUGQpYXmu3TCg71LisTiSKrRbP5yfsDPp0Uyny8BslgBBnmw6OIwav5J9Ydv19TZyf2ShcRtd6Jcilh1nQZ9Mf5lE4r2W+9uuka+AX0uSY5CpaNwlsoSMObuOmTd5cysr/TEoJPNalm2a0VCfN7q3E+p77wTgfdAhnxlRy56SSnN6r3EpCzyy3QGihk49w9f/XS+QGrVFBsTP3vWXGCDOlpQ6Z+1t7R+W2E5G1yJLmfBgUcNdcSIU11H7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNRER4e4mLrF55o4DjplUU27MM3IpEv3OTG4dNc+3Lg=;
 b=nPhCa9lBDpdfR5FQOWrfHF7LBV9ZZ5cVtHYmSw4RENa8E0w0wJOrPPTjfm+gwRqWCuDyImJs8eqsiXH2sHGxlOgCLx3MoIgyvGoSWNy0/gu9FXxIyePh1TFwy5j3LxaEYKZW63VsH80kjqqVPjuH/2pgpt988GtKjWV4AJrclReiV76bgS0VORHlk3hByl4gPk5jjQu4t/kRPumoRf5IF22Enk6StO252vndtnyz1d8BQJIK1IGlUAGpGnTPGb6DUjY+SCGfHu1WbTs6kBpvCs3G3/UK+xVLvjBiI/5P6FlNlZv+IMy88wDFzbju6txFu0s8F85BRpzMPKjC6qkc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNRER4e4mLrF55o4DjplUU27MM3IpEv3OTG4dNc+3Lg=;
 b=TfJ6A2GepfPZYCkayya43IZQce2yCmAQCHFiIQ1irdsuWxyUi5l/NNvuNGtONyYWtkxA5KoxFm2j2ysQ2TrOErhp4qHFBFYSUun59qGqYVsQq7G0LLeOTjbMvK+fDrs7GzpldI4GNDktuO4RCWTSbJsr05hpjo1kLoItpXq/qWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 16:05:39 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:05:39 +0000
Date: Wed, 8 Jan 2025 11:05:35 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 1/7] PCI: Don't expose pcie_read_tlp_log() outside of
 PCI subsystem
Message-ID: <20250108160535.GC1221136@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-2-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-2-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BN0PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:408:eb::14) To DM4PR12MB6373.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c63129c-7fd8-447a-67d7-08dd2ffe4b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?WVf7hL3pb6oPHLT2low2x+syLBkdHFz9uAWjmrl8/Zqqf4QK5h7NNPPtcH?=
 =?iso-8859-1?Q?cPab0CPnsfosCh58MpmoCmL9DQSDEiec0gHX+3fLWLlL77SWUqwehKVw2s?=
 =?iso-8859-1?Q?LGXyh49HHR9DyRaYq9ApyBm9pi1EReC5NtR4GzUYLL3KizjuYhBqITvkox?=
 =?iso-8859-1?Q?jEhz40ILMs0WxE5kXrTfx96bSXf2GmSsjgP+c+fptAl4VZ11EjonqXdOm7?=
 =?iso-8859-1?Q?ql8OWO7Ry84ZU6Xre39Qhn5NUzuMiYzfj9RLPBsONm1scmG5DichGORoNU?=
 =?iso-8859-1?Q?FuPKAEz4JcjRMxJCLv4H0zjJ44NmQuQ64p3i9+hWvoxWIeooJ/gfgk22S0?=
 =?iso-8859-1?Q?+Tbc10ofXWCoYjOzX9ioH3zpFsyDlUVoyRysqq0W5cg/xbK1dB+bCQpq9Z?=
 =?iso-8859-1?Q?GhBBtgTX1jtUuOH+AXGsaxX3XpHvV2spnS4742VtKQKYYH32N/rUvCFjTj?=
 =?iso-8859-1?Q?qRhGZ95lSd1x4yGM48xf1CsZMkj2EIaExqn4hkXiiVyKCMmYl5+PoA3dDZ?=
 =?iso-8859-1?Q?MDe4VkpHpLcAICuWB5AWa/jzcDn6+yldb5KpT0dBmSPI38yLupjd6fqlEU?=
 =?iso-8859-1?Q?IT4Y7vhqnW1tlcJcZ0tA2QilCvab2X3G+Ob/mMq76zRBT7bdB6aCzpDR5/?=
 =?iso-8859-1?Q?MlNnzRRhimYNaxGluyqBP9eueFBmP92soXr0PVKb5sL7/ZVxsODTXI/LEW?=
 =?iso-8859-1?Q?H49XL4Q8V7IOnbe1/gb1U4EfU2hmaWNKleQQ3xtauVQknxtRQQNUm3/KF5?=
 =?iso-8859-1?Q?KRuZzsQHjc12g2tKdn6S1HVuL7lUkBIYmyWA4oU4jkNRHSYIC6Jyfz6S17?=
 =?iso-8859-1?Q?MdsV4Ghy+RVhBSRlw8nwM9bwHMl7Bqx1Ju1qsDskmmQdENawD+R2OssYvz?=
 =?iso-8859-1?Q?AhrlZgFErdld3XgclqxK7uLd4W6N2fR6cCATmk9Etp3bRry2Ans+VhnBmX?=
 =?iso-8859-1?Q?U42HLq1+415fdnrkrD/VTALXrLq4ha9GGy1zQiweFDn3Caf77sUEj4/7BK?=
 =?iso-8859-1?Q?UiBi1yPCebQVjciNVhlPurCQJfl6/y0rdrhfbw0aaazPeSvIytN3Va2PDc?=
 =?iso-8859-1?Q?CfEJKz2tBEvRCbnYzXDDpnUCGYlcomCQCFuXM2P01VlPXBmsJLLn9YY12S?=
 =?iso-8859-1?Q?rqFjYvY9nGV+FzjlyM8yFvuMazUN7Sr+z4qkFaGGZqSRyDcBaj/4szL48b?=
 =?iso-8859-1?Q?EOdMvrD9Qq14IfgWp5UgXqIzFITbSFGGK4F8itZIgBsrJ/Ilx3xC8CuYcd?=
 =?iso-8859-1?Q?aapNqhKsEHcPYHx0aW4oEQbcGhrW+3q2vDRvTnf5Fosb3l95xqYxnhvwrw?=
 =?iso-8859-1?Q?TLYEwJTYChPDZCSvsiqW8xMMPUvKsSwcO8sSf8vJCpWo5l0YKxoXZLLtco?=
 =?iso-8859-1?Q?sE8xb1UJZm6XRQqE5BVzGbt41W5vHM3TDaDmK82Eaj61YCEZCzjHRYjQYd?=
 =?iso-8859-1?Q?QugOpoUSFN9WlIHD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bBMrq1p//ckVncgCovf4xDcGVIlZ+HscIl5opg/uqu+QW8J9JV7pd+yZlD?=
 =?iso-8859-1?Q?zznxtFxfMEfQ2vsJ/KP0lI9w2g/oTSH/MlExm6YcwIiSaVZ7jeViF/WBbW?=
 =?iso-8859-1?Q?g0O+pjmoEs3SQb2sV2wsGbiDNrTA7goHWSRnYifnPtyAMfvebjAMuaJg1k?=
 =?iso-8859-1?Q?9LlQYtBeUQQ/nMIOADsc90m5C/bJwbPDkH+6LsH+1FrucUGIm2+RoISEPD?=
 =?iso-8859-1?Q?8NqE+s7eLJmcfTpVEEtEuh8LU6OV+E5t2h9oV+llR4/K3V+mHbLWNzbDsd?=
 =?iso-8859-1?Q?sndaVKXjuBIZlkMOYlC7MeS1dI17CoapKwyyg4B3fhtv7pdPlN4A7/gdH1?=
 =?iso-8859-1?Q?m8Vp02USaCeP6z2pOwRdKUEWouO69Qi1QAtGZsbSH1Uuosq+KRB/AAJ+ww?=
 =?iso-8859-1?Q?WqMqewTZhWHmaknfhpBtHNYRokn68NYhXiv6oStzBYa2KrcwiILbdVgX7M?=
 =?iso-8859-1?Q?gKfHb+z51rVbVlY0pap+hJ/ZyxedwoZIaV5avgjWBdRgvccfniQSBTUkRH?=
 =?iso-8859-1?Q?kb1itt10DrQ+eg/26FYzi+V5BQH1m9fcMb06FphY/SbO8GzYPfLFy0rMxe?=
 =?iso-8859-1?Q?jaIOAfJDdbScTdNexaTAIcQk3c9Zn675afy5JqWDLIqijk3pq1vUtuM1Jl?=
 =?iso-8859-1?Q?zQ/EkB2k0Ss7PCEAQFVzs6qSA/dMAH8EJzZl9CsTZ2Hy783REOlyMuVfWe?=
 =?iso-8859-1?Q?lSrHmaMPgRG36cNb0J6At18QvuZGCboiH3Bf6FJ9OhihSC7YxOptk/Ol9f?=
 =?iso-8859-1?Q?CuuQeRhMN/StaypsZKMse4MmvfXwjzgJBohYoy7L1U9+cZcKdWT4rlffSD?=
 =?iso-8859-1?Q?JgPLK50X22//aucMOStuohYMkhSVtLc7WlkZNamkLpdP+CY8kzBfvVeFUy?=
 =?iso-8859-1?Q?hLrnG8L4JLDKXePng4SC2a8JknEf8zSodNPE9JpDaMhy//+KAAjCCzryKP?=
 =?iso-8859-1?Q?4snVz08pq8rjr2GqSPTQRY/YxX0+Y26p8bLLbAXnvgsS2aLN14cCoBqoT0?=
 =?iso-8859-1?Q?r/34FwhKeCxwyvqEc62W7MwY60IMnY5HEUZINreNyXKH6tqnefTAb0zJrF?=
 =?iso-8859-1?Q?xLqzcm7CMjRLTvXMkc/SDStqIhJs5qq6m1s28jBeLEbtbxMTNjcoX+bu8F?=
 =?iso-8859-1?Q?D24gnXck9Ld2SutKutT0eaSaXhoO/MteufvFrOZ5Yaknu5FpAAaOUSqjuF?=
 =?iso-8859-1?Q?ndcedjzK5oPO6VEBNhXXAcYuk+/bU9G2ZaIN4SONJtKO5z9OzWrC3EEI6T?=
 =?iso-8859-1?Q?wa4crPaYokd9vcUSEzDMLdcUayJ+vmHYHgG8lGpZu5djHGaVOJx1+5APsz?=
 =?iso-8859-1?Q?f95/H38Mnwth0wYVzVjx5+PEjRtRFG7I59SjSRhI1WLRe1isB8TyFYMi1T?=
 =?iso-8859-1?Q?fRHOdLDMuIMEJnkN3j+nxIvdmpFsMtWEP86eCNtQTEPjv4GtNd6qMcZf0f?=
 =?iso-8859-1?Q?49qseVZlUwv6awWHQHawitTNVn02HicxEoRLFJJ+MAaytUzFDbggjkS/cS?=
 =?iso-8859-1?Q?1v92d5KKFTP3fL2pfR8LMSAt8yzpqIEHRWS0v5vMjmH131fyfT0mN4t8Im?=
 =?iso-8859-1?Q?gfO3Qt+OW+FPRLsnWDRv0JLMcnH8kgBepQx9gVzlHm1+mntslIYReUnxrm?=
 =?iso-8859-1?Q?YJ6ALgKa+jmb0xD2ZC6AATNNls9o6mUVUL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c63129c-7fd8-447a-67d7-08dd2ffe4b8f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:05:39.4182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlKeloK1KNxdUBNfL/SO4Dz7M0onY2UWNTuUIAnm7O8Oh1SlPqfNhUQewutY2ob80ZGdftptgonSDCTjwd4c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:41PM +0200, Ilpo Järvinen wrote:
> pcie_read_tlp_log() was exposed by the commit 0a5a46a6a61b ("PCI/AER:
> Generalize TLP Header Log reading") but this is now considered a
> mistake. No drivers outside of PCI subsystem should build their own
> diagnostic logging but should rely on PCI core doing it for them.
> 
> There's currently one driver (ixgbe) doing it independently which was
> the initial reason why the export was added but it was decided by the
> PCI maintainer that it's something that should be eliminated.
> 
> Remove the unwanted EXPORT of pcie_read_tlp_log() and remove it from
> include/linux/aer.h.
> 
> Link: https://lore.kernel.org/all/20240322193011.GA701027@bhelgaas/
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

