Return-Path: <linuxppc-dev+bounces-16438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAENNn6NfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0AB9989
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2XrS4D61z3cJr;
	Fri, 30 Jan 2026 21:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770312;
	cv=pass; b=DI2vlO8V6rJrZ1ZLSgPxn1HNqf12JY8AfCxaXR2t9XuuK12DtVt9AcdKGgVIi0vY12bCNetgrZqE/Tcg+m37PVqC//E56GHuLnb2aVRkEi4htceeoTfqZjO/jdiViZVznHmEGaeZgqAOB3rGlfdIvVH4+A6WQEqf3bzeC0iRQ1m7/+G+s9i0Z1JYEuhRkThooKB+bboP265Q2qqavaPBdHJ0wmjuR/IyFQHvjbu63LJ+VogLmSk30kPLsJWxuh+Mm4Pcrsf6ObbLAHiX1UKeWN1MnN5kCBJaHdorA3T4BHEOTJd6qR8SstWb7Qya8EySotBiE2kDRh1fhlrK/k62Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770312; c=relaxed/relaxed;
	bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MRVDibLQlA4V7JtZRIY7MQ3SiCh48pOv85GR3/LJtQthdlls8/4NuWuR7eRhaZyF6pat0DSzSu50l1AuFbwBYp7yere0OQKM8MImxYeSBdo30arQAa1oC+kcUE6jZ7rX35vbxAeh4v+Hz7CN6gCBn/js+4jlxOCeT7eEUNzG13X/X1+iw2q3BeP/9AhGEspkkOByGGK45fnUaSRNsDQ3ZYD/8yxfKHzTj+yIgZeo0ts3+pADH5d2/+6miS/ow9i5ZBtbYf69jprLD90UcU4Gngol6JQ4ozqPmW6A4qU4MIo80ddFewQrgD7CbV3F6cropnm/i1UBHi+/QHHkpmJiZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QiGUnuiu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QiGUnuiu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2XrR6g1Gz3cH7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZulm34NQ1aJkhL6etuUiGoR9dyZ5BbxHsB/Bvrjoek7EJJHXpV0x0l+fQ5paFuL/AY0xwhUsAquwLDHWgdgrqIEbsYik7IGBiI61syH7SR50SUPSeQJYzc4cZMfUOjmSb5mRzYALxBKQAJNwRQqhxWHxflKvZuII+jCZG4UVn7bi9xbnO3nMDbxAlK3Bcw+duOQ5sxBL4+/AYB1U9LqlBfekn8cZjB+xQRSj0BjaZx4EtDCJUpfDbNOrwj7M0SITj1OsEE627DGk4b8CTatLGP1S9rCC/W3nTr14x86clBI+qGgWAkzM3/48BdvGFuf4ZrherkM9XUmRYuI6upmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=LuA3UFDwKC62b08b9GdP6nuXSTvGx+ojvmahKhfseMkPucw2I0r2wISFsANfhb2HvhfPpO9tfOVM0eJt0m3ibsUzg4+1TFD/698ymbXX2RC7+oGxEq46aewZ6ySMoTcz1zmJDmGpJJPGJ59ZBFLcksVq4eJCViIqo7+1UOmy44MioXpjQEM+28MIKgXiQHkayeM5TU/baemj8ZgGpOP8M8TYvdRyBuK96dj4SJxxzgC4hzB99nWUjURM6PGuZXaN2UI/42nRx9FEJzPcE83qdR5bOtCkRJOODLgKmmT4vZqUauHzOCtPD+jga5HoH+vzE2dh7wthkH95DizOkmrbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=QiGUnuiuCVTvasuaAQaVOSFitMOo/eCQyYizW5jEzi4HLskWoP0FVGF+fO8QhTCHHLXNl0N4u77fNu5TX0HSzuLCK+QPCoaeFXNb2tf5DzEybPbwBP9qGRcuNVZFJYMIWXZUqQZrV5k27qg88CIwgfl1OrWUUV1Mce3TmrmK8hev0t0B4SRFfXIeLxgh3iVOLfseu8s/bxQKGDeE4PS0m+qqeD0n4Uc9hJJ5ySnpRMyXJLlch81DuEfpI8ZLVvOLN1TiRF+F/HBKhlt2iirXvIcWk/UBTIURrEDcVHQfuyCBOPkXmBfalqZPf0aanDlWT0TBlUxn99TlprRjhf8FLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:37 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:37 +0000
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
Subject: [PATCH v4 10/13] mm: Add helpers to create device private entries from struct pages
Date: Fri, 30 Jan 2026 21:50:56 +1100
Message-Id: <20260130105059.51841-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3de19806-7f44-47e5-4b05-08de5fed8a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Crp0X3lrdSdIWZ1ZWHQ14rm8VFeMeshlCgiul2HCUjvvhMa5Ka5vi82BAmhw?=
 =?us-ascii?Q?wRqrZELDj91y9Jp7q/Pg4fp2OHqszO/4kmS9Rnxr+NLwkLvJ1y08vxF5XsIJ?=
 =?us-ascii?Q?6Q+DRLSSBR6tnHmE8LpqnVQU8AS4NE9kxAq5/vRYAmkbcJyLkgnYIODgC8gE?=
 =?us-ascii?Q?F6i/68xdR0KxYIxB1fgJce6Cyq1LSnEH9MLmn5+lsLcqvKg76BmbswlM5TSm?=
 =?us-ascii?Q?GwdNskOibh8zai9Q/iAqv0QdwGTQNFXXR5c81PvGxbrcn6CNf7MW0eqmej9W?=
 =?us-ascii?Q?hf1uwAEn+LXCwiY7Slqo0kDO6dEgUxATpUNItkLP/3DrirsqTk3h/vkRIl33?=
 =?us-ascii?Q?tzLhX4/CY1ufge0S5uM2f2HmPDpVEkXngeDT5CT+sIFD2LOtTCTUE0vatPRi?=
 =?us-ascii?Q?aELwwrp29O+YzgcYvzefk8x36VHgwP3E3juk4VDrXBUV6K6rMPzW3n/xUM6k?=
 =?us-ascii?Q?VQQ4TMNarvSc2heqw11z9lHIVT2o74eg0CNn2IEtMkiZFuLPkVnCpidf39c6?=
 =?us-ascii?Q?CGeVpM+taVjXOHjZqFLklsQsAOmYLTtsREQrfyYczQE42Vjj3I9aOcDkGwaI?=
 =?us-ascii?Q?b5CfVdv2SCyLCtA6ly8HzsSsxmdxtnKXEe10V8pJlh/OIvSqakstGd2Wm5/m?=
 =?us-ascii?Q?r5B/24FHmMh2wNJ2eu7w1QnsqOsWaHh/sEEn8aXw8J5g6FuCjvOOz35dT54z?=
 =?us-ascii?Q?Bg8nm2DWJB5gER03FrqNJp1NV9AoC0FXl6mGMvrm6iviBS/WFkeQh8qwGA49?=
 =?us-ascii?Q?ac4pQAVB3bdG1iY/gxYPE8hLBTQTOjFX19qbyW8ZB3aha1khmF9jkl/DeHZq?=
 =?us-ascii?Q?AmpkC1KJ9dX8gkJlOebsBvc+YWpevbOZbU35R+lCzsInmKM8Z2w9DkMPGPvC?=
 =?us-ascii?Q?YqfSAaV13T42m3DAPcKMbRW3v7E96ycN4g81vRklOHJubZ3i1mGKK9UvLnjt?=
 =?us-ascii?Q?zBOj62Sa9qR2pPMP3WeTZ/tvhLirHCkzP3jN41HiZ2nPi6qRyZ926tHcWEEC?=
 =?us-ascii?Q?ibYzxFrggo2ddHRXV35H0b+6sUknnUjiN+SzS/Sq5GFn2ih8Z3GyhKN8o8wQ?=
 =?us-ascii?Q?R+gK980ynt9uf1KkLiTw9gCzwt6Ng3m2xjFnxasGtvg9MB1siihXV9yh63ML?=
 =?us-ascii?Q?HdqkRhQrR0y5DQsWcHJzm10JTH334xMQFLbG7WNK420mvrclP6VO+wvVrwaE?=
 =?us-ascii?Q?KQqs9qCkEsUn9T2YVrSq+W0vxGB2KFiNxbeA0RTu6bRedVxIoMAa4vaWAKja?=
 =?us-ascii?Q?vewaUHP0463vDvqY7/vfoHy2kGFuUvSQ+b8Oj5MYmqXNAzey/nyDH1sFgMI5?=
 =?us-ascii?Q?A6SyAyKyKkgj5lq0TDR2QHtmmTCQFYh0p+e+I/g5hTHXODHN9D68vsN5SouO?=
 =?us-ascii?Q?GqSOwPtT+19t2/Xb46kt6/MSEO3ZFarAfJ4BPLEC6Whh5zr2CIL0iJspmAwC?=
 =?us-ascii?Q?BGoOKut4ObKQIoy0CJtBGUTcY/L9UCPQ0uBRQbEOY7HuT3Kfqtq+7rtUNBMS?=
 =?us-ascii?Q?D8RjeUjBmXvWNOwTPlm1pVBp5U3R1LbkMrUE87ZxtyOdXMjxL9hknKYwZKTY?=
 =?us-ascii?Q?0612abFWu9lO1bqV3zw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qDehiIMLDLZex/bC0KOj11LxauN2URvanLXx5zx+eJsBlzIO/jXDG5lEK1Lm?=
 =?us-ascii?Q?xpsj+aQJijqAN3zjG/AsFwm6pnh2tH/ozXwrQf52T/kuN/0K69y6tAGIO9um?=
 =?us-ascii?Q?clOJUn++Wbl8HDMyZYIR7O1MiLPg1WzQuPQwgy5XKjUixe7M1ssqJ4Uh9nJ1?=
 =?us-ascii?Q?jSW/s8SPqq5SCRkVfbFvGBpSR088mwGCcG2wCscL7EuWT9LSbhE02bBGlZsT?=
 =?us-ascii?Q?zfTAmnjjbUzLwuNmMxlJRHGBONKo0rKuDZyfwyP61v8wQ6BPsinM0FzhToLc?=
 =?us-ascii?Q?tUP1YuQ5vgeFXqATHRZFCyLrg4/RERjhiWJVzv7QgOxdPj4tJ1Uc4/Q8VCqh?=
 =?us-ascii?Q?IJlsyDIwDQ95sshUaM8SToqVQvIODqIi55amnQ9hqbRZWJeF7QJwKxnqfN+9?=
 =?us-ascii?Q?uPgcl00QkNL0J0phOfSN7A1BfSE5F7uOnfOwJAO6dC3ahnEnGEwtSoIOEZ8L?=
 =?us-ascii?Q?Q57F9oc8zNf4q0RMvtKs6lc9gyb+t1dmgLerHx3zNcxdZKteArUBu/NQwjqf?=
 =?us-ascii?Q?CcNhqZD0GfI92w3nmpnnIN9j6zYZI4qR1S5e+2KNL7KLuGIxFgwh98rCdszk?=
 =?us-ascii?Q?hGu/K0JdqmnjV9HtTICqi1bdiN5ZjeMT/v2uCPTkCXccYvBE+OHPYGc/Wsrc?=
 =?us-ascii?Q?TISt8KkbY2kftHApHza6GiAg49JEukEv3ZCfP73YG/0yi4wpwlcsrb1vyLrb?=
 =?us-ascii?Q?IcEznq9iNPkgZGrYhjiuO0Eyhe60K+ca/mY9RBbOT2XjrtPP4HSzt3Ib2/nO?=
 =?us-ascii?Q?mTdwsPHZc3bHpBMTGHg9ga8dgPznKNhnnA/y22qJiXXg7eyHIxH8dy6L3KXw?=
 =?us-ascii?Q?w1zYKB6gOsZ/3LuMFK5oPqMCLfOom3ADBFd9CYK6uMOdEq884/eLzL9QBx5p?=
 =?us-ascii?Q?ECJCR8g8Oy4VoaRmmHUxTZodZnBmXMWdaZF2LoECDtkv2wxYu8cH/8QWNiwH?=
 =?us-ascii?Q?IfP53LTkgVTe4I2dOU5LoVP/OFnzxP5lVbKWLV4h/G+tbG0Z8T2hGR+ON+Fi?=
 =?us-ascii?Q?u45l87A5XPioYhheQAGKRaex4MvvXG8LXvJMYJexo0dbzWdbPlFFd9qCJCpM?=
 =?us-ascii?Q?qLaluIsvlme1I8tPLCsoU1/3UQZWadkUCCiyutcbbX2kB9zj5PJU7HGIU5zu?=
 =?us-ascii?Q?zUyKTXvUi9nNXD9drW550QPhjTbKlYqF2ZVoDR1TnPWGEa3+EvNcGWRZ4I+4?=
 =?us-ascii?Q?10jhXMHMhulxcWtMzBkwKj3qtFTyBIUubQEmxh30Yp+lk8cC11UQcOVOrOFa?=
 =?us-ascii?Q?afUGMv3XSNGNyv7aCC/RbIauTOI4yi657x7DsMmztFqCFhtxco+tn4uBMvCL?=
 =?us-ascii?Q?pxWEciDzX7TihPaMQQxYTlkksda3dJ3xBYT1R2N2iY0rOZqJZbA47V35DI8G?=
 =?us-ascii?Q?3cfoADv+KWeRHHV4jZzBmZYOI5TgwNWB+vtiqj80TEchq+9EqWThB0i6vF58?=
 =?us-ascii?Q?rHpPwwmHTY1dZiEBu3YBsPiETSGajngZcBN6F5NFW9vsWfneKE9+RpTSlKh7?=
 =?us-ascii?Q?2w5vXIHC8lls/CxybRIjsfAH/4CdXrl7XRqJO7CTV7ItN1FWySWWPWEOMj1P?=
 =?us-ascii?Q?nY+5LTaN/UqDwFh15XqYHbb5T94RD9MYz5CLnVz6OoJgztax2W6mr7ivhy7B?=
 =?us-ascii?Q?H0C0sjTyLv3Vpydu8t9mE5SXy4mmoDoQzrsln5+5TYFC5v2+ehvx062eB6uC?=
 =?us-ascii?Q?vJoHEH3AQYFJFTsp6h3sVLoRpChP5w105yx/0O3ah1lIbLIhf9CTN6KloySK?=
 =?us-ascii?Q?umlUwIZksw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de19806-7f44-47e5-4b05-08de5fed8a77
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:37.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj1I2u7ZMqDYCVwzcU/fadN0Bic5WbvX8FWrDNqiJoeW2j+qcVAG3xd11dlNdCBTCfFsqHXNGUcgEdfVO/jN/w==
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16438-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 01B0AB9989
X-Rspamd-Action: no action

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flag param
v3:
  - No change
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8b39983792ea..080e27da6b47 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -169,11 +181,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 4688b9e38cd2..24e3ebbab1e1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1


