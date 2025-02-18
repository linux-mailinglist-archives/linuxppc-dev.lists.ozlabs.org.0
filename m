Return-Path: <linuxppc-dev+bounces-6301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CAA391A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 04:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxm2151g4z2yt0;
	Tue, 18 Feb 2025 14:57:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739851049;
	cv=pass; b=Ct6j2hLfufPlogbfedK4D2gGgr4/1R4+q0w1mpbbJWtGpMuvYvGVplDmTAtyh9fCBz4Ej34qZmyiOIqydx8kaFWN7rQVxR0OQjUP/mwQSTIWbfpJAxBYApPh1WF5oAtvxlpMsXCrq/Q8W+n8JIyQHS/5+Ln//zkY4gxJ4kveWKt0jtAzWHfkxQ+arFG6pi+KdWfD8zJ9apchaNM4rEiMzbeaJAAivomDYU3Qzc3bXxzdyxgrdXUTOjB7+AFiZfxtQAz5bMRTP2+47B7g2368HU9uJnPmquiV1n39WlckJvYvlF3ojOdVg5O0ftNULpOimSNiBXyhc+MG1M7sPHg5Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739851049; c=relaxed/relaxed;
	bh=HqzD7sEFSC4LaRKIRiHCWZ4+XsjlEZSCqu5EnQeyOr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/MnSaLDaorSOzbejS1ObUWt6tKwRILgJRWBSy/gWU8j/xIIwyRldRAq4tSdpgqK6capuOp0bCoGqdzbJdgtKIK2UKobtX5fwk+QRWy9pxr+5ogVT/IEMwTqrKWj0t2wv8uCDPQ7ZVUAaBafJfhl5xckyQC7bI32gXb3NzOFVlUMCsWg/EvOz9KQjuK82gff3B2VziKh0PPCYQT4WZrWKXz5q4m6vUU4wpdvVyTRlzkbmI0G8EDaF9IZQG0p6SPEGYMpWybtTWwm/dfv6Y7DsyXdBgiP0NZ1SiZad+OV14Des8GCrJA/dkgGd67ghrtnYN3T1Ym4XmVlhpJk4ipNBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OU3njy4h; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OU3njy4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxm206Z2rz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 14:57:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFkS1dv6V8WPTMIO+6yBob/MmlddxAr/YAR3bQnFkjenj32DO+h9bmTsEiP9ZvaUemM0aTEGuMcAwJLT23vTO0CmLp/K21mkdQIJU6BLd4BqUv9G5hXuroSrG/CowuPTew8CIrePLpio1BV9nK+1PVI775GdJkqV3OWSv7wJRAmhGJcPYl3zGIojbc9b3UGvx8GtnjuC591OGBudUN68NqalOYPQkw1gG5WRwoUcSKnFFin5NEeBHZD89+68rFUmUTvb17MT5Y3/IIlaqWm9svT6V0K9QmZp2EEouSnjX7ZCy7R2amRzzKy3RU7WPAUiJ0POEH7nrjFiul3kQbBsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqzD7sEFSC4LaRKIRiHCWZ4+XsjlEZSCqu5EnQeyOr0=;
 b=cpIHVJA6Js54UWO/FZVEcUWxDxvg2MqmaYgeTxp8zqLV8jga4DeAwXLpyR/24m5c5iID71T+HAamoA3eFy+cLEFFlKq6+Jlp8nxLYxyu/sUM70YlnMYr071w2fqaZbOjr5l/SdHzCTrTnkVx5HOKVF4qPS/2n9p83KId8+HcL0d8eHWMSClWU88bPkrz6Y8ivSFuU2gWtu/jEc2YVCDl2EcQeomFun8DgYjPPEkx6GpTeW34J07VLaqtV77UnCeUXqjGvLOYXOqYNmckVNkjVo8+my34kBbX6xjzknqeFquMLEL9FlITpdjGwJYr3t8kJ2AUKqqCoGmCWZNY9dhr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqzD7sEFSC4LaRKIRiHCWZ4+XsjlEZSCqu5EnQeyOr0=;
 b=OU3njy4heB7MTbvgeh0gVSOgTWRuDLeX/rsGgSP+DGKOgu8s7rKN5SVmR1Xt3vQ0hyxw48xFj8bhDYYnTyOg/UYA6sHc6hcXK4yjapmJOEO5tL6W4FGlQCbIMzg8+y775mtUmoWWHXkAEJMs59DzEQZcOSrMw55h87jCBAxoLJ6xo8coeKdDs1tcPQnnSEsFM5nszvQrch9xNqRV+RLHD37WiK1dcrQL9unh3sXq8pEYy/FTChG8tl9UUGTsgR3KUbAkOlQz+hPyzVh0KLr1UciqugTzu7McRdhVl3M1cpH2+obwIydb5AoXQzAy9iX0qcFeOf1zwzlH0eEVSOzcYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 03:57:09 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:57:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
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
	loongarch@lists.linux.dev
Subject: [PATCH v8 15/20] mm/huge_memory: Add vmf_insert_folio_pud()
Date: Tue, 18 Feb 2025 14:55:31 +1100
Message-ID: <419f349fcd7f077666efaa0ab8473f0607144fe3.1739850794.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
References: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:1:14::14) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 056ee603-d311-4b8a-98f7-08dd4fd05170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+qMzXn6Lo25YW7Z9pTUfI1qppHjnDckgOewPTDYF54mbxOJGMB3F7NjWUYO?=
 =?us-ascii?Q?SiVTGWFFDf5qPcLwFZQ1k4tuyr0hHFiiXfocNSp6YBMuoGqLuar934WPbUX7?=
 =?us-ascii?Q?qCTeJNmBFqt9tp3mAmJUqi2lDmwiGwMWtCFwsarldxIBM6ZhdY9PguESWHMr?=
 =?us-ascii?Q?VWqa4RR4BmTVpPLA82EN3E5r3xj3tPcebw4ZyaB5q2K2STF+oV3VoUVo3SQC?=
 =?us-ascii?Q?ixUQqUe841ftiklyJE6AkkYtsp+jfCIBJqCIFnw+eVDXVecIc6OypFUjz4mf?=
 =?us-ascii?Q?yMdYleQD8tzAELs9VscDOovkDzeCkZOonLuofIvfqcds+ctxPimcnLjC5hlI?=
 =?us-ascii?Q?NZGeMXwg5ev3ewcmWPJI6QR3yBRCbSgx8bv2lsE0ttben4nXAMmrghvLZovA?=
 =?us-ascii?Q?kv/Qc3Krw3P/IhNWQgT8CgVof5wwfC0uTYqoQ2iEwfmkkoXJz+TCTljS1vgU?=
 =?us-ascii?Q?PZLWFsoqHFxK3wVmiSzX0LXBavlwHk6Vjcq28G7s5k+ijsmfF58u/rZyTEwF?=
 =?us-ascii?Q?/EPYJW9/OFM/0M2kNr9smlIfrOCeYw1+UMLoRxR2+KPq/8VlnoZz8s1U1/uM?=
 =?us-ascii?Q?MeqtJPOpI3RzN8SQyVj25YV6kO+9EfXE3/Nrn1T4d/A4zi65gI34DYduCsIi?=
 =?us-ascii?Q?jkjE/zpkDBbs1tQUk3r1ns8bfQnHlQpftz1j9PAKpzfKy4d+iE8NLs3VI1q1?=
 =?us-ascii?Q?ClyL9PD2aH5fdsse/6Uo++L8ynHQwwf/0adT/T3rGYCi28UZyBp2gCYyAV6F?=
 =?us-ascii?Q?yZBHy9WeO79/NQDP/G4119jCntrF2pUPnXVT/pKsaEd8CywWd0vfDSS+aHIo?=
 =?us-ascii?Q?TEd52MU7eR1YToDCZksfnfQTHWf8uSQnjAphpn1b7qrvP+4+qQQq2xjTsrGi?=
 =?us-ascii?Q?BNWo5jePcMp4ciVnnMI0HmjbWnbqKa0IBEW52tj4GFs1cVQNMtPH+iXPhU/e?=
 =?us-ascii?Q?HGIwYnkEXhT9YQjdJpd9Es5ojQEsMRd4EiEoXUShh1NrAZPm0HJ48paWqtUu?=
 =?us-ascii?Q?0KS1yq9gphOmLiCEw2YKzdSy8JYYs78wtxNehMhi07WQcXLyXCCf45/dFjjA?=
 =?us-ascii?Q?4C4D94pFJgMQunnNulSW8LHijNfrqOQCeK7T7pnldqvfm/o6EF/EHrh8eQxn?=
 =?us-ascii?Q?iP3Ev0WnskKg338zJhLOhbHwaEm6YF9ncA8L77nTkhGILagFIWgiXcE+lj1c?=
 =?us-ascii?Q?dm96ZbP9tcJN/SWjDXArIFX8W4G9YmQk/xJ0HxoriKFHiayB6qjoK1bLpFzo?=
 =?us-ascii?Q?p5j/Ysaai+jUffcxqyHNJM1hqX3eUO8VeKYcWHZNFZM/fobnQq/n/ljdULrd?=
 =?us-ascii?Q?pj/GkN0HelrhTsxKrhlX18TJUWEWf2dXRo/xYvfzXhsW6OQQtNiHrwMiRqUC?=
 =?us-ascii?Q?6cIJur0xa5mJUI1ZBd/QPjw7JtXU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jAgoBjB5DDWbca7oF8NeIE0hhfHKihXdEJ7SQuTftXSYUjhmh3ZPGlDPitDo?=
 =?us-ascii?Q?YYUS7D1kPwKnOU102rhhk0XnO8F5D4h+9fbHpWXw2EWhmC7djzn2qaIRZELP?=
 =?us-ascii?Q?Dx7CJjGs7gYJblvSKCoUEA+nOc8jmppI5YzrSwHKMiHVbH3wCYLi6EPlou1D?=
 =?us-ascii?Q?2cscUOHJSwc5L11E4z6xfFGa83PpphXgcx9foNnEXku+KByNhltVCgupxRLf?=
 =?us-ascii?Q?EAlFi25LxpucBq5flC/y+Iv+Be6gAPwXjNetP9tPUDcTJjEdeb3bJwHUb3H6?=
 =?us-ascii?Q?ZuEwL42OagD2AZbLerbtxvycsKJkuZuIwBDGqfHDnMbwuSIjOtuKFAY67I4u?=
 =?us-ascii?Q?ztLwFi0lEhC2jSgOHjLr6lo02Av5GLM+/BnhQa2jEkDW5N6SEKOqGWUr9v/2?=
 =?us-ascii?Q?Pf9tCJs7YMGUcqIBUSJPDhLwjnurfyOggeyjR6ohwo5bMQ+0qYKPt4p7SG/Z?=
 =?us-ascii?Q?xSYj6lynf8OnTl7jfgkBr/9+6ZPNuhaFQgNmGkQps/MchwBVOYEPGttQ18cO?=
 =?us-ascii?Q?GVcGj9a62Tt8Oyl+fO1b9BC3qPuuPxoqV80uA/oHbNKXEEfWMzXBxpR8yFwL?=
 =?us-ascii?Q?K2ME0zC0NCCg+8ngWKnAZSfGBt1srzHH2Lw5SDeV8a2OPGvlDcG8FfZXBv/a?=
 =?us-ascii?Q?bsagRCGwWiT2konqQ7rgoiIyWs3KbVPgWVJdzFSW5QVWlHukXGkVspT24k27?=
 =?us-ascii?Q?TSH67s0OP8wk0UJZxiWX/f2sb5nB3RWi4PNR6phjNG2gyJsXKKYoG8gFZ1xt?=
 =?us-ascii?Q?P9SwvNhBsZv+tFK1RpS57f+s3NYfnB1953IvInwSIVinDz8weJUGZ1psNQgR?=
 =?us-ascii?Q?OWycevJGkONR5PdWdn/8DYyxtVU+m4cBPOZFzRNBuaB31n77dM7ae0AP19s3?=
 =?us-ascii?Q?t4Enyum6FhOtDnI6VHPCeS2l1DWtaWo/SPjz1Z+J/lQOHtBe7ialKmkiCSZe?=
 =?us-ascii?Q?ykhhAQXyzzclC4rzO+KlgzAJpY1Si+OhwdrXhxwQ3FQSJVyBzZTP6c/bqzDh?=
 =?us-ascii?Q?Kl5nSAo/+loo1UDfy2HHbxF24FdsVPhSjN3sYdk6YxC4ycczWZAsaZ4Hm+t0?=
 =?us-ascii?Q?UzdtoNU+QlA9xFodvC3yBcfE++hlc1mrY9xfh0FfAqlX/8Y3eZKaWwxwLtaK?=
 =?us-ascii?Q?e4C6S6JAJ5cWbuuKQ49jXs9VvKhXEdg/c8dRCQ7sBIboJ9Rhog5KWpHNGTT1?=
 =?us-ascii?Q?57kUVvZl8h0W0gsJM1tTS5hFRMvF8jNVLT6tf19JdP212pK7paCswTUhVeyH?=
 =?us-ascii?Q?LEb6KhIPKTfPTyTX0J+iOpQ3QTHjMlHKp7kkMHZwZkYPEczMcs5GEKhykgrJ?=
 =?us-ascii?Q?yjocNgLkv7r7tbRXvIFdRFdJAHysfOoS0EBy8Os/GKT02ZT8kFZk4RA0fVKx?=
 =?us-ascii?Q?uH2t4vryOt0J7to8he45zwhTMLkqECopiWDSMlfLNnx/qX8aWTzsY7AyNxio?=
 =?us-ascii?Q?xfOAxpmNcVAmCE++3EEnrxSKpvzjkC7yFE1QeviGBhvoDi7TZdFtoNT3T+UR?=
 =?us-ascii?Q?U7dcnF3s+cDkqLjENhWxYawebEbWSub/+dnkL0EkEVGN5VdIcV1Pl9o8mYYH?=
 =?us-ascii?Q?gc/5UsmR2w1tm9d+B3VXwp8vt3Y0MA8L1NvLBdIG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056ee603-d311-4b8a-98f7-08dd4fd05170
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:57:09.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW2HXIYuBPXyOEhM9Wys4KGed55ZcbIRSVCCVjR1p+lo+pyuahHbDTNueoqMXyCH4d0iQHPVaY0juIXT4Sg/Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently DAX folio/page reference counts are managed differently to
normal pages. To allow these to be managed the same as normal pages
introduce vmf_insert_folio_pud. This will map the entire PUD-sized folio
and take references as it would for a normally mapped page.

This is distinct from the current mechanism, vmf_insert_pfn_pud, which
simply inserts a special devmap PUD entry into the page table without
holding a reference to the page for the mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes for v7:
 - Added a comment clarifying why we can insert without a reference.

Changes for v5:
 - Removed is_huge_zero_pud() as it's unlikely to ever be implemented.
 - Minor code clean-up suggested by David.
---
 include/linux/huge_mm.h |   2 +-
 mm/huge_memory.c        |  99 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2bd1811..b60e2d4 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,6 +39,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
+				bool write);
 
 enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3159ae0..1da6047 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1482,19 +1482,17 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pgprot_t prot = vma->vm_page_prot;
 	pud_t entry;
-	spinlock_t *ptl;
 
-	ptl = pud_lock(mm, pud);
 	if (!pud_none(*pud)) {
 		if (write) {
 			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn_t_to_pfn(pfn)))
-				goto out_unlock;
+				return;
 			entry = pud_mkyoung(*pud);
 			entry = maybe_pud_mkwrite(pud_mkdirty(entry), vma);
 			if (pudp_set_access_flags(vma, addr, pud, entry, 1))
 				update_mmu_cache_pud(vma, addr, pud);
 		}
-		goto out_unlock;
+		return;
 	}
 
 	entry = pud_mkhuge(pfn_t_pud(pfn, prot));
@@ -1508,9 +1506,6 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
 	}
 	set_pud_at(mm, addr, pud, entry);
 	update_mmu_cache_pud(vma, addr, pud);
-
-out_unlock:
-	spin_unlock(ptl);
 }
 
 /**
@@ -1528,6 +1523,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PUD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
+	spinlock_t *ptl;
 
 	/*
 	 * If we had pud_special, we could avoid all these restrictions,
@@ -1545,10 +1541,57 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 
 	track_pfn_insert(vma, &pgprot, pfn);
 
+	ptl = pud_lock(vma->vm_mm, vmf->pud);
 	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
+	spin_unlock(ptl);
+
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
+
+/**
+ * vmf_insert_folio_pud - insert a pud size folio mapped by a pud entry
+ * @vmf: Structure describing the fault
+ * @folio: folio to insert
+ * @write: whether it's a write fault
+ *
+ * Return: vm_fault_t value.
+ */
+vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
+				bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & PUD_MASK;
+	pud_t *pud = vmf->pud;
+	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON_ONCE(folio_order(folio) != PUD_ORDER))
+		return VM_FAULT_SIGBUS;
+
+	ptl = pud_lock(mm, pud);
+
+	/*
+	 * If there is already an entry present we assume the folio is
+	 * already mapped, hence no need to take another reference. We
+	 * still call insert_pfn_pud() though in case the mapping needs
+	 * upgrading to writeable.
+	 */
+	if (pud_none(*vmf->pud)) {
+		folio_get(folio);
+		folio_add_file_rmap_pud(folio, &folio->page, vma);
+		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
+	}
+	insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)),
+		write);
+	spin_unlock(ptl);
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
@@ -2146,7 +2189,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			zap_deposited_table(tlb->mm, pmd);
 		spin_unlock(ptl);
 	} else if (is_huge_zero_pmd(orig_pmd)) {
-		zap_deposited_table(tlb->mm, pmd);
+		if (!vma_is_dax(vma) || arch_needs_pgtable_deposit())
+			zap_deposited_table(tlb->mm, pmd);
 		spin_unlock(ptl);
 	} else {
 		struct folio *folio = NULL;
@@ -2646,12 +2690,24 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
 	arch_check_zapped_pud(vma, orig_pud);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
-	if (vma_is_special_huge(vma)) {
+	if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
 		spin_unlock(ptl);
 		/* No zero page support yet */
 	} else {
-		/* No support for anonymous PUD pages yet */
-		BUG();
+		struct page *page = NULL;
+		struct folio *folio;
+
+		/* No support for anonymous PUD pages or migration yet */
+		VM_WARN_ON_ONCE(vma_is_anonymous(vma) ||
+				!pud_present(orig_pud));
+
+		page = pud_page(orig_pud);
+		folio = page_folio(page);
+		folio_remove_rmap_pud(folio, page, vma);
+		add_mm_counter(tlb->mm, mm_counter_file(folio), -HPAGE_PUD_NR);
+
+		spin_unlock(ptl);
+		tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE);
 	}
 	return 1;
 }
@@ -2659,6 +2715,10 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
 		unsigned long haddr)
 {
+	struct folio *folio;
+	struct page *page;
+	pud_t old_pud;
+
 	VM_BUG_ON(haddr & ~HPAGE_PUD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PUD_SIZE, vma);
@@ -2666,7 +2726,22 @@ static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
 
 	count_vm_event(THP_SPLIT_PUD);
 
-	pudp_huge_clear_flush(vma, haddr, pud);
+	old_pud = pudp_huge_clear_flush(vma, haddr, pud);
+
+	if (!vma_is_dax(vma))
+		return;
+
+	page = pud_page(old_pud);
+	folio = page_folio(page);
+
+	if (!folio_test_dirty(folio) && pud_dirty(old_pud))
+		folio_mark_dirty(folio);
+	if (!folio_test_referenced(folio) && pud_young(old_pud))
+		folio_set_referenced(folio);
+	folio_remove_rmap_pud(folio, page, vma);
+	folio_put(folio);
+	add_mm_counter(vma->vm_mm, mm_counter_file(folio),
+		-HPAGE_PUD_NR);
 }
 
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
-- 
git-series 0.9.1

