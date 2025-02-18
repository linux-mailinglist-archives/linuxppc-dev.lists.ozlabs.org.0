Return-Path: <linuxppc-dev+bounces-6290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECFA3918C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 04:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxm0k18vhz300g;
	Tue, 18 Feb 2025 14:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2407::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739850982;
	cv=pass; b=HpSnjsvOBOsSuek8QknNOa2LfhuyNl8uj9+IyTcBCc4wZZeharyBbb6T5oGs+75AJ80QkkfCsfE2lShSBCCU73IqWOJ4nTjPQB1huLgh6c0h/vPpm1MWynEAVeMA4sd0+Vj1gjxDJk0z/EmH152IhYRNgzQmC+kgx10wYXFUEwTl4+bBod0M79T2nZzc8XY6KGAP9OUCzZsjmAL/xZwCFSeCqRwb3HG4i643DuV05PiAUTRMgyRuIAnKqvf+WYhJX8HQyvCP9EBFfacvqxkG+Ro6BkKDByrilzP0PSm2oarDnyfYk6PEtYPci+6GDJXXzEOHeuGKLOBR81q2Fvsn3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739850982; c=relaxed/relaxed;
	bh=8uq3O8kXTMfzu33bTQkJE6cujPJmeDvSmwlQjmGtbl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIDxXVa5WIAC6EwH2ASs9/hbaRIxsJrSkjdTb1nfozTA2d6srtp7CEtNuWyKiMR43i4ZcGkUD2MOsPQDwMCgrbcKToNSpVc2fTMfubx6yvb7qQBDfJ4eCCk6S1lKjXN9xPEzVjEo5wObF38KvQP2MDVlHhFpbBf3kyqcNTOX9xEh97VqxO2MnMtGey7+BF51Gxtjn2FEnewoluVITrvAHno6cYpJchYX2T8N8Hsi8dWc/qI1EjxTb7I8m84fi7pxs64Pz3fmxc/8rk51Xpmorf5/gaCGB3GpbGEPpjqmlYc0YQ2YRekb1TkK7vMSa6+SF7/mxZHns4c1kUhoE8l35Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EKzlzhLX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2407::60a; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EKzlzhLX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2407::60a; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxm0j3RYZz3029
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 14:56:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUL3pk5qPYe/aFSGYpXBmqk5E29E05qYZprty50ZnqGeNJNaC2cj+oxflZARHq51DdlW4xMLDWYtkSBHo6nVPTS45ab4ldRpFikUTPqO9bZiy7HlW/Z4814XEurysz2Q6fUmr5IEX/MR9+CN2WdKPTB81zLvznu+aJME4yWfBkni/N3JBR2wAs3nOXpusr6TjoYG9dKboIL6MVPTuREDyV/hB0gOrWJe50rwesEC5Wf8xrMgCtzJj5+jU669lgxr93sSwOLFhQKyYXGnaV19IzHkOXuoIYEvPfD+SgVTTung/tiHv4mzCbvgXagwFH97hc7xW+xExJhcaKoJJZxDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uq3O8kXTMfzu33bTQkJE6cujPJmeDvSmwlQjmGtbl0=;
 b=TS8KZxBArRxg9Z4ntzU558AXkOa2ooRRRiCWHRNNEmuti2mlOkEE2zRei9Sx6a0S6LGfz1Y1h0pos7v0+3Lq31IAY3AlLXtoaoBU841L8r5Wq2mktR30Cat/i+fYkRj0QW8kl3vCCQNDcKBEB2EYmBAhazlOAr1PXSHJFXm4o0XqZtepW8cWDKWAfiLYC6U37//OT48MNSrcGOm8pb6K3ifGc26ELECJEqVl7sHWweAYPPxt5IIcZcPGuvXRU5IdF1/6fn/8gBENTlYhtWgn9/VVR9KfHho7GZ0jCsEfZyH5Xwk1Rf5JMy+X+4HsEaDS+nmKO9kKWO7VKP8VdCsyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uq3O8kXTMfzu33bTQkJE6cujPJmeDvSmwlQjmGtbl0=;
 b=EKzlzhLXBuCjA2fAha8EgDleXh7TAf4VZkziPZfE3lzLXS3QvCqdEvTSz2c5QmA7PkANu3sHqpQBeZAnGntVP4Ugz1vcFrqLWXjgPE3pQrLDKYbS6b568FNQ86ZSSuvXiWk9+vc6lPh1xsYnaPal4Xrr9NLh2pSqZkXZ9ss1cqjZHarDzCpONfUgLYFVBDR5rhcQrTMyfvQaYuo5VGzDuYwAmLNtBEsfS/rKvPIE5eul1JknHjDmd6U4dfrfdSMFZH62eDGNewejan4x3dtByRb5wKhjln25eZkmLMWDO5H7FeerqDAtfG2HLKgU8OB3FPPQeIyDhxVO91n/rfAgVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 18 Feb
 2025 03:56:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:56:10 +0000
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
Subject: [PATCH v8 04/20] fs/dax: Refactor wait for dax idle page
Date: Tue, 18 Feb 2025 14:55:20 +1100
Message-ID: <c2c9d269110b90224eeb1dc661ffbc1d82aa20c9.1739850794.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
References: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0127.ausprd01.prod.outlook.com
 (2603:10c6:10:246::14) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 056a616a-5ed3-464c-9160-08dd4fd02ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EF0xGFj1Bg59VMmz3gq6CCmNoEH4v57VwO94j3FEkRoPQ25QgPCrt7V1PDm7?=
 =?us-ascii?Q?aE9bqy8wO/0F/TI/EIOUmOAfbkPo8vivKGKOlAeXPNNs81lWPy/yvOcEInpR?=
 =?us-ascii?Q?Zxe+CjlQ/+snOO6sJQprfbqOnOlIPEPljM3gJEVRFi3TIdyguA9ho9dwRSwi?=
 =?us-ascii?Q?Y7rbn69pZwSJfjyihp8VWLk0K5hm2L7pkLt+xeMKGwTQBw2lDKWDTvGuTkfk?=
 =?us-ascii?Q?fjNl9SCqilPIIdiwIUatuwB5jRogA45XDKTRDlirYbFmJqH95ChoCeBH/kSX?=
 =?us-ascii?Q?O791v3U+ofNUgZLvvxySxTXzjA9B42egWpsYjrg9XgHfVgAnnphAsnHot4gL?=
 =?us-ascii?Q?WNHTxp28VV0CilXsnGi6Nl3RBK8dDtHPEBPHU5nUtGjcGPw4R0/f8GKOe4nj?=
 =?us-ascii?Q?7rAq/rZh1iqfHHiadw+tTf0JQteYbDgQdQR1bi7WzEV/tVxQTsoUaiSs+JBV?=
 =?us-ascii?Q?0rRnTa30BT8OxeCEGhjLZ+MvT/1OV28ZbnmOlEgZ2cxCGEZowyL3zoEeS+Cp?=
 =?us-ascii?Q?pBBdJs0dVCcTCFcpTj2wIE/oOXOZhbEQteEpsMLDdRKUfftYuye+xSHFdnmL?=
 =?us-ascii?Q?piWslnlhysLNCa0/HtaSF2rL4mVvHi3ihTzJfE8f/OGy3fjKbvs8uUY3fAgv?=
 =?us-ascii?Q?Gwdssez2AF0K/MhjWya6gfE3+l9+CPrDtmVkcZcCcY6O0dfx8iHy8uLehujW?=
 =?us-ascii?Q?JAVJTEC1O9mjJc2q6R8eyPMfOKFFc7b7kFKR0fgbAVAP+bIBb9OouNhFk0As?=
 =?us-ascii?Q?S3AWYRd/ci2Njes/WuHMe8aiLVYhswVwfhdKdBEPKGYK+Axz+f+0EtuxNSXm?=
 =?us-ascii?Q?edl0RD8qN0gtScxV2jZlQSfHvI7PAVHxh4AU2AVLfLOysIxCJvzwqHcLaECA?=
 =?us-ascii?Q?VdlpoRV5YyeTnNh0GAi+piSnSQ3MYLwfQZbEKUAwVLmM6THtcFcbxKLF6Vi1?=
 =?us-ascii?Q?iGTRG6GO+HR1m37eLuRsAefzA+riihD4IiHF+DajiJSY1PqbYaJjGl1HBUrJ?=
 =?us-ascii?Q?Nrl6U3M7177h4dGoxHEcuJv6XB5zU2OCFs8rF8jzPqZNnsCJJIuQER1KpCit?=
 =?us-ascii?Q?zEZPxO2DYOv6tOwpWoUcENPhn8sgNKmwDkd8kLjpLFLbKdu05nYTQZbvGhP7?=
 =?us-ascii?Q?vqlTKfiCtfwcnUxrH9IzutVijCyxjiz107ivlfFAhWVzrX3z4v7o4MrWjixP?=
 =?us-ascii?Q?wS63QetlVKw9p6drvsHIUSepTNNhfaUcUxhctNouYJtqTWPR4H81rxI15Wg9?=
 =?us-ascii?Q?30BC58VR/uIhoyCzbzKZpO1caNCwZyJaWancxIhq76od/WMobxo+F4FchsRW?=
 =?us-ascii?Q?xNhWO6mryJUZiydQYwh6nXvBJ8medBHNy5fdBqzXvLq/SgMpFc9tsspLxgk+?=
 =?us-ascii?Q?SSqbFh16+Mlu91Y5Dtkn9a3ZimMq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?InT46NM35aDYBqIXNVc43Udj3znPOG++/0SzqJeOTZaiEfqypa9kURdbXJQg?=
 =?us-ascii?Q?CYiQsZIQi/wHDFYsTO9fwjIGuH8xF2REVy/V6RxcS/ZD3oBnFf6yGGrFgDdF?=
 =?us-ascii?Q?6CglsZxOkGu30s9w2PkjfdxBvPUH1yAukrHtvGDQaM8wE5BJXvNzCUJRUpac?=
 =?us-ascii?Q?VchBbZ7NbTAiqiXPl4Uc4sJfsYGuMJ12cvP5UbFoexz+jlKu5RhbC4t5gNUm?=
 =?us-ascii?Q?zvXPIDF2QdagxdHtuLqttXEX7tX7FJf1Db9jHBhtaq9AxIkJLD0oAEbkN6CS?=
 =?us-ascii?Q?SLat+6PUqSjPmWfodhQrSFDTOM61Zp29inRFbW+/obcJFyZOGnnvZwyWBcXQ?=
 =?us-ascii?Q?F/kpGeamzmY0NI7C3uRrCsGL/BbQ/3SfGdmpjWgBiGdoy2ISsHrBBvWrbIYu?=
 =?us-ascii?Q?7yOhT6xW4Bq0yXkL0pPP5UhPAW6lGtIt2ptQyqzpCEZl9cvVUT0k3nU8u2NG?=
 =?us-ascii?Q?q4S/VMVlW9q5gVIExrXApRZ4bzwBpSKVT8orE9UQfgBlblOsipJo8vQH9fPS?=
 =?us-ascii?Q?5gyrJgMTfHfmtBD4dIm2kP8jkK3mkRIidipbY8wPHywVgjE5WVnzAXHO1Ll2?=
 =?us-ascii?Q?FVKbu1Qv1bSucr5wA/MVbCpQdyE+hk+lg2QQu0rleWu1ycVi1Plos2T4Sli1?=
 =?us-ascii?Q?iEhXWdvmMXbMRpuETNVWkTHGkYHUs8DgG3os9UMiu6Y8ErhQi/KgEanQYPyR?=
 =?us-ascii?Q?MF7N4yCiMLg5DcIs7EWAlv7Ct7W6Sxt5k8G3Q4nwpH7tYJXpS7FGV/N/ZRbK?=
 =?us-ascii?Q?cBxXmATdRX6+/sJxj+hQheho5iOd25uOO8Rcv61mMhpP9QM3j/EViLi6UhS9?=
 =?us-ascii?Q?E3dACm9xm8IMs9FN7HakOoOd94Opo02mYeBX8kjPR6ye29sDNfIMz0tvgZkd?=
 =?us-ascii?Q?Fk+zt9eqt3pAkoeDSaK1QAOeEs2CddrbUDDzIdZd5k8rUPkPL2YowUGIX8p7?=
 =?us-ascii?Q?DmadjGTXbcsFhsz9++OqGVqxFE6OJJWZaUwqtyrAmwwOFodphOhgL+M3tBld?=
 =?us-ascii?Q?y+eZ3JmC7ESQFZlDx0omgNupm55zoNj80nzBTEybSzfz2hY2y6d2TjqUNOLi?=
 =?us-ascii?Q?9J/OawH5GlCVV6tbKMy2v47ZtRgRbrs8hJhmWWMqHQoF42iOimc4/K6wfaVS?=
 =?us-ascii?Q?2WUg9lQCnw+00/mb2IJ4yQCN48gW2ZIaOTF95ecLmZvSEQ6J2NJTw/74KQDo?=
 =?us-ascii?Q?zNUhN+TNDs3HjuoFHseRa9MiTITTNaSW96EjC8IYv24Cesq0zMKbitjZfVVu?=
 =?us-ascii?Q?mY/n+X+fAfd6q2CvwQSirC/5EiBXTmR0ecK1jkLk/ZbJfCsMgb14Wqyhk/h+?=
 =?us-ascii?Q?UIEZ6WdgsE4SETpEBsvG1znW+2kMm3EmpeVmuy5Jxl+dSKkEBERx1YimCwAD?=
 =?us-ascii?Q?hzKW5lksottwqa2eTVOELD02c/0haQC2lkPtJivg5SJwRxSpS6H4Wm/AzlsB?=
 =?us-ascii?Q?Vw+bp+MsvBzhI6EJkIl8auIuJDsw2yHknDJuxTs3m3uzkULB5MWLVqqVRbkx?=
 =?us-ascii?Q?ACc7WdxFaJr/kqyAx7MsImRIIWAt597jqOwKAmV2eHA0kz8I6BSjdKW3dLin?=
 =?us-ascii?Q?EZQgvHWfPZZIuP1OSxt5NA6jKqVbgSvQ1W4/OQU4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056a616a-5ed3-464c-9160-08dd4fd02ddf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:56:10.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WocCNFssk5aYz3/9uhbs703XrUEa2eqf8jjgWYhmYN+M5ciVPh6Mztpz2pEjIIzaH6IWOOmhf7mypxXQwK5ArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A FS DAX page is considered idle when its refcount drops to one. This
is currently open-coded in all file systems supporting FS DAX. Move
the idle detection to a common function to make future changes easier.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c     | 5 +----
 fs/fuse/dax.c       | 4 +---
 fs/xfs/xfs_inode.c  | 4 +---
 include/linux/dax.h | 8 ++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 7c54ae5..cc1acb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3922,10 +3922,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index b7f805d..bf6faa3 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -677,9 +677,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page_idle(page, fuse_wait_dax_page, inode);
 }
 
 int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index b1f9f15..1b5613d 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3020,9 +3020,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index df41a00..9b1ce98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -207,6 +207,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 		const struct iomap_ops *ops);
 
+static inline int dax_wait_page_idle(struct page *page,
+				void (cb)(struct inode *),
+				struct inode *inode)
+{
+	return ___wait_var_event(page, page_ref_count(page) == 1,
+				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
+}
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
-- 
git-series 0.9.1

