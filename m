Return-Path: <linuxppc-dev+bounces-15200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FBCF1839
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 01:37:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkwNz2s6mz2yG3;
	Mon, 05 Jan 2026 11:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=52.101.43.51
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767573443;
	cv=fail; b=NUR23bo1Ev6WotuuN5GO/2/3FaSnhY2vmdxONS9KqjbmQC/MbOD9G0n4Yi16E3d+axB6NMeMaeyDKjW6tS3puMdQ5zdhSKM08s0RYAS1+/SIZEyTkUrLu4GhxnSILPzWf03K/3WYPrK7eSh5sysg82VbDvnIunv9MIqOVqfC5BrISCSDBQasNn0UxCm2AIDhN/V8DOgSaIz0J/itRQyCU78F0OPpykVFUKz8G9mBJJDCO8WnEI5itzomSkHQ96rYOR7Rl8fgDn4h1A4hlz0QwAPS3c4lQXsMxU7KOGtJUZECNtb/uwt32qv49+xza+rZG85ao5vtBVaDkQ6yHjYDMA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767573443; c=relaxed/relaxed;
	bh=8QBxIZPecMYM0PNIBLJj9TnJmEZ3m6DFuXG6F2kgKJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FOu7jjWr7n2fCCskmeQZf8AfvmOoGBhLN3lrXHMeGmVT64sUPXyoF9kLhXnIeZRcGpdq+SHOMpTcQIJtGLVuXS37AFqDhWQH+lAwRfLIMEjBk3upCOInD/G1hVnQSDbHQzIBl1fHWYl6XPm0PJo/Vbe4Z2gfEcRJ71NPrXceswIBLzgfy8Ov2Ruc3nInq8Z59gd6XRGVxpMxG+Nkm4Z2W+PaFwUOB1I0ZG7yPQM0Tqv9r2MChLTGtzjSsQrCeKtO8FSB1AYKY4MeG5Q2LydzX0hZtvEJJyAcgIqLhvAAj1cbaBv5HU+bnExFP8k00mXQCncr4Ibt11k5qGemKpTlUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=fail (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZSOBQMxx reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=52.101.43.51; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZSOBQMxx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.43.51; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkwNx2GdLz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 11:37:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq6aTSsJdE5lKK96AWRLh463CtLtet/a3qb/wo+eb8PInGUIkv53OryRK+0btuPgbb5DijgwdrcfNp19HKHAtGWWAikgI8Co6lQ7qQ4ne5Mr0mHcK3ZvHTgNkrEh4m9XE/Y0+eyKaObVTao1WMLR/jTqoko1b5myEhO6rjrBzpbEdknglstBH0LgVEh3NptD32iW62orhlwaXsVIS5B74FleepmPJgQfJ9ysuPdU6KajMs0jhvDt2HFeuI1k32h5LlZJ9uS2Ltb1RohC3MdVF2JBZJcebRMhoyJAv3QdgeDupA1EpEThFv2OVE8KwBAXCzxmFgmt4+8ZBwb6tqcVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JTgCUYC7vcogScbcoA7W9NP+xjgbpfgkjLk5kq8e2E=;
 b=eOvjuIJsZ/MD0hHzu9obPmOaNtgpeTZbXzXNsQCnK2WtChDM8WjAFVRIGZqtZL9RCQUMmoZ8Uwmz2piX33kFlpu0Xh/27JTYUGRD+BnXjevWwcuzT4P1lofBNVvZODt6y+p8MWXfrosIg8YQefK+BlDYE/nHEpwUIM24bnBGLyZ8L6MuHn4/o+Aku4wq06lv+A5kUdWsxxitoKNej7hWsDYU+CSQwhtZMW0TDr3rzopg+FeL8LY3MPnW9lbur4BpVlZweRfNzn8XCq+ey7FaKq6qaW1Twb2bc6ffhUj2L+DGZbwMP6XToFk8H0wFurwom99fXOmsG2XxGFIok39JeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JTgCUYC7vcogScbcoA7W9NP+xjgbpfgkjLk5kq8e2E=;
 b=ZSOBQMxx2O4wAwsGeMr9XmBbEKzH0BUDqk61YGL/9OqkMOXwTV794bLQHLbEB909ZIrTVwmkPCvnis218vuaAuN1DjqGymK51Ku7kZA+7oGlgkGQSSO5ZYS/ofUPFR0yivHrZRT+QU98Rjsm/AW/ZgjetbsrCNxiZFnuRNz/GEpnRW2Sm8nTjeM+FylGAk1mPPz2vH17iiJ3Vm2EH1yFJvsYu4CiWwl8MvFmfQdp3dmBnkNxm8tLyRdsVKfG5zkvUWaT0mPgMylTGUZPxmEF2s5Y6N8tpqf+hCEEk+S+duHWHqDJzAMGpMmosiKUqA2kaiJ3rcsToAUez8SQRyRkjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA1PR12MB9490.namprd12.prod.outlook.com (2603:10b6:806:45b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 00:36:38 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 00:36:38 +0000
Date: Mon, 5 Jan 2026 11:36:32 +1100
From: Alistair Popple <apopple@nvidia.com>
To: "Kuehling, Felix" <felix.kuehling@amd.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, david@redhat.com, 
	ziy@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, mpenttil@redhat.com, 
	jgg@nvidia.com, willy@infradead.org, linuxppc-dev@lists.ozlabs.org, 
	intel-xe@lists.freedesktop.org, jgg@ziepe.ca
Subject: Re: [PATCH v1 1/8] mm/migrate_device: Add migrate PFN flag to track
 device private pages
Message-ID: <nkxrhh3q7fgnr2q4gvtg4hi5j6juvli5a64ap6nlgacrevogel@nun4hfcmdfez>
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-2-jniethe@nvidia.com>
 <d489ebb2-89c7-44e7-80eb-53b5fde8cd39@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d489ebb2-89c7-44e7-80eb-53b5fde8cd39@amd.com>
X-ClientProxiedBy: SY5P282CA0134.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::19) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA1PR12MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5175e9-eff3-4c46-00b0-08de4bf27cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?giWbZghvJ4hAzkO3e5uiLDkVVyfKSjHbxl3Nrolibp9L6eH4tmjeZPE+f/?=
 =?iso-8859-1?Q?9YLU0NgqFyWrvGqvTgEvCc3c6OhBSclkXpTI/V+Nozmj/wXOz8Ch7SDzRv?=
 =?iso-8859-1?Q?KBt0ORN/Qdxq+//Uu83rV/03m7v6CA968jq64WMi9HnyZ4II69aXzVXvH7?=
 =?iso-8859-1?Q?oERmIenpi2O0b9VU4vkSOAsbwtNzUcO/BkH+nGqWWxoBD/9C/6w+8sD6+F?=
 =?iso-8859-1?Q?Pw3a6cF+kGDop4zAMVAyNvdEYMZFa1h+zwbeImmAj7rLcz3ArJu47n1JXh?=
 =?iso-8859-1?Q?cS1xTTMEfztHsyc1pKfSMMvRLMd31DW7eAY3K+Dv8f8o9GbhuUaoe19ow5?=
 =?iso-8859-1?Q?VggtzfPd6fCBmPebMZ0kt9Eu+j8+H9yiUmh3OYJesd9qnl0KpfLVmXVSec?=
 =?iso-8859-1?Q?6394aJ88hpB+i4YozBzsA1q8N8trgEj8qCaMdp4H7eV6Le+tONXiVW/Bsl?=
 =?iso-8859-1?Q?omW9CUwj7ECgN48V3NK3jzg7TOAaveeEmglOh/U7qOO2SUkMj7HrXEVQb3?=
 =?iso-8859-1?Q?GuPd6Dd7wvmZCeuiAGBVbdAznlJtBfzGpLbVdkXPHC1/Xfz05MFwUrLn2/?=
 =?iso-8859-1?Q?xv5QaOBgPGOPaz1czxjGOuIRiH6r2fLlunRJ/vq6ZBZ5Iha+En8eRF/XEU?=
 =?iso-8859-1?Q?qyeMrxbTu1LtxnbD2Pv00cuoWQPuL1cNZXg2Cn4DqATvq2Gz/uIbKDim0k?=
 =?iso-8859-1?Q?nDKQabMg9Zqc70ylkFkeKHacLdbGLzGBNAst4fYucya5EUfiEmbwiTShO8?=
 =?iso-8859-1?Q?/kk1B2Prx4pArLYFhp2Y0S99zEYEqSgsOkXv0AVQS3g9RrHoWHKEE3O/im?=
 =?iso-8859-1?Q?/kkuSbqh1snTOLbePPRss7WnfESS0N91s3255tMbmMN7gLJ9vAwkYm+ClP?=
 =?iso-8859-1?Q?hR8oGjk4BO2+TrOFxvKm7cHXh3CDJxg4a8V9DHCEj+PKjbFI6QcbPOmYxU?=
 =?iso-8859-1?Q?Ui88v0zAW6HvaZrbZUj37Uu9nOtAm7si93neQ8mJCwoKrp3Ie0nw6cZpFw?=
 =?iso-8859-1?Q?uixMtxm023c9PUsJ80HsrPTmLWaPT7HddybgqXT9jGnSlFbCYz0hcBWQ8t?=
 =?iso-8859-1?Q?UuQhKF987j0OyZ3HqFSAvbMzH6JS+9u26bCciZy3sTsSL/ynf29DDGNfZR?=
 =?iso-8859-1?Q?WR14zxCio3JDPuM57tsJvB9gpP7cPdpR1dTzm8ac8RHjmg/LCJEopiyqND?=
 =?iso-8859-1?Q?lhXP+ZmOrdf15U/PLRWn9go8ZF+ft8y6gudMtNx9kA9Tl7VgDxz+TKx8R2?=
 =?iso-8859-1?Q?5I42z6SqyVzCOzXTKT9gCZqUE7vhkbTJ/SSwrHOabqGGPdYQs8SE3MBO9f?=
 =?iso-8859-1?Q?w7spG6DdyD/oRwsujnxBv+cc/JKoZkdrF+EWrwl6638RqAUsx+rQE7CBOl?=
 =?iso-8859-1?Q?C1LAVfp10/X0IyYQpQ1/dCMCUYnqI3INW27zODc0hjUL6RTLursN+LDY1Q?=
 =?iso-8859-1?Q?2jZp+0/UyitrgpHlJIKp2NwFB/vTd3z3XRntB5+cZw2mKe/R1pERafjpH1?=
 =?iso-8859-1?Q?aJATsVfGtXG3SZEE39aCp1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?98gNVg8LTHTVW+Xt8weavqyQgEZGfghh1/8djXEzP7MyYWUWgwsVq3vqYK?=
 =?iso-8859-1?Q?3hZEYVogGAQp6o/BfAbOJEzzEgBbym071lkAvRQ8JzinelFnSBzkvQGBO1?=
 =?iso-8859-1?Q?4tZms3WHOPxQz2+k61dOA5FdSAy6pMDmg2dNhhrlj8EBXGOE8qR80vy/B3?=
 =?iso-8859-1?Q?xvugp89el/vYQcHDVTgsHxEbJgQ6WEmv1oDcL9qn8902+MftXzdcaVwDrw?=
 =?iso-8859-1?Q?Zhoa+yVMa/+lw2Tcav89KU6FCqWshotCocFN20zSpxxrT1viNVXROk2h6L?=
 =?iso-8859-1?Q?JX17n0PKyOyaR5+o+36m0fcPWEBn6Ra62y737JqxiXAh+7AR8ZahQGbVix?=
 =?iso-8859-1?Q?FwGs1glkR4gszKOkOQaGR6vRqljGxDuDuX61RBHtiNyXe6V3LJdpyUGvFy?=
 =?iso-8859-1?Q?y9u1qt1HBCl+UlzOYFsNtH88HRjSjIWwm3UYIghncEJsc6R+1SLGm2qsnC?=
 =?iso-8859-1?Q?94bTSr7QEmebhRbKjk4wtyxi0ZG6CCSSGoooFSBP1DdTyL/ebJ1UazBw/n?=
 =?iso-8859-1?Q?EiquC+4PRionRlUwiXXOpUYW1TDn8gh7KYiXmJOVJVgsB5dJI4iO5NNMAu?=
 =?iso-8859-1?Q?24KhuK4L3f0IicXmrpYhIY82BnWrzvseDxB7HbmepW+6d3axsloK6dt/ar?=
 =?iso-8859-1?Q?a1yq2OFIsY8Hrf+29dTyrsH3pa50FZ/2cZGOnDN+ujcnHo+owY2kiqvXEq?=
 =?iso-8859-1?Q?RLwNshMOjYVTEnFmwduje5Bv/C2IY18gkm8hTtdojEPx3SipEW5LG1dJg4?=
 =?iso-8859-1?Q?VIgRehwwclYQj31eL3wO+xlnClph5S+ZFs0/KzWaT1ZnLkUY1Ic4Ll8d7G?=
 =?iso-8859-1?Q?lN3l0qviVGQJxAeJc18W4PYwC1tVI6Hf1nQ0BvZSmyBRMK+bRCYfrMbaZr?=
 =?iso-8859-1?Q?5qPJQHmzmt8S/+HbYoZeGoFU7L7e+nKKg/izcV+CnCLp2IBq+CFF27hK8i?=
 =?iso-8859-1?Q?B3olTZeQf63ty7jl/2d1feDoKke7+e13DpsuxXkld/pvg1qWODUnP7037F?=
 =?iso-8859-1?Q?AFJJZW9M5LO0S8+/1507/HI0Pta+6EnTw4FtPPybLuMLnVS5yzGhVQfllZ?=
 =?iso-8859-1?Q?7cNaaqkOnp6PImsHbJz4K8qyspSGUBN4qdm0HFZQak+9TIq5LZgOf8z00f?=
 =?iso-8859-1?Q?CyooWRO/iJYKn5K7E//hVpCn2zie/xkwuX2NAaw8Cduery2d5nllgCkaq4?=
 =?iso-8859-1?Q?HxWEPxOno1/7S7/J//9GEeERlBaJ2u3RHcJ7xFKBmGGVvyiRfrcpg+ium3?=
 =?iso-8859-1?Q?f0j8vfd07nphyv+yj2xsoE0zt/HO4JEcmENAHxSftSSyOul90IHPUQs34/?=
 =?iso-8859-1?Q?+xWOB31hG9qvSVAlDJVW18IB5nm5Wi1aQLbRwJuibD77TEN+tTm4lKbSz4?=
 =?iso-8859-1?Q?GpceSAiAeHAfnrpE9K3xh45YBcNrqKBkRa+REY8E2gNx6LthvTSjkJ2VlI?=
 =?iso-8859-1?Q?b6jjlLJ502mGbLCv6lE1ekHq6nRYPnXHWZeDTa/1B9Y568LgEOqro+NI4l?=
 =?iso-8859-1?Q?b1QruPhINyp8quGf0iz/nHJpXUanrP9nKyHvH2XcBWOsroNKKmEXfODON/?=
 =?iso-8859-1?Q?QHZir9TBJunQM6tk1dnmo2xkcedJxjSEp2bevxJ80gPvhAijVHMNdTiKcR?=
 =?iso-8859-1?Q?uQlh1nCWxT0gSBkzhR1hev2wE9gjbAlRwlq8DV/A5j5JKFcRem1RkyC7mX?=
 =?iso-8859-1?Q?4NrtzaRUxxHub07RcqMmL9HY0pgrrPUnKbH3gUrAlnlq4tyB8YpCqyBo/d?=
 =?iso-8859-1?Q?IGERop6m7yq3ObTXV+hOFgsy4VBMhodwI1UH13GVBsQPMkTZB6DOQLEnZL?=
 =?iso-8859-1?Q?wGP8UWRYLw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5175e9-eff3-4c46-00b0-08de4bf27cc3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 00:36:38.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fYwd7iZN0zAViiQX0su1ICPf7PNgUiBJYKbdf6nry6f8KHAxm208TL6gUptTVthqLfh0fW1/WYwBE6iqYLT3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9490
X-Spam-Status: No, score=0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-01 at 04:03 +1100, "Kuehling, Felix" <felix.kuehling@amd.com> wrote...
> On 2025-12-30 23:31, Jordan Niethe wrote:
> > A future change will remove device private pages from the physical
> > address space. This will mean that device private pages no longer have
> > normal PFN and must be handled separately.
> > 
> > Prepare for this by adding a MIGRATE_PFN_DEVICE flag to indicate
> > that a migrate pfn contains a PFN for a device private page.
> 
> Thanks for doing this. Some comments inline regarding DEVICE_COHERENT pages.
> I suspect this will have ripple effects on the rest of the patch series, at
> least in patch 8, but I haven't looked at that in detail yet.

Thanks for catching the DEVICE_COHERENT aspects, they need to remain as real
PFNs. I think the flag should be renamed to MIGRATE_PFN_DEVICE_PRIVATE to make
this explicit.

> > 
> > Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > 
> > ---
> > v1:
> > - Update for HMM huge page support
> > - Update existing drivers to use MIGRATE_PFN_DEVICE
> > ---
> >   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 ++-
> >   drivers/gpu/drm/drm_pagemap.c            |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> >   include/linux/migrate.h                  |  1 +
> >   lib/test_hmm.c                           |  4 ++--
> >   mm/migrate_device.c                      | 11 ++++++++---
> >   7 files changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > index e5000bef90f2..dac5d6454920 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
> >   		}
> >   	}
> > -	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> > +	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
> >   	migrate_vma_pages(&mig);
> >   out_finalize:
> >   	migrate_vma_finalize(&mig);
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > index af53e796ea1b..0257c6e7f680 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > @@ -303,7 +303,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
> >   			dst[i] = cursor.start + (j << PAGE_SHIFT);
> >   			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> >   			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> > -			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
> > +			migrate->dst[i] = migrate_pfn(migrate->dst[i]) |
> > +					  MIGRATE_PFN_DEVICE;
> 
> On some of our GPUs we use DEVICE_COHERENT pages. These are pages that are
> coherently accessible by the CPU and peer devices in the system physical
> address space. Therefore, this needs to be conditional. Maybe add something
> like adev->kfd.migrate_pfn_flag that gets initialized conditionally in
> kgd2kfd_init_zone_device. Then add ... | adev->kfd.migrate_pfn_flag here.

I don't think you need a new flag, you could just make it conditional on
adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE.

Note the need for this conditional is specific to the AMD driver and HMM tests -
AFAIK there are no other uses of DEVICE_COHERENT in the kernel.

 - Alistair

> >   			mpages++;
> >   		}
> >   		spage = migrate_pfn_to_page(migrate->src[i]);
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 37d7cfbbb3e8..0c756d73419f 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >   		struct page *page = pfn_to_page(migrate.dst[i]);
> >   		pages[i] = page;
> > -		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]) | MIGRATE_PFN_DEVICE;
> >   		drm_pagemap_get_devmem_page(page, zdd);
> >   	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > index 58071652679d..2bd80c6f5bcd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > @@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> >   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
> >   	if (src & MIGRATE_PFN_WRITE)
> >   		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> > -	mpfn = migrate_pfn(page_to_pfn(dpage));
> > +	mpfn = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
> >   	if (folio_order(page_folio(dpage)))
> >   		mpfn |= MIGRATE_PFN_COMPOUND;
> >   	return mpfn;
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 26ca00c325d9..52f65cd5c932 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -126,6 +126,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
> >   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> >   #define MIGRATE_PFN_WRITE	(1UL << 3)
> >   #define MIGRATE_PFN_COMPOUND	(1UL << 4)
> > +#define MIGRATE_PFN_DEVICE	(1UL << 5)
> >   #define MIGRATE_PFN_SHIFT	6
> >   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > index 8af169d3873a..19681904a666 100644
> > --- a/lib/test_hmm.c
> > +++ b/lib/test_hmm.c
> > @@ -727,7 +727,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
> >   				rpage = BACKING_PAGE(dpage);
> >   				rpage->zone_device_data = dmirror;
> > -				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> > +				*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
> 
> This needs to be conditional on dmirror->mdevice->zone_device_type.
> 
> 
> >   				src_page = pfn_to_page(spfn + i);
> >   				if (spage)
> > @@ -754,7 +754,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
> >   		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
> >   			 page_to_pfn(spage), page_to_pfn(dpage));
> > -		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> > +		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
> 
> Same here.
> 
> 
> >   		if (is_large) {
> >   			int i;
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 23379663b1e1..5d108ddf1a97 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -199,6 +199,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> >   		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> >   		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> >   		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> > +		unsigned long device_private = 0;
> >   		struct page_vma_mapped_walk pvmw = {
> >   			.ptl = ptl,
> > @@ -208,10 +209,13 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> >   		};
> >   		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> > +		if (folio_is_device_private(folio))
> > +			device_private = MIGRATE_PFN_DEVICE;
> >   		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> >   						| MIGRATE_PFN_MIGRATE
> > -						| MIGRATE_PFN_COMPOUND;
> > +						| MIGRATE_PFN_COMPOUND
> > +						| device_private;
> >   		migrate->dst[migrate->npages++] = 0;
> >   		migrate->cpages++;
> >   		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
> > @@ -329,7 +333,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   			}
> >   			mpfn = migrate_pfn(page_to_pfn(page)) |
> > -					MIGRATE_PFN_MIGRATE;
> > +					MIGRATE_PFN_MIGRATE |
> > +					MIGRATE_PFN_DEVICE;
> 
> I think this also needs to be conditional to distinguish DEVICE_COHERENT
> pages.
> 
> 
> >   			if (softleaf_is_device_private_write(entry))
> >   				mpfn |= MIGRATE_PFN_WRITE;
> >   		} else {
> > @@ -1368,7 +1373,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >   		return 0;
> >   	}
> > -	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> > +	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE | MIGRATE_PFN_DEVICE;
> 
> Same here.
> 
> Regards,
>   Felix
> 
> 
> >   }
> >   /**

