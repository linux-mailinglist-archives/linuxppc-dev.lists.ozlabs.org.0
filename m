Return-Path: <linuxppc-dev+bounces-15101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A04CEB46C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyVt6Nhjz2ySb;
	Wed, 31 Dec 2025 16:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155576;
	cv=pass; b=en58jKwtKAlkaLRM0hJCFTnIbHaqsIgMTkuUc2mQZBuzC3ogo5HErUKPnMFh3osxwTdWwyTXYn9BGNqkijBt0f1SQeMP4+hXy+LZH/GNykWr07/TNtVMejngD/owjqJY0SNhhaok2awaRhf8Xyw2ajEk6kVlZzVICw6gPYRLXzeRV4ekH+tPBbmqqf79aVUr3nut7BMb+vWCehPbTiclcYtk5TEiWuQhu8Yep1rQaeAIHCJsZdGCrZtwxK1VvXp+79BQpQL7+EhAEb6gUQ3KsjblWnLMoqYf9sXQrkTnMT/3jzUjk8lOFXTFvDTLdMUMefZBj39UaYFJ8BM2MTOCXw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155576; c=relaxed/relaxed;
	bh=Fm1Ln0bpACqMAMin2f/lqj+YmUUw3anv+NmXfmp+G+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Edp0imEGIA8MK3r/FvckpW5UMqNLz8IhT2GbEdTtV0jjoh+1luiwnK3t5WNOQhWJLJlJm+ac5g/a0h0di2U7omcD7hL9bz+27/hLVGH7Aha4eVp6/SifAQfj7gBCRM08BFub47eKMu3veT53Y+MTpdx+ZpWr3oZL1fb+dwIP7FX116+0uXfdl8chMxz8lHffvTYnqWGCYqLNPoqugc/XPdQO+ZWl6i6ZkJkF1U+63X1u53jQT9o3FoS+xV/fWmYq3g68sc1KM/QwXMiw1FV0NOBsmWgTI5WPYKu5DFDuRC6+p4CdnR19evFcJvTYfThPwXfgjVQ5Ad+68phZzeIvkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCfg/Ft+; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCfg/Ft+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs34VCMz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpuc06Kfhbbzmud0O7prDdIXpR9AZcGbNqoMQDd62FCeEngT26pGLjlra6s+WLGkKrzXmMwuub1eiwF00EPQDCcdl6Ex1TTE2Hqe+BMuOWhjXq449T19iCZ1TUpgBdyhM4/yn9waX1rp53rgYE6e/jN6cTQ1/cYQw3zmTTNo4yKoqdVgYkunn85lPTP2pydbXq+1RWfy6Ym/uG1gLB5/4MWO2TYGJTRDvVLZ9E96+OTICazPiFFj8yxTccAkhCearVpnvN0eyBKQC4uIekUHLTzxyvwtE7fkHbK6iR0MOaz64GQp0N97vxHkZ/iaNmrAxtO9sLl1aZLWRlUJ85de8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm1Ln0bpACqMAMin2f/lqj+YmUUw3anv+NmXfmp+G+U=;
 b=SqyfXx+LzIReGPvLOemvNiA4xyXIEJSccRqnibROW5pFLLTplMC0ZHrraXhKlgpAFGg/QKIsSnHbFvpDMW2j41e+BNy6bTgGzhPfRd18904nRdAjPUrPN+vZuqqhOQQpxCvhyIWLI3HhyAby5sV2vw+tYYF7fECQkvH9G6QkXQUo3TRHs4UHpfKnFCsNvCGu2fUn+9g15RY2uw5D/m35S0CjULz90QYMwgEcTrGRkXI+HKxn6mcea2VITeIbsblAmIrY39SPI6npJl/nPJG6KiNr3PnnGo70b8cGD1O4Txu1m1g/y4BJB6Pn82uVnQSQYa/IS4tOUsSkGjaqkTQRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm1Ln0bpACqMAMin2f/lqj+YmUUw3anv+NmXfmp+G+U=;
 b=UCfg/Ft+liIn/b6ij7H4/swGQEv+A2j36PfRnSzhIXStJmxevCq2RwC4Hbe/ZQftqVpc/ITLQAXrigulKv3e3PvT7pzPjh8ww+Vdgy/S+BAbmm118/s/japbHzGNHJn0qJNUBXnEEu4QbuAxxH4uiWikBcW7tMrg14wyzvSgnVJitaSYd6UkySKdgNPUBEU3vUvBmC0LML7RWigQool4Ik4nMVAnXmjqeZ+YlKgIPcSITgaauIDB1JQRBvFoBNo6mD9pD8/0nkjKWjohaYfAc8lXLxgUMStVdqqjED8b4KZ4tT7aWVPkVM9IToAi4QwaguoU2QV5qU8vP53VCaShyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:44 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:44 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v1 6/8] mm/util: Add flag to track device private pages in page snapshots
Date: Wed, 31 Dec 2025 15:31:52 +1100
Message-Id: <20251231043154.42931-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: ace1d125-e9f0-486f-5049-08de4825a43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JiwlRjLRKAx+5pIrN6tDRtoULTjOJvD8xkF8mhS8FAI1DIQXYv2koyN9uKMJ?=
 =?us-ascii?Q?VOssuZLRdk3iyY7ULMkJC0iL0kGDO9qEtpaayscdNpuVSB3PfyVDUiwl9OgM?=
 =?us-ascii?Q?ck7sEJbGAFn6kBWMvq+Ks6TePpnJNIJ5uTJbmAr6Ee50XkusyqesK4D00gom?=
 =?us-ascii?Q?T+T7qFicki7NFSxpYCoJCxLIgbcop3ysIgb91ASvw0woDryuYuH1xdO6l0Bx?=
 =?us-ascii?Q?ks1e3SFaS4QnatiMfNvPSNskka3YLXFr97MoRoSDJzEuB4rCkWiHa4OIGOzq?=
 =?us-ascii?Q?OkDiIv+FH4+NNzpl8GONzuKagYrRAFSF3eoYebj1o4fzgFm6T7cRy+bXD0Py?=
 =?us-ascii?Q?V3YkiRZGj4c5wcw0YWvuIUSLVtG48kVnOcyEEZahjXqGiMg8+IiexOJMOC9l?=
 =?us-ascii?Q?n4qd4W/7HtDX0V4zHZ9ZGHylxyLSWx+lT5gZ6Ev6HgZ7B/wFKMgq6VVzGdDB?=
 =?us-ascii?Q?GRaBhUkQIQrvvmKAowxfKJaHmSAXv+XqV6EZAqKJ6aekRyznhgfgpTgnb53i?=
 =?us-ascii?Q?/MtrKv+Im4zgE4lp3/PQW8VcmvAFbglmZaFXAUxIOnr+fB+iacZu3T0n5Y9k?=
 =?us-ascii?Q?RuekpD6x5kFZbr/hTjy0U3/Gwx4+f0E4Zq01DOF1x/6s/LdNxojyqmzVfT8t?=
 =?us-ascii?Q?7+8WN3hmYv2m+0OZ1Ij/UhvCb6Nj4m7tL7WfZIdwcKzf1HDi9YsEi3Qmfgub?=
 =?us-ascii?Q?czChnz/5MV8G/TzQh5sPOoI9lcsGovqMZF+lq/uw/+/K6NDFtuGwZm+LtVKv?=
 =?us-ascii?Q?8KlhqhS156omPyT+WdlwpS5S042MVJnPG9h6tezFOhZLC52SaJfEThs2G1VX?=
 =?us-ascii?Q?ZtfOhF7byM7JqdmO6QuAYhFj1srMtTclwKrPeUkJU8nXhkAxCQVvCBxUjDDQ?=
 =?us-ascii?Q?bgr+6VYu9IMArn6CWm2clNjp6uzHgCO9Jp3wL/yfonANvoJmyVvX6XJ8Z/b9?=
 =?us-ascii?Q?mQ/adqfRE01jOEe8SKoev78xrnYuBNs52rxFj9qH8GMZ/9VaPouZicUfqhRw?=
 =?us-ascii?Q?RJW4ZinuzwQqml79Er/n9RscW/mYTfyqERpAHHmNtwuqoGl3paewXSmnXxPh?=
 =?us-ascii?Q?lKrA/u0FXcZNJaN0dj/FlQfw1clri1tQhFNOjhoKharc7XsRcfH8Gk0LqmXl?=
 =?us-ascii?Q?/nyqyHC8CLMsGxdEXxb3+fL+CTEX7llzInCBL9NH3gVTfV5iGJlOjPzO9u62?=
 =?us-ascii?Q?fg7GFd8JgYXi9fKDIdDZ/7I8kxGf6kP6LBJUhKenSn/0LLYohD7Dp1dgi4VH?=
 =?us-ascii?Q?2g4g3tFB/Gmp28AEwTutpvsTmax65kxJOZpdo7iVFV+VdOItlZMuT5+8Hs7S?=
 =?us-ascii?Q?7PVrJwazJdubacQEZWDP9KYSExyIBfArVxyzQ/tPMQQaW/gzI1A0ujBeQnZk?=
 =?us-ascii?Q?vaWVCPWWmRlfXiPOFAL52XXPhCurri7wYsZvAufvN7BcaL/e3Rs/DAYf89HZ?=
 =?us-ascii?Q?gC5VqJt6upb2kfgZ+Ip1EZuY5tBxyDkG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yiJ+EGEU1skXiZRcSmKa/iVz/x+6FVODP5GrDfrZCtC3DxL86kFW5ISBcdFh?=
 =?us-ascii?Q?MQYK0mDCXVskGv0ZaLIOSrbilfIEE48Y++9KtsxRWUd3gPNNnF49SQwt3PEQ?=
 =?us-ascii?Q?fLb3wJBGHI083TZmiazLqv9A4yCGq3aEPJLsMDOzLm3GW0fCIA4dRwT/9Svr?=
 =?us-ascii?Q?kThMTPOcq4OhY190qqJOKoA29LV5qx9A4Z8lofX5pcGo02L652xrgzePtlQU?=
 =?us-ascii?Q?VNu7g0TpzvKW7u1Gp6ZsxDD7RIpVlwNM5bHFjNzOzYq575xOIFvGy4D3EZXD?=
 =?us-ascii?Q?1WZ8HldlAwpoYIs1tFGiio2LnttKwR9KE7bn17TcWAbUGZuc23wiwF248gr4?=
 =?us-ascii?Q?Tq86GR/n01q7ns4nKuN+Ioykbn9CJ+vV1R3Gx62JabJBdUTCvF38BHzVOoKJ?=
 =?us-ascii?Q?Bx3onC2MBrpwqyRBxhStdmyoxoM8j12+KgTVZtYdBaR/0vDEj6UUZzffk8lD?=
 =?us-ascii?Q?vtrw82Z4bSKPFm071admvQNydVmZ8hPzI0arz+tOrXxvdT6mkIlARtjq0uXv?=
 =?us-ascii?Q?rmQvU+k6IBMgN2/qPvrD4Uq1ak7jQDXeRN6yYIPJiASABSzExVs9kLofnka0?=
 =?us-ascii?Q?lO3tfcIt/njFZ5k8JI6o7UnKMqZBLuPqpZ6S2x3e+AgMeNxYZOABchib189y?=
 =?us-ascii?Q?LUhnc5x58JnyKmRcqJJA21wnmwNZ8JOa8ocHqwvVvZtEugNU/3t3PsUyWhdk?=
 =?us-ascii?Q?N10o5+4NzLHlmKqJQZy6dTavPz3vE/OL/gwy89AQijDPDbD60mQSRSIHhhV+?=
 =?us-ascii?Q?jm9yJBAl+vKpqhryaq3SSc9kLMaanbXRlgFnXWPNzFY7lMAGhp5VRmDTY2Bu?=
 =?us-ascii?Q?M8xA0R3d3ywZddrEDtvLseMDodyhnnSMyNRhqR/bJGLiyUQBPXsnTZ/ZHE4q?=
 =?us-ascii?Q?wXX8+rYF4vux3sKSAe7HUOM2tMfxvTdhUKnEOhDvCGARCxFv+jAq/cy8s8kl?=
 =?us-ascii?Q?x/KL0I653yQ+i5keLYh2b0+kj1dycksWJ4vJ0DbI2sQyuSsPUo+GndWUFilk?=
 =?us-ascii?Q?h6uhmtfMqICsMLIBRzOq623A5zsuiH4iWacNVKapVeWIQ7yYeYLNpSE/qBLq?=
 =?us-ascii?Q?0gLEfmmecQk7zTuhVhNDaLK9h5o5a0wGgzfgY4R9Yze0ARImZ0FX1HfBnYVW?=
 =?us-ascii?Q?eC7BhirgVUq5cEgIaAkIeeIkDu7qDv2ekFvDyDqX4cSSEfykTK1qMDaqORt3?=
 =?us-ascii?Q?1CGu/qv5qsGXjBBd+9UaxEh+jzarITZG7/2vUlYjAF79Q601giSy7NIjEdEq?=
 =?us-ascii?Q?eAxG1sgCsRDkBPyrHd9YX6OGnhhDBrpj4OPNrT92CM4slNdhdofxCpkYw6pY?=
 =?us-ascii?Q?BzvOP8x3bBByFMEAtXEDieWQ5f1+9535yjQzUrqDqzCcY64Si2S1SUicvwsY?=
 =?us-ascii?Q?HgFid5CLmp0lw0IkED7kewogpmzUQlJU0uukw+03Em9wN9PxyezT06Y0Gllu?=
 =?us-ascii?Q?qp2NvD21KqUBox8Wz05ieXYuoDUfcQytUT3q1+UesAvkXVZaNQ4jHv3Bc5Fh?=
 =?us-ascii?Q?t6qrYo+zs0dPCvJupJ8YLRR5is+/eHED4jVK+nyuzEgBIuGiEC8SlNqx7Jun?=
 =?us-ascii?Q?xLXfYyYHGcFz+ONw7307NsjfY6xgGRtDL/CWtJSUv+7cZ0hcd61doy6lyXNV?=
 =?us-ascii?Q?VwCT4cRNyys4UebEUT86BDTOeDlL6CKBZyG2X8I89wA4X8Tb64xNzTHiWjU9?=
 =?us-ascii?Q?XqICiFLS92SJ5/Dr8x/EayHiTHrMAaNJwzYX41InjKzCOqHlIw6IQRS/Gqb0?=
 =?us-ascii?Q?25OqyMBcsg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace1d125-e9f0-486f-5049-08de4825a43f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:44.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuD8sR/mTv3D2FqgQy4dj27OSTPMIlnmqRO9pCsEwp9gQijaz/flGZTcRl0lXSobhv3oxTzmgIoE4G3cSx+xOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - No change
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index f9b2c2c906cd..adca0e681442 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 15076261d0c2..e65329e1969f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4623,9 +4623,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..65e3f1a97d76 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1


