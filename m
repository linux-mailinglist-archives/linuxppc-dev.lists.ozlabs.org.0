Return-Path: <linuxppc-dev+bounces-16198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kv6ADMUc2lksAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5570ECA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7FM5Fmfz2yFj;
	Fri, 23 Jan 2026 17:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149479;
	cv=pass; b=TGc7ZC3aFRM+X7C3o9H6f6sGOevvf5dw++t5KB4RmKWor7wTNAU1ZIXSOerElsipCChkiEEgCztrGuVmy2G9MZzpzrXIzyBGnvaVCm4+kLmaodJJpKXdH2aTtIXVGHwEYWsQtU6Fc2xXPxs0WxCrQseO4PRF4EH+Fw9x8BDaphZ9uzgAftkloQo3Wl37QYiJZ9PCG2NGYfJBkOCIArKmRkOrYx6kqfThQjIJbXsjRnLVnZS66i55CIo7aTGG4LBcTLYecPA1NkCOujsa3yYdounMlgpOefnySLJ1gDrRxfP2jftJfm/bH3PfM7YXatfeHOgbjXhRbe9Sqk69HjJT4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149479; c=relaxed/relaxed;
	bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DdyXHqsy75W8kUpWQDVoRYQbwiVeT9K4ivTbn7uiR4I3e+LewQQgziL+KTJ95Ii1gvfXsQq7wwD0wngC9JtZTG8Bujzp0WnpvIudCRia1KctJQogzEuWWl3MlRasLHAxi5hC1bs3XGhz1c8quzfwl5YXF4/rliZockRylvnmRIAVjfg/KX6+yitMy+FH0l42ymogRhS3kf3W6FFKGf+bNheVvesPf4yMnunrLed/nzvGS3l/iGrZA7jWY7awyo2ho6t+TqIeZdZJmObi4tT7kjY5JZ+Irdi+qwuKTr1kDiUCXBJtmVRsF4QvwJMeyNc667uU4tKimeqXaHKJdH71Lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oMYeEg/j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oMYeEg/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7FL42tRz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BURrqdI3oCFaC+bXlSP2iozHJP160g5EhMM8gJOkycVZ8CMGmr/ftwYIiggp/fIz8Mg060nEqZufBy0aszC8VPjP49r5QzccAdQRU73Rc4P3d3l90QhjXLMk+MWyvtmHRQrosscNfLaUHgQxAuhbhod12Nd7op4qztFG+QbCSrvzFiWq4xaYN/v2CmYDprumuLCFknFwfNzlmAKX4sZ/JdjT+rKLXdOcdKmPjtcpeo+CuutITsMghDCWG1/pH7LsouudArnVkqDA57C/JqWeZWE2QsiVWPoQ5LIMnayQcapcdWMYYT4JFvLSPHblsTQHkqni1o2u/SE0OEWd34JqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=Uz2lta9PVzsw/VnOdtJww9oVfXuYUfQMVnVr+7zcJtGEGEYOMJPOYLDi2/28KGrLJZwyaydBBhXTMh9EAILc7t/0lo5WxjsRSWmZOQA4a9xqlnXURxoaig4DQhnWlW1L5QJvn9I4bpz1c2EnlMp3ivZPNU41jpBEADFVrExXrnK8/4RsZ8YDpWS5BbU8gtXyqyWVq3oLE197zXrpTtMzUK+PHoKmpM8tQcRKbekNSVBmIZlLXXPs2i9EWiboDx0m63d+lEOhhen6wjVlx27CoDUP1aSvDqGwS6emRPTgXB3+bYf+Vd6Wy3ijjaj7Z9tlZJEq3Bxa/VabAtZ5OloVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=oMYeEg/jtRaLfItgTTPt/bBBaKE4lYapCoQOBO2728VGUlWs34JZTMAKy6Uk2/6ZdUzOV6nt7RBFolB7KfC46tCnbowC3ErTsOK8hH7irYXi0ndPEj1R7TpUsWEm8fjaT6yjXikLs/1NovHktMZz5pVTIAgnyNlEKbNHkcSe/EMA66RI2m4blIJ/sKy+d2OW/9iPZo5N1rivIEe0d0cEwQ/RKvNm0jDeDlmnUFzeHgqDXm0vtksBKvzMROu+D5F06y4IoS01zWaFbyvGWhQVLnmK2uBY6OBCoPrmyvyu3cVXcLDgMkJ90DdzTQm8ke67YUbfO2fzu30/aGiTPYdzuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:24:16 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:24:16 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com
Subject: [PATCH v3 08/13] mm: Add softleaf support for device private migration entries
Date: Fri, 23 Jan 2026 17:23:04 +1100
Message-Id: <20260123062309.23090-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 4212cbf2-ad45-41ca-e878-08de5a48084d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wO0CV7jQblo0T4XwZh+io6GCfm+kxUobXMoJ5tWyu2PwSLOzcoEXtD+UPECf?=
 =?us-ascii?Q?kPGrYQ9cBKZge0Eybp1KPuOv631DZi2Q7HCLesIoYNNdbDGMRhJYwgx9SmfI?=
 =?us-ascii?Q?m6ERkPsr/k+zK0JLT9tLmWLXGqlGamf4Hd0QugwILOAkj6n3xCT3fVSaZ7Ca?=
 =?us-ascii?Q?IUta6mVk7yhOGXyg8TWP9PnWIswzRDOsHFWboTMqxDJdpKOWLOvNqoJZfdye?=
 =?us-ascii?Q?LgtWmDXAJG5raoJbzpeVZ8/2cVqJqK2SsbjjATP8ELNSkjdGzHWQ34JtauIC?=
 =?us-ascii?Q?uN4Qnjc6G4nZ+u+B6FXaMNXfLMS7bH1bWROELG4IwXPbl4ZLxTWuumolUdIo?=
 =?us-ascii?Q?BoeTi9kNL39IWXTFdg3Dm9PBnwqSorpSBTSMk8btDIWS2nC+zsQ14qS0zV7T?=
 =?us-ascii?Q?KeVoCa96NtXY7KmKfc6Xigg0kjVl1oLkojkVB/BCQcYYuwhnWeSw3ePdc7qD?=
 =?us-ascii?Q?UTDx4eGnS10VOFcnB0uXQneZT/HyY8y7/25eUqeOD7RsCXm6vSBGKE8V4HT3?=
 =?us-ascii?Q?us4185uf565t/nEgp8NMNIJk0x5EeVYigFu62t+QJ698vddlYTVzlQ5e/6IB?=
 =?us-ascii?Q?1y3NbvkWQ4vJsUgDlT3my+ZRKGBKS/93PFYvotZX6LrSg+QGgiBsya4jAw8H?=
 =?us-ascii?Q?gH8BOs0K/Tp2OLSAj05s3Oa95/dNTcp7r4pud707SU9mbFXmaG5ejzKHeAhs?=
 =?us-ascii?Q?u37kSK31PraHRV2CRKrbt5odlnbJ0iC3w6NFdWId8QRRoROVAE7t53YTSoZx?=
 =?us-ascii?Q?BgLJOIATaETzB8pv+ceKqhoVU6cD0JckLpEx4pEh8P2h6elmC4+/HexREa9X?=
 =?us-ascii?Q?MxG1aNDW8DUYDljgYQRK6ih6xqCTha/0uAtPch9PBECTqRjZU/pE9IYT1raK?=
 =?us-ascii?Q?iVNV2zfrXAmuVGeSenET9sN6R0PJmurqrdDsUyroEogA3Pja7hXmD6b19MEC?=
 =?us-ascii?Q?tdcWaNRqS7tHBhSUwEMckmUt3sz6s5VW2s1a29FN23hoSkiLEvn2z+iqb04a?=
 =?us-ascii?Q?FQfyYzy+XnzpPsoK9JVsiUX37XtTygB7gKgifmzp1kex102Y/Ajm+C8KebU5?=
 =?us-ascii?Q?0ntNhUoZvsySCZJ14kP6pYn8Av/pwiQDinRM/bqhTCB2dUH75HhIQwoGkl3C?=
 =?us-ascii?Q?6oWWpXoC62tl4ww9dJguQVqJ/nTyIGFYx7TNACy9WpO/CoSLp4tg4nTkuB/d?=
 =?us-ascii?Q?Q86hJqj5SX4Ls1NRrnCpEAy1b0U6oOvLHB2MLqbhcmkFoN98wbgci8PD3xrQ?=
 =?us-ascii?Q?QTaHx8UWFP3601xBRFYJl2wsZ1qF8BZ3Qz3JIiJ1iaY/QmTBm8RNluBHvH2F?=
 =?us-ascii?Q?91hs/St8y5yzeg4g8UFYcLlXI+GkV3f/wGOQHljSiwddgLLqi386eQnavQai?=
 =?us-ascii?Q?ya0plBh1p7nBnoIRQELFDHWXeboQAtkeVZ0rkZj+HAJmUsVjb+KukKX/+ypN?=
 =?us-ascii?Q?aUwJNF954O0F3vC1esnh3IPJ0tinr5s2Lg+NvyTAP42G6m2K4x0FvrWXB+85?=
 =?us-ascii?Q?8+fnQG5lPJQPQzLMMU4SBhxnCgwMKqJuO/aaoUdsbu8nSzJe3An415mu+P+X?=
 =?us-ascii?Q?RAL7emig30cEs6YOHPc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xqH8hzZq+o2UTKi5FNwvunMsfaTX/SzUT16CMAit2VpKni4RzpfAcZ1CVpVR?=
 =?us-ascii?Q?dfc44h6W6cUIPS9Sjos1ypMGIjFDjxTpgpEhlP77ZagntW6tYXZlx6QhEvok?=
 =?us-ascii?Q?og8HAnfdwG51M7X5rNvUWLPZfCTgQ1uyeC5SJsokECk1U1dmXn7UDIsCxv/v?=
 =?us-ascii?Q?1aAGIlZMMvX82mHeArvbowIIR5PM0d2Q6X4Hke17hzo4FUwZqzGzhE+HWaoJ?=
 =?us-ascii?Q?tRkNaa9QR6/HoNOvQkya84gVOUvSZxkBFfLu9mn4Zzi3cFbjvXvCllaMMpWZ?=
 =?us-ascii?Q?dkQKSSuaucCXUfLXHZa4u0NVULRRws56NYFyFGczy2eCdyD+BbRI/2+UTQxJ?=
 =?us-ascii?Q?N77H9GkVRHMkzmf4cNCgAGeAwKQ4He6iFcUMpnRUC/hlaklBtuqTJTeoIn+h?=
 =?us-ascii?Q?DI13yrXt2naDM2SP7iogDuanuZ+QEPN1gIspAacqr4NowDXuSO+V4JANMq+o?=
 =?us-ascii?Q?RSMFfgX3BRmWJdbGMVhsHXaYzk7MsQd9ViQR69+vm/CLWq5EXLONVLXpPSpY?=
 =?us-ascii?Q?041TtyLNTHA2vPg49Tfpw4WfStFSCb5xRRhCxv9s/yzOPozLPk3hjDI8oLdG?=
 =?us-ascii?Q?ZFXv4zebuKU3TJaPGYwvGl8XJkR0DGEkZSEJO63VPvRxq/LJa2S/w05Tj2gW?=
 =?us-ascii?Q?qrHJ76jT3hlLpp97ZRiEMTF2nbJAdgyreebBUlX4kBMgAB0qHj2edYOnpMc+?=
 =?us-ascii?Q?Dkt1gNsT1uOviqye5+J0N9miHz3IV14oD0K5NdAH+fsdOIpIVvg9MNSuzclL?=
 =?us-ascii?Q?ZAML+eeY84pbGfqOPXNblJzzeY1xXHNuRVSIrvcTik1qWWTVdJrZeE+g87lo?=
 =?us-ascii?Q?eOt+uWXCEfIy6epzeiV0d0PaPwJgspQ6Y5h0AN5tGQV7FRPDNkjVRH+Tyl63?=
 =?us-ascii?Q?pwcJANgIi0ldZyQYJjVM/lSrj6XEBa+qmc50dxf5MQR8FwnKL2+67pzHGlEW?=
 =?us-ascii?Q?MIUQzAFLWVjNaxRGbEej/0GQZBTIAYIkFHqju3gUkQnjiPjNjrb4U9WMabxS?=
 =?us-ascii?Q?isQXf6qeYcO3qA3AyKP7p1Ykha/YFEtFnr2d/i7IbvF2xAirz5sOwAzaRwdV?=
 =?us-ascii?Q?KAglOOYkp/BhiyxgLyZPd61Km6Fjj+b3d+/Jn9OY2HDQuBxrawVNp9siF5le?=
 =?us-ascii?Q?gcntGz2H9S8jg4Hvm03hISSr5V8wAGM1HqiMkzbbxAWE0Re5iquUD7PRmYWh?=
 =?us-ascii?Q?lq/xt48M2vL9iUDuY8p1W0Aepg5KjyxOY+5Zox3p0rymcDgUZyYoOrZYxmmS?=
 =?us-ascii?Q?oYg/JDrwNC8E5yYm7MAJd7Ydutg8A7VWL4fUQyratUU9zuFaKnqVAqmw6hqI?=
 =?us-ascii?Q?uf3DizvzFMqoreAxOrlCwPHffMjFcRfVWlIxPJGnUNsEgrUmNM4Zfvz1weN0?=
 =?us-ascii?Q?uJhyQvPq/rxPXfeLSqEWN1X9PFGtu94ffC8DBgxw3lKabbO7ldJ0rCNr05/p?=
 =?us-ascii?Q?bcrDMgRcpNLVBFVp+n8LHpMnb6UNpj83otMHc5/rlJRoAFmQBy/cA3kep22C?=
 =?us-ascii?Q?6DYketNmxwWziz/EEeQGUBLRKIxqc/SOFXLfp4MMCgvzscv3U+Cx+aqtxcGa?=
 =?us-ascii?Q?kR65JpLgK1qY+7t6scKtq2RklFxcKHrQHjLiA1i04u8G2nB5e2mJXsQ10zil?=
 =?us-ascii?Q?2fOW6fy3h2BDVvRcLQbfH0V/+6HiCuZr+lfOIOqXWlyr2flaFK6Ezf2UG9w0?=
 =?us-ascii?Q?HrkSFmynD79P1RTgO1im6QKdkGOJ0TAYeD/Lqoth6CVjMiEShf5WIbepZEHS?=
 =?us-ascii?Q?qqMAWQ1hZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4212cbf2-ad45-41ca-e878-08de5a48084d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:24:16.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wi2DjE6DsKXHPrKMHw0R+ND3CHBz3V+UYzO8KAVdRh5LfdHXS+2kbNfvIcgSF2q6J0uwmET1271jQ1A0nJk1bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16198-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.123];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 01D5570ECA
X-Rspamd-Action: no action

Add equivalent softleaf entries for the device private migration
swap entries:

  - SWP_MIGRATION_DEVICE_READ -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

As with their SWP_MIGRATION_DEVICE_xxx kin, the
SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx types are used as specializations
of the SWP_MIGRATION_DEVICE_xxx types.

The new entry types have the following relationships:

  - SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
  - SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

Update the existing softleaf_is_migration_xxx() predicates to reflect
this relationship.

It is possible to distinguish the between a
SOFTLEAF_MIGRATION_DEVICE__xxx and a SOFTLEAF_MIGRATION_xxx type using
the softleaf_is_migration_device_private_xxx() predicates.

In practice, the only reason for introducing this new type is so we know
when to not call pfn_to_page() on the swap entry offset once the device
private pages are removed from the physical address space. That is the
only time that the difference matters.

Creating these new entries will occur in a subsequent patch.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
- Separated from previous patch
- s/SOFTLEAF_MIGRATION_DEVICE_/SOFTLEAF_MIGRATION_DEVICE_PRIVATE_/
- Update comment for softleaf_is_migration_read()
---
 include/linux/leafops.h | 90 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 52a1af3eb954..60681ada7b8e 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,28 +199,88 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
  * softleaf_is_migration_read() - Is this leaf entry a readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a readable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a readable migration entry or a readable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
-- 
2.34.1


