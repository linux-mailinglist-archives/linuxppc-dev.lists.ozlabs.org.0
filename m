Return-Path: <linuxppc-dev+bounces-16436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBPFB3CNfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511FB9973
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2XrR0Dwpz2xpg;
	Fri, 30 Jan 2026 21:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770310;
	cv=pass; b=NORPAPjCm55DiFpnkssT0NqHfS3gOrmReuvEFLMRW7QS7WBpw02V4AI1Nt34qzHOvnkKlfFy9BqX4A0ZSG8cXeyJlpHMRdW4Dn3UxenecClunn3jgT+URr97Su9L4bubhHG1xi0rLwkai6Ih8mJSmksSiTIW1ncs5201TpyJGr8FVkW2dmA4/PuvLmYKLIujHUDND+eUPtNNlPZwoWhW8vYBQKWSPmD9baRlqAAQP14Nme+b8mJUbnNd2mh42vQnJTgSnOazkE1AFrR+e2kFzvz72/ap83bSr17E8nNQ6OgfLY3ufpdFZkercUXGI6ISeXOwOakoL5rKnWDTJi58oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770310; c=relaxed/relaxed;
	bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiLs2cFgAdDJzbhWLi5ibfKMDrcpzK++F+0vxWhNYrv8t0B82kALSKVIZ/Y/+HDWlOlIexNq07dMWt/N58K3eruA2plGRD00E2ClzNXolnwyoOJse0dDDS2pMRYobFcMuUZgQp3J8YcIc9k+f3+QwbEDMYL06VaxUwH9d8l/CaCQAo6E2mxCCIbheeGqK4zkzHtn0Jhwy07FgtalVIRvclSpSUgylEgiCjvU1T0U6hxEDoVL8pXODFCZWZ+HSdhSTGXsXwWSk6pgvcOelB/101aK0kqtF5hWwoQtKI9lMtlh/BbLjoGBrVmWlEMWTIZyz0hhF1yOzAoaslmE3+cmSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nkQlubuq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nkQlubuq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2XrQ2lV6z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjn99MarMfbeUXMaTwtkzwC34SBHI0mMugL5ZzzR7mOoFSnOiMQB+MLd/0b8WWeYG843nIUJEDzAATbjrv92tf7IXx+cxvTY++p5helRq2xGcgJO99Sy9UlNo3XPAN5Xxz6YDGW1K6q9cfXifOx32F3Rnjndh6Hb8rtoKYV+iEfQtB77JnXuCnN3Hh69ynO2PqFcqGMUPRm/5pDIe9IkxmBNrxeFigsyOn5/BHiLN9ID0CJpQscSrNtLrfHq9doFR2ey/atPezj5IpXVrgOogmsE/3wG4yxoW9K9VfkoiRwgXsg+HT5Dr+SfgMDxzjUzIommZNC2GG1aAvbFJ8umsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=gIEHbUcJyVpioydtAzZsUAxlDyef31/NbkQJ9uZjUkgArbQqptJM6wYMOFAFy8BfEmsM/hD9WlCQCT/PO3fFAUyvQtuii+6xPIP6o/o2Kyi5pk5fhaLq26otoXm/dgNIAOljwkD/QrbVaN+LbG0EHbtvKtue9Q6pucuiIXV1Zh95KqujFsd8P+lOrF6WLdp9RQX4Z+bGk5OAGp1D/utHI3hlM5qkwuScwJY5LDSk8NJV2FfLLZD768dxUFnJtvhCIk/RJRZPHj77ipmmN6lDxM6XPD5COhMieOlhGDJIa0Dt5niWl1X8SfrJpmFdyngaMwNVvKSHPT0GHuuALSIXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=nkQlubuqfbc+g3JKwwsctVhAq66VTWXBgBoDZicWY4cqB7U+gAX0Mmbq0hOG64dUj/+1X+4cSv2THZVTe1C+KYbNlZxtiprFkrztc3NFlki4gdFtO2Mdhoq1WD9SCOXuxIakgI761m62l8BuMzYuw68cu2yEvU1cSpawWgYYOApue/N5SR06OgkpdaJcqU3YYrFUP4fq5hFXIhj86Oaz5cVBbmny0R8x+35UVoUeWn1mcaHGOA1NsgHoMXCcz5MXflQWTqD9amMbg078j0qkVgXr+2BHymf6y94d6NpmboL40x9JISUU8JxeJB5o/dq5E3VZ7GO50Gcy0mwzVGFtHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:27 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:26 +0000
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
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v4 07/13] mm: Add a new swap type for migration entries of device private pages
Date: Fri, 30 Jan 2026 21:50:53 +1100
Message-Id: <20260130105059.51841-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 6536141e-9214-470d-2065-08de5fed8461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAsjsLfzTYSRG6gB71y9W6JdZpQe1OEwtJeLRAUU+2O99ZrNqeWfJY+9kWdW?=
 =?us-ascii?Q?GzvkEpQW1MDAiUNBP5iCDyndIlBRsQPMYv7Fd4n34JYAtIXMBjZLnBBS6Nkt?=
 =?us-ascii?Q?d9U/V/Q7y7FaG94ZnW3tkW/5xw5gDLxAbjZqjCo4qxCRrGm+d/eW23AyeuVc?=
 =?us-ascii?Q?z8mKHiiSEFG8FAQ92TerSaJ5XOsCqjxnpm5KttzR5eNf5lwE6IQwPNlgybA1?=
 =?us-ascii?Q?V0ZdGSxjuEU0HYbXXcstAMndNpov/QJ2xn1gpYyA041qlPQ8S6Km/Ea4Z2Yn?=
 =?us-ascii?Q?1pESKLpZZ4p0A/C5XjkNzoCzoHIbymhr42D93n/35VUstmf3svKLPq2/VOdp?=
 =?us-ascii?Q?CggQxwKR8rPH9Oby9pOwCESvGUt5fKGN0Z6O+Eq1sKgT0SLBXk0bBx1+7IOP?=
 =?us-ascii?Q?ibapwWoXWPKP+Bwhi1FpjVx8D2ud8qVsTlgDxNpDZpRG/D5eeDHUv9kaUdJ9?=
 =?us-ascii?Q?yhUCyVZfH5eKRiC0IMimus3zntUEoxzqxceFKzyT1Xy6i1xeabhZG9TjMYcm?=
 =?us-ascii?Q?vuTx/FqlNeg5HCfLNo2oFjArpEiWbHv/9YCpv8R2eP1o+Rn2D3mdp21/Fy2j?=
 =?us-ascii?Q?YOMl+mDF9S3LOn0fD+cjko0aHfT2zBjWfQsnrSgpUCq31Lxsq6ClyC42VwyX?=
 =?us-ascii?Q?hSYIdvoyfZR+fSVJFqic4izNs/6QNi46Cnj83tQGTJxGY8HavYmeCoGGPs5Q?=
 =?us-ascii?Q?2/BQszJup1JCKfsdykvWsEVRZ/n8d7hiVE7W+z4cOE8WsZg01j4rslY3STln?=
 =?us-ascii?Q?+9BBIbHW9wo8XEcidiw3aePF0IBvM6iwVUNI1HsQeHDbx1wZtilJDIsnbIPl?=
 =?us-ascii?Q?2tVdxyNpglrhQ+dZjgZ4jsw+qZeDTzGNMw7SkJ/3MVft02hps+X7fedFSFuv?=
 =?us-ascii?Q?CD87aAZxIJpJ9l1xvbOXzsGy9s6BTdHIm25OsFYnh6jYfvPmo9Tp92UBSX4k?=
 =?us-ascii?Q?vS+ljzYixmR9OPPDgsRQlR1sdCqPd73AiRZsaI5F6rKxNWfAr+2wWEHc4Ny3?=
 =?us-ascii?Q?cv7fWfn5+Rwp2uKX0xkGuOu4KRqUxajrD1TBNYfCWNjh9Glso1sVCfxj3jhk?=
 =?us-ascii?Q?HABivaGdv0pFZFWUTvh1mGj+YYyEz+pnGt9C5n+Q0uFHY0Q4hOIZ+nzGaEqm?=
 =?us-ascii?Q?0eU3K0hiw4A/P1ei2Oc2CM+sLDOEynzv6W/3d6Wkfv7+RLLjYfpW7HZgoSiX?=
 =?us-ascii?Q?XUhJ8j/ODcMrJMltqiBnkJlHfwzy/0XwkP/k90x6/cnAhGFmvSbT93DDFp12?=
 =?us-ascii?Q?VxWLEh/w+rMR8aAK+zxV8fh8AlZUVAmv1kUK/2WmnLMWb1K/Jt49SDPzYaN5?=
 =?us-ascii?Q?DowyHEFSFA5F0+MxEui5bGXtzFtmSy1edv5W39rj5Y0TU6EXXwdlqf4pJVyR?=
 =?us-ascii?Q?aOdWxhUhnEiFqAdq8KF+f0M6G9Y2eTl1u7Ax0aw+PmZcNbre3vGxtwWfXg3L?=
 =?us-ascii?Q?53rJJSJuG+3bsJRb+DD1yShaxi42Yh9owVXsY8ABD5UcwkUAr+6xntbOd/mp?=
 =?us-ascii?Q?cW0JAxepS3RV9kf7vvEKq4GkjvEiS7Chr1a4W8VnfP7JXEmCUo9oFxB8D5lW?=
 =?us-ascii?Q?jQZ5k5sUsu3KJdleh5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AB+DADh/Q9tMMDSe5pEKYeuX/v3x9nQZuNICdI9GSBYPE0bLFoQS4+/J+xrf?=
 =?us-ascii?Q?Z1P4t1q8d7UY9dFxBztKeAwzgO0SICNYzjJUgvoTWzdhCSKm3mSKEcqUWH0r?=
 =?us-ascii?Q?OFIldjmBsJ8qoROtdxYbsO3JWnNWXItfIttJdQf2Nw1gcla7A6PCbMRDZn3L?=
 =?us-ascii?Q?j6vcRmhp6XhrJMVNZC6e0nyJlYzdj8ZXwZxV+94KdW8apkX03aEX5HKZHg9B?=
 =?us-ascii?Q?lqm0P8rJlbUX/1bE5zpr/ti1VUMPsagh0THfczT9OW1+XarCwulD4dHlbWB4?=
 =?us-ascii?Q?vBMj5armofhdXNtz1XoAf4N4GjKF3MIQ3FGLuqd3zXpz7WvGYxDt/bHCOdJJ?=
 =?us-ascii?Q?jYFMFHs4JHyaIQMq7/bprCS8I+hbu5SMJOvsSqKD2YuipQULDk4IltCU6xzW?=
 =?us-ascii?Q?SpWHJy1XEmhglzszQgG8C/80Pu7p8nBVeLSte1j4U9Ph5B3bGwFtewa5Au3l?=
 =?us-ascii?Q?ogVm1QieMuVJ+bEDmlqD7LmSo0cZXc9hQph7MemfMzdwisYetrZEaSXjD2Ba?=
 =?us-ascii?Q?VVOyUleGnyanSVPfh6/a4ulX/4TNX0HZZWo73OsICYEvEpDrHcHXHktfVFIK?=
 =?us-ascii?Q?2eBYTi1lK1Qd8UJz1PzQDpzd3J0WaHp1fJHlF4fzBq0jYWbPgEsAyIT+cIWn?=
 =?us-ascii?Q?/kzD1aRndnqNqV8RMoN0X4uBlEC/m/1Age/hk0vX8bAhfOkfsIPmM9kwM3qX?=
 =?us-ascii?Q?XTM2Qxuzv2Lx2E5ehxSwLqC05zIBJBokwf6g9iGtPDlmzgmQoAnR8ux+nohD?=
 =?us-ascii?Q?tPtlT1kgADlBDfngNr+bvmtvPo/3RznyR0FVckB9kU073oYQR2pEdzUP4UKa?=
 =?us-ascii?Q?IFDYlygfDjAnOaj59k3hUhce6krjkYOubxqEGrOXGDWcChUaHoeuichjOliM?=
 =?us-ascii?Q?Ub6/Yia/nsZDt6hzVfrEsvWfm08nKLBpWvkeJ8t1lGZVapgtjQr3Qf+AQVFm?=
 =?us-ascii?Q?rVGJ/CMpB/mvEHWbTYS4vJ5u8TZzpsujMarQ5o16IGaZnAfL38ZnRbgtIXxC?=
 =?us-ascii?Q?dXjyvgLyUl2L8MqLmSjKrip67GgA6+r0DpAzb0UZuKY1943z9RyQWvhpPxb6?=
 =?us-ascii?Q?BBBHM/BNycTzavXczHkyRt9qWPTsbZHPcgzL2L3oYnqXeyYDKVPt+0T2VgPL?=
 =?us-ascii?Q?AdmnjBMOVuZV0l4X+o+eU2obx1Nd/qdZ3qFhKSmuSO7w/BzB9CmXqNAeytEx?=
 =?us-ascii?Q?CagYeAL4PxF0WjGdVUi/sfK/VRWrxzQeS5xbzpxLWlaKIb0jDaCUJahZueVS?=
 =?us-ascii?Q?aoNEeGFU0AxTE4nAXU4HuZcFnlMw1e4/l395f+tAnQKTm21wOlH/MO8+uCHD?=
 =?us-ascii?Q?D07aYuW3Dsm8Fupn+bMOM59d5szkQfRMr8GyqZ5BGjvT7AEPu7fp4vcdwMXL?=
 =?us-ascii?Q?ATvNzXsriRQb+xMbGlwpdcprmOd7ZZmcJHAIOGEp3jCcczRBg5bTJihR1d0t?=
 =?us-ascii?Q?ndjKhrRbRcM1OcBxsL7WiIV9URlVutPxWeoC60nXKaW8nF9ZvTx4nBQ/D8W2?=
 =?us-ascii?Q?f6d6WmQdSbYsKKs/SOSAEwyi58Unl7DZFloahaKxPzDHTGqndpjmDm1H66iV?=
 =?us-ascii?Q?SqyeA9LBcoZ4YlaTxa2BEQ5S0NvGQaxnJqdxq/9NIIwdcQR+c4Rc1dEXLcpp?=
 =?us-ascii?Q?QCgvgniUyI0qd1mtRHoSgMmqrBE1PI9k1AiqTreZQjCUICbCtD7x0DJZtCxa?=
 =?us-ascii?Q?dvmsJ394S1nebMw1yeFLOfIO3TWhQwtrw+gZpk3BERIUaG9/Xek2j6ydASZ4?=
 =?us-ascii?Q?xjr5s27htg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6536141e-9214-470d-2065-08de5fed8461
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:26.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRctwYcNZQ4pdOqok2J1oAmXc7WkT4dNXgRuN+AuvxdqVrsPW8oeGNZMXzuZwtwPPBRayJ+PE59/it/knznw9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16436-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6511FB9973
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page. This includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types that correspond to the existing migration
entries:

  - SWP_MIGRATION_DEVICE_READ -> SWP_MIGRATION_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SWP_MIGRATION_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SWP_MIGRATION_READ_EXCLUSIVE

The SWP_MIGRATION_DEVICE swap types are meant as specializations of the
SWP_MIGRATION types - they are equivalent except the new entries
contain device private offsets.

Forgo creating new predicates for these new types in favour of new
softleaf predicates that will be introduced in a subsequent patch.
Currently the softleaf infrastructure does not have the means for
creating new entries so provide swap entry helpers to that end.

Actually using these creation helpers is deferred until a later patch
when the softleaf predicates have been updated, otherwise the existing
checks for migration entries would be broken.

Note that SWP_DEVICE_NUM is increasing from 3 to 6. This reduces the
maximum number of swap files in the worst case (i.e.
CONFIG_DEVICE_PRIVATE, CONFIG_MIGRATION, CONFIG_MEMORY_FAILURE) from 24
to 21.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
v3:
  - Move softleaf changes to new patch
  - Update commit message to explain the change reduces the number of
    swap files.
  - Move creating the device private migration changes to a separate
    patch
  - Remove predicates - we'll rely on softleaf predicates entirely
---
 include/linux/swap.h    |  8 +++++++-
 include/linux/swapops.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index c1d3c0e8981b..220627cb7fff 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +179,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
-- 
2.34.1


