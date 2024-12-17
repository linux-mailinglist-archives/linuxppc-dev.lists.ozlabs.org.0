Return-Path: <linuxppc-dev+bounces-4234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00B9F4210
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 06:15:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC4kj3rhPz30VK;
	Tue, 17 Dec 2024 16:15:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734412509;
	cv=pass; b=JLsCFC7SsWoRwK2qfBiL4Vd7uWPsURNKMZydfWlrqrV6QgcWE2tHs08mAeDNKEEd5uguE62t0R9Q8BZx1h/F2ZJnXfeQenV+jHS/jSNWS3smoQ/kiXQI18+aP/jtVzlzqlgzSo79fPI3YTM+mpWYJx2Gdm4f25oIs6R3QgYIwk0FW+4Amgg0NmuMCYUeFfhqqcRcV9z7xzZfVfSnVJx+CGPutA2cGl3A47AeHlq78s8HjPAQiyIjS4wDSnwrlc1+l6iYOVI62RbFtD5QZDE/hvkAL/fJUHnq+N0j9LGmj94NNWWLlencvE0N760N1tdsepbNDVrWWWOL1ni7DBOgtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734412509; c=relaxed/relaxed;
	bh=AhSxmQ+j65lRO+MqTgSIlrqwBiHyj9EjNJh19mI84Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWGR6zlQJjzkoOi15tBHO/hyenfgEZ29x+V2OENdWHBtG8kalJAXVmDXcGOnLqJlYwIZYBQlvTv/7UeLX97RB49rMVBB+Y8uWSm1zKZt7lRMqVXRE76F/5sZMua3MOIcTBFvM7g5ik44BY6hLqOClQFOSXvczDMtAoNOnPs3RENHpxxZ1hmmT40WQVCC9A7qMAXmNMfl48wGGmZStPyeVnt+oWu042GXN1TTWyP7ges+/uERjaushao52s270LXe/0CQw8deOZvai1eSR4EwkKJvubgDquSgGAtpLbsjkQKMxn1UFkB7we0+xE5KLVndeFNRSRx7pXiNTRL3Vafuig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OMo+N+VR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::61d; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OMo+N+VR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::61d; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::61d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC4kh5VhMz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 16:15:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJepwsADWuQrB7P+EPL3WMg2z46/3py0phTnlthPFMag4YSBIHjeSWoGrByteuw0UIfE8BOL8XVZuTQ0vC95mBhtvFFeHHJ/NdUzOL7aVyCjETgMgXibo1eVPSLyHds4jlT3Mu4uke5JD5nPs3WtHMMh97G4J/l4Qx820hxKQnhHQ6G1HzpawuwECCrIyDoGzCM2+PMH2zRwEvQiFWCxffNdp/N/hOjuwVp2XpEd8yyIOZSoZNQhb7YNzatxMJ7f8yJtq3XNZ4teRrXfem22AZBsHckJITXv9EOm9cY7BjaU8TYkXY5g5OfUIN9RvYMlUiKmmKvgL6UToghBxFUoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhSxmQ+j65lRO+MqTgSIlrqwBiHyj9EjNJh19mI84Z8=;
 b=q/WVZFK0OCn5l1P8Om0MNYvpN2K4P7+x5zH7PbNjBUHMbf0H84D/W8+/13q7ke4QXyyArFEM9tKEuLQJHAJu92YHK583TpSmXlUC2o3D1aA+wZ8+gcs6N4CHpj8kTEpHFnPnxpWORlaMSD+Fn/Wk4mWApPkC6hfUpvD1Qn3W2QUtQ7Lniq9TM6bxj74uWrR9cYM5FtmqIkt3DFuuXc7LZEZhcD8akTD3dafSL7vIg+FLWJt/9tuGvDcnVog9+3/denzWqu0sSflaQFMny9rVLnwsFcxRTru5JJ0xCEoOzHw+NsOtM1yNweborP13EGGDVbJ8J/cfaaAZhKVVZ8um6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhSxmQ+j65lRO+MqTgSIlrqwBiHyj9EjNJh19mI84Z8=;
 b=OMo+N+VRHnQHATfk9y/wmCWNyY6c8qMkVpYpqpgQK8c3z01KbZyVUqb/mQZGAzV8eX6+YJbr2hI8AYucjXSOkLf13BBnGCJ2e48X8Fq+yTdMqhWzNM2ewyUasMTl2JrVxYRx+ePr2QSg2GoIHt2gGdf+sODnT9WvLNphkMsad7UJLz1BPkUilZ+RUtWCLzQa2RagJBpwA/alppvT2MJoIaCDb15fD55hkfajNsDEDQNidyqF8NIIG5n+R6mEbaUo7qw7QL33mLO+AJhjb6ST7UCHSPWHQpBM3pX7NsguMgRoLfMO9SUKCUnGv7oRE+V76eQkGmLS8H58rd0tkBMiuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:15:00 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:15:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com
Subject: [PATCH v4 16/25] huge_memory: Add vmf_insert_folio_pmd()
Date: Tue, 17 Dec 2024 16:12:59 +1100
Message-ID: <b1c1e92f29094d6d5b78c6f87dc8ac81a9cbd7aa.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0113.ausprd01.prod.outlook.com
 (2603:10c6:10:1::29) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4d0580-ae27-4720-0666-08dd1e59c175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o2qqKUGV0KWRdZw7LXjMbM6bJfubNkA/xVluzUjA8xpmgsHiykQwjqJIwuP0?=
 =?us-ascii?Q?c8HxWss4m33PY9ODXL1IkN0w8l5Jr6C+gSpJIoGDiqY67ptmp1HZuLE72dpT?=
 =?us-ascii?Q?RF2b+R3ibwRELQPHv+QajUcCqH1O3KfQYBXYmCl3c4V45+gEnTJh/1s1D0K/?=
 =?us-ascii?Q?BMl/kAKZ9ALtxscg5B7aGrz70BkWqxqzUUGuyHUovu46toTniMupGTCLvyTz?=
 =?us-ascii?Q?MeO4/dNiMZMJha6/JCqd155i9FgrDLCiN1jAJw80smcdukOsS8O0PI4soI6r?=
 =?us-ascii?Q?qVmNktcx7eGGpY9puq1/cdwLNKxDXWgkIL3l5XIE8ABofgBW03+mcRGpjwvU?=
 =?us-ascii?Q?lIkZaB2XQIev3aZotbyAoa9F8gFPFiLsHLo56r62d6TphRWfNvGl5zQEPUCN?=
 =?us-ascii?Q?eGW2FoziJmGxyJIJ9UYjb3TTDeg9mgBGZHeqU8VeBlMeXOSvQtDT5JoCzd2B?=
 =?us-ascii?Q?DB2ixzuRntnq1F2qep5w68epaCWU1n19GMz6kMl/Wekl74lLog/y0dq56//K?=
 =?us-ascii?Q?QD9KfopUICIXFYvKTXgOHayRW37Fix+n85h0NQBChpCVrt9l7cKNiujAtZyd?=
 =?us-ascii?Q?uAp/p5iLMYcd66y/gkn3MuqEUihl98YeP3F8oJzBMPuWLfJolxgsDIs6V8od?=
 =?us-ascii?Q?Mhukviu5Pc/4irjJzpWaeuh2THCR1qi1kZ7n9uJUgJlWajF4wNgutantw8Tx?=
 =?us-ascii?Q?l+3zOkpiskd/CiPW9crcOcqFpjsUqRLdFYi79/SxYSj/oE81rhprdQsR3HAG?=
 =?us-ascii?Q?g4wvyLohfBil4vtPKJKwioTIXJT21Jf+5HtqJd+eskiyafx5zjBRxuZjxCsr?=
 =?us-ascii?Q?jAdFzWYJEL6/1XypUqrIBc/EvByxj0G29zLnwbO/0Va6JsMxe9wvtJTQ8+gL?=
 =?us-ascii?Q?EA2S3j8QVsMtqlyS/KJhokEzuuPHaPlrlGLtT0z664EjRP7SYlXmtnxNampV?=
 =?us-ascii?Q?KutvSJs6Jdnn7UedL3/90KV5jviMqzqO4voPmVdT76K/N5sNZbAB1LZYHy/9?=
 =?us-ascii?Q?7kJozIBUmY+l7o57WabFN+6kj2PgoRUJ+bHykkAvV8fBWGbnV1C+8JJrfC6h?=
 =?us-ascii?Q?mklqB5tTtYbLwI7Zgc1uLm4aVJwca3577m4VODJ9h78sMws0SVoMaKrc68qG?=
 =?us-ascii?Q?jzTXqyqUjA2fg+DrbpFUxkFUwmC96AAMZKDUz73CpsGu0h9/qu0wiNYDoF46?=
 =?us-ascii?Q?zVLdGoqik7/v6rkD3X2McG5f2DR7Yo0pUaTFIDHUI+BFtZdjZY7CDBZ2ZGVX?=
 =?us-ascii?Q?F+W/RkEwOEbrYIDsYD2uOHidAtilbspeUjNF8d56+hnGdB3p/UzEzdPXAIF5?=
 =?us-ascii?Q?JNK5Fqa1B1+zfUUR/r1BT0ChhitTo6QutihblHKUlc5SsJEbFm4wV4T4d1AA?=
 =?us-ascii?Q?x+NzzXYQHiGuS1nGgq91AJ9XqGnA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dtPaUXvoXqFP+vnWMMCQCCt92HfhYrjC6SJ3IgATIEBRpg/a8eozEwZ12+sE?=
 =?us-ascii?Q?mo21VgTLMT6JxBoU2RmbcHIo6gyzMCPmAQozqnYS4OGsXV41vGZaLvKsifpi?=
 =?us-ascii?Q?cCZGa4iLhT+uh+WTbUc+5aq1NEqBUWU0UpEN0SvNMGADOrDsy1GBILRo3bsv?=
 =?us-ascii?Q?gkQfr2eF0wUGwTc9c15X7wsg1tRhCls066GUg4i8guCrcoBFPpUWNxs2VQh3?=
 =?us-ascii?Q?gFmFDKbBoYfgQKw15BKEUsHOkOMHnxzsd3WYaTXXcpMPUZTKM2lX1sBXLQju?=
 =?us-ascii?Q?kzIT4ygJSa/t5dtmwXkzOhvBZC7m8C9vcn41053J6FfTHUdule/ltHlVDSVe?=
 =?us-ascii?Q?h1w13vCQ8KxeNBkjtkkbNhQbRxqjdvqqdZSXqHTD7+6GBRMdiPyJpcOHeOOZ?=
 =?us-ascii?Q?ImYVUIQcUi4WwOybUKzZgGQQAhMND/NahJdqd9pxiAfaykUEcpgp3aPehjX/?=
 =?us-ascii?Q?bvOj6NjVlIukQ6sF56cYvwZpoSmtWN9jrYubTu/LgnGfZeDd1mxSoTfnl8fr?=
 =?us-ascii?Q?S11GvhKAu+DYHZhWCn8dZUgAKR1cf/DXWmqg5sczs8ydsdaJWQKXcHk0Mrv1?=
 =?us-ascii?Q?J2aO+modHrKDB5T56DVG+mEApM1K7qVHNrol1hAf5k/HU6AnZ6RRCY92JLfW?=
 =?us-ascii?Q?GdxsjNtm9AkQCOx3j8zClYDdbNflY8cyHQlSqr6lO7sdQ5GsVjQpAhENw5uw?=
 =?us-ascii?Q?g46Zfz+YJC9yV7Q36ejTwR6O40+BMkPcyhChr2cHuH/3iP0oEAHhcv5S0rKM?=
 =?us-ascii?Q?GzEuJf+zh+/4ef3lVw9qUf+PEVl+5fptWPpZignA4fm9IWy2ftDXhKj7tOQN?=
 =?us-ascii?Q?lM4g8QSNSL3mWEkPnfjw9o8i3fpO3JRTr+iIQb0ktAg/SSLnU3g58SLvCpSx?=
 =?us-ascii?Q?MxXeyJN+ufJftoiKMDnwnU0Iq4pvGhjW5wLKJxLB7/eKOmoNG3NyXQTxEkwW?=
 =?us-ascii?Q?FGujaT36pCFLEYrk3BvZYZ4Gk2hx/5PCiKqWA2nl2AZb0tl3nXfGPk/E8hEk?=
 =?us-ascii?Q?JEddxngu5Tn6bvPjyFfz19l2eaxY3AYT1B56y51/PyIaZBIjrXg1+T/5uokR?=
 =?us-ascii?Q?Nay8He2S4Od0LgrS05Sj7I+2SvA+Ijk3ehi95YXheqHmS4m3sT+fgIU6kGeA?=
 =?us-ascii?Q?loRhNXxUxofhigmvjvd/q9csnon3ChwsufhwM7DlYk2pLjTkkJWvS7fN3lyW?=
 =?us-ascii?Q?dz8gCG8mFqX9bpjmy6BKoLcuCyuSmvieX3Q9PZsdQH9QJsJVWtcIx+wcerhN?=
 =?us-ascii?Q?lxagWA9D6uAeWDNfYtkwRufzHu6qnB3cJDYURVOtYTRVfXVk5LS3u/mwHiN/?=
 =?us-ascii?Q?NPaok1zCw1C8yIpWQJa7+3zOQLZLV70TmlVfLuVHHn4ln8v6uyGgFxqAVNdb?=
 =?us-ascii?Q?LWAT6/RF+ks+aLOWws6vUNNhC/prCbWnoaJuqxUi6bFW7PqSEL90x2KKrlDj?=
 =?us-ascii?Q?TsYzjJ3lDYbhW7weJfHXwMowM9eDFoBnfQgADTYY6PFn9zYxlQcA8+jjgzp3?=
 =?us-ascii?Q?/ySN9hGTTJ99ACLSr+CaMInVFoK4gVkx/SBanPPFipw9jK6ATAhmqdEDjvrb?=
 =?us-ascii?Q?Iozw4Ne+HNmdDvW9R4kXnKdbK/0T5Gv4EEveoHBS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4d0580-ae27-4720-0666-08dd1e59c175
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:15:00.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtrREqhJLeZHxp2PZtuDbyfHZCIszFqBzBAb1UWO+EF+YFgQ3a6i9zfAlIjrQJIIVBtLMZZw0mA4PDrMmKkMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently DAX folio/page reference counts are managed differently to
normal pages. To allow these to be managed the same as normal pages
introduce vmf_insert_folio_pmd. This will map the entire PMD-sized folio
and take references as it would for a normally mapped page.

This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
simply inserts a special devmap PMD entry into the page table without
holding a reference to the page for the mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/huge_mm.h |  1 +-
 mm/huge_memory.c        | 60 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 012137b..4ad9aa7 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,6 +39,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write);
 vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio, bool write);
 
 enum transparent_hugepage_flag {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5081808..55293b0 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1381,14 +1381,12 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
-	spinlock_t *ptl;
 
-	ptl = pmd_lock(mm, pmd);
 	if (!pmd_none(*pmd)) {
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
-				goto out_unlock;
+				return;
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
@@ -1396,7 +1394,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
 
-		goto out_unlock;
+		return;
 	}
 
 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
@@ -1417,11 +1415,6 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	set_pmd_at(mm, addr, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
-
-out_unlock:
-	spin_unlock(ptl);
-	if (pgtable)
-		pte_free(mm, pgtable);
 }
 
 /**
@@ -1440,6 +1433,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
 	pgtable_t pgtable = NULL;
+	spinlock_t *ptl;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1462,12 +1456,58 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	}
 
 	track_pfn_insert(vma, &pgprot, pfn);
-
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
 	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
+
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & PMD_MASK;
+	pfn_t pfn = pfn_to_pfn_t(folio_pfn(folio));
+	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
+	pgtable_t pgtable = NULL;
+	struct page *page;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
+		return VM_FAULT_SIGBUS;
+
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	track_pfn_insert(vma, &vma->vm_page_prot, pfn);
+
+	ptl = pmd_lock(mm, vmf->pmd);
+	if (pmd_none(*vmf->pmd)) {
+		page = pfn_t_to_page(pfn);
+		folio = page_folio(page);
+		folio_get(folio);
+		folio_add_file_rmap_pmd(folio, page, vma);
+		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
+	}
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, vma->vm_page_prot,
+		write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 {
-- 
git-series 0.9.1

