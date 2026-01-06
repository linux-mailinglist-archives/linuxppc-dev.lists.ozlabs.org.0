Return-Path: <linuxppc-dev+bounces-15287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE98CF64B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 02:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlYZb5WYtz2yFQ;
	Tue, 06 Jan 2026 12:32:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.69 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767663175;
	cv=pass; b=ANLn6IzVxZrHWEwkbO9tr1CibtAsTs9QKVUWGLfdBKe0sSiz/CH2T9x9PklCTIRg0YgEwdXv9BL6huEwqTawsBPyP2fAzO4l1zDhN+s/TxUd08CHuxbi7/J7kUL6L5BnsMbpWgUUj8f0jdvEdHqLlFEVyk2GEmiUZtE54mlht0/emYkMfCB+XzL6UoUqgwV8CPcSaOl5Vap3v5C8obA7MgqMDASHIHLbykeooTLt5kljxOGPzjJijQNrUbdRHtHY5I4G+NX+9KL1GZsYmdxypS+hNleIdGQPWZe7ZF62lDnIVpEDOT+ZfsOVdTab4OjvGuNZ0ykuDUW980QQKsru9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767663175; c=relaxed/relaxed;
	bh=PZI0IwnwXu249QkbxUFiZej9pfgE+OdCVxOzSw7Itow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cT0/KDdCB0Tv6GDc2X3RPqUAuyH6C6h7HEvaB3k83PdK7I5k+7BNy3kIVuOKbKdbSXGvo59RjbIDMzeqvQLs86q+EWBcVSV0XlCdGMd32jyJSJN3ykEj1d1D5NhZ4CrCpOwTSj31UsBYDzmy9dbj4VuD0whceT3HsUib6b+a6R3/bDK6GvACFGxtL/ENo2DZIVzKYowqElstE1NYD8bdsyBe2QapZASYDQeNoQ+0OnSZxNmpnlKb26rMex5RH8AN13B9lzgOvTOunuthiuIldtBZEMMgkTBNwdh0VDqltL+YAFfpMDKF8tNEwT8Sn0SMMaWN6dGAAF8XjAZXDCj36Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pXI0YHVo; dkim-atps=neutral; spf=pass (client-ip=52.101.193.69; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pXI0YHVo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.69; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlYZY4P4mz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 12:32:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4me5nFkt3TKUSLxuqCRFHYdvu2C5fU1JXX+OrxLk0DF/9VRFcLLr79k23iksyHkHw2txUNAIAoaZSSALwxsMRCtuuI3NaszrqT3vedwLCKmH22JRQzZNlyV1DHbl9C3sE7JfskW2cVP283etBENskDeqGBjSN7lXy59q3jBsKe47C14wPv8p7nGl5mYxwD//+dIfdFHS0bXDqPHQtwlrWY0PP+P0IFmkKxokBj+oQ6/+R4Ry5ilo0ctN8I/giSKTNS4Q8bFGKdAjql8Y9tvww1nSQxA4cUD3gasVg0LYv2HufvwdIsPbqnNdtJxFdcp5SXzC2tjIWOrhpVkqcGaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZI0IwnwXu249QkbxUFiZej9pfgE+OdCVxOzSw7Itow=;
 b=GGgBoP8I5fWTI0VeYoDxIWotnfy1E41yL5PxYJz5TmldV9RQCjPAjZkzJQ/3qLo+bEFwSA8SVhjOohwEj0yD7fKI+J3+ibu+m2glfscXBpxe7IVJTR/M37tGNrA+V7pAescVdvdlIXg6dYHB9lQWDjoyzi/a15Gw1KsCGzpi3m8dcKkq/I0Wm2xLXkeUtgAKfT85+ta4ZU3wg2EcVnyBORPu/qeYG4NcEuFAHa6qU720jZjco3sn5KP/rxEb1lX8wjdzuhus9sQKFdwEgmbZuhese9G//0j5a2f6DDGu+PTzVywgo59ajwcbaSslc/0peDg3GLwB2es/WejEj+QVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZI0IwnwXu249QkbxUFiZej9pfgE+OdCVxOzSw7Itow=;
 b=pXI0YHVoG7AELAH+CNQh5/LRST6utBcVEvr52NWiqZsNJYa2m2M985GFazuDLwL2wAfRKsBYq2BXJFO2FnhuKPfg+3J2nwEmUgAY84IIy1RrsEb36BzQRqeu/EX2HUs7WaqtKw2h9jbF4C9dv9qwkUtSdqllF32blxZlOiq+FKI/hKXMDAfsNkDEo84Q2IQq15PYXcxbvq+hFYJINWqq2XI1fdj21U35fwSIucbqyaEPRKZTG9PGTe+iD6J3W9nWBZF3m6d+Fy7HD7qiVjgXNdRLqb1F96x3znHVH5jA/4yqEPB/udReg5AQvm9fCeZHMrBDnIMQH7z/tcB4QqHG8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 01:32:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 01:32:07 +0000
Date: Tue, 6 Jan 2026 12:32:00 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com, 
	dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, 
	mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org, 
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca, 
	Felix.Kuehling@amd.com
Subject: Re: [PATCH v1 4/8] mm: Add a new swap type for migration entries of
 device private pages
Message-ID: <yvxdi7ychkfnxo44ydabclirfm7qoswgrq3hfx2qgtdq5xmuld@i3dlsgnbtlip>
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-5-jniethe@nvidia.com>
 <knd4e43pwy3stoj5ydld4fl4kjzzjnsod5kpucnnhzgbs5hrmv@fxrcyzo7e72x>
 <ca992e0c-2299-47cb-8558-103db426d9b9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca992e0c-2299-47cb-8558-103db426d9b9@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0025.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::10) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b291ac-e722-4b22-b087-08de4cc36714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kyff7+3vqJVSdyl3ojrci3put//SKZnVr/DAGAj1edLnxsC6nl1JUBWTB/3A?=
 =?us-ascii?Q?F0cNtGPhxI/BqQlllk0QVqr/1+aq0pazuE/66/1EHuNZk5ZOICDRx3TlLqw2?=
 =?us-ascii?Q?743cgDy9LlubY6MK9K12FMWUAdt8gp3S4uHW+IqCmIBdIVxrmgTXbMFz7yiU?=
 =?us-ascii?Q?XbjQiKC1epxKVctlMCu/V0F4K2oQuInCitEJmPuLMMrrNZnf+PYE3opvV1Kf?=
 =?us-ascii?Q?nnrOYarQCDpLRF2sBGcdLsv5en6Y1oRm1F7JanfXH2iFNm98bmrw5oPVHdfk?=
 =?us-ascii?Q?6nql/lXw3af+YEWCPnrZgX5G4sH3W9HscHLOFdgf45by3qE+VriI2DhziNYt?=
 =?us-ascii?Q?wMYw9QoA93LF0j+JzuCBiFexSUPVRcANxgfLWl6l9ppDURrj+9XTUOBknYfV?=
 =?us-ascii?Q?/0jkS0cMGu4jokAcZPKfHG4HbhSiE61SzgCrWNus5IUFUVaPwRpK6NrdgfFY?=
 =?us-ascii?Q?H6zsPyWZFSkdCzJueVmrNfrKVWN8OKTTeuHWe6SBB0z/GSFuhTQgf30TXojL?=
 =?us-ascii?Q?RwWVxP4aPlbQBzTK4JcZPaLuffmeglqsMerUVdY59SAeZaNopta7cJeD3qX8?=
 =?us-ascii?Q?YN2jXBBkrDrmhRmgeYWlhuM2lFFhCbbh5RuGgGbKnePVeUiyjuqJs7DMhNY6?=
 =?us-ascii?Q?NBqBxheznY1IJHc2ga4r6pwFOwY/ZIUelfyNmE44LKjY32dMQINqSkmn3drf?=
 =?us-ascii?Q?Na9qB273U/KFaNKF9eFTRwvksfEzrWmlYUElx5SSSBy+nZ089+49oCt5WLbC?=
 =?us-ascii?Q?PZmJytMnpjP4+lGC7sJEIMLPEMQ6NLkPjn9CGoiP6e2NWaLk1yg1mJ+L2c8r?=
 =?us-ascii?Q?uyQ7JBNaaur48sfXI3zwqZbWG8ZGGFQDZptAA6vr5nHW+QBr+84Gh2ZS5uUQ?=
 =?us-ascii?Q?a9PCCI7dDit+zFjej7JoFuxTKRLg9fH9zTMuqYDMqVtaybPSBVPauv6y6Y2L?=
 =?us-ascii?Q?O9oAWSUTwgbvJff7P41p1SaxSToPpSh3RECuv6x/4zBBrNzLELPhzytQqQ6O?=
 =?us-ascii?Q?92+3VmZEmi/Xs3KZOGEJ0kH78+gOqUN/7kBB1d1vAygLzom7rZ9hoTWGd1X7?=
 =?us-ascii?Q?p8MMbfVC+Sgr7R0c+vCFwpkOBZHIqbCAIid6lV985yd/Rwf0phZS8o6jKZbM?=
 =?us-ascii?Q?lBylKpSS49qwR4UC70mfovvP464Upvu7l9IfffZ6GTdA1CzM3LfpTTK77l9x?=
 =?us-ascii?Q?8VubEpUN6BBpIFxlpM5WjCy8PaKjG8YJvngOOAt7RDr1lJv9Ic4urjKHl2ET?=
 =?us-ascii?Q?lmxqaqaXhYUFc9j2WpLgoVxJlnmH3HNzsc/KFicm7fl8w8pQwkad62QiXlN6?=
 =?us-ascii?Q?idUSQD03oqV418RhC922ETUzuL7u3rRA3hu7lEja2yiB9Nflx0vF6v8Ye95w?=
 =?us-ascii?Q?SXuBK2EPMoZbXBJJt25svVfMcyhHo3zwXhT9a9vJIsoYer4kuLPFVcykgdqA?=
 =?us-ascii?Q?YGLJL08p/dyKhZ6Y7XNmbfzvHoVJIJdH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uWkNUiKeboW/phch3ZF85gjZqmzJ5rflHm712/qmL3S8Gf4kqXeytJVk2p09?=
 =?us-ascii?Q?H9H/G+Bu6Yj5N5nALsV67YSGzQSbMNx5qW9fHG17E7h0uCfB/l/gHSA02or2?=
 =?us-ascii?Q?PQq2YrdwW5RKd7a7ijUQ5X/AKZVTSKHaxRGxWOxYZ0yiyq46DY9MULyhLguB?=
 =?us-ascii?Q?XnGb6xfedmWoqkEMa2w5+rEId4d/hMeLC4dZUZm5T2d4RsLKbqE1ccYXb/Tu?=
 =?us-ascii?Q?mk8Em49dw/PFhp0Fy37rueHBXDoWyd8JRU9QVtb8cU81FB/PD2nTXeA/8Ied?=
 =?us-ascii?Q?MD3C3ypgUc7qRgA/jMstPu0kvAEwzCHa/+7puZK7YuvxHVY+xqdq0aSzuC2l?=
 =?us-ascii?Q?HbJIyzgQkx4N7CfqN7S4KKrjkNANasamHMy+/dHQE0lrLMIfSk7fiv3+/+jw?=
 =?us-ascii?Q?nKbuJjDKR9z7hNFobH9pYQHiNJecRpYXFvLww3xJjL61Ympqd/Fi83ldrdGg?=
 =?us-ascii?Q?QenVzIas31CmQNXjEG2pZvC22jHuFUgzHV8/i44mTYj5GkHsvL7lqeU/Ye99?=
 =?us-ascii?Q?HgBq3UZnoiwtxg5WpaSlvo8s/G3CEiRHB7xZ0KfxD08gik40AeUkNI9EVwyh?=
 =?us-ascii?Q?33Os7QBuzVGgv+aa0RPU/9+M8XLqWuggyWETAN0edwlSYTIH9rCIqU6h633d?=
 =?us-ascii?Q?vI7Efr05D61O8a7+38qVV+17IGJ7KDThH4zBaubeqXaz9lN4aVibQE3SIRrQ?=
 =?us-ascii?Q?QGGhL5T6E0dMhGHU/97kWsYNlR5oFZLEztBhcEProL5OH3PtZbAj7kvup7ag?=
 =?us-ascii?Q?4iKLkT62pAbpYZr+RVAsGpY4Msxn8ATH7hAQEr3QhjEbLHFXywy8S7AkAAni?=
 =?us-ascii?Q?go0k6NLKaffi53PzcER3fqnWpERqgsXen4a4OLTfk73ZksATJm8ILWluCl/Q?=
 =?us-ascii?Q?hXJ5fJZ4KKs0V935wz2i/6W1BjkTVLN042nP7P48DYXJNRYtLCxKOz12MpOC?=
 =?us-ascii?Q?yqlCzwkgllgplwqRTuwesDgwWol5V9RSCQW9T5DDkswKpVwJ5h0R0ajdveae?=
 =?us-ascii?Q?xSweujdL0wxRYV7GYr3Jrsmb+RPGz1fhqj/QAu9xSOKY1TjZVmMmxQ61oLVr?=
 =?us-ascii?Q?I5kUTMtIKpQqo958oDSnP1/9YrUchRN45IjmFKw0cpWJ2QX988RlmMsi0sTY?=
 =?us-ascii?Q?9PydqQywvhNCC0dP8lIdQCTw8hAfBV/sLGfZhsyv4EDQ5gr1NSDVGQxAf0GM?=
 =?us-ascii?Q?82jEUdfU9onm9veBhyIYxLF1W65VAFHY1woNSTlsfoEtWMy8HE5lW9ohfDDQ?=
 =?us-ascii?Q?VQH4RDSKp44jfihZotUbiPqEfYMR8cSQVbYlyfDC1JJAPm75brrPbklQ5Wmh?=
 =?us-ascii?Q?zOEqlCOwBgb6PqGFykzSBudZoJ/lX3xDeTTbD9JlWDeLnG73GkGthHUJs5kK?=
 =?us-ascii?Q?JclH6DfbKVbMfV1n+a+36UYPjzpQTfShN/EgWi1+DPhiYTLaqIevTvpUt0VS?=
 =?us-ascii?Q?nzsGV0SjWnAiwSNV2oQaBUj8ajnGRGdEvkil5AeqMM2hnn29AQk0CTRpqxyQ?=
 =?us-ascii?Q?/n8/GNfIfNHeiUTkj+SinjXtwwKXWntUYJhddInw61sO1DbWMhnkeJPWnBgF?=
 =?us-ascii?Q?8jA5phjv//+38rWiXy+VmgD5AreqOX2S+5bEdsysc84pi5kdmluP05k1M3CC?=
 =?us-ascii?Q?Y6KVxp14zqnFRM9uUUo8I9pneggSwbBp2iccrDupa7vEfdxx8dMor904BgCL?=
 =?us-ascii?Q?uOyk1zuVO9LbheUYmTBVGCGpfcjWEQmSXWxXghClU/8aXwOBk4YPLDLDT9zL?=
 =?us-ascii?Q?4TrZiLczyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b291ac-e722-4b22-b087-08de4cc36714
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:32:06.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSnAAVimnXERWAJR1BZcOeizkKIhiuGRYbdxGiyBy7pQb2qq5GexZtkcbtE7SJpsyqBmooHzbJSn4pvbs2cizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-05 at 13:56 +1100, Jordan Niethe <jniethe@nvidia.com> wrote...
> Hi,
> 
> On 5/1/26 12:17, Alistair Popple wrote:
> > On 2025-12-31 at 15:31 +1100, Jordan Niethe <jniethe@nvidia.com> wrote...
> > > A future change will remove device private pages from the physical
> > > address space. This will mean that device private pages no longer have
> > > pfns and must be handled separately.
> > > 
> > > When migrating a device private page a migration entry is created for
> > > that page - this includes the pfn for that page. Once device private
> > > pages begin using device memory offsets instead of pfns we will need to
> > > be able to determine which kind of value is in the entry so we can
> > > associate it with the correct page.
> > > 
> > > Introduce new swap types:
> > > 
> > >    - SWP_MIGRATION_DEVICE_READ
> > >    - SWP_MIGRATION_DEVICE_WRITE
> > >    - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
> > > 
> > > These correspond to
> > > 
> > >    - SWP_MIGRATION_READ
> > >    - SWP_MIGRATION_WRITE
> > >    - SWP_MIGRATION_READ_EXCLUSIVE
> > > 
> > > except the swap entry contains a device private offset.
> > > 
> > > The existing helpers such as is_writable_migration_entry() will still
> > > return true for a SWP_MIGRATION_DEVICE_WRITE entry.
> > > 
> > > Introduce new helpers such as
> > > is_writable_device_migration_private_entry() to disambiguate between a
> > > SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
> > > 
> > > Introduce corresponding softleaf types and helpers.
> > > 
> > > Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > ---
> > > v1:
> > >    - Update for softleaf infrastructure
> > >    - Handle make_readable_migration_entry_from_page() and friends
> > >    - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
> > >    - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
> > > ---
> > >   include/linux/leafops.h | 70 +++++++++++++++++++++++++++++++++----
> > >   include/linux/swap.h    |  8 ++++-
> > >   include/linux/swapops.h | 76 +++++++++++++++++++++++++++++++++++++++++
> > >   mm/huge_memory.c        | 21 +++++++++---
> > >   mm/memory.c             | 10 ++++--
> > >   mm/mprotect.c           | 21 +++++++++---
> > >   mm/page_vma_mapped.c    |  3 +-
> > >   7 files changed, 188 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> > > index cfafe7a5e7b1..a4a5c3ad647b 100644
> > > --- a/include/linux/leafops.h
> > > +++ b/include/linux/leafops.h
> > > @@ -28,6 +28,9 @@ enum softleaf_type {
> > >   	SOFTLEAF_DEVICE_PRIVATE_READ,
> > >   	SOFTLEAF_DEVICE_PRIVATE_WRITE,
> > >   	SOFTLEAF_DEVICE_EXCLUSIVE,
> > > +	SOFTLEAF_MIGRATION_DEVICE_READ,
> > > +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
> > > +	SOFTLEAF_MIGRATION_DEVICE_WRITE,
> > >   	/* H/W posion types. */
> > >   	SOFTLEAF_HWPOISON,
> > >   	/* Marker types. */
> > > @@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
> > >   		return SOFTLEAF_DEVICE_PRIVATE_READ;
> > >   	case SWP_DEVICE_EXCLUSIVE:
> > >   		return SOFTLEAF_DEVICE_EXCLUSIVE;
> > > +	case SWP_MIGRATION_DEVICE_READ:
> > > +		return SOFTLEAF_MIGRATION_DEVICE_READ;
> > > +	case SWP_MIGRATION_DEVICE_WRITE:
> > > +		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
> > > +	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
> > > +		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
> > >   #endif
> > >   #ifdef CONFIG_MEMORY_FAILURE
> > >   	case SWP_HWPOISON:
> > > @@ -190,16 +199,62 @@ static inline bool softleaf_is_swap(softleaf_t entry)
> > >   	return softleaf_type(entry) == SOFTLEAF_SWAP;
> > >   }
> > > +/**
> > > + * softleaf_is_migration_device_private() - Is this leaf entry a migration
> > > + * device private entry?
> > > + * @entry: Leaf entry.
> > > + *
> > > + * Returns: true if the leaf entry is a device private entry, otherwise false.
> > > + */
> > > +static inline bool softleaf_is_migration_device_private(softleaf_t entry)
> > > +{
> > > +	switch (softleaf_type(entry)) {
> > > +	case SOFTLEAF_MIGRATION_DEVICE_READ:
> > > +	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
> > > +	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
> > > + * device private migration entry?
> > > + * @entry: Leaf entry.
> > > + *
> > > + * Returns: true if the leaf entry is a writable device private migration entry,
> > > + * otherwise false.
> > > + */
> > > +static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
> > > +{
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
> > > +}
> > > +
> > > +/**
> > > + * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
> > > + * readable device private migration entry?
> > > + * @entry: Leaf entry.
> > > + *
> > > + * Returns: true if the leaf entry is an exclusive readable device private
> > > + * migration entry, otherwise false.
> > > + */
> > > +static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
> > > +{
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
> > > +}
> > > +
> > >   /**
> > >    * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
> > >    * @entry: Leaf entry.
> > >    *
> > > - * Returns: true if the leaf entry is a writable migration entry, otherwise
> > > - * false.
> > > + * Returns: true if the leaf entry is a writable migration entry or a writable
> > > + * device private migration entry, otherwise false.
> > >    */
> > >   static inline bool softleaf_is_migration_write(softleaf_t entry)
> > >   {
> > > -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
> > > +	       softleaf_is_migration_device_private_write(entry);
> > >   }
> > >   /**
> > > @@ -219,12 +274,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
> > >    * readable migration entry?
> > >    * @entry: Leaf entry.
> > >    *
> > > - * Returns: true if the leaf entry is an exclusive readable migration entry,
> > > - * otherwise false.
> > > + * Returns: true if the leaf entry is an exclusive readable migration entry or
> > > + * exclusive readable device private migration entry, otherwise false.
> > >    */
> > >   static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
> > >   {
> > > -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
> > > +	       softleaf_is_migration_device_private_read_exclusive(entry);
> > >   }
> > >   /**
> > > @@ -241,7 +297,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
> > >   	case SOFTLEAF_MIGRATION_WRITE:
> > >   		return true;
> > >   	default:
> > > -		return false;
> > > +		return softleaf_is_migration_device_private(entry);
> > >   	}
> > >   }
> > 
> > See below for a bit more context but I'm not convinced we want to include device
> > private entries in the definition for softleaf_is_migration(), etc. It seems
> > to me like it would be better to make callers explicitly deal with the device
> > private cases separately which most seem to do anyway.
> 
> That is not generally the case - the only instances where the device
> private cases are dealt with separately are when we are creating new
> entries.
> 
> The advantage to treating the device private migration leaf entry as a
> specialization of the migration leaf entry is that because most callers
> are not creating new entries, they do not need to be updated to
> accommodate the new entry type.
> 
> As an example - take hmm_vma_handle_pte() -
> 
>                 if (softleaf_is_migration(entry)) {
>                         pte_unmap(ptep);
>                         hmm_vma_walk->last = addr;
>                         migration_entry_wait(walk->mm, pmdp, addr);
>                         return -EBUSY;
>                 }
> 
> We'd need to update this to be
> 
>         if (softleaf_is_migration(entry) ||
> softleaf_is_migration_device_private(entry))
> 
> There is no distinction between these cases so this is just noise.

I disagree this is just noise though - it documents that this specific
case expects and deals with device private entries. For example in
hugetlb_change_protection() we have this:

		} else if (unlikely(softleaf_is_migration(entry))) {
			struct folio *folio = softleaf_to_folio(entry);
			pte_t newpte = pte;

			if (softleaf_is_migration_write(entry)) {
				if (folio_test_anon(folio))

In the above it's not clear whether we expect to be able to handle device
private entries the same way or not because they are implicitly accepted (and
incorrectly handled). We can figure that out from context (ie. hugetlb doesn't
support device-private pages), but it's more obvious if it's explicit.

> That would be the case for the majority of the callers of
> softleaf_is_migration(), softleaf_is_migration_read(),
> softleaf_is_migration_read_exclusive(), softleaf_is_migration_write().
> 
> This specialization treatment is further convenient as it allows
> make_readable_migration_entry_from_page() to create a device private
> migration entry or a migration entry as required.

On first look I'd missed the make_readable_migration_entry_from_page(). Agree
this is nice and would go some way to addressing my concern above. Ie. the code
in hugetlb_change_protection() could be updated to use the entry_from_page()
variants instead so that at least such a case would be dealt with "correctly".

> The code in change_pte_range() called out below as difficult to read would
> actually
> be simplified by using the make_.*_migration_entry_from_page() helpers
> as it would remove the conditional. The only extra consideration is
> making sure the SWP_MIG_YOUNG_BIT and SWP_MIG_DIRTY_BIT bits were copied
> to the new swap entry.

Ok, I didn't immediately see this but sounds good.

> > 
> > We also need to be consistent in the definitions - softleaf_is_migration(),
> > softleaf_is_migration_read_exclusive() and softleaf_is_migration_write()
> > all return true when encountering a device private entry but
> > softleaf_is_migration_read() does not.
> 
> Thanks - this is a mistake.

With this and the above changes I'd be ok with including device private entries
in the migration entry tests. Might be good to hear Lorenzo's thoughts though.

 - Alistair

> > 
> > > diff --git a/include/linux/swap.h b/include/linux/swap.h
> > > index 38ca3df68716..c15e3b3067cd 100644
> > > --- a/include/linux/swap.h
> > > +++ b/include/linux/swap.h
> > > @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
> > >    *
> > >    * When a page is mapped by the device for exclusive access we set the CPU page
> > >    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
> > > + *
> > > + * Because device private pages do not use regular PFNs, special migration
> > > + * entries are also needed.
> > >    */
> > >   #ifdef CONFIG_DEVICE_PRIVATE
> > > -#define SWP_DEVICE_NUM 3
> > > +#define SWP_DEVICE_NUM 6
> > >   #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
> > >   #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> > >   #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> > > +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> > > +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
> > > +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
> > >   #else
> > >   #define SWP_DEVICE_NUM 0
> > >   #endif
> > > diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> > > index 72aa636fdb48..2bd01f97b4f0 100644
> > > --- a/include/linux/swapops.h
> > > +++ b/include/linux/swapops.h
> > > @@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
> > >   	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
> > >   }
> > > +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
> > > +}
> > > +
> > > +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
> > > +}
> > > +
> > > +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> > > +{
> > > +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
> > > +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
> > > +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> > > +}
> > > +
> > > +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
> > > +{
> > > +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
> > > +}
> > > +
> > > +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> > > +{
> > > +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> > > +}
> > > +
> > > +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
> > > +}
> > > +
> > > +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> > > +{
> > > +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
> > > +}
> > > +
> > >   #else /* CONFIG_DEVICE_PRIVATE */
> > >   static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
> > >   {
> > > @@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
> > >   	return swp_entry(0, 0);
> > >   }
> > > +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(0, 0);
> > > +}
> > > +
> > > +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(0, 0);
> > > +}
> > > +
> > > +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> > > +{
> > > +	return swp_entry(0, 0);
> > > +}
> > > +
> > > +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > >   #endif /* CONFIG_DEVICE_PRIVATE */
> > >   #ifdef CONFIG_MIGRATION
> > > @@ -175,6 +242,9 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
> > >   static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
> > >   {
> > > +	if (is_device_private_page(page))
> > > +		return make_readable_migration_device_private_entry(page_to_pfn(page));
> > > +
> > >   	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
> > >   }
> > > @@ -185,6 +255,9 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
> > >   static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
> > >   {
> > > +	if (is_device_private_page(page))
> > > +		return make_readable_exclusive_migration_device_private_entry(page_to_pfn(page));
> > > +
> > >   	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
> > >   }
> > > @@ -195,6 +268,9 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
> > >   static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
> > >   {
> > > +	if (is_device_private_page(page))
> > > +		return make_writable_migration_device_private_entry(page_to_pfn(page));
> > > +
> > >   	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
> > >   }
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 08c68e2e3f06..bbfe5e87884a 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1800,7 +1800,11 @@ static void copy_huge_non_present_pmd(
> > >   	if (softleaf_is_migration_write(entry) ||
> > >   	    softleaf_is_migration_read_exclusive(entry)) {
> > > -		entry = make_readable_migration_entry(swp_offset(entry));
> > > +		if (softleaf_is_migration_device_private_write(entry) ||
> > > +		    softleaf_is_migration_device_private_read_exclusive(entry))
> > > +			entry = make_readable_migration_device_private_entry(swp_offset(entry));
> > > +		else
> > > +			entry = make_readable_migration_entry(swp_offset(entry));
> > >   		pmd = swp_entry_to_pmd(entry);
> > >   		if (pmd_swp_soft_dirty(*src_pmd))
> > >   			pmd = pmd_swp_mksoft_dirty(pmd);
> > > @@ -2523,10 +2527,17 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
> > >   		 * A protection check is difficult so
> > >   		 * just be safe and disable write
> > >   		 */
> > > -		if (folio_test_anon(folio))
> > > -			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
> > > -		else
> > > -			entry = make_readable_migration_entry(swp_offset(entry));
> > > +		if (folio_test_anon(folio)) {
> > > +			if (folio_is_device_private(folio))
> > > +				entry = make_readable_exclusive_migration_device_private_entry(swp_offset(entry));
> > > +			else
> > > +				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
> > > +		} else {
> > > +			if (folio_is_device_private(folio))
> > > +				entry = make_readable_migration_device_private_entry(swp_offset(entry));
> > 
> > Note that device private folios are always anon, so we should never hit this
> > path. We have enough other warnings scattered around for creating device private
> > entries for non-anon folios so I'd just remove the else clause entirely and
> > leave a comment saying they must be anon.
> 
> Good idea.
> 
> > 
> > > +			else
> > > +				entry = make_readable_migration_entry(swp_offset(entry));
> > > +		}
> > >   		newpmd = swp_entry_to_pmd(entry);
> > >   		if (pmd_swp_soft_dirty(*pmd))
> > >   			newpmd = pmd_swp_mksoft_dirty(newpmd);
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 2a55edc48a65..8e5e305bc2dc 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -963,8 +963,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
> > >   			 * to be set to read. A previously exclusive entry is
> > >   			 * now shared.
> > >   			 */
> > > -			entry = make_readable_migration_entry(
> > > -							swp_offset(entry));
> > > +
> > > +			if (softleaf_is_migration_device_private(entry))
> > > +				entry = make_readable_migration_device_private_entry(
> > > +								swp_offset(entry));
> > > +			else
> > > +				entry = make_readable_migration_entry(
> > > +								swp_offset(entry));
> > > +
> > >   			pte = softleaf_to_pte(entry);
> > >   			if (pte_swp_soft_dirty(orig_pte))
> > >   				pte = pte_swp_mksoft_dirty(pte);
> > > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > > index 283889e4f1ce..61542a80074b 100644
> > > --- a/mm/mprotect.c
> > > +++ b/mm/mprotect.c
> > > @@ -327,11 +327,22 @@ static long change_pte_range(struct mmu_gather *tlb,
> > >   				 * A protection check is difficult so
> > >   				 * just be safe and disable write
> > >   				 */
> > > -				if (folio_test_anon(folio))
> > > -					entry = make_readable_exclusive_migration_entry(
> > > -							     swp_offset(entry));
> > > -				else
> > > -					entry = make_readable_migration_entry(swp_offset(entry));
> > > +				if (!is_writable_device_migration_private_entry(entry)) {
> > 
> > I had to read this code a few times to convince myself it was correct.
> > I think it would be better to not make softleaf_is_migration_write()
> > return true for a device private migration entry and to instead deal with
> > writable device private entries one level up, same as how we deal with
> > softleaf_is_device_private_write().
> 
> As mentioned above, as an alternative, I think the
> make_.*_migration_entry_from_page() might make this easier to follow.
> 
> > 
> > > +					if (folio_test_anon(folio))
> > > +						entry = make_readable_exclusive_migration_entry(
> > > +								swp_offset(entry));
> > > +					else
> > > +						entry = make_readable_migration_entry(
> > > +								swp_offset(entry));
> > > +				} else {
> > > +					if (folio_test_anon(folio))
> > > +						entry = make_readable_exclusive_migration_device_private_entry(
> > > +								swp_offset(entry));
> > > +					else
> > > +						entry = make_readable_migration_device_private_entry(
> > > +								swp_offset(entry));
> > 
> > Same comment as above for non-anon device private folios.
> 
> Ack.
> 
> Thanks,
> Jordan.
> 
> > 
> > > +				}
> > > +
> > >   				newpte = swp_entry_to_pte(entry);
> > >   				if (pte_swp_soft_dirty(oldpte))
> > >   					newpte = pte_swp_mksoft_dirty(newpte);
> > > diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> > > index 7fddafed3ebb..b19820a51e95 100644
> > > --- a/mm/page_vma_mapped.c
> > > +++ b/mm/page_vma_mapped.c
> > > @@ -255,7 +255,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> > >   				if (!softleaf_is_migration(entry) ||
> > >   				    !check_pmd(softleaf_to_pfn(entry),
> > > -					       softleaf_is_device_private(entry),
> > > +					       softleaf_is_device_private(entry) ||
> > > +					       softleaf_is_migration_device_private(entry),
> > >   					       pvmw))
> > >   					return not_found(pvmw);
> > >   				return true;
> > > -- 
> > > 2.34.1
> > > 
> 

