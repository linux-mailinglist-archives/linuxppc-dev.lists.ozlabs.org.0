Return-Path: <linuxppc-dev+bounces-6563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D0A48F64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 04:34:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3v1d2xzxz3c8Y;
	Fri, 28 Feb 2025 14:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740713605;
	cv=pass; b=hTZ+WJ+vvtex1aPLJTrtO83tMTWN/decClCY2WSX0RdQTwg9YcG96zmZTcHc8R2adqwSzJD//YQdJTCzMW5MpkyctrWdIFgGzFMWIO3oOTepTA/ALVAdPcjbgrDV+QKCIOcWHQrYukH8+OhqdmmtI8+pSZP3h30JIZjwbXSUFnSEs57dQnInOPITajPyaG2sjUyKtf/k7cRvfobB2OkK5rRB0o4YZkbCs3Vt+Eqpi/kUSZtYJf0up6UJsmhxkflf9DgqOjI+A9aGHwJXaBbLIwiMHBkiKlQjuEu1b0iEgeM0RElunlq1dp0bnZ01c9IYQWuNQ6xAxrMRxxqArWLNtg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740713605; c=relaxed/relaxed;
	bh=+u0YnLmYHc+DH3jiR+pkv/UEz5kFOMI/DlwLxrVnEzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PK8aetHqNfOVtfsEhvPp052Uji+2/BBuRlsdEGgLNdyCV1UAlndIncOSneDWyGq6Fj5jZCPQRQ/+hxTUaFa9Dc/3pvft7IwaGft/VQUwld+qP9eNQVTz8lUBbbzQaJ++xdbvAAT9XneHqh/u2pSfyRn/v4u34i14mVmaRyg9cQ0tIPCKb2dRJFsNiM1ZytBqGXv3vShLARiXz5cV5+6yhskZEC1OH+/sJmDhIZCld/UZhnZcXyj9nfTqXY+ZU23YAZ9dz9+QlfTwwH+4zy8aEWXPsZQc+4JOJ96gZ2P3Zbo7nOGmsddlZvl3D9g2H+3jwuxyEMsSwt7hOt3sn6AShQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A/IGqJAH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::60d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A/IGqJAH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::60d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3v1c5Vtwz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 14:33:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb3EThmRMp1UMZA0CDkO57LwUJPql6qb9GbDUQ2nPRrmcPQp9B2N1VuOq/F6puakwSLiV5F3+O2uH5Xw+0OPo8tf2bfzLT4y66y15tI7lwKrPUHNBxCYZawH/vcgqNH72SrXCixS4ihgRK6aMS0aXk/I1rv1q3SiTsDCmUMA2o6cpVTh6UCOmRNqDSsAtEpuJugiEmqRsbCkwzgsWye+UWt0tVy2KHtD0sN2yG5gcbx4Ou9HrwHM1anevltPzfdlD/1nBbaT7IEGq8d6IF2pktplOSz8Y5ZSaSoCQuQ8i25j9gvxf8pzmH5Xcc8Gzfnb89bK6OkqdopEcwFwy0x7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u0YnLmYHc+DH3jiR+pkv/UEz5kFOMI/DlwLxrVnEzo=;
 b=JGbT6pT3zQ1E/MqGxVAPvQCIYJYTbgWeas9/KedR7bX0wkWkfT9x8c7Cmn0n9hiJ66ATO3uwo2GPwBuMGKJ51CWnIKTckmCTlKA/OJFOlhngIjrDfkv0U2jB1Z4TbNNtmjYLtLG7GdHstNKWvJ9lXj5Ux9OHLQcY56QzZSAiWwYquKSKJ9liO5uUJTNAo7sL8uDIhxzYeZ1KNfVhDHt79/inlnaj0RqNETuMqOsWiC/umnfrP2GbE1oZXPW0Axutpgoew+n4rZ+ZiIw6M+dI4M2ZJatFjDUAaWORfmq7JCZ7+Osn4ff9rw9icPHF9W6t+5DTaU2VyfrgmMgPPsVlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u0YnLmYHc+DH3jiR+pkv/UEz5kFOMI/DlwLxrVnEzo=;
 b=A/IGqJAH/XLQCjKjZ3u8DoDW/As78o4LyTwHd0ubgio5fD35xQLwi83gms+1aAWmCyKlC/AsiTyx4lUHf0jqXwOU5BlhiI2JG9d6eFxPz0xch9WylNXJh6Ig4GLmX3HGB6MwKSA++Z4CP19++wuXwVasm/Rh27qJRB3T03w6o5i6HgI61DsVSLOFDkuXkaP5axgiT+ikMSQZniNmTMBICa/K99/an759KYMu7DcvR9vA927D8FQLG8C7KuD6o0UYD47K5gUcN5TXk5MYBEmGE4gxgRI69kXUMLojrVZpFigZCuZ4SpWBlWlEJkN+HfIUwgoPpWUXf7BcTBrgwVjLFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:32:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:32:59 +0000
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
Subject: [PATCH v9 20/20] device/dax: Properly refcount device dax pages when mapping
Date: Fri, 28 Feb 2025 14:31:15 +1100
Message-ID: <968d3a8e9157e7492e85d065765c027e525f9fc9.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0175.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::26) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: f03f1155-1661-442b-4f90-08dd57a898f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZboMyZxBpuoKnE/MyLLyscmUBlS/adloX9CLap6AJCrFwYFkTWLwgaUChs+c?=
 =?us-ascii?Q?BI78b9l2ksKykqQpdemLyiDVUGjM1fa5y63aEPJ/kQg8EEiiqHtSExg1ui02?=
 =?us-ascii?Q?+IkFusgGZvDQ8GYg66JoWxd5A1zOd3GHpapJupULK0dWdYWB/VU659JTCl/p?=
 =?us-ascii?Q?z2tbyIxgEPpaREiHtX9GlfHhH6HCLDzx8XuT6MYYDsHS9S6j6jL9hi5liH+K?=
 =?us-ascii?Q?RNU3cmpRrIw2esefXqx9zZR3pmjQgm8uM5jpSYIpN4FaAQE0WrIlfE0z8+Op?=
 =?us-ascii?Q?PaijYVJ3tIHtsMCsFDuO3MBye8HG9T+hcned5qy86zsUouUdwAvtvnxvxacd?=
 =?us-ascii?Q?e1GYTnczCrG157aXIFQMi7UB1aW9CL2qLL/tftQHmfsDjSsMih/vDEv+KTlq?=
 =?us-ascii?Q?JF2T5kpBGJ3XkGaxxTUM2GN3Tl8B1FxSDZV/F1S/6vKSNr3bg0cRWD8tA8OH?=
 =?us-ascii?Q?s+FudKxEU9qTGcPuaUPuTFjL4lWM89j47opM0CFII1xbSpliuIHUPpOfvaqa?=
 =?us-ascii?Q?Je1wCFrOhGNnQo4/2nyE7lLc18MMJ72ydp7GlyeiUdrp5AN5z09NDNDKHKQf?=
 =?us-ascii?Q?Nw/oElK1P7FlDahE5ofmI3nviz0uWjLSduewLoGe7tXhuRza5b9lDa3AaONP?=
 =?us-ascii?Q?pomtkUsWkG0BDLYwEsfLe0BFD1dfAWrjHFnpHrCZUSeI3oNBASnDXkBoOFhA?=
 =?us-ascii?Q?vJTSIsHrLtPyIrtrQDm7G8VYxrt/Nx5z+duy2WMpBrj2CTCmCoZ+RJkcU6yC?=
 =?us-ascii?Q?adMYUxPUJ7BOC1E4Ewmgl+V/WkZVu5kmdgSqYyF0pArlppAQ9UvR9r3tXLwr?=
 =?us-ascii?Q?pMmgT/FJJz9aGZgHlo8gFqyoKLMiRn+MuaZAr5nq9w5zSfInCIlVvZ/qYIii?=
 =?us-ascii?Q?7+LimhPbQvxhpXdSMaNMYl5ibMMllh+6ZAyFdfjtuJ5jfKeI9kqksmK0vONA?=
 =?us-ascii?Q?Q6KFVh/CdjxtXIkKXu/XYlnv2ixtd2K6h4RDRU8SQlNg4p5XMENqBlAIa9kg?=
 =?us-ascii?Q?trREbnNdtDiKjaLImYCLDql7V1Hs2R/z5SAj5vBX/ObvJmgG172ye0/gfw36?=
 =?us-ascii?Q?FS5HslyfOf37m7WFtod3gPl2h1WTZOnaU6CFMkEb2MtAYmxc11JajzlY/lBi?=
 =?us-ascii?Q?ntUOox13HaYaCaTtVliBoa0IMPa1pumGbsA/ahq8Bh0eYJGX/2voXJrHuv23?=
 =?us-ascii?Q?o+wRsSMUG0pFIGlN/vLyztYtEcgAQJDSl03hiMGaEa7lRM0diim91ezgU4E4?=
 =?us-ascii?Q?TktRC+u6HeudUfGjYHLuoULb2138Ec/iEa/EwVdJrgpR38HuyXDYIVHCns0z?=
 =?us-ascii?Q?ScUdFPhSzysYXW759JNYTeJzVTCCm7gNzel0d8/aN0+8x7mH8g3yDhCDRvoe?=
 =?us-ascii?Q?efQlJnMUwNWzM9IuPJDPfJgpbu4L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsyXbcIJBsCx2zSjk/fTLogxTepGD6GyfDif3hHH/eY9KkEU70vstXl1PPmm?=
 =?us-ascii?Q?W1KvKQI8WwL3mr2fuh+WOfNb3Y6fIVew0zetUw4l062MnClRaBazhLidX0SM?=
 =?us-ascii?Q?mLpHwMJGOHa9k0WjpRfSD8ZUESbbj4w4kklnpQ3AcKuoQfjRR509mQnFyggr?=
 =?us-ascii?Q?yOpOfuce0EouiJS9TpE2bs1VtQjr52V6/QIknHzImd4veazr0PI8nM9UNDJH?=
 =?us-ascii?Q?sc3vdLRD7Q7/HDM7Ie0LN+k4I8VTRUJ1BlugVcpfoRCRz6NBJ1JfgDcD47zS?=
 =?us-ascii?Q?VNGZU9aMI/dqRYJtI6VHgnjpvZr+LZ3Am06DH18pucXIm+v5sEwZynGU4CyZ?=
 =?us-ascii?Q?rzh1xdWBR96j2BAabnddxLOIo3jzeKd/fISXsnL6RAJQXNiBmx9olVcr+App?=
 =?us-ascii?Q?YK7/TnWz2jMim2oHEw32Q60pmdxThy9VYCPJjEto25jHsOwG6ZEPOb2b0BVU?=
 =?us-ascii?Q?eQsH5rx0I99Lb52NhSfW/5BGdnGWQ4LY2yIVg2wp0hGp43stVBxSUg+zDu3C?=
 =?us-ascii?Q?r0ktVTTzi5RFU+395hnVopRk21k1Ik9SRfwQhv2lmZ5TokH2+qufqINUDeN9?=
 =?us-ascii?Q?zB9sxgmXjFclCU5IZnpZSUMAcNcBCMTzqp8hEr5hmJ689evV45Qweea6nMez?=
 =?us-ascii?Q?j/0iw9WwiUNBBQyTDOk/8TWT/kHfsYKW+K1MlopmReXW2nJMcbykmyKgZBgn?=
 =?us-ascii?Q?pkX6AUIB9uq5Y7qM2hb4Q6j8+CHnj1LcuGoXXZCXIkLXlmCiQdwMrHSQr1fb?=
 =?us-ascii?Q?jN2Ixfm3Kn5SIPN08emQh+ausKWykkJnnTE3PNLHFkH0glNnR6RkyvrXx9IS?=
 =?us-ascii?Q?5XU6EXfcPZuuzrbhXx3Ua67hRlq5uKGo12aPBApFDRJA3LQEwl3FRqEiHc9l?=
 =?us-ascii?Q?v34g1KkVhEKasP/5Yv45Bj1W8dE8eVeCWSJEMeXiOPsSPKzoczxRc8L9NA7j?=
 =?us-ascii?Q?zFIS3AROtj7o8RGryV+qu62tGnra1dgudnGxXiICWkfH7GsRagWwTo7I9JXa?=
 =?us-ascii?Q?enWegkEeo/woklHaDqTcls2rUhZUGm76vIkH82h9aY7OKW23vtOgVF+sMCIe?=
 =?us-ascii?Q?rXA+XGwo87LKkinhQHvlaP6eBeWscB4o55ysdBHGAMlSqPDquE5yXC7QoSPE?=
 =?us-ascii?Q?ibcAhzzYgmtg6D+xqVCTHRGEwepeOPXryfH5p873d2cOo/q9zf++tutgOxt+?=
 =?us-ascii?Q?+hmuLJeLhDqTVccG91K8cbh1vQvUNZJ2Lo0K38/mFTQh4HfSRcJVMdGe5gaB?=
 =?us-ascii?Q?EbF/wUrCQvd6CvTEtMZEpKUBx/c4Uz57KRheVoBlBjZ46oyRqjYPXmEfKzDJ?=
 =?us-ascii?Q?p5+iTMU+dch39Jq4VJqbdpiqkehpzKDClQYc+f8QfIbM4w4qUn2Xvr178/Wf?=
 =?us-ascii?Q?FoRAbLth5LQacHALqXGL53plX0c7iZckLFwDb2sXpIvXr83MLEM/xPXBwBml?=
 =?us-ascii?Q?W+fNqGLPH7yYzjYIbmAM0a9UrUXeOV7oRLio4fYUo1lVAXDIPWio6qAyB7uD?=
 =?us-ascii?Q?fP5M/xeEImPT/vX5d5oi5qtMs8fNaQ7PrQMtbTiq2I8qOSmk8EE/+reOX7Vx?=
 =?us-ascii?Q?j4MLELj8sMZVpLnh7e592dFnPdIAdnc+/ZAtmIMD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03f1155-1661-442b-4f90-08dd57a898f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:32:59.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gwYvZ9ATlaMB1KHr74HZw3AAUQ/U9ML83qzTvhsIWmHRNJ3H0m5eNhUjZI3PPKViJIfcxx7CENVgiIjHlDlNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-Spam-Status: No, score=-0.4 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Device DAX pages are currently not reference counted when mapped,
instead relying on the devmap PTE bit to ensure mapping code will not
get/put references. This requires special handling in various page
table walkers, particularly GUP, to manage references on the
underlying pgmap to ensure the pages remain valid.

However there is no reason these pages can't be refcounted properly at
map time. Doning so eliminates the need for the devmap PTE bit,
freeing up a precious PTE bit. It also simplifies GUP as it no longer
needs to manage the special pgmap references and can instead just
treat the pages normally as defined by vm_normal_page().

Signed-off-by: Alistair Popple <apopple@nvidia.com>

Changes for v9:
 - Fix warnings when pgmap->ops isn't defined for FS_DAX, reported by
   Gerald Schaefer.
---
 drivers/dax/device.c | 15 +++++++++------
 mm/memremap.c        | 14 +++++++-------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index bc871a3..328231c 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -125,11 +125,12 @@ static vm_fault_t __dev_dax_pte_fault(struct dev_dax *dev_dax,
 		return VM_FAULT_SIGBUS;
 	}
 
-	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
+	pfn = phys_to_pfn_t(phys, 0);
 
 	dax_set_mapping(vmf, pfn, fault_size);
 
-	return vmf_insert_mixed(vmf->vma, vmf->address, pfn);
+	return vmf_insert_page_mkwrite(vmf, pfn_t_to_page(pfn),
+					vmf->flags & FAULT_FLAG_WRITE);
 }
 
 static vm_fault_t __dev_dax_pmd_fault(struct dev_dax *dev_dax,
@@ -168,11 +169,12 @@ static vm_fault_t __dev_dax_pmd_fault(struct dev_dax *dev_dax,
 		return VM_FAULT_SIGBUS;
 	}
 
-	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
+	pfn = phys_to_pfn_t(phys, 0);
 
 	dax_set_mapping(vmf, pfn, fault_size);
 
-	return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
+	return vmf_insert_folio_pmd(vmf, page_folio(pfn_t_to_page(pfn)),
+				vmf->flags & FAULT_FLAG_WRITE);
 }
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
@@ -213,11 +215,12 @@ static vm_fault_t __dev_dax_pud_fault(struct dev_dax *dev_dax,
 		return VM_FAULT_SIGBUS;
 	}
 
-	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
+	pfn = phys_to_pfn_t(phys, 0);
 
 	dax_set_mapping(vmf, pfn, fault_size);
 
-	return vmf_insert_pfn_pud(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
+	return vmf_insert_folio_pud(vmf, page_folio(pfn_t_to_page(pfn)),
+				vmf->flags & FAULT_FLAG_WRITE);
 }
 #else
 static vm_fault_t __dev_dax_pud_fault(struct dev_dax *dev_dax,
diff --git a/mm/memremap.c b/mm/memremap.c
index 9a8879b..2aebc1b 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -460,11 +460,7 @@ void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
 
-	if (WARN_ON_ONCE(!pgmap->ops))
-		return;
-
-	if (WARN_ON_ONCE(pgmap->type != MEMORY_DEVICE_FS_DAX &&
-			 !pgmap->ops->page_free))
+	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
@@ -494,12 +490,15 @@ void free_zone_device_folio(struct folio *folio)
 	 * zero which indicating the page has been removed from the file
 	 * system mapping.
 	 */
-	if (pgmap->type != MEMORY_DEVICE_FS_DAX)
+	if (pgmap->type != MEMORY_DEVICE_FS_DAX &&
+	    pgmap->type != MEMORY_DEVICE_GENERIC)
 		folio->mapping = NULL;
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
 	case MEMORY_DEVICE_COHERENT:
+		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
+			break;
 		pgmap->ops->page_free(folio_page(folio, 0));
 		put_dev_pagemap(pgmap);
 		break;
@@ -509,7 +508,6 @@ void free_zone_device_folio(struct folio *folio)
 		 * Reset the refcount to 1 to prepare for handing out the page
 		 * again.
 		 */
-		pgmap->ops->page_free(folio_page(folio, 0));
 		folio_set_count(folio, 1);
 		break;
 
@@ -518,6 +516,8 @@ void free_zone_device_folio(struct folio *folio)
 		break;
 
 	case MEMORY_DEVICE_PCI_P2PDMA:
+		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
+			break;
 		pgmap->ops->page_free(folio_page(folio, 0));
 		break;
 	}
-- 
git-series 0.9.1

