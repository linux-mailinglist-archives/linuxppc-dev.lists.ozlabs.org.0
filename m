Return-Path: <linuxppc-dev+bounces-16196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAzGAyMUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35270E89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Dw5pjPz3cCx;
	Fri, 23 Jan 2026 17:24:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149456;
	cv=pass; b=asbRdXUk1oMpKvJ2+X5erQpHso1Repgn14pg0tD+g3kJ+qYh3TgfHUQkpA8FZmPnr/bpEp6BphuLHIFiKOm2i5ARjCxmwCWog3PGqlmxo3L7pkhcqKdzVnwI3gzyou8Xqu2dV6RL5ky+X0j50k//znLL5qZC1MrmmC8uOXav0QW6YZW968HgumwuYKDbO5zSuDAhDBlnXj1j66t6SezLevivONjTXN5JyzBw07fkgMbUW/iVpVPoPw3B4GCtt2M4WeM5OKGb4D2bwjzFDoPl4swv8SdPl+MPIM3kHH50x2YIHLkAI/Jy1I9HDjN+8qx0Sq3tH9Rl0nV+r2UgPARe1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149456; c=relaxed/relaxed;
	bh=/whOTu439TI6/rokuvGMHIprZMhUuQPHsgulcAZN/dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c/k3VJk1SsGclyEbKO3VUkb14pu5c8m3Vh1vZ+wbS7gtffclkkf9k87OjTpOFghAtWiyReN0mbc2yK7b+9LU3XeD2hPVm1HTI/Lb3aCsQC47IELrWlSd0KXvJocSD9TtieunEoT93p6YxUQsC/eloX5XYTu9rJSoTE7QzLkJXzTIq/Pn4vH+hLlHknlJoH5/Qs0bVX9Alt2DXo5WtRQJtqV4Ju13IPWwIpp186zHXTzS0y4hlOq0zV5nQYMuJxR/S4gFbAvTph5SnVn3+6C8iygIO9P4mdp6GnKQsrhpdh5LO92fWPW+sqb3ov9Q2h50NmXnJw7cEBVN9SayjbOUmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ukNLRjnw; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ukNLRjnw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Dv6TByz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTtS8S/EFoELNH7hi72ENTeMdYM3LBFXbpRMEZjjmjIas/ejRNJAnkUiOD0zXO/AxTUo2TVG0s3rM/NVdkzzZoCGVwd483OhuwyrgRppsWQsbD7mep76+lnZH2/1jEj/El9UrPsNw5eOVQJzIg7+RqhXaaU7YsMYtRYrPZFihMtVJftbGV/DdHQXz/WkE6ovHLtseCHF/E7Ta+Ax5s/x1UFuiVMzjEpOuryXI5rbhxQl1g2LKEAQPwFNhwaB0XPG0UFxNR2NAUkJXetqGRj0AX9SoXoVCKEEDkN1CH64NoSRGs5TCk0KgT3nBexUxew0YDsUHGJ8tGVOc0YCZK6yAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/whOTu439TI6/rokuvGMHIprZMhUuQPHsgulcAZN/dc=;
 b=bQ/0nwVJ0oxgtLHkmtI4X49oawFm5PPVTlk8JGNNaAMJ4VNpSQgeTtKMjW0OYXttAN5kDYHTej+nKlsZHD2UmzmW5l6r2g3WDnmcTQwaj2nhEL5tb6DJo57deL403vk8FdGWe5pTBor/QFh7DHnf1h67kzkTiaQc2fYU0eugmlcHrChTQ6WeU2CISMoRPwYAMqQeJXwvlh5TIVujINm/EFoqqeTa9HPbkLwyeFePwTpsPhLdYSWxcVpA9qwkJpCh1CSwy45rnYR7Mn+NbESy/DG2uQZ2L1vRVvoUMB2eXA5kwpCgg1m1zBv3y68U82iy6ZpzV3yIukwGpyiuB8CG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/whOTu439TI6/rokuvGMHIprZMhUuQPHsgulcAZN/dc=;
 b=ukNLRjnwi0YJShsQ+oV8iAXK4eLv/xC045+sJ5vnuCb7RFWMuHUM7A0mNreQkD3RAGZiZcyvReHsXJ8TJ/OuHRkyaTQ0WY7p9C+DPQm98yOEh2rXwviz39/nQ95G3ZNLrtSb24QazmdBaAgKIzUETmeAC97ckwD22b90uqftFkAV5u876KQBTLoVzBtdEuQ7u/hY4E+LLvIPFmk6jnoBAsRVTmGApWzXRT5O1yOxh+SI7PFPeTs9Nr/5do7OgVsZ+7R6NWQoOhM2SzQTHkhDc3e/Im7GwLLnFmzCBUymjTcAWqTnE/wLMs3IaxH3oKy5UgboW/A+KJ+k0Y2LIuH70Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:24:01 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:24:01 +0000
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
Subject: [PATCH v3 06/13] mm: Add helpers to create migration entries from struct pages
Date: Fri, 23 Jan 2026 17:23:02 +1100
Message-Id: <20260123062309.23090-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ef230a5d-5954-4a22-3c03-08de5a47ff62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LudG8cLLX2eQd3ObHV/BrQDwLbmilUVS6azGb/f3c5nvIVG7cUl9yHJYSmqF?=
 =?us-ascii?Q?abuV6U50vgF84bStxUi3/CDkHu8ShX1C8F+4rfcSWqqZdQT3LPqyuPg5bZx+?=
 =?us-ascii?Q?9GTSeK0kEuA90Dv0zwaPQnz3U3ySBSzrRdY/08slPLo2qBuJj0gKho9PCFXa?=
 =?us-ascii?Q?zV6Fn2X96P8bVfMUWOy3HJt8KJ9LSlcxpOeAk6qB+/GqtcenA/JJEq1ad0PA?=
 =?us-ascii?Q?AE5TZ9K4l8nzlULb2Ga4Lm1KK4TczgoKDeId96HnLlVqrumoXmZr4jAPWwHD?=
 =?us-ascii?Q?YTI0iFu11ait6pVNoDX39igddN922J15M+goOf5n2iksj+/eW//D2tQnWAvc?=
 =?us-ascii?Q?ret59WJHl9ChRgOPezZvtBoSsIOrTbeEAWUbsdBz9HTOBqmYmz4XMcVH5ETs?=
 =?us-ascii?Q?bci49pFWYFJ/HZv5gbSPlzgzbE/LNDs4OHZc4FtekEZNFw4qi8HCgLsn4U9j?=
 =?us-ascii?Q?Cp8v8uLYDpsbVwXRmx/tN8Ju/AHBJ9toBYwtXytK4JhbDlmnVuqMIsLhipfW?=
 =?us-ascii?Q?kVsROtBIZDxuYT7JixK0nNVJ9Vwo8xip5eD9p7bUGlP+Aav/haIOK7vKOVt2?=
 =?us-ascii?Q?TyMso1Jp4m4jFtad2rDcfFL0zPVLujyC9wFOGP+clp7PrONcJHDaRkE8Ekk6?=
 =?us-ascii?Q?PY09gn6eXRFATUkANOaWQvBA/9nQAstSj5qIzyKfXK2uC1wxNJrheo2EgD3a?=
 =?us-ascii?Q?kbcHd1LxjYFa8CVyGGqJVhND3xOwzYxYohS+l8G3ZlClhM1AtYxI/ULGhp2m?=
 =?us-ascii?Q?sVCvNtgpMbxrIfhz051lAU8/f927YHZoDtjfM67rfPfvIf7ysH4oVmyanjCu?=
 =?us-ascii?Q?P6dyCsFH34sI0w81CXEMrIC6IhIjSw+HjrSgYwlbqjpC+Ud6Tencfs6ejxKT?=
 =?us-ascii?Q?mwjdVqyPPeyOoX1l66oha+zRefGdQSBoVlFuKkwMCXBgzDtgWEmIBxigu+LY?=
 =?us-ascii?Q?PVIvG/ox3rjQwTCcMZ1FqwLJ8NrhPfz8bkeAIgXcP1tmM1bD7ANDqaQE0a62?=
 =?us-ascii?Q?f2q05z/fUpb6mgoo+9Dwe7OdjONnKyIiKkUgDvB+4dYacQV4S+TWqsYh/BO9?=
 =?us-ascii?Q?KF/9V+MhKOWBDvjznCTBll7WIVpvA9u0Eva2CQ7I7BXHpFRoUXHJRGjRh7xV?=
 =?us-ascii?Q?/IZk4ZrxPaZpnc+LNk87o2gUSXCvypN+Ra30AIx4gWHGUoCTU3HHg4LYxw0Y?=
 =?us-ascii?Q?MtU0a6a5C9P96Op+hiTrCoNcRiVRYB74tymdmru2Qy1+37LfXKo/nKLutfEL?=
 =?us-ascii?Q?LndgOjmXg+kWkbFTcnBIzVKyoT4M8Z5x4GCjcBbvGwa+sLKsmetmgUx+6OpS?=
 =?us-ascii?Q?8+WEP+FpsZQdo6UrXdhxedqZy0MGh6TpapWtcLeBzpogrrQFT0SF7axMpXPt?=
 =?us-ascii?Q?/PqWMAmaDVHetbz7vEqvZe+HLSGqK8YbiQCs5fAtwCF7T7YX339rSm9u+peX?=
 =?us-ascii?Q?udq9L5iZIqPF8j/RiRMUDXrXtCAPnk/c3eMCoNh1vnzTiSUI5j1siuB9uO5t?=
 =?us-ascii?Q?/PseZ4HdP/53Nhlh/Vswdc4Jma8bvi0hMuBDmfIknMQIMb/9MdhGai1+bPJl?=
 =?us-ascii?Q?kJR1DrKQUvusszCttwM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xJ5mgz44GmYMN8kbmVwsA+yiIUdxIP7a5bIZ7XBSNgeepQCtFdx0+oNrBzT7?=
 =?us-ascii?Q?HL3NGgTqcnzkON2yX5If8Een2Th8ymeEHkEzB7C6C1Vh4e2i2/OWMXSpeTAo?=
 =?us-ascii?Q?EGtWrZD5ThaPbiEzZR6ze4R91AqcOIax4Li4kb+EFCHQAy32ACT+dG5cgsfz?=
 =?us-ascii?Q?NzVf8H8VJQTh07FnioOI/Ml4HeM6YMZfci9WpbZ7eW9rd/M+vNn2MSNK1FJ0?=
 =?us-ascii?Q?8byuomI3dRa0cpgfDQQgj6u0z/E6FAhJdd7GfbAG4D3vCbCqwGUYztnG/dMo?=
 =?us-ascii?Q?cTKKgA7ESJgeJPziscwuiJ9JsDsKoqnBDQicMOyTjBym6/u7O+LtooCq3gi1?=
 =?us-ascii?Q?R62IfG7TaebvN1jVidsKsHaHmEjhf8sFGgwAvSjBg+ktxC/UILazArORMiAo?=
 =?us-ascii?Q?KM/Giic78Bvn4auOqAtavZz2KT54fpTH3UBnoCJo7VjfB1PKGUbSrgnMGLO5?=
 =?us-ascii?Q?Y/a6mbFvP98vyLFz9oVfE7B2PzxQVrBbXvACdg/+I+VQYqwjwwVhKcOXgGi4?=
 =?us-ascii?Q?dscxAWqu0CzkYziweOeiQNqbYly+YrAND+/9rfXnI2aw/pp5VUVK/czhL14M?=
 =?us-ascii?Q?OK9bjFLFev9/CET7tEpDWb8i0hnirNaNhlAXOZVCmVcokP/HYXRog634+kJH?=
 =?us-ascii?Q?scadGoValwILu8exove+0xOakTTo40fvWMa8cMJpQCPPiMDoRluoWpWv07A5?=
 =?us-ascii?Q?0KpKxVLWoRfeCRDQTGNS9u6eb6+Q3qNbRPGm/37ApCRoUUTto9kl1XN13+L/?=
 =?us-ascii?Q?Ih7zOQBOO/ZMHi1N7smXiLDtCGlvGwz+L9eO8+6lneG3AEOW+B39iSUCh/jd?=
 =?us-ascii?Q?FEM8XBW1N+oKgTAfc5HNSRMq607KaOwla4NEcfqAtA4/f/HvYOa2GPute88o?=
 =?us-ascii?Q?Ag9jL1cTKrpGEQwaFDsyYvctNBFSSFPqk17N1GDgAqqBYQhtflkhStCEPCID?=
 =?us-ascii?Q?k34X8vGSqMg3zN7Cj7iaSBPLQ7e8NxgsQoAjXQR1oKWOOsHEQqdcpylZDUIN?=
 =?us-ascii?Q?Sw3lAjAPetNFuyh4ZDKbY2/DQES4lr4zuovwoAqqvxujJesysvp8S192mDO9?=
 =?us-ascii?Q?QgyHaPL1RMfo8QK8jn0MeovupnS6ml470e2oUJSAKzxYFJ+imjrtNPd+4Gps?=
 =?us-ascii?Q?kFFoJSoz8ko5B9RV+DmAmT4eNzLgB0iVRoznbGD00u6Avz9DlR45Kg53jxH6?=
 =?us-ascii?Q?e83juTNYIGkfTrU5gjilbpwOBtYSN5E2mrsBiuMVE+tXx3n5tFMB9YqoyUDm?=
 =?us-ascii?Q?1RJWaO2TAzjSLmkT2Xrl+pIQ57RjB14QRjvRkDBEDUBt5CJ2Fqd4nTsBmfH+?=
 =?us-ascii?Q?u292sfZp+sIHhpyNXyMxvbidNxXbxr5iGj5wVsD7AW+2uZRIwEX5VRy63JO7?=
 =?us-ascii?Q?EP2btQGIi066ozdwrFzWuTrtLzdX/yuwmF25DUUotjvQxW6TQInGl7LZfn1F?=
 =?us-ascii?Q?SgMsEgq3gZrJdDt08Pv+l+iWoArVsSFFrxV9z/JA0557aDkEhm/ImEBpe8/E?=
 =?us-ascii?Q?tAyRSVZOqBueObiILdumCiBu/NLJD+u+cbH9jxk1jqwotiSMeAr0W6t0C6Mt?=
 =?us-ascii?Q?E1jnS7T8I6VvGemHstR/fVM3s05huatld7jN5vdHzdmDWGPscoKOBiTPuEUQ?=
 =?us-ascii?Q?4wYDbfVw4HNkIYI9z+35GxnCFC1iPr7U9iihaQpnLCRho6PQD6GWJHz1utK0?=
 =?us-ascii?Q?k8C0zFJFeWou3qBywEoP6J73POLv5XDeDIhbtlNkn1DKtII2i1Ya90oO58b3?=
 =?us-ascii?Q?zLNLiW08rg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef230a5d-5954-4a22-3c03-08de5a47ff62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:24:01.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTme8wgW32TEK9314FvSZMvDsS5KVKWJ2LAyPU/TVSDT6UwKvnJ+GIBSuE4iuE3HKrU0OSkUlVK9EMSeda+uWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16196-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.170];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0F35270E89
X-Rspamd-Action: no action

To create a new migration entry for a given struct page, that page is
first converted to its pfn, before passing the pfn to
make_readable_migration_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

  - make_readable_migration_entry_from_page()
  - make_readable_exclusive_migration_entry_from_page()
  - make_writable_migration_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flags param
v3:
  - No change
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 33 +++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index a9ff94b744f2..52a1af3eb954 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..a9ad997bd5ec 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,33 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +239,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writeable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e0ab14020513..480e4bef4bc8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4955,8 +4955,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6507,11 +6508,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..16493fbb3adb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7f12934725d1..f0bd518ddead 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2539,14 +2539,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


