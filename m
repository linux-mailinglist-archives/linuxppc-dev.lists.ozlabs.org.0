Return-Path: <linuxppc-dev+bounces-16181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLdIB93lcmlzrAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 04:07:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D86FE86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 04:07:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy2sM2wjXz2xJ5;
	Fri, 23 Jan 2026 14:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769137623;
	cv=pass; b=ZCwECD/s8aOo4BUnNLsmeoNy10A7WrCm7d2miiAA0i3NJDhvod/+Twx6E0e8zx3L4rJu4plz59HLniA3sBZbFs8ck8q/9j2G3zTlHAOB4QGCPiZeDXtZc6MpO+ziP8V5XAjeu/Gklpu0MEert2v+1qxKIQ3YitvpeV/kmS6WugicHpBN7WSTx9MJcHJNt3b/42ffrmcjuaMJkE2k1z0YwjtLOxDWNCwo9i3WhcWDHn3fHFGt+xTzGMYzkJvg2+NXp5sJOw7ELZho/Jwj/rhdicWbE2xSeg450QVTYDzKGVyqyfpEjnfuTZ8C76HpJvfrOID49aagXLJE6CopQ9AVPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769137623; c=relaxed/relaxed;
	bh=u37pWPu+kSFA1irq3bmen8j8dy5zytLm5Z0/V7vHRhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bh8Dq9dqD1JPFBXb5DDAL2SmV5y2AvcQ91NJkBVQW+mRd3OSH3GILCHg/Xz+amaipZfjAlbu7oaNEuwEJkTaf5pIFpXDseLBOdglLMY0ipAs8OxsqmyAjF9En2unuZyI1aqr7ftj/t5KL8CVSaknYyoGWu06Cyv1oquqSp9BmKbYRmhYJKq65yzt/RKkInO/0L267eeq/au0KZweVZuQsCx4h2PsZfkcU41DbZaWrWzfN/Yi4u5oZAU7VFvmqMup+czm2O5khII0p3hu07b2SdSG1AITb4I1un1yeGo8B7QH4n9DEnGCvTOzqE1EcNZ/M9dhqt5w4LeKg7P31Acsmw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hHULNQmn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hHULNQmn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy2sK63Rhz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 14:07:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK9dIg0K/4pyczmpXPfBdHKsCfuZzCl/yFnSJr7V0mfXqhd563HgqnpPCND2U/Jkv3Vs4AeI/gBsM7obx6G9LSMyo8UyMhSXXJluK4abkWj2NBccm2vU1n5tR1iS+3BRKQiXY+2AJWYG+WMIlJKKYqkyyVEAWfRkSzX+glLKUN02CEq5Spbo6Gb3q0/nlG9xHi11PtHcBCqnr78uc8Sad7Acj/5ZMdLv7qcPmvzUlmIdDk+RKbiU/0g0enc/Byathp5KSVSWl+THysUdI+cF/WwK7qfox5m/kFU9W6i6mNDdcxbKwefc2KAgem6yRVaFJJxgLQKS23MGGjrok+awvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u37pWPu+kSFA1irq3bmen8j8dy5zytLm5Z0/V7vHRhc=;
 b=U6d1tix3BSdTzGILiwJq4DXJZ8HTp1qYJB2kOZ/Bm3wBWAoOxAdUuUWyedE4rOkwuP/1tW60iH0+YKVVHczeE2LX0PptIwLis8ylzXvVJLkZcY8BFd0dSNS2pOL9XBIvg2vz8CJyKDOkzYBEtOfwXiiX+JkBFsynJEkPGQ8Wdz1QpsZyT9Ap8DPTlpInWLpi2QxoF6ybYUYdcqvXrtk9jqshwYs8Bi4oQVPzO6CbmrVKA3+AlagFsylK+l3Kc1kzqzb6x874g873chZCnHG/MdtqecrIOmMIwiRS6HGIYFOZkh+NlV4ebPA0yYfX5L5gg7JloSOMB0RSLo65gZCPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u37pWPu+kSFA1irq3bmen8j8dy5zytLm5Z0/V7vHRhc=;
 b=hHULNQmnttht/L8HARioIkj56axihUSg24bvqCxCDywnjIqPwRgetjte/+k7Si97NzBVNwPSgHXLxc87ebmLP3yxa2YIbSuaV/7ligSQhAZjyOmBzpkYxnjwOf2yRZSNCRweXapb5565YJFAmp6rMeZDtHsZJORwnDbd513JKgbk19P+ahV8TqPOkHl8LT5JhclE7ZjZa9YZXJZ1LCBFgTINIELhU862Z1FqXX0KHBz9YLOOVjBknk8mWtg9XnLzpUThwaiKDTsvxVa2A0E2e8HdYqhfhL2IcfPn2Mz4LYJhKBzpC8fGXh9JnxLAsIJnzEfyqtG5880e4QlQJ+Pyuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 03:06:35 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 03:06:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org,
 balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Date: Thu, 22 Jan 2026 22:06:28 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <DBBD65CA-A8F2-40AC-AFA0-FC95CBDB3DF5@nvidia.com>
In-Reply-To: <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: c5693040-f08a-42ac-309a-08de5a2c6aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czR0bEVBdmI3c3dlQjExMkF3VllNdGdPMFJhdldLeXBjU29vamxJZkVOaG9a?=
 =?utf-8?B?bTRjbzY0cFNXbTA0UU8ycjg4R3lLNFdnV0tYdm00Y2JTS1gwdkVKU3JTNHNh?=
 =?utf-8?B?TmJMUHl1ckphNUJkSGRWOXFBZi9vOXhHQUMyTWZmUHkrRHZ0WEp4b2VaZGtS?=
 =?utf-8?B?a0JqTG5QNVdQSXNiUklXMDFqV0FwMWdGTVBlK0lISlR3U0hJUTZSSFpkbEFO?=
 =?utf-8?B?N055MmV0R2VNN0xqSmhIOE02eGhPZ1J4NjFZNy9qZ0xENSt1VFU3dE1JdSsr?=
 =?utf-8?B?NXZMa01xeXN5RXlFeThPMGo4QUZlZjJHUlN5NmpEL3ltNnRvZVVaWWlXclJ5?=
 =?utf-8?B?alRMMnd4R3pCTCs4MXhyQ1BvMERhazZWRFRyQzFDM21EWktCS3JHM3czTnFu?=
 =?utf-8?B?MEdMRkJoUThzb0JYdnhWejZJRFA2SmRnMFppUTFMVk8zUFN2M0JJYUp5NnJm?=
 =?utf-8?B?WDlIbUF5SHljN3dwc29iRVJzUjRGQXU5SjdiNXVFZi8ra3RxS3FKOGphV2Mr?=
 =?utf-8?B?MnQrWEJWeEMxdk1Ba3dpNWlLcUVrbWMvTWhGYlBCTjAraFM4dlFkZmtPd0Iw?=
 =?utf-8?B?cUdVcWM5UTBHQ1NrNDN2ZDhxU25rY3RQckhBNjhUOWlaeC9UUE92bkNFcmY4?=
 =?utf-8?B?VGtYektueHlKMk9FVTVxZkcxM2pBWmIySU9abTlIemptdDZ0RTFOWVB3TTlp?=
 =?utf-8?B?VDFYL1phNmRBNytrUU1RclErcDBnMExveER6QURNWXhPVzJlMWJZNlNZeFJG?=
 =?utf-8?B?WDJsWXlNZmhuWHVseWNaSHNGcVpLbWQ4d1ZmMGFyMlZrbUJsOE1TTUNJVlJS?=
 =?utf-8?B?VjErRG1od3REck8xRXJrZjhtOGcwUzN0eUdtTTJjVndobUhoTHRJdnpUS1Uw?=
 =?utf-8?B?Q0VjY0dPRmNnZWtnR3c0RDhGN1MxMC9XYXBLa1dEN2c3SUV5VFMyK3kvb2tT?=
 =?utf-8?B?WlNhenRYSFJxSm9oK0VwemxnTXhNRzBCTkI1RVVzSmVXUnVFZXJ2QjNteU5H?=
 =?utf-8?B?ZEcxSS9BcDQ1M2JVclFzU0lzb1hVVERHcnhzcHhBRHVGOCtXNFdoWXVOVEJ5?=
 =?utf-8?B?QnRsMC9xK3lMbVhpd0JObSswUnQ1S1ZSK0QvQnN5cXNEUjJtcm1zTjJvTmhk?=
 =?utf-8?B?YnRNUWVNYmdsYzdDa05ncjZEc1NkRmNnb0JWVmtwMEwwbzJIcGNaVnhscEcz?=
 =?utf-8?B?WHRUdjZiaVh2djlnUnBINmlWMGthTGNSTVYya2VRbllGQ0JmV3UwVjRQYTZG?=
 =?utf-8?B?MktNM1NETGp1Y3FjMk5CUFo3M3I2bk0wdFF0VXJZc21USVh2TWt5K0JQdC94?=
 =?utf-8?B?WTRNOXNkZjgraW1mSEF2b3hmMkhmWWl1b24wU29wejdXVXZyR05qYThFUit2?=
 =?utf-8?B?c1VvRVJrTmlYZnFRVHFZYWxRN0RQK0Yzcml0ZFRja2xDblk4eVE0Zi9KcjJ6?=
 =?utf-8?B?aSsvQlJPNmI1ejh3azVXa3kyRTlwYkY3WG5xUDY3QTlaOUhIWVNHV29RcERP?=
 =?utf-8?B?cHkwV0VVeDY0RDIyV0REcXk3RzBoYnIwdTlRYmN0dE5PakYzOERvVHhaVXFG?=
 =?utf-8?B?WVVBZnRxY2pGTEJsRVcveHQrU1lQcjRxOGw5OFVpRm1EQkZ3N3BuOUNkZmlk?=
 =?utf-8?B?cXFCc2t3SUk4aVFnZlVHb3pIVW5sWkNqVUVDWFFYemtqMHVSZzNCSko0bEpY?=
 =?utf-8?B?QVl6dHBTcU8xS2FLUHJEZ3pCRXEzK3daK0wrbHFXN2RCYVFNVzM5b3RZOXlx?=
 =?utf-8?B?TER5N3YxN1lRaTFCdncwems4ZVdKZ0J3Z010TnRUV2U0WE41ajBIc0wydTlT?=
 =?utf-8?B?ME9NWUlaZzdOTDlpVXVGNE5yL0ljb3lTSkF6b29GMi9id2NYaDdkK3JPbDVE?=
 =?utf-8?B?TUcwQU5iSnMyOW1zVm0rYWVRNnZ3cmpZZncxRUFjb0gwNDB1T2lBTWhWOTZ2?=
 =?utf-8?B?TWxWUTErN3NZY0RqWEdyTmNRYXdRK0JqeUtrdkpBWjJoTHF5UlBXYmMyUlo1?=
 =?utf-8?B?cUNqK0ZpVUtibXpCbnVJWXJUZm16V0pSZE02dHB2QU1IS2JXWk5WRVIrMHpI?=
 =?utf-8?B?cEFCVzBac2hBRW54RGZ3MlRQNzFDWnFSZVVvUkhBMmtLRmUyZ3NUam51czFD?=
 =?utf-8?Q?5X1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXNqc3FqanJBOUI5eFAyMExXSDJjbVQ4WTJOYnkzQzYxbWZuRVpBVlhaMGNN?=
 =?utf-8?B?UWhxbVhLSmhFMzQ3THR1aVhzV0R5VTNkY1RCWTFVV1MyTVBzWHVLdEJGZzFP?=
 =?utf-8?B?WkJPaTF5SnBRTVpMNFdiSkE0U3Q3MjBDWlRDZzA4TDkra0dSc3VlbmNEUWNZ?=
 =?utf-8?B?V3g2UTZUUmhNNHEva0dCUjErd0JZSXdtdW9oVHNHdWlIeHhMVFZaU3pjV0Zp?=
 =?utf-8?B?U1BKTzl5a2lPM2preXlHNExUYm9iVHRjUVVOV05JUUZISm9NODMxNm1BZGt1?=
 =?utf-8?B?eDc2YmhzTHFXYmUrWmh4YUx4L25JMmNHQlVVeFVNS3lBSHNjN09tNnoxYW5J?=
 =?utf-8?B?ZEFsSklJbjFnS3NYeGJWUGNGVi9nOGhGa2QyYnJaajdPWU9CRHZOUnhSZE00?=
 =?utf-8?B?bHJrWDE5SXhhWEMyQmJWYWdnRzgrc3U3YmJzRStYNml1T1NNWm9OVG96dkto?=
 =?utf-8?B?dEVVTE9yek4zM3hSLzA2S1hkRXEySFJPR25OWnNnZG5xS2ZsTmU5WlVNOWF4?=
 =?utf-8?B?MVRZMzJHZlJySnRteW9FSGJOeXk3aGpPVG9rbkllaGxaOUZlNFR2VSsxU2VE?=
 =?utf-8?B?TWtyU0Qxdm9LQ0VSbXBCaE0rMEtreDRoSHpEK1Z5OCtOdUpFRzhZdlFxVjc4?=
 =?utf-8?B?ZGN5MlorNlNoSFlNdnZIR2p1eE4wUDdHRnpnUENCcnh5Smdaa1hPSnZKVXpC?=
 =?utf-8?B?MndETkZIRE02R0djNUFVMzNqZUJKRTFPbEtZd281bHlJdEJsd0RlaTRweklU?=
 =?utf-8?B?dFhVeG04YjBvaG5tRGlPRDJMeFgzY2I2bVJSRjlzZ0pRWjI5Y0wyRlppZllz?=
 =?utf-8?B?OWRVOUdJREluaW8yTG9INzMyRFh1VE5wamRQaGtCTW9BcnJibisrdWRxeHlE?=
 =?utf-8?B?NzF5eG5rc3djNEVqcTU4ZkxrZXorZmV0bWxManNnbUlPdXFaN3I0UzhzbU0w?=
 =?utf-8?B?ZDhMaHp3KzkrUVN2MGJjOGJUR0MxdEFjcldMV0xPVlYrT3QxWmZ0MVNxRG5i?=
 =?utf-8?B?WURTVmwzd1F5YmpKbUthOWdlYXM3SXBydEJpRW5IWjJPL1lkdFJ3TjNCNnNi?=
 =?utf-8?B?YlFRU0ZOKzhYNDl3ZUtMUTJjRjNITHRjRnlXaVNuOXpvNVBORnpUK2pZQlpZ?=
 =?utf-8?B?WTloL1hETDJKQ1dSQlVHb3A4MFgyNmcwTnl6TEsxNE0zQ2pxcTNoKzB3N2dr?=
 =?utf-8?B?NE82VnpBcDZ4V2NrTkoyVjliUWl6NjBhRGZ1NnN2UXk4cWZ2SFRsMUUwQzBh?=
 =?utf-8?B?ZFVNa05aWDB5aWtaMXFqREdTanZUelp5TW4rM0hjQ29BZllvL0o1dWpZWXo1?=
 =?utf-8?B?M2dkOWpSZUVVQi9hT1NUcGlnangvY0piSUVpTlJmNjdBRmIzTTc3YzlhUDNH?=
 =?utf-8?B?M25YOEVzZ29IRmd0TWR6Qm52b2FhRkQrRGtSaE5QK05kOTB0cCtNWVo4cHh2?=
 =?utf-8?B?aGZxMlRIcHNjZS90QmJrTHNVUDd5OU51Ykh6dHkzMjNXTWY0Q0s4T1gzM1RY?=
 =?utf-8?B?M3o2SzNwNzdBZzF5SHFyRmJLWWFNVFkrQXB2ZmZZOTZKa2tJN3hoRjZwcHM4?=
 =?utf-8?B?bm1WOFJpZ01iQmhzVExjZTVFK2JaRURFVWI5aUhEVlBYYThka2hROXVKeUd3?=
 =?utf-8?B?WEFHNFlkb2diSXZmZmRQbEJJMjd2MEVPWi8ybVBiZjBmdlp1bTgydnNPUUhS?=
 =?utf-8?B?enpNNkVIRHgwWVRqZDNoZHFXVzNRUkc3OWNYeXM2Z2ZmSHB0WGdEcmNBRGt6?=
 =?utf-8?B?VE1oejZIeEZudzMyK0dhMEkyNEQ1UVF2cjNXWXQ1S1QrUzlWT3c5QUl2NnpU?=
 =?utf-8?B?YVd6Z3NUWERwQ0hhOWpQQktwR3o3WVh2OFpzeDBiL1hXcktNb3JVQ2NmQWtZ?=
 =?utf-8?B?R2RwVi9FK0tEaWhIL3A5ZU5GQmhtUERnL3djN28xREgwR1lZQldRZmxWaURo?=
 =?utf-8?B?VWZKQkRqOXdCSDE4ZmxOK2tiekR0NlpwZzFHWHVsZGZoVnRGb21ERXk2Z2dh?=
 =?utf-8?B?KzRVczhNYWg4RDM0Uk1aVWNlUUVVaGYvdUxZSk5hMmRhNFY2MXJRQ0o3QVps?=
 =?utf-8?B?c2E5U1VQWFVmbVA2MXo2QlRXUHZteFlpN2t5Vld5cDZVQS9OY2VKM2NEeGtI?=
 =?utf-8?B?Wmo3RzNtdGw0aUdLK2p5UHF6UkNtRXhheG5xWnFCTU54YVQ2WmNQWmJFYTNR?=
 =?utf-8?B?dU5SRlN3SEVYREk4WXFwdTdRamxaV2plNnFhejVCRDNhaGx1dldtV3NiYWZB?=
 =?utf-8?B?RkJCdzkra0dkcTEweDJoTVFsS3JJTHFObVl1bktDZUI1RDQrSVVJTi9yUi9R?=
 =?utf-8?Q?wCeiUr/o8tss4ejHOF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5693040-f08a-42ac-309a-08de5a2c6aa1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 03:06:34.8691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGU78P93DkBkH50bw4MdIvdUh0YIhyy6xrVaDLeU9Xzr3q1HuviXCTQvtD2csMsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16181-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:apopple@nvidia.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.161];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 760D86FE86
X-Rspamd-Action: no action

On 22 Jan 2026, at 21:02, Alistair Popple wrote:

> On 2026-01-21 at 10:06 +1100, Zi Yan <ziy@nvidia.com> wrote...
>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
>>
>>> Hi,
>>>
>>> On 21/1/26 09:53, Zi Yan wrote:
>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>>
>>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>>
>>>>>>> Currently when creating these device private struct pages, the firs=
t
>>>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>>>> address space large enough to represent the devices memory. This
>>>>>>> allocated physical address range is then remapped as device private
>>>>>>> memory using memremap_pages().
>>>>>>>
>>>>>>> Needing allocation of physical address space has some problems:
>>>>>>>
>>>>>>>     1) There may be insufficient physical address space to represen=
t the
>>>>>>>        device memory. KASLR reducing the physical address space and=
 VM
>>>>>>>        configurations with limited physical address space increase =
the
>>>>>>>        likelihood of hitting this especially as device memory incre=
ases. This
>>>>>>>        has been observed to prevent device private from being initi=
alized.
>>>>>>>
>>>>>>>     2) Attempting to add the device private pages to the linear map=
 at
>>>>>>>        addresses beyond the actual physical memory causes issues on
>>>>>>>        architectures like aarch64 meaning the feature does not work=
 there.
>>>>>>>
>>>>>>> Instead of using the physical address space, introduce a device pri=
vate
>>>>>>> address space and allocate devices regions from there to represent =
the
>>>>>>> device private pages.
>>>>>>>
>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>>> allocates a requested amount of device private address space and cr=
eates
>>>>>>> the necessary device private pages.
>>>>>>>
>>>>>>> To support this new interface, struct dev_pagemap needs some change=
s:
>>>>>>>
>>>>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>>     - Add a new dev_pagemap::pages array to store the device
>>>>>>>       private pages.
>>>>>>>
>>>>>>> When using memremap_device_private_pagemap(), rather then passing i=
n
>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address spa=
ce to
>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the devic=
e
>>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>>
>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
>>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>>
>>>>>>> Represent this device private address space using a new
>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>>>> private address to a struct dev_pagemap, where a specific device pr=
ivate
>>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>>
>>>>>>> Device private address space can be reclaimed and the assoicated de=
vice
>>>>>>> private pages freed using the corresponding new
>>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>>
>>>>>>> Because the device private pages now live outside the physical addr=
ess
>>>>>>> space, they no longer have a normal PFN. This means that page_to_pf=
n(),
>>>>>>> et al. are no longer meaningful.
>>>>>>>
>>>>>>> Introduce helpers:
>>>>>>>
>>>>>>>     - device_private_page_to_offset()
>>>>>>>     - device_private_folio_to_offset()
>>>>>>>
>>>>>>> to take a given device private page / folio and return its offset w=
ithin
>>>>>>> the device private address space.
>>>>>>>
>>>>>>> Update the places where we previously converted a device private pa=
ge to
>>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>>> device_private_offset_to_page() instead.
>>>>>>>
>>>>>>> Update the existing users:
>>>>>>>
>>>>>>>    - lib/test_hmm.c
>>>>>>>    - ppc ultravisor
>>>>>>>    - drm/amd/amdkfd
>>>>>>>    - gpu/drm/xe
>>>>>>>    - gpu/drm/nouveau
>>>>>>>
>>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>>
>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> NOTE: The updates to the existing drivers have only been compile te=
sted.
>>>>>>> I'll need some help in testing these drivers.
>>>>>>>
>>>>>>> v1:
>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>>> - Update existing users of memremap_pages():
>>>>>>>       - ppc ultravisor
>>>>>>>       - drm/amd/amdkfd
>>>>>>>       - gpu/drm/xe
>>>>>>>       - gpu/drm/nouveau
>>>>>>> - Update for HMM huge page support
>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_=
DEVICE
>>>>>>>
>>>>>>> v2:
>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_=
ARRAY(struct range, ranges);
>>>>>>> ---
>>>>>>>    Documentation/mm/hmm.rst                 |  11 +-
>>>>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>>    include/linux/hmm.h                      |   3 +
>>>>>>>    include/linux/leafops.h                  |  16 +-
>>>>>>>    include/linux/memremap.h                 |  64 +++++++-
>>>>>>>    include/linux/migrate.h                  |   6 +-
>>>>>>>    include/linux/mm.h                       |   2 +
>>>>>>>    include/linux/rmap.h                     |   5 +-
>>>>>>>    include/linux/swapops.h                  |  10 +-
>>>>>>>    lib/test_hmm.c                           |  69 ++++----
>>>>>>>    mm/debug.c                               |   9 +-
>>>>>>>    mm/memremap.c                            | 193 +++++++++++++++++=
+-----
>>>>>>>    mm/mm_init.c                             |   8 +-
>>>>>>>    mm/page_vma_mapped.c                     |  19 ++-
>>>>>>>    mm/rmap.c                                |  43 +++--
>>>>>>>    mm/util.c                                |   5 +-
>>>>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>>> --- a/include/linux/mm.h
>>>>>>> +++ b/include/linux/mm.h
>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(m=
emdesc_flags_t mdf)
>>>>>>>     */
>>>>>>>    static inline unsigned long folio_pfn(const struct folio *folio)
>>>>>>>    {
>>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>>>
>>>>>> Please use VM_WARN_ON instead.
>>>>>
>>>>> ack.
>>>>>
>>>>>>
>>>>>>> +
>>>>>>>    	return page_to_pfn(&folio->page);
>>>>>>>    }
>>>>>>>
>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>>> --- a/include/linux/rmap.h
>>>>>>> +++ b/include/linux/rmap.h
>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(u=
nsigned long pfn)
>>>>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struct=
 folio *folio)
>>>>>>>    {
>>>>>>>    	if (folio_is_device_private(folio))
>>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) =
|
>>>>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>>>
>>>>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk=
_pfn(const struct folio *folio)
>>>>>>>
>>>>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned lo=
ng pvmw_pfn)
>>>>>>>    {
>>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT)=
;
>>>>>>> +
>>>>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>    }
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk=
 *pvmw, pmd_t *pmdvalp,
>>>>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigne=
d long pte_nr)
>>>>>>>    {
>>>>>>>    	unsigned long pfn;
>>>>>>> +	bool device_private =3D false;
>>>>>>>    	pte_t ptent =3D ptep_get(pvmw->pte);
>>>>>>>
>>>>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_wa=
lk *pvmw, unsigned long pte_nr)
>>>>>>>    		if (!softleaf_is_migration(entry))
>>>>>>>    			return false;
>>>>>>>
>>>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>>>> +			device_private =3D true;
>>>>>>> +
>>>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>>>>    	} else if (pte_present(ptent)) {
>>>>>>>    		pfn =3D pte_pfn(ptent);
>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_w=
alk *pvmw, unsigned long pte_nr)
>>>>>>>    			return false;
>>>>>>>
>>>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>>>> +
>>>>>>> +		if (softleaf_is_device_private(entry))
>>>>>>> +			device_private =3D true;
>>>>>>>    	}
>>>>>>>
>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>> +		return false;
>>>>>>> +
>>>>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>    		return false;
>>>>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_w=
alk *pvmw, unsigned long pte_nr)
>>>>>>>    }
>>>>>>>
>>>>>>>    /* Returns true if the two ranges overlap.  Careful to not overf=
low. */
>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_wa=
lk *pvmw)
>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, stru=
ct page_vma_mapped_walk *pvmw)
>>>>>>>    {
>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>> +		return false;
>>>>>>> +
>>>>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>    		return false;
>>>>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mappe=
d_walk *pvmw)
>>>>>>>
>>>>>>>    				if (!softleaf_is_migration(entry) ||
>>>>>>>    				    !check_pmd(softleaf_to_pfn(entry),
>>>>>>> +					       softleaf_is_device_private(entry) ||
>>>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>>>    					       pvmw))
>>>>>>>    					return not_found(pvmw);
>>>>>>>    				return true;
>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mappe=
d_walk *pvmw)
>>>>>>>    			if (likely(pmd_trans_huge(pmde))) {
>>>>>>>    				if (pvmw->flags & PVMW_MIGRATION)
>>>>>>>    					return not_found(pvmw);
>>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>>    					return not_found(pvmw);
>>>>>>>    				return true;
>>>>>>>    			}
>>>>>>
>>>>>> It seems to me that you can add a new flag like =E2=80=9Cbool is_dev=
ice_private=E2=80=9D to
>>>>>> indicate whether pfn is a device private index instead of pfn withou=
t
>>>>>> manipulating pvmw->pfn itself.
>>>>>
>>>>> We could do it like that, however my concern with using a new param w=
as that
>>>>> storing this info seperately might make it easier to misuse a device =
private
>>>>> index as a regular pfn.
>>>>>
>>>>> It seemed like it could be easy to overlook both when creating the pv=
mw and
>>>>> then when accessing the pfn.
>>>>
>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw)=
 to
>>>> return the converted pfn instead of pvmw->pfn directly. You can add a =
comment
>>>> to ask people to use helper function and even mark pvmw->pfn /* do not=
 use
>>>> directly */.
>>>
>>> Yeah I agree that is a good idea.
>>>
>>>>
>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are =
you sure
>>>> there is no weird arch having pfns with bit 63 being 1? Your change co=
uld
>>>> break it, right?
>>>
>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (=
6), so I
>>> thought doing something similiar here should be safe.
>>
>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is u=
sed
>> by almost every arch, so it has a broader impact.
>
> We need to be a bit careful by what we mean when we say "HMM" in the kern=
el.
>
> Specifically MIGRATE_PFN_SHIFT is used with migrate_vma/migrate_device, w=
hich
> is the migration half of "HMM" which does depend on CONFIG_DEVICE_MIGRATI=
ON or
> really just CONFIG_ZONE_DEVICE making it somewhat arch specific.
>
> However hmm_range_fault() does something similar - see the definition of
> hmm_pfn_flags - it actually steals the top 11 bits of a pfn for flags, an=
d it is
> not architecture specific. It only depends on CONFIG_MMU.

Oh, that is hacky. But are HMM PFNs with any flag exposed to code outside H=
MM?
Currently, device private needs to reserve PFNs for struct page, so I assum=
e
only the reserved PFNs are seen by outsiders. Otherwise, when outsiders see
a HMM PFN with a flag, pfn_to_page() on such a PFN will read non exist
struct page, right?

For this page_vma_mapped_walk code, it is manipulating PFNs used by everyon=
e,
not just HMM, and can potentially (might be very rare) alter their values
after shifts. And if an HMM PFN with HMM_PFN_VALID is processed by the code=
,
the HMM PFN will lose HMM_PFN_VALID bit. So I guess HMM PFN is not showing
outside HMM code.

>
> Now I'm not saying this implies it actually works on all architectures as=
 I
> agree the page_vma_mapped_walk code is used much more widely. Rather I'm =
just
> pointing out if there are issues with some architectures using high PFN b=
its
> then we likely have a problem here too :-)


Best Regards,
Yan, Zi

