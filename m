Return-Path: <linuxppc-dev+bounces-9495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAEADF61E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 20:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMt1J5jSXz30Vn;
	Thu, 19 Jun 2025 04:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750272228;
	cv=pass; b=VO9J8DdL9phD+BwesEyeBWyH5dBPik1BopB6Jxqi8GtUe+Nlg84+IimOIvokHY9ezXj22DqU9DkCf9TILzVfEJbcQMcww8i1JUuGCPk2XFRMtdCZ2nN7qapqyTYU6c9DTegBUdMv/aOFTN28Cb4p95QzPE6EFIzD4dKzSD6x3yBfDM3p7n/cX5GPdnNJvkPimo7XBUPKX2kKsNRZeMO33rx6eb/c0g0/CEAd/nd2lQiLfxg9Rb8PGNsaTjgDczsiQbljWJoVBRl29yZrFWdpzOkzfHfaItBSLjbjWj+CDuRG0bikaOMKM9HxrbtqRR9RVi4sLh0GZKBgVszAaK8aWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750272228; c=relaxed/relaxed;
	bh=5RXplM8E6CaIkOYBv3T5WetiDuYPIEPBaf2T+Kxe0nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CSGXfwxtIuqUrMjfkJkfvQOWn78CFWUkBbdHSahizRJJCX7vlINXyXIhokI88XbRWPZPtuoQ0qElIAUO2pD3mzHpVlXtJyUBcjlc73/sHnlXcEL93mUoU+I2QUWoH3BOA0skbusGq+pMJkH+0SQRyPckTOH9xbPY9khb/qhkgTLMtDfyuVX43bq/Ut+DG93nCHA5Jmwxe/+ch4mt/5W3KiaLfYA9pncf/0MlfYsQRUOnROAlal0mpJ+RGgdUWXCgvFnNiWPZwd3pTEglSv63zuI8GfvWGBx82Juke6IeJxkuNzMub4sC95Sb8bvwCwOfPjdesEYjNAh9yb4ZdK11VA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oiTIveNR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oiTIveNR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMt1H75TNz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:43:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYRkyXTMsYFBEFu8yQlCiu5835LwpfDr0rSz10WyMQwEjqOfipjIrFjJZF7g4ixwtllOtshFwJ+dUX4OW8oeK+Jp85ltCRFYJtMMHUX+dYK5+3dbIbDVoAsP7bgtmkQiuXtgVm9Rjmgds7I0ru8pykJOdKQoAOnWTV7SkbXmlIAOpkdnJ1Rn+0q7X53RJNHZkgTO/dVyd8bUGci7gnhqC1E00zr28sgkW9Ff81EZHHVRIEItMbvGaNh1qE21lTOOx99zE4D616mm7sWp1OX+8PEbNFSE+h6GI3c/pZDdaydhzWOEGbzwioUarwC02Ee4y4gxOFvoUtEyhQAuvA6uKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RXplM8E6CaIkOYBv3T5WetiDuYPIEPBaf2T+Kxe0nw=;
 b=HeMHcqDuXmkrxU6dCNwBG1Fsi0jVc2tKtvsIMBMKMKAniwawQC4mgL00ygJC2/GXnfZk0WItSJUWp6kKcL73VyGQKh4PctMcntEmE/o0cVzmy/PI6KH9QVK/iUYurkKcnHMBOc9dZaukIchmEnH7Rtd2Hd+N9ioyzh9T/VFD5JbNYOseEwqA9+mL6LT+KDhW2ms+mBwLzc2Gmc260b4QZpH+JKdcprUcOG3iQqHuIDDr59qSJx8wlLrS5mQwUezeXQUEpvYT9ACl+c/07xIItngrXhQLY27OX/Iegy2MRUTBRUnrCRgxoouku9JPbx+f8Sjolph3HV5AWo8nCr3oBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RXplM8E6CaIkOYBv3T5WetiDuYPIEPBaf2T+Kxe0nw=;
 b=oiTIveNRoQaPmBLxSeTSZZGnIYdR2XNDdXYbi3Yi9jz1LdJyvmx80FhNprfwrtNSr9iOzPu38xforTb393BHcb7zivr37pDwGV0W1bZR3pS+7XpaEpoORvKCWRlb3vfD/Kyy3W3YU5gDEFcKHPtXELYnqxzelZW3oZNI5phnc+3mQ9qHJowPaUZ3fplOOsuEwBBEGWKQYl+m0F1MvDLBdKgoI8xSHHtcfZun1XUhcvCw8jK14qSF1o1lz1oc+xiTZrHG8k+jT2ciuqgJo2xsHxruC0xvPDkSQfMXRiMtdAUxQV3bSaILZff4KJAw+5OLeNRc4qkwwRoWVMGk1Wyiyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Wed, 18 Jun 2025 18:43:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:43:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 04/29] mm/page_alloc: allow for making page types
 sticky until freed
Date: Wed, 18 Jun 2025 14:43:22 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <6E57AE2C-7754-4269-B16A-A39D168C5285@nvidia.com>
In-Reply-To: <20250618174014.1168640-5-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-5-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0890.namprd03.prod.outlook.com
 (2603:10b6:408:13c::25) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: 949b0367-c703-4086-eea2-08ddae980328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lmkR0aNc2DBgsm980yRwauSKUeRWdEa++yL2+8hLWx92H90HUJ1EHsz9ip15?=
 =?us-ascii?Q?4ym/QdJjP1vu2AaEnsocyOUzgGkG93km5WY1ntDgnv8yRzB22OoZaY8q3eWm?=
 =?us-ascii?Q?UpnDEJSsjb8bBMdCmQbdveyP4YgXHdo96ZOm/frQ135y4BGTvpyo2vkF8Ik0?=
 =?us-ascii?Q?CVD+NMtILFnPQmgfnKAzdBwBW2UgdCD00QhfIadWLyqWLvjJWRhRO072veIS?=
 =?us-ascii?Q?pfAQ4y7aGzrFsuPECUH5UXR68MwXNLNNg5LaZbOWGwYbfNQDiTzb2sI4qoia?=
 =?us-ascii?Q?R1dPJybm9IRrymseF4wGYaTn1z+vRiRpVNMfXrc04Lf9gJaT50Eo4woupCvp?=
 =?us-ascii?Q?RKOF6N518nx9vQ42PaJ6Cv1R/m4P4Z4VKHKH6B5FClpdzqKA8gxJWKPXPnPm?=
 =?us-ascii?Q?QPKhLvZh6OSPcyOC6NnmeR8mHw9AwzHWQnsInPZ6aDoUQ4vxAip4qk1W5WC0?=
 =?us-ascii?Q?P2CLLSWJnd9eMUQOl9jbPdsK0ldEt5x5zRcc2P5wxoG7w2mxtS40nj+9bNQw?=
 =?us-ascii?Q?/uKE0xZ6lWq+tG3EoGNv8m9eW9LQYks9J1a9z0Yv4leKmsdPDk7Pk440Bi+p?=
 =?us-ascii?Q?v4s+IK64MMQMiILW8SRnjT8/2EAMeP6x9xhZajGCPHeuMfiWPekWlT7CKOWs?=
 =?us-ascii?Q?1+h4geLC0sc8Ecb1aF88X0l9aKn7m9tPdttOu5vdzuAAXWpj7ULUyBmAxXqs?=
 =?us-ascii?Q?NEeALdHHPObXJzJbqydSWhRARUQGAskVAeb3bJmjqJ2Zba7TS+AoHvlmC2JN?=
 =?us-ascii?Q?m94NGkuCG+e3N5S630I3bWUrWXrNAjmwOGSsHqnqM5/CNtrNmaQA+19FL204?=
 =?us-ascii?Q?pEasburxrINrO6cQQbc+4eFZeMhOmc+gYrA7WRwZKNGBPvjJ0OUVZEMhwyvE?=
 =?us-ascii?Q?/+iLpnpTPGScKYhZv74JcKP1dJKbnVaF8aZ6Xgkp9eQBLRWnCsEcEJ9OUcvD?=
 =?us-ascii?Q?e1/pln1yxylj91aBdYq5nWaaOpkwu8zBkZpi82iBeb7pUTQyd86Uu5ZY+7h3?=
 =?us-ascii?Q?LGWAlIVsRweS11sds5kSmuedTrKxJeaC4PbNjsc63gASyzGBKS6OS5hwQneK?=
 =?us-ascii?Q?5RMl17hv/5aMqsFQ01d4e/LpnwQ+B6P4e6VgvGXYatOK4ZPWUqS4BuyyRdAe?=
 =?us-ascii?Q?uN2e/nui3JrIifE65RNITBqJMPbloI4xvV1ox64chZnA05ztMOjyFVvQdWwz?=
 =?us-ascii?Q?jQG2aGXNsVPB56vxPaJhiiTu/qhnxQn0Hx5Au9IaArANmh+HycXNSF4x4dfZ?=
 =?us-ascii?Q?Gqy3f/9yx5z/9e54FDckH5Uf35mCEM5XOnMLKgxq7Y2AC2se96NPdnyasEEa?=
 =?us-ascii?Q?/7WCWp2oJGL5CGApsP0iqhJ9iKYKOnfFRWbIndm6IDynHY4SQLPExHigF6HK?=
 =?us-ascii?Q?hGFCrA3vBnLSzmwRoCZudxImrRWWy+YT37dBiBYeeZVN14QMdnbT1V+PPVjj?=
 =?us-ascii?Q?klJI1efd4/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1SM1wTklyZUaCn04T9CQLDsIi1MgDjw+m5uzzUFyH3XclRcUYBNecwZHLRJe?=
 =?us-ascii?Q?z7JtqLp6myfVkNTIVtttbaRYMvWQbzJ+Iff3q71Snl5A9r9nEjhFa39oY7iV?=
 =?us-ascii?Q?vng3sSp3KZgpBWdVBC3UmpMQqV8GQIarunaPVeRki+S6hZdr8Ld5c9Pu0ro5?=
 =?us-ascii?Q?p+dpHKKY1go4vwop9zmQUW74Or+Jmo+h1hO+ZhfS/NS45O2crgsZBkmYnaFz?=
 =?us-ascii?Q?Jln4b2J8UHWzJsRSTbxVDsd+dPVsHpvXYXCnRXGYcBYqX6OyUaGjJiAlOQWH?=
 =?us-ascii?Q?m3kl842kUECMx+JnygNvVK2MosOCCmNEtTwZTTwU8WYwJnJlLR6YVYGIxYdQ?=
 =?us-ascii?Q?EwQM7Ej6tspTQnufcLC4Dx5V6dzbtMV0NdqgAdLaoZq+2yjSvhoF8IRcrS3O?=
 =?us-ascii?Q?9l+5MZ2IPkNVoKdIoHE/cg4nXaQn0Z9PVtwsexw3aTjsnNFvr3TurOLxaq3g?=
 =?us-ascii?Q?1W65QeRMu0OGv3Kd1UO4FDLP00N8xHy+h9KPYiaiQVSZ46gh7UlRSYBWOEts?=
 =?us-ascii?Q?rP+PZ/7GFiGTeKsWGNqVvLA0xU3fyfzic/svD+6eiXZ1DRUHxdj58ZX+sLIm?=
 =?us-ascii?Q?DhneTFWJHBCuzw5hQbokEwOjX5rpz0YmnIRhQ4mamylchtW9Sm5vzf0Nod1o?=
 =?us-ascii?Q?PNz488c8ZzSj7tMIhClUfeQ/Yazqs/iYwYBiqVQsuR3grd7b9ZDfSGMRv5fg?=
 =?us-ascii?Q?Ik0j0hCCkZb/kVLs4GR/JY1zYAFdPBp7amp91Wzd+fJOzeXNWYHQeJ+5wXm5?=
 =?us-ascii?Q?twZcBRVKDePnFdsVtdD9KT9bP2vtl8lsPxxHuiPv7Ah3UONJFBeoMYxNIfLK?=
 =?us-ascii?Q?Jm9z4fULSicE+dOXAk/bXM1hkHSoQBA4Ms5LKpJU/b4/ELRtnqHH50zwXeng?=
 =?us-ascii?Q?CSgejtkQeCd/spFkocg2DjGVCIl5sBDpFqBHCKTbIQjetJBSVGw7U57S571v?=
 =?us-ascii?Q?ufdjWmCK+FTTorgEuaRjaayhZPcUED8nXERcZGwymaLPnf5PtUViswGmZmWI?=
 =?us-ascii?Q?38iERZ0qZ/xF0tzUVIZsQTEMEcAxGvtraqTtxfuv/8yPCnEdOdYTQHX+7L6B?=
 =?us-ascii?Q?kOORdw6+EQ10twFQUBhOWGuMh3mh9LMeWAL4WsNhjHo8zJ2DGWEuE/9V96RF?=
 =?us-ascii?Q?FwDhvpSn0yGST6fseH+hm+0Hf6Q/DnRKXViz+PcRS0zq4Fk9ncHVAXg4ABr9?=
 =?us-ascii?Q?ua8juBp12uVJEnKuXGna2Xs2faQTvX0cnWBWhu9QvRSOUaBHFDGp5xMyILTi?=
 =?us-ascii?Q?ynsM8qC00U2SurUsF2y9Tk87HjTDvgMHLCZXC6y3NDe1Q+Q5nJAmvgF++Vul?=
 =?us-ascii?Q?n8doidnCUC1ZPswvpKpeGdmqcD7RQYq5FkoDcuAUxUJuM0D/du6tIfV707tR?=
 =?us-ascii?Q?fICLHUHgZgPC3ipxlhPXpdmlu3FejIvlTg4vntT/NcNotUJVGKnHttqaS0yQ?=
 =?us-ascii?Q?9PNOP4ZPWFN0kqdHkD1A26pUVUQfmrb8HS2iAylyQ/pg2h46IyXqCKJhy/cx?=
 =?us-ascii?Q?NZRfTHzBzlWzuPPJ+asFlXwJZlD8qzjd3Uzq2mzozPS4Wda5VJU41jsLlLeQ?=
 =?us-ascii?Q?ahTG4IXW+hl8NcvZHn0ITj8eO74nfYBZs5Yc8u3t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949b0367-c703-4086-eea2-08ddae980328
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:43:27.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y6ze0PH3z9Ze3nAZkkcPBR1ho2dUH1Ndvpt9t05sGhMrUGrHOrEKkIuYQZMbAf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> Let's allow for not clearing a page type before freeing a page to the
> buddy.
>
> We'll focus on having a type set on the first page of a larger
> allocation only.
>
> With this change, we can reliably identify typed folios even though
> they might be in the process of getting freed, which will come in handy
> in migration code (at least in the transition phase).
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_alloc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 858bc17653af9..44e56d31cfeb1 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
>  			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
>  		page->mapping = NULL;
>  	}
> +	if (unlikely(page_has_type(page)))
> +		page->page_type = UINT_MAX;
> +
>  	if (is_check_pages_enabled()) {
>  		if (free_page_is_bad(page))
>  			bad++;

Should we be pedantic to only do this for PageOffline and PageZsmalloc
and warn for the rest page types?

Something like:

if (unlikely(page_has_type(page))) {
	if (PageOffline(page) || PageZsmalloc(page))
		page->page_type = UINT_MAX;
	else
		VM_WARN_ONCE_PAGE(1, page);
}

Best Regards,
Yan, Zi

