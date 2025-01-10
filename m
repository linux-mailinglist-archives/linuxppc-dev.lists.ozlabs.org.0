Return-Path: <linuxppc-dev+bounces-4955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524FA0877C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:04:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrgm6YCTz3cTd;
	Fri, 10 Jan 2025 17:03:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:240a::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736489028;
	cv=pass; b=W5y2uvY9u2cXBQhpkB/hJQJuCaAxWlwvqfnG00UT6sCIzFzJ3RlqOFFQJkHh0QapMTamw3t5KeSgtrvnYS2CbPhywIKaTvJro6ZBMtvEnLj3HpPmwjL9AFKARljuvrqWKZw+iFcW6SMXKGrSaBolvr3n91VOgx3F51JHgH/2somXvfpb/WwdGfkmpCW2BbJB6ntOqxcal1y7K7gndO4nWNPYd66WJAGmhZy8bKz7PYyxFtAAZfHajNE35JEOMc16kKaphGEyC3rXSwYKCVNZ/rO38DRCDIjPlk5TQbon6R9nSOKLIAex2o1SWp5tPNXuOwfH2rWoD9/BLoufIktjfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736489028; c=relaxed/relaxed;
	bh=ANnS9ugPhWXEhOP/c+FzNHxXqu35Gn0O+fqlriZg1uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lGuWiWqRyOkne72iin5UpsXyRTMMLUinJNsKxudejDEGB4iDmCOHS5rnorQ8cQowIutnbVJc/5FLGhffPRCqAJhfQ2S/d+Hb1C0XA8V1LLp18LaZ5BrEj1gvL4req+Xh7/cEGGqClJkaZlFkU2VCce34GUq1gbeo2EVCL+RwyfWvjPFefyUAmASqOkvIJP2Mj2vbTGmq0G3BE/5Dzqh6D4i248+bzIyCCtpL/cGDQStdkkPiJHK9RWySxixjDZbg8uONJ8kX+yFzXyiNfOiyOFXdN8ImBLzJ//oGjH0i9Y6mEHoIguHSWTqHxZQcJ/W02gbvu8GUwUfw0yglo38Q3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eJqtczIV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:240a::61e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eJqtczIV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::61e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrgm0Dm4z3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:03:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pecagJ9KKGI7M8e5D3OLuqXN9L1HIPoflIuoo1gdnW0xwpaPyzE7PmRcBovg9ml1LtEwvVF40XrnDQEHF1CoxnFGLorZOsNg8l8aWF7K0mLZhtnaS1LVJnXFss/Q4Mb6R1UO4eMG5JyVB9Zut6hpdAy+GBYyJ3y3pKAeEvo54Ce7FENrKhmsCQZgjihqHDsfsbpdt0Ffdz/iHwHfr4Fa7chLqzPl3Ig0UmgcTIOJ146oabnIItd/jcLp8YOwkYN0SuOFLNlIu/0gqGARVAnRF4GjIUovN6RpnjDZ5TLi9LsHYLBUB8jc0+HHPEO0nVzDYI9nEj/5fw5ATXZGj4KcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANnS9ugPhWXEhOP/c+FzNHxXqu35Gn0O+fqlriZg1uw=;
 b=rdV11lwFNOuw3GAS8hYPKRug6DI9mttHZCB6OA2sPAe/j8+Bf4g9Mgk+cjetBy8WG8o4wgM0hMS9Sd7R90GvUZLD/FMxYMZjnlVYEFYP244XSJx324ahy3UqVO9XpAA7inGPx+cfU0m/Ns66B8+OraiQa65eO+O69ykvDWByzAZ1cS+CAd41hjKSiVtMIYrwvQIzf2Ay/l9Ps8QnEbfi8RRjAtUbaQisqtKR99LBgzRpEacpcLtCWWImlJqul/uh+/SogbFD6RcCUd7re946/yRhzkSFka6eY1miwgrzamWiEqWrJPpZeDbNxyR0qrlgjI/hrNsSdKmKxp7aPNTHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANnS9ugPhWXEhOP/c+FzNHxXqu35Gn0O+fqlriZg1uw=;
 b=eJqtczIVlHKK9NrayjGhTQaaBAa+mJNCYgFw6IP3lSPJHxq6vSl4SamgeqwDl1Dhp30zFbn4+ii8dALKEVAPcKPy2XQUECbwCgF1kbDmLu/B883bb/fWw8UF8001tOodLZIFimUN65ZCovL1DpG9czclisNzd5h2wqV8Ya5dLopL4KxI2tOtmJ/2S/TwXUEI35gkm90JeSeukBaIDliUto91X16xwGibsyFXdsnRbIR4WaljV0gYxqj1ZX8sjYuQ/8/efx4hiOyB1kWvIa9uinZ52RvxJp5HYFqSVJRlPyQWOBvQ+vjXDr4c9Td0coXxmm5eploJmfgvrrypKzM/XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Fri, 10 Jan 2025 06:03:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:03:27 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v6 25/26] Revert "riscv: mm: Add support for ZONE_DEVICE"
Date: Fri, 10 Jan 2025 17:00:53 +1100
Message-ID: <4983dede0d60686508513b3d9cfd26aed983fb7d.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0063.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 0906086e-222e-41ba-b703-08dd313c7fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzBYanlIUFJ1ZTY1VlpGT0RzY3NOOTN5MU40ZWtNdUVzWlh4Z09yVTQxdXRU?=
 =?utf-8?B?OWc3bWNkeFBkOW5ONG0xa0JaMzJPT2hMWm1nVDlrQkd1bXBSOFF2Q0NpV0ZZ?=
 =?utf-8?B?SGxURWNIMncxMkFrYWltNHV6TUttYlZWVHR6cnI1UEFmK3Q1enhQTXFQb29G?=
 =?utf-8?B?elg2MHQ0TnErVWh3OWtwRnlHTERVOW5ZOGlWRjVPV1BtbW9UVVlsUEo3d3Zi?=
 =?utf-8?B?aU1VdU1UbWJIS2FUSUdBNDdHc3NXRUlQTDcxTFlOR001OUpiOHNhRTF0K3hQ?=
 =?utf-8?B?MlBPYVNPclFnalJpeksrSllyUTErMzE4eTdqdm5mM09QRHJOK0d2aEcrYnpM?=
 =?utf-8?B?cHhzZStJTGZjdGJIN3o3YnhNTEE2VStobVl6c1grU0VlOEttNFJHbnhDSFNt?=
 =?utf-8?B?YlJXdFhoQVljTWM0WXNuc3JRUHNDMzI5d29NaUZ2TXpZcjI4OUs4WkQva1Fp?=
 =?utf-8?B?VXRzVkdOVUZGR1c2V05SRHNIWlF3L0dOWXlhcW8zank5QWxsTytpY3RJT3A5?=
 =?utf-8?B?ckplZm0yMnBqd0c3NGQ4MWJqaDVaVU5pZVRLTW1OSjNsVFgvY2pNc0pxcStv?=
 =?utf-8?B?aVNlT3RYU0ZjWjlNMkNPNnF3UDh2eTlaa1BBeUVQM0FZa2RKV1VMWXRxRk5r?=
 =?utf-8?B?N1l4eDgyWWxUTUpyMWNkMjNvdUpXcWY3eS9ZVndpME9uNUh2ZWtwNGdPOEtK?=
 =?utf-8?B?bEZaT29GNHgraXkrdVltbDJkR3oxdkZXdXVoWUVRNDkrSVNwUHRpNlkyWGly?=
 =?utf-8?B?aXMyMXBZVDZaNzB3Tm16UWR6cXRDY1VIVGo3d3hpS1J5YUJ3YnFtTE9zM3Ra?=
 =?utf-8?B?WWp4T1hiRlJBTGp2WWk0VXhmeWRadG1JNVhGSTdsZlhIL0F2anVnMk9VVGhu?=
 =?utf-8?B?RDdMMTF6T2d1N29MUnN6TnE3aDlub1laRXpCcjNXc3VXbmhtcG9tSGNBckVk?=
 =?utf-8?B?VUZqS0pzSmpvNmNSQmhPcjRjUVFtd2xSN0RxWWl3RE1RSU1zaHNiSjRLWkpT?=
 =?utf-8?B?dUs5R0N6VGtGTzR0b2tmeTFndE90cTk5UE5UaDREMVhYWm04WTN6QnFlSzFJ?=
 =?utf-8?B?bHVmeTkwbzMyVVg1SGlGcjltaWUyOWczRUJpQUhNSWUrbDBsa2hRS1RpY0Uv?=
 =?utf-8?B?empObUlDUEdpWkl3Mm02eTBSdVJDdUVzd0Z5RXg3RGxSWWRSZXdHSlBkUmZz?=
 =?utf-8?B?VFZ0M1JadFo5Mnh4SDBQUEkxY2xqVllIN0ZmMWN6T2wwVXh4RjIwLy9aSmlR?=
 =?utf-8?B?K3czNks1VGJHRWdYZERCTERQMkNXSzBrUVNyM2dMb1ZmUkJaYjcvNTY0R2Jj?=
 =?utf-8?B?Mm1rSnNCMTJFeGdvTG5NbTNZbTI5ejVoOWpNbW5RMTRqQUFFOEduUkV4VVho?=
 =?utf-8?B?b2FzY2lPdGloQWhLbXhhQnFRcXVqSVU1OGk0ckFQM3NvUFhLWHlubmlVck9D?=
 =?utf-8?B?di95QTYxQ0w4RTlBRXZGb01JQTRWc1RCa0NLZWtGNldXcS9BTUFnM0pCRG5J?=
 =?utf-8?B?WmZ6eWZmcjVod2FoTUJuZEZuWVN5TFgyTEhib1J3eEVBMzhjazFXQnd5dldE?=
 =?utf-8?B?UXpZVVFhNVV6WGQyVGlYdXQreXZEei9UV0I5VWNHY0hqc0x4RjM1QkNSTFRR?=
 =?utf-8?B?clRKZFdUNS82RkVGdkduU3h5SzB0UFExT3liK0YwcitaK1pKRWJtSTNZM0dT?=
 =?utf-8?B?Rnl1MXFFV1I3aHRBMzZjMC9PN1VYOVhKKzVGTGx4RVJEdEF2eVdlVkpIVmll?=
 =?utf-8?B?b1A5SDdmSFdrczJoSUtuV29RN0k0RTdhR3pKZmdkdFpITDFQQnpRUlNFUC8w?=
 =?utf-8?B?YktLSFdUTEk5Y2xibks5c3cvbno2ODkyRllWNEdyeUhIOUhKcEF6RWsyOUdD?=
 =?utf-8?Q?lEEjD/8oycXVC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhHUGRtQUFLL3ZIanVRVkx3RXZVbGVpZk85T2NUMGVnaWRvcVhubzVMRytF?=
 =?utf-8?B?NndTQlkvcWJiSmlWOEdzTXRhbmx4d1VSV1BFZlpqR05waDR3UHVSSG04UHhx?=
 =?utf-8?B?YlJSMHcrSXk4TzRISXQxWVlobmp6QkFEOVNZblpkdWpKemhaRTFwREh3RURC?=
 =?utf-8?B?bTV6WWQ5TC9KdGtCTjcrZWlTQlVhUW1RUTlnZjZnOTBXYVppcnRzeHZSL0lM?=
 =?utf-8?B?SFI1aEwrMzNUbSs2NHNMRDI1VFBaTDFsRXBncExpeStkRUZaYXRSK3JML21G?=
 =?utf-8?B?WG52cGFCbTFvd2pNUE9MWlp2c2RzVjFwdDROd0o3UU5McEpaUklVWVQ1YmtF?=
 =?utf-8?B?Z3MySzMrRnJpeWV2REZMdHE5Y3l2eHJRSHM3d0llZEpZWVRMeWl0Qmt4eHg5?=
 =?utf-8?B?MTJNbEE3bGo0UlA0T3NhRFUrZlNvN01CNjVxS1B1TG1lQVUyTXY4UzZPcktx?=
 =?utf-8?B?eUFEUjVjL0RZbzZ4RHJWQmRXeWllQzRtdWpVRm1ER0lCRGxYSmtjMWxkQVY5?=
 =?utf-8?B?RG9ZcGVYZ29rTzFJdk5WbmRzdTJlTkVuWThIQmlYODV5YWs1eit4N2x4UmdT?=
 =?utf-8?B?NjcwUHFTUWNlZXpMeDZCZ3VYUk1VWWtkTmkvUmxDbjFBZktjTGM3U1R5TXRl?=
 =?utf-8?B?eTQ5K1J1bmJTYWt6Rm14VTg2MUNBZURZYmJSOWo5cGVPUFdaY04wejdtS0hV?=
 =?utf-8?B?ODNFVWNyVVc1Y0hiYzNjSWxGTUlwUGtJeGZpTEZuWnhvTjl0T2pqczFTeXds?=
 =?utf-8?B?OHltTFV2clVBb2pRVStrV3dlZUpsUm9qcmM1N2tQbERzSEc0V0JYN05NTnlG?=
 =?utf-8?B?TVZZWTBrYjNlQWhzR1FRbDlmODdrRzlDeVo1UnZ0ZTVVdnhkN0tMUXZCTy9p?=
 =?utf-8?B?L0RwRWVrSFR4VzhWS1NwNEFJbWVRSDFWVElwQ3MwdmxjQTBMb3dGSXhiV3dI?=
 =?utf-8?B?YU84Q1JtTTZGN2U4SjVuNnNKL2dSL1MxRmhieU5yQUNCYmNkODEzSk9CSXc2?=
 =?utf-8?B?RTUzQUQyWjl4ckRoU3BtbmpuZlZrZjdxQmVrZzRaeERaS2RlZmpTOGdUWGNs?=
 =?utf-8?B?L1g4dEVtdFoyalFBeHlRTWw3WjJURkxGNm9JM29KRmdyMlZjQ1RZZU5ucEdo?=
 =?utf-8?B?bCtSdTdLdFpNQzBlMVhQWDRud1QrVlpuaTlBZUkzaXg4dE50dWR2dFM4S3FI?=
 =?utf-8?B?VktsdkpqVnJXdGZubTFTZ1VTb2JDWm5VdzdKYXhNSnRLZkVrbDVQTE16MlNs?=
 =?utf-8?B?RVY4Z1JXdkUrNzdlaDJ1bzEreVhodndVWmNrZXM2anJPM1ROMkZadkR2Z3Rr?=
 =?utf-8?B?MzBkUkREQWljdHg4YWZoQm9BQVVRaFJGa2xRVXlVZ0g0YTNrZW9HYjh5U0Yw?=
 =?utf-8?B?SjgwaDdQNWFVa0drM01kYW5QcDZwVHUyK1pxbUZXQU9xQnpPMFlMc0VpQjQ0?=
 =?utf-8?B?WFBZLzloUVNZMzZ2a1E4SGJ4blZZUFhIemk1MThZNGlvb3RmTks1Q21DbVVG?=
 =?utf-8?B?Um9qcnV5NHBBRTQyMTh0cmVwZldTRGdjNXkzTkVvMkZYUm9ZR2t1cDNnN0Nt?=
 =?utf-8?B?QWxpeUJxTVdKOVlZY0pjZXE4ZzRDLzZ4RXZzNzh3TkxpOW4wMmJORThGMmUx?=
 =?utf-8?B?QVF6b00xdEtFVXdEQWFHSC9DcERFMUo4MnNJaU94dWk0VkFVN0Rqd1RYMGZF?=
 =?utf-8?B?ZndKdWVnK0E4STRDV3cveSt4a1luTzJZT0ZGeDc0ZUluNUgzTUxJVkZWRlVx?=
 =?utf-8?B?V1lDb3pOU09qdFpEeTdDc1U4MHNPdXRidkR0TGlaRGNwOENQekpKZUtNSnhh?=
 =?utf-8?B?NzRLeXV1MG9XUCtLQWhqNFIyRG81Yi9NK1RpVkswWlVtU3B5dC9xVHAvVUZY?=
 =?utf-8?B?OElZR3dWOHFnR3FmMlRwQmxzaW1UdHhQQnEraTRBV2xpZi9vazBOODFET1ha?=
 =?utf-8?B?S3pmYjl4dmpzK1JQRUhBakdJT2k3cEJMNEJCY0d6alVNdm52Zk4xRWRqdHVF?=
 =?utf-8?B?enF0c3paSlhPR3A2M2NoQXRwQVMwS2JIU2lOS1A0OEFzTnBRM2cxY2RGK0lD?=
 =?utf-8?B?aVVpTWg4L2M2R2MxQmNLZTFsNGlweHA3d1pUSGw4QXhkaDBmbjFqVGY1K2RO?=
 =?utf-8?Q?0I538ngeZpcUHpJv0J+N6xzia?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0906086e-222e-41ba-b703-08dd313c7fd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:03:27.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKbIjNar9c3KNeNThk/fQPLETjSND1sBNp1/q5G9bXsINHuRAFHLiSpcJdNMqhWkuXXn+PdmVUjM7ODQwLM9Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DEVMAP PTEs are no longer required to support ZONE_DEVICE so remove
them.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/Kconfig                    |  1 -
 arch/riscv/include/asm/pgtable-64.h   | 20 --------------------
 arch/riscv/include/asm/pgtable-bits.h |  1 -
 arch/riscv/include/asm/pgtable.h      | 17 -----------------
 4 files changed, 39 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7d57186..c285250 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,7 +43,6 @@ config RISCV
 	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
-	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd9..8c36a88 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -398,24 +398,4 @@ static inline struct page *pgd_page(pgd_t pgd)
 #define p4d_offset p4d_offset
 p4d_t *p4d_offset(pgd_t *pgd, unsigned long address);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int pte_devmap(pte_t pte);
-static inline pte_t pmd_pte(pmd_t pmd);
-
-static inline int pmd_devmap(pmd_t pmd)
-{
-	return pte_devmap(pmd_pte(pmd));
-}
-
-static inline int pud_devmap(pud_t pud)
-{
-	return 0;
-}
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
-#endif
-
 #endif /* _ASM_RISCV_PGTABLE_64_H */
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index a8f5205..179bd4a 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -19,7 +19,6 @@
 #define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
 
 #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
-#define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
 #define _PAGE_TABLE     _PAGE_PRESENT
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d4e99ee..9fa9d13 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -399,13 +399,6 @@ static inline int pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
-#ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
-static inline int pte_devmap(pte_t pte)
-{
-	return pte_val(pte) & _PAGE_DEVMAP;
-}
-#endif
-
 /* static inline pte_t pte_rdprotect(pte_t pte) */
 
 static inline pte_t pte_wrprotect(pte_t pte)
@@ -447,11 +440,6 @@ static inline pte_t pte_mkspecial(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_SPECIAL);
 }
 
-static inline pte_t pte_mkdevmap(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_DEVMAP);
-}
-
 static inline pte_t pte_mkhuge(pte_t pte)
 {
 	return pte;
@@ -763,11 +751,6 @@ static inline pmd_t pmd_mkdirty(pmd_t pmd)
 	return pte_pmd(pte_mkdirty(pmd_pte(pmd)));
 }
 
-static inline pmd_t pmd_mkdevmap(pmd_t pmd)
-{
-	return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
-}
-
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
-- 
git-series 0.9.1

