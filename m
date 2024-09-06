Return-Path: <linuxppc-dev+bounces-1077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1787796E9C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 08:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Qqq63XDz301N;
	Fri,  6 Sep 2024 16:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2409::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725602952;
	cv=pass; b=Mld6AgBloFh14yDozyYZKGUp8HREaX5ehr/TuiHBmBHJeUCe/HeDV7keNlOOEZHCskEx+ADCsitnS+rvvb0vu1s8m6ZXRKBQlD8upqbF+wnvDz5JuEj/iWMK6FarsOqZMO2tDSGD/vRQfFeebCjQOy0VdBKN19aYHw8bMSudCfb5GQtFf0kyVXAKTuh0h9kMF1TglaPYQm9Je0me9sEsXvrCt0hu/ZL/fLPYdkdjAburHLRtNJE/OGqIrpXt9rnieb7Iq1L1vcpzIEmLHyx+Su2nk+To3c/nok87D0f8EfH/htQ1sbO8zAC2F3mgy2DQj9wHU5SYlOzWq8vXwOU6aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725602952; c=relaxed/relaxed;
	bh=UbsRXH9JJIBnRvfSPNoa0YV7m2c595aea1nDAMY00oI=;
	h=ARC-Authentication-Results:DKIM-Signature:References:From:To:Cc:
	 Subject:Date:In-reply-to:Message-ID:Content-Type:MIME-Version; b=Mo5eaeE//kSx8CI6pb01I+E1MR4kyhj/AJSU3G6EgBpPPPc42UhTyErShS8YzsgzStAwNJQtCBE/NycpStai6/3Fmj8/6FtmRSOdRXcljK6ciEptrA1eFcYiOMtbLC/4UmJGesklHXg68IF+iKX+bYvXkV+grSZIJd43zJgxIqjNkyyt1SXK8cJ7Ta6v1QY5xz8GzrczNaxvh8I6h8IL/GP4G6eOWk/AphZMECc1cLKbVxXUIcgai4BF0ThZ+BFU3H8pTKtCKrDuMT4acA2ZZy3xeFEwKBf8PFCVOz9LH3G4hq3jaXKps9PVzzMDQJaZEYRWuQtWu41Ux8Z7Ng1dqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n1nW40tT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2409::610; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n1nW40tT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2409::610; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2409::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Qm82x8gz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 16:09:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCrR6VhnMnsg1v2Rbtl51RhnerGQJZRpyySPERektbkoaCDCeThbkFo65cRrieXJHyBDS84vS+yChuAGl2/FNHcyAAWmfsn1sHn+7O8oqFOKZxKeGqa+w8ZXB4xogOmWTNbJM7WZVre3XgN48/swD+XFUcZUJL97v9ik7tqVZl1WY5gzVyjUWjTxdaff7auucIxcJRVkLsiNbTdQQ7x7GW/8qXStR8QqqoDKJcnfe+SoiEV3dQBUo76VjFSu5LUHv9rkXnBV408yEfKaLPr8qtDiBhDHXnGFfCpv6+3wPAlimN2ccdcebH4R6yZjavXhghHneT4dbjrd0Z0qBiHR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbsRXH9JJIBnRvfSPNoa0YV7m2c595aea1nDAMY00oI=;
 b=bRXnbi6fG0MqNV0Hp/SCLmUNdJZhvvZ+ZzB6oVFWaFRxAnZ5Rr7JwodkoPR1MDJHnLt2NbCdbbZCBeQ9iVVpT9aLAzyofBJ7tbEzkXUdgob174v828SHmJNQPw32PgK4IMSPoKO2sd+6u1d2IS8+zxOOUKhI4M5zxaMzm5S7LMcHAe/+jB+pjndA1qLZvIHk/LuWuoyx3APrulCW7cMIM7Eg64TU1dg8AYGvmmf4E3onvrvPNs9c+0O3qNexoGHqNRA6SbQJqjDQiUCYcBIkU1eGPpYc8G/ILCkDT+ji8t6Cff3s52McGgIzy+2868pDR/Y0zDI5B3mG+b2kYAjV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbsRXH9JJIBnRvfSPNoa0YV7m2c595aea1nDAMY00oI=;
 b=n1nW40tTYajkvZIah/cOB3kuMPNPkzynMSnvc0Rx1aQwK7PnFIMaPVV7RFtNnfbGAaaEn7rlu9IH2lgVuRx5bbcAIQAKHHlc8YvnNoFozYOmT0Dz0sQ9DYImFiiEbtBOSFeH+0O0kLLOEmsNeQfbG7Lo9vblrzP78s+Hz4zTvKP4pkydF+HZF3/YVkotEPM7AjMkLUR89IksW8HMZXB2+Hw49nrWafcYL4Xfycz/BLYbO/OvR/Pt5fQFGuZTwup8BqXLbugBYmx3NIBKPESOPuoA9Z1QKolxjahVEF5EX/zPkDSn/J1yoo86nuTkUfwoFgPXJWjCvf15ClX+T52Viw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Fri, 6 Sep 2024 06:08:47 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 06:08:47 +0000
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <afcfa4f164e5642c4f629c75acf794838c2ac9aa.1719386613.git-series.apopple@nvidia.com>
 <20240627054455.GF14837@lst.de>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Cc: dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org,
 tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, david@fromorbit.com
Subject: Re: [PATCH 10/13] fs/dax: Properly refcount fs dax pages
Date: Fri, 06 Sep 2024 16:00:38 +1000
In-reply-to: <20240627054455.GF14837@lst.de>
Message-ID: <87wmjpb9g6.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0085.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: d081438c-657d-4fc3-63dd-08dcce3a5e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qkn2Zz9/4qH7iAaVFFLM7o2NoD5/A0WNiRaXj72XV5wtoX+z6oAy7fR3BN6f?=
 =?us-ascii?Q?VvqdYpdiBD90SOMrOSFt+j73r7FsvQItHV9GMySaaJ0Pq9NPAE7BDQ3FG2W8?=
 =?us-ascii?Q?q0Dr1+kO1PaY7rieB+0SgNMB3OHb1ucb8kDYGsb6dVWBBwbN4U1p1/+sR7k7?=
 =?us-ascii?Q?FrZ6hadUvmLRY8Ow+NmbcWaQ2IQ7flRG+/bn6F7FPfx8yCwCtI9ROS8ebaLz?=
 =?us-ascii?Q?CWKc0r4ZjBGGGRu/PiNi5z+1cdXu7xlqUU38J3XytJoEGZOdGxDQVDFMlT4Q?=
 =?us-ascii?Q?yWyoJEorzVCRSVuphmT3t4o/AkRmTJPTuC+VRHNmezh73KoiBdLDouf/3Q9n?=
 =?us-ascii?Q?x4IAlea0Ck+EMimkStn10h38OefCvf06PRMMXstWTBnshhOm8jl6GDaXhgpp?=
 =?us-ascii?Q?1a0ODHht6/TXTurPmZROe/LqLuElcjuOc76lKBoPtZN84hUjYhRWWkeFxeYN?=
 =?us-ascii?Q?GdO/J3G9wHPgpELNtpwD2cKUm9zywigH9KIx9ykwuGvAijRF91ZGzILh0p8k?=
 =?us-ascii?Q?O1ihH4CgFvkGvCJNvxQaxPCjEsWAvGIh5JYHY7OhvlxmOMzOZFK9wiSUfIDx?=
 =?us-ascii?Q?rTBQtBLLact7WcoileoSOKBk1+UA070w9uZ0/Wcj+w3CLUNOniS8Qn94ceuv?=
 =?us-ascii?Q?GDumQSEXjfl44Bbrt3eYbbpxNLmelpJu/Y3C73YU0vqZwzLzeU5tyWzwDAEx?=
 =?us-ascii?Q?CYuayZxQuQwE/0V30xS0FRzj1cQ9ibVFuhenJbLQnKDu+DSFrRFnetc+Tmbg?=
 =?us-ascii?Q?4/Pr9zj87kKIcpmWH+IniHi8TdeYhoUCkwvql0YG1age+zd/VmNSRsBtugXr?=
 =?us-ascii?Q?pClbmGNub2BCOIxQDiumHPAGhtZmrSNuSBvKFZf/1rsWy31TgHSEz8afzwn4?=
 =?us-ascii?Q?BcU8U3Kl0Chv0c8gsOp2iWdr2SA4tRDybjHUAcGonSBcCJL0JBBIBKpwLuLR?=
 =?us-ascii?Q?YuR31LxeSMcLpZWculnzC97b/HoVm2D/ArDYOLO3J+yQa1Q7Zd4qEXDBJFeE?=
 =?us-ascii?Q?6E1kMjk7iX153CsWfYekq2C5/AewKBksItEl0vGTe6YKWjl5awwx9wl+BYMX?=
 =?us-ascii?Q?OwZNmqivzNOJpNAzRM22Xa5jKMiZwh1FWpr7keeq0oaMOry2HmL/XVMufu4j?=
 =?us-ascii?Q?n6azWgkd3TMziOHgPfzzwZH00mLBWlRA+9Y4+sRodcuglLY3o7Exjj1N75Pr?=
 =?us-ascii?Q?35ogvnd1vP8pt6jGHKPhj/B/hvH8ysrE+cg3N1SEjuCpfRflnf0253rEXM8V?=
 =?us-ascii?Q?SQTPAZlCA5QgnrW39XI+hg6XjA75DBKVheU0a8mJw/rNE+RwSud2dA0svylk?=
 =?us-ascii?Q?sfIXOR8rNPJ4NkC7Q1Ov88+CtMqEEOZkliAqUv2UwZGdsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YLsEU0S8sWvuBBHQ1rIXmX8xljB5qdnPq48s4HILSUaki49MCk3UlmVOkpgI?=
 =?us-ascii?Q?p7zzGU8VdL79gR/gBeILlWMZncGwAoGhBBXJzeLtjS4SMOuR3yU4fQqE8ik4?=
 =?us-ascii?Q?0uR7cOAQg3wVDqpCLY9y1J/ftpvr6o3OO9lwKtK+nR/KMMMlcGvoeYCJdI5M?=
 =?us-ascii?Q?LMRz5/gLkFjw8Kqb2Et57VjRXqc++0qBq44rB0ihhTc9OEgAuM3+YD1pFTiL?=
 =?us-ascii?Q?2hDG8M/d3bjc9rVnCGKr7FzNMJfUeD7Sy/HHKpbsmEzbmYuxNo4STzvnKp3i?=
 =?us-ascii?Q?ZdgXgAZy1eopAeJ/44LqZcN8sGlCQLbOXZOHcCtU1LO4chZilqa0aGINBfsV?=
 =?us-ascii?Q?Xx8AmQCX+/6vYOIW53Co7GlgGEzp3LR3awCvHS+KY+eX7aXybojY6KU3HZv1?=
 =?us-ascii?Q?NYfG8+zyxbiNq15LnKtrj3hHoKN2OQDtfxqeEwU0a2CKSl9mgZKqQmyf4r/P?=
 =?us-ascii?Q?s5CHV69ojOsmIP63/pmQb20WvRXf/L2k1DNgvLBZLpMFi1Vu0WuGxcqAHodA?=
 =?us-ascii?Q?5Zm/TEwzjCY+ofqbkk0pfmUT7WE9o4WPOKZjKrenKZM3QcOltzVrNNZKT15e?=
 =?us-ascii?Q?uerCl7+5pz+P6m7zaDQOcyqk2M2I0WavHjkr35YTf5M/S0mKvZx3Ti/0O1L7?=
 =?us-ascii?Q?19htGNqivcYb1TZBjb7q1c0WZcIzZznMAJOeQrmNC+CezW5sU/lt/dp7n7Ht?=
 =?us-ascii?Q?hNBCVk08sJGlNOssgSrKJqAazDAXk1SYzBRXgMKnnP4ZLwb+/ER+8Q8oXfGM?=
 =?us-ascii?Q?9LJDHhAzbT6Ealod1RSoSyVrP0dDGyrRJsgl3NWA/Qj8AAKGHZub2XlgoyxO?=
 =?us-ascii?Q?hZN3jtpYh2dPPraTVS9tTJ985/wM9ZL377YTXr83ze1y/ZtTR/g4jihLyvFR?=
 =?us-ascii?Q?1lfIac5WLm4P2eCtXE7LBZzRaZRGYDEukXLtMtoUGE39qDfnuAnzYBVj2iNI?=
 =?us-ascii?Q?B2tJNuE0A8r450hYGvwYfhIXxYqvUFzGn5freb5sFcpxEkrV5F099s361Jls?=
 =?us-ascii?Q?LQlzIT3a8yB0rq0imsKazLZ0b5T+PvKUNoIsii3I7hQkc9/Hwl1YyZ/0i3m6?=
 =?us-ascii?Q?voNseznKbRgjSiDMZ0fvRZBGyhcr/p3hr47xplidVRLBp12pmKKmq54Jifnw?=
 =?us-ascii?Q?OqfE6Ly4cH8K5go7bAVVtJNbXUy+I+MjUpiEvDJoxG8wPkG1K5XIKH1VTCQq?=
 =?us-ascii?Q?Y/0AbHrTsT1fVxMpiWZepxkpaUSG+scdZzCj5EMW8LESThVwZBZ7GXhTbln7?=
 =?us-ascii?Q?sBsZV8ljyVNhp+cfD0G5wQ9wBNsSnxtmDtIJwvrbCG6/IJemztNHH/Eyka3D?=
 =?us-ascii?Q?AyqlrMwV5GKp6pfcSx1G+a0uk23d5Uwb05oGj43QbrbTy3UKXkJHFH38+a/Z?=
 =?us-ascii?Q?P6axFRrluydkBdymQJuUxw45Vh5ruu4ViNMhBdXmYWiUNznIKR1csq70SLoR?=
 =?us-ascii?Q?eFc78r98oAUKOZ/nzXIWdC6a5aZN92eREaC13S08EmZHItbtV3+RT3zPo4xO?=
 =?us-ascii?Q?4oF3FS44PzTaYYIFOGl/KoTNfbzyCJEGzyA3GuXKitI/xFulWUz9CGOAFlLF?=
 =?us-ascii?Q?2JsXpH4xze5zJ2jX+0RhsglWmBb+7Y88tDlr/81o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d081438c-657d-4fc3-63dd-08dcce3a5e92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:08:47.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbK2MoRguK+zVxCQMw/hnsNuQuoEZO8vjpOaoX14PgMEC75rqG8HQpHJ5+z51xWMmF5EkR/vBNjnBKkiJVkBKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495


Christoph Hellwig <hch@lst.de> writes:

>> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
>> index eb61598..b7a31ae 100644
>> --- a/drivers/dax/device.c
>> +++ b/drivers/dax/device.c
>> @@ -126,11 +126,11 @@ static vm_fault_t __dev_dax_pte_fault(struct dev_dax *dev_dax,
>>  		return VM_FAULT_SIGBUS;
>>  	}
>>  
>> -	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
>> +	pfn = phys_to_pfn_t(phys, 0);
>>  
>>  	dax_set_mapping(vmf, pfn, fault_size);
>>  
>> -	return vmf_insert_mixed(vmf->vma, vmf->address, pfn);
>> +	return dax_insert_pfn(vmf->vma, vmf->address, pfn, vmf->flags & FAULT_FLAG_WRITE);
>
> Plenty overly long lines here and later.
>
> Q: hould dax_insert_pfn take a vm_fault structure instead of the vma?
> Or are the potential use cases that aren't from the fault path?

Nope, good idea. I will update it to take a vm_fault struct for the next
version.

> similar instead of the bool write passing the fault flags might actually
> make things more readable than the bool.
>
> Also at least currently it seems like there are no modular users despite
> the export, or am I missing something?

It gets used in drivers/dax/device.c which I think is built into
device_dax.ko:

obj-$(CONFIG_DEV_DAX) += device_dax.o

...

device_dax-y := device.o

>>  {
>> +	/*
>> +	 * Make sure we flush any cached data to the page now that it's free.
>> +	 */
>> +	if (PageDirty(page))
>> +		dax_flush(NULL, page_address(page), page_size(page));
>> +
>
> Adding the magic dax_dev == NULL case to dax_flush and going through it
> vs just calling arch_wb_cache_pmem directly here seems odd.
>
> But I also don't quite understand how it is related to the rest
> of the patch anyway.

Yeah, that should be unnecessary as it gets called elsewhere as needed
so will remove it.

>>  		if (!pmd_present(*pmd))
>>  			goto out;
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index b7e1599..f11ee0d 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1016,7 +1016,8 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>>  	 */
>>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
>>  	    pgmap->type == MEMORY_DEVICE_COHERENT ||
>> -	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA)
>> +	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA ||
>> +	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>>  		set_page_count(page, 0);
>>  }
>
> So we'll skip this for MEMORY_DEVICE_GENERIC only.  Does anyone remember
> if that's actively harmful or just not needed?  If the latter it might
> be simpler to just set the page count unconditionally here.

Yeah I'm not sure but the switch statement you suggested at least makes
this much clearer. Once I get this series finished I can chase down the
MEMORY_DEVICE_GENERIC differences. I suspect we can just do it
unconditionally.

