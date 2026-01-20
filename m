Return-Path: <linuxppc-dev+bounces-16054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393DED3BDA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 03:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwBf35HJwz309S;
	Tue, 20 Jan 2026 13:50:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768877451;
	cv=pass; b=QX5Nm22FCrzHBoNaR7k1DO8jMsg8O3n64bAIXUKRayul6Dvsx4BuLEbH+EGirKM6B6L1wdKx+zAMqjx7kp18z86wE2lSgOM3qL0K4NAFXPHOIm3EJRK8veIk8s+5o/Fikv9oloMk2qqCAZQ4l5MQFW7IZVebX130xZh3kv6JnOnU2S5tryjPHXEkdcnMLCGKCSN3V3Ib88q0Bh7HbF8jA5JHgtDvz6zi64EVKLkTJ2vXLhgT4pDZlRKLN1Ap5b8t3erfSo01PYBjwdr2L7fPg1yo6cNdy4byxTx2M7dORwnThG6rfKIP4RNUiAi6+G4m5pQANvRmgYmprLkEXnqiZw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768877451; c=relaxed/relaxed;
	bh=IhPlgWQqgli3eSv2RUrnByqxvea6Gk2uJgmB7dXrIQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJU6s4dG19JELhkbofjWA+wlYRSznrenWRzGL9kdCmPm8twDXDOK2+ZPt0tBwhXpMgwY8A59SvHSxfxacdOCtbYy7lOPnrM3eW2zfQPGQF6ISkh03xlzBT/PWLk716sqAIQkn98XfBJbBdYwTtGceTlRowc46++u0HWAd4r4Vn6IHexLUC/fmDnYkqn3zmbjsiTmrEInDCfHjXXhJ15XP7Ej/xuWhF1k6oB7Qrs/yC2Sl22cKrSTVVapwAZU+yItxr89rT9TZCcn3LgsCUinDLg6tDXB/B8ra9dYcrWycort6/5odgDroANL0ztz2CIUz/iBLDYCIyZgQ5I3P0XeTA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=X1qXdfFV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=X1qXdfFV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwBf04Ylrz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 13:50:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJKh/cwGXGUGp+wzSpatcrzApHHprfD0HrCjFPOjJuF9hz5zIxfKqKC1tCU4/p43TJyBJp0jWuvBSFquFu8r5QrOmlw2ysU92KjbAcvw977HUWke61Mm15INI5Q10WCJ75Z7E2K6z4ipp4+oeRmEwzxgQPvYwzj6V6g7qfgDI9PtJzbvoEAowHvqq3+c3gXsJe5tZuWva8uiheo2H3dRFPrRZNZnIR8KvIjb2tWvHfZ1Yiayz/LfLvWv4BRPF1PqNf/miqs1VHgOfp0VdyyIepPYYI+M1EIFPwY3h8fsWjW17ptpvz/k0KT2hkhRD/9iSfE21N3IaTImeWEcXNgjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhPlgWQqgli3eSv2RUrnByqxvea6Gk2uJgmB7dXrIQw=;
 b=f7ZzohuGLWFgptNrYl+yvubPdSeWsQy7FG2rtOxPCkSXupWZvo72YyDbiMeMqMTcn0xpK91Hrt+B73L6ms2nyRdxhzI+XO4rxzU5ICnFEhkrOK1jVzj2PjFfuyAqNb81TuTxJ0/IzTJvaZum9kqZGi9R30TtZ45+2CLnMBaFmC2G+10zJ0YOjklqF4Q5mL880HhRRD1vnfxBAbequQvJIM5cEMtwU3ob8w7UkK3xc5VGt52I9T3fzdfEOLSwRvk72YuOQ0CTIwHyjkJg1S+fDooX+fL30isT7n5wQsGbwmDOHMlCZzIlPbn4fDiY2HzZDLK5BsaSflEmkq0Lo3x99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhPlgWQqgli3eSv2RUrnByqxvea6Gk2uJgmB7dXrIQw=;
 b=X1qXdfFVuEuZg6Yb/ixDII9Rm0AXKt7ePOAD5HzpXH/K6MxxbZnnR1HhZ54qL/U6o0M+W75mIU696jwo+VAOp2qpdOljIW3PYhVDo6Dd5cnzuJuHFwY1+MzZcEsxNT1/9olLLSvhQYUd8X30hpRdrM9erQyx29A6N16oPbaQBFG8S3rw7IBKmGUamHwzhIUdkznV24GfkuuQjGIuwBOgA5XPck+sH5LNG1Iz216b/wyF2VWZEIU68PsDeyGuQEebqyPdq7U5fpNCy4tKHYrDc/HcioIfk6CICKSaAnNEZXHXb65TxqiSplOPD2QkuV1wAFfE/oB47ApearDsAxbOnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.11; Tue, 20 Jan 2026 02:50:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 02:50:24 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Balbir Singh <balbirs@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Date: Mon, 19 Jan 2026 21:50:16 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
In-Reply-To: <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
References: <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: bddcc1fd-17ae-4dd1-fe3d-08de57cea8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CiQXsW9/YSzJ7gYMVfdiqc6m4KkSCmd5zkWZuV6gNTxYlNPN5HKQARmuTKvV?=
 =?us-ascii?Q?8nsVhl+OwnqzE/9gjQS4g8HuUni3UcEC9LAonzK1WahH8l+ZoBfWABycByJu?=
 =?us-ascii?Q?ybYEu69J0rlPE9Y9NcDrbx0AqTxwLvkq61omi4/wCihv12ITYkjBKToLTRfa?=
 =?us-ascii?Q?a49yEPjCBBJYAlQUdUEm4bQZFQduoaHve8f+jAsePICj9QcKy1oyWBy1wTa/?=
 =?us-ascii?Q?2qQbLy33+mfhiEyG563cDlUSeZWzugALZbygEJBDRIUJXjsZpN9PYukX4kC+?=
 =?us-ascii?Q?QldGs4+8bdAR08r/BMPEEa69OL3s3JnF1/f69EFsOQ2167RQUCKxZlAL3Vgp?=
 =?us-ascii?Q?Wfi/A1ArRoSlrc3DVsQ2vRPFWQ25LLEkhUvsT5mhGNAC67iI30mxEH2/UVZW?=
 =?us-ascii?Q?Rp4scm+ggrz4VCnL/hAO5vluQSUrBKhbRu99fdwHRyFoRtgLrAzNbgmQnOM8?=
 =?us-ascii?Q?2S1s1uhIsHpen0dCh6cQvPQpobmigbp3WyWMfSvTuQmAptDMr8oqkLD71xfY?=
 =?us-ascii?Q?XuMxh/QudK2d74ofX+bwNE7RRUyVS3lDkOimfZgzvC+y1m+Lmk1fAq9o0Mn7?=
 =?us-ascii?Q?x/Tu4UDATHqTL9CWATtgJRjRI18ZqNmPxt1i1L/+ZBQWdRFGXFiCN8wTVRpD?=
 =?us-ascii?Q?6//Fmbup4NFDwoU6Ljft5EJuRMqpDcboOL532J0J/ArOyQeokZfdkCYvC36s?=
 =?us-ascii?Q?BPRKg7cvLsfFQX3+Rw0I0X/OiYkJmq5gXujvgKq1ixf9GFDX1jSYFCrZPBgU?=
 =?us-ascii?Q?2pNORc/bliKTXuVAgeME1lv18M2yGhQNH4fIAbnwVkvZAoyA3WGKN7bhWUlh?=
 =?us-ascii?Q?yEWdyeRaVvp5mFOHfgMixXXKnoEOJ7XhYn3PvQvKcTtuR7OhD94DhLsFowgD?=
 =?us-ascii?Q?joF//1X09lzLVZx9+lX1T14+Tta/iCJZeMkLUTplxclBKopnxOG3YuMe3JW1?=
 =?us-ascii?Q?dVz9timIeAL4u/isF6K7lXC4vQeLsia1D/mq9laoesIfqzp1TlecMdlRzwUc?=
 =?us-ascii?Q?9LFycZbhxJ2Zjtw1hnzRCdr8PM4WspbxXswAsdGchVx07XiRt7O2TDQUoIm0?=
 =?us-ascii?Q?fr8rQLFZ94RAMfLtGWLkyw1MumY4B5uECFg/kSxUhw8Lcn6FSNp3KdBRyONg?=
 =?us-ascii?Q?AkhkAFyif+xWuxr4d37M16RrYdFw6L7oE9w2Ej+bKgWOpiha08qrDNggYCWa?=
 =?us-ascii?Q?X7xukd7ZPnu7eTUlPtr2yH0TlmmjBeGBQsZ7fmvgQNnLp6C8OGbLmqo2ScAF?=
 =?us-ascii?Q?zpn/2Ow9HdN2A4BU8BozESK9yDRvdc9UqW/+a/cACs/cYMfpBwn4WRQdj23M?=
 =?us-ascii?Q?iIRHLwCIWV/QWMEptraguMQiUo7faDK8DfanH30NgXYdE+NCK36XJ9kFP3d8?=
 =?us-ascii?Q?Kn3R3aVH3OMn7ODGSRwtMnih+4MqrfrEZmrpnBq0Vs6Nq5OYN8wS5egeStHL?=
 =?us-ascii?Q?hjoL1Zs+vCMgw3fBWWlliO9RmwZI61dnpipNkn6/qjqEo3bvjWVWYgl0osAR?=
 =?us-ascii?Q?c7RxLP8bfsojMja4ZBtu9Wf4XXyVkv8C/pGLLj029JmsU8NpbIRxETMcmDQF?=
 =?us-ascii?Q?hFizuTmAvTbix3LkfAc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HU5+3v35rgrAUCNrL0HSRQnDOukE8XTcJqRTRGztuj/H6omag2DQCVQX0OlA?=
 =?us-ascii?Q?pOT4XTLO2lgmxQ1+Qir1T4M9ZnSCwyKhQVuferOuZXMid/6fFdKZDeZP1/KP?=
 =?us-ascii?Q?Em+bsU06kRbUpH/HoheORSs+sRq/TeyMY9l9YalJlo/fOtwPi8P/x6FokniG?=
 =?us-ascii?Q?Paq5btFnqp0RMh7adqgS3WzM3mu8dBl3l+c8Q91dX8ZA/nA8UPQ2qPAocQya?=
 =?us-ascii?Q?J1st2AMCb+uY88TxOF6lgbCAOyf+2SrycIgpiYHwgKx4FtgshWZ+n2SJIMtG?=
 =?us-ascii?Q?l87k83qXKkeKyTxGXsyZFzvtiwTvTE/X/aVwArPAN5z4JuAMREzDHaBKISbh?=
 =?us-ascii?Q?d9zbf1TbHto0ZSlmqug7RnEP+t0dGjSUjDUTpqZZ3u30RN2hYtlV5zaHP3gp?=
 =?us-ascii?Q?nI2F+K2JOlE86fKEsF1Ip4LjaJIFwamI5PIUEOWvuMnRrovrjn/mvPRLU3Qh?=
 =?us-ascii?Q?L2B/ZZOR/xs9FwOCmnstZQx9+byI0vQN8w8Xd/ZqEjgsbPtJyT5soBeDGI85?=
 =?us-ascii?Q?flkV2cwEE1TbQH5UbtRijNScdwBNa8yfOI3Hv/ycWaTx210zkhjpDAKrDIpj?=
 =?us-ascii?Q?q3JEBoIpstoqlfl5ojU1cwW5/Mku7D0OYLdrvS0zrJenybi7PFnbCZ8ZLnaH?=
 =?us-ascii?Q?BRCErSmTFnr1NN1AjRACS/AYsHlpEymruvWWnjP7N5SmEF94Qw+huSCJR+rl?=
 =?us-ascii?Q?50Sn9M27KepWbZvjY6r75IUe9T/w4DG/6ZwMNMFokwbzRZZ5Zj86xw5MPjc1?=
 =?us-ascii?Q?Lc2xfwfeXDr/4PQd6FrLrtriOeOMqklC0qNpfnbWkGdBhb2EnP9ChS1aCFZe?=
 =?us-ascii?Q?X5qYZt+Ptj910VdbLwkcBdBAY09rJ8oN8oerP2m5cZaSjqQ5Y6GURaEWkuUD?=
 =?us-ascii?Q?aINCzw4VyEKTseM2BopkCW0qIIJSTII1V3yflv5pgLtbzjbsmVLkqVz+G9Ok?=
 =?us-ascii?Q?MtsHjgpp7Vi4eB6mvvO5v50xz8Ib2DQms2KR4YHG7BzIGHgdh9B9xOTgGkYD?=
 =?us-ascii?Q?AIFuomlfmGQmc65L1Xca7+x0fSumjYnXRhA5ZUS85MarksJS4GOH2hMGxw6c?=
 =?us-ascii?Q?UbQKP4wBiODS5H1KtYWOoPUoFR9rV22THwy+6Pp0iG2hmq6ZKVpCDIxrFlt5?=
 =?us-ascii?Q?Aq738nfbsdyT1L4n/oK+NpDsk8CzZjhhabKHYunx55Elux+vaWVd9HnELn/v?=
 =?us-ascii?Q?Ths+PYhtQHjRhEP2vycsBEuxm7v4DnvjwEcveJd5r7xfphSnx86SOtPkkJiK?=
 =?us-ascii?Q?kwFYMQOn4Dop/3VEjBV1aqS/ETDIwmXwyGL6G8eKPFmlt8o+UshRnlVOVmbA?=
 =?us-ascii?Q?nyw+TB1OvprvEbos7VtXZH3KqT87nzjBuyJ0ykzMXfJW58ps9N7wI2oPUXtW?=
 =?us-ascii?Q?ml3R3B+8/6WbcX8c2wHtzlaCq0+oJ4imlrmhxmYV0DLSgpwMDZ52itr8D8Ws?=
 =?us-ascii?Q?z4bmjgW+LCvwqb48N2H+8UkDDIkpg/FnsGyU+x3k1ERYWs400E6s7sM4YSlu?=
 =?us-ascii?Q?PS2+OQmZ+BYtCKh2mvvO7S4XTo87Lx8TaeL4pPcxlCFQR9cvsHchz8e43I+I?=
 =?us-ascii?Q?fOK+DC5RyhvDhkWISteMwb4EuCqeE9TCEPs2HFVQC9XK126SbJHKhJ+sk9+9?=
 =?us-ascii?Q?Dc1M9MCtJpW5KWAJuYxvk6Dm6eZsp7nrWi2WObwVQdtA1vLtnEwMJRcF7NK0?=
 =?us-ascii?Q?igPFWlM1Zrz1OAI0Gak02ViDPXfyLK8/v3AK9nprV9Qm+tqW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddcc1fd-17ae-4dd1-fe3d-08de57cea8a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 02:50:24.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlWSxLPRLzNNCOor+9elAt5NVJaWQybuOSgruNwlOHL3msuw4V37J+fbH4VJQv61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19 Jan 2026, at 17:15, Balbir Singh wrote:

> On 1/20/26 07:35, Jason Gunthorpe wrote:
>> On Mon, Jan 19, 2026 at 03:09:00PM -0500, Zi Yan wrote:
>>>> diff --git a/mm/internal.h b/mm/internal.h
>>>> index e430da900430a1..a7d3f5e4b85e49 100644
>>>> --- a/mm/internal.h
>>>> +++ b/mm/internal.h
>>>> @@ -806,14 +806,21 @@ static inline void prep_compound_head(struct p=
age *page, unsigned int order)
>>>>  		atomic_set(&folio->_pincount, 0);
>>>>  		atomic_set(&folio->_entire_mapcount, -1);
>>>>  	}
>>>> -	if (order > 1)
>>>> +	if (order > 1) {
>>>>  		INIT_LIST_HEAD(&folio->_deferred_list);
>>>> +	} else {
>>>> +		folio->mapping =3D NULL;
>>>> +#ifdef CONFIG_MEMCG
>>>> +		folio->memcg_data =3D 0;
>>>> +#endif
>>>> +	}
>>>
>>> prep_compound_head() is only called on >0 order pages. The above
>>> code means when order =3D=3D 1, folio->mapping and folio->memcg_data =
are
>>> assigned NULL.
>>
>> OK, fair enough, the conditionals would have to change and maybe it
>> shouldn't be called "compound_head" if it also cleans up normal pages.=

>>
>>>>  static inline void prep_compound_tail(struct page *head, int tail_i=
dx)
>>>>  {
>>>>  	struct page *p =3D head + tail_idx;
>>>>
>>>> +	p->flags.f &=3D ~0xffUL;	/* Clear possible order, page head */
>>>
>>> No one cares about tail page flags if it is not checked in check_new_=
page()
>>> from mm/page_alloc.c.
>>
>> At least page_fixed_fake_head() does check PG_head in some
>> configurations. It does seem safer to clear it. Possibly order is
>> never used, but it is free to clear it.
>>
>>>> -	if (order)
>>>> -		prep_compound_page(page, order);
>>>> +	prep_compound_page(page, order);
>>>
>>> prep_compound_page() should only be called for >0 order pages. This c=
reates
>>> another weirdness in device pages by assuming all pages are
>>> compound.
>>
>> OK
>>
>>>> +	folio =3D page_folio(page);
>>>> +	folio->pgmap =3D pgmap;
>>>> +	folio_lock(folio);
>>>> +	folio_set_count(folio, 1);
>>>
>>> /* clear possible previous page->mapping */
>>> folio->mapping =3D NULL;
>>>
>>> /* clear possible previous page->_nr_pages */
>>> #ifdef CONFIG_MEMCG
>>> 	folio->memcg_data =3D 0;
>>> #endif
>>
>> This is reasonable too, but prep_compound_head() was doing more than
>> that, it is also clearing the order, and this needs to clear the head
>> bit.  That's why it was apppealing to reuse those functions, but you
>> are right they are not ideal.

PG_head is and must be bit 6, that means the stored order needs to be
at least 2^6=3D64 to get it set. Who allocates a folio with that large or=
der?
This p->flags.f &=3D ~0xffUL thing is unnecessary. What really needs
to be done is folio->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PREP to make
sure the new folio flags are the same as newly allocated folios
from core MM page allocator.

>>
>> I suppose we want some prep_single_page(page) and some reorg to share
>> code with the other prep function.

This is just an unnecessary need due to lack of knowledge of/do not want
to investigate core MM page and folio initialization code.

>>
>
> There is __init_zone_device_page() and __init_single_page(),
> it does zero out the page and sets the zone, pfn, nid among other thing=
s.
> I propose we use the current version with zone_device_free_folio() as i=
s.
>
> We can figure out if __init_zone_device_page() can be reused or refacto=
red
> for the purposes to doing this with core MM API's
>
>
>>> This patch mixed the concept of page and folio together, thus
>>> causing confusion. Core MM sees page and folio two separate things:
>>> 1. page is the smallest internal physical memory management unit,
>>> 2. folio is an abstraction on top of pages, and other abstractions ca=
n be
>>>    slab, ptdesc, and more (https://kernelnewbies.org/MatthewWilcox/Me=
mdescs).
>>
>> I think the users of zone_device_page_init() are principally trying to=

>> create something that can be installed in a non-special PTE. Meaning
>> the output is always a folio because it is going to be read as a folio=

>> in the page walkers.
>>
>> Thus, the job of this function is to take the memory range starting at=

>> page for 2^order and turn it into a single valid folio with refcount
>> of 1.
>>
>>> If device pages have to initialize on top of pages with obsolete stat=
es,
>>> at least it should be first initialized as pages, then as folios to a=
void
>>> confusion.
>>
>> I don't think so. It should do the above job efficiently and iterate
>> over the page list exactly once.

folio initialization should not iterate over any page list, since folio i=
s
supposed to be treated as a whole instead of individual pages.

Based on my understanding,

folio->mapping =3D NULL;
folio->memcg_data =3D 0;
folio->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PREP;

should be enough.

if (order)
	folio_set_large_rmappable(folio);

is done at zone_device_folio_init().

Best Regards,
Yan, Zi

