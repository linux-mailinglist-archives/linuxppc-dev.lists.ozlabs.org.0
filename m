Return-Path: <linuxppc-dev+bounces-15595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD4D15C28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqpCj5Mzbz2yFw;
	Tue, 13 Jan 2026 10:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.52.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768259777;
	cv=pass; b=BObsno7HqmcHLDnVVUeYPqRFubFDeQqHeO8N3TT55AuYmG+jFDGQ+rHxQseUn++lgC4r0ZhYz/7Un7stdjDzPEKa37T92RZIfDOufjmj+Xghk3a3fLshuUeS2Lom9vjiiFRcRHue7eyT76u6ikfmm6w1N6a9ZNbd3K/9ChTgK1CVdG9WQHCjkX5rX8A2/9IYDnDl8T2fZFZxGDqmzEIg3GDUjzP3Tr2Zn4pCvQ61l0bZyhLFw/jdkhH8KVxIBTRrWrunjtab5wsnu6i4DgzAwIyMxDt5o/FzhQwk6W5FQtpp85UjXAmCCbYk3KcPS5vHu9KZ7TKY6G7vLSCaBDPVMA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768259777; c=relaxed/relaxed;
	bh=OjpZOMTFF5BanPWXmtUO1HrF1IGNcJz9kFX0f5urmHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HjQ4S/j2LlAEOZ/iMyB4Dr0C4thfr6txP/E1zwwbWCOzkfSnwuDcMMYK9yLdp8mRU2YEKu0HxLvFEi5R7I9u2QvTFvd6G3GCiKAUy/NCYmjx90evcyiMBZr/HHNm2DuIzN4JyRLFJ2IkWxxO/drwOqqthMxppkeGM0yQSGaenbLFy6aNcIBX8Oa2tINQwuATDwqkUuzPF8Vo5VECywKC4uElXhlR5/Ac92akDpnjxTf01G6De6qpLN+Bu0qpRc+m/S29+ikGBQlR3714iu5hXE9anz9sxppYQXQVukOah0JSNN8WTo07gTBfaviUAFBS5BNzCTYSqoDMoY7eVsV9gQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M7mRjb5S; dkim-atps=neutral; spf=pass (client-ip=52.101.52.9; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M7mRjb5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.52.9; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqpCg6t2yz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:16:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhITgbLmP64x15V06PyVAcwTL5egwLq3waU1PphOtbvdAf488EdqNdPt5S5TJtFfSOHogEODBVjUWsgx+6baFwziJ5J2mQyKZG4ydPwwBw5j5OLr2Dybw4JAtIl3AxVzafyiPYB51akNCSqgaG5ZR9+46a1cv8kNRXeT/IDr4IXqLmgNJoVQhFQomVwdlPBD4bNYtAW9aWP/v38I326vw2uI2/g+mzGEkp+0blpiEAunmqKfYsWOdvObyCXrGhQ4Q1k0v6m/vaKRQ4kqqQF09jLF86ucFI3cvFX5UK91sd0dEYIGIApM9zvv7Hn2u1AkbaeYqDEr5nO3ubDMHflM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjpZOMTFF5BanPWXmtUO1HrF1IGNcJz9kFX0f5urmHY=;
 b=O0NHUhOKhJDlvH1mjSxKK6c4Dt8Djg1eg8eYIU39sFnl8XFCQ59lUlOs9IKC534xy04Omw9POWKW7oaxNE3T6xsIUxzt7WM/lBvash6/5blG0oXTIGVbkz+eAo8JVwutt9Jh6DpIubvYn13VG2D6Yl5eUhbjEmTdTVXIUIDJHwV1mN3xEAxCfoF25CqLTZCSH+7VQRxnbAZlhapJRsRIlnikfl5Tpd8pJbEBJx57AENqdrVCJQXcZskLRouZwdBTtnyUK3FVKskITg1Ta8GQFY3Yvj/WlXtkU27hCCGdwrifkOyXRRJsx/ha4wpLzkU7RB31/g3rv12Kme75IWlrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjpZOMTFF5BanPWXmtUO1HrF1IGNcJz9kFX0f5urmHY=;
 b=M7mRjb5SoU/BBsNFWZMRxlixK11MY3akA3b9gZKMzEzbuRrZCJblKc9C3ob1MaPnAJpwluN1qIJ5po/3PwHPl+vx01Mm27wHTk472K5NMMSmSIfVx63GBOXoamy1Fy/6JfEvD2U7uXV8d+ddf1K92mthbOBwwNxxRTJejN8T+O813jWcZuNVzsxsPf7EzhjumImzrdoduo8eV1C3CRs2JiI5pyEdXNQH8lSPv3zZXzMlysX4focTrBr1tqJeUjrI3wkIfmGOiEJEuzEEc2ZFUz2YaDjy20sEFYMYFAn5vpZNw06I7F38QLnFLYRdVtImFrqIgYHb9zHQmK0nIH9ruA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 23:15:34 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 23:15:34 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
 Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Date: Mon, 12 Jan 2026 18:15:26 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
In-Reply-To: <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bf900e-c6cd-44af-1532-08de52307d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19052099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEdQbHB0QnhkWEViNlF1UFRpK0FreHN1UHozdGhxTkE3WHlnSFFKSW8yUnI2?=
 =?utf-8?B?WUNZWEwyaTUybU0xNk9kbFpzT0tzY1FxQzNzRmxLTUVaUm04dVRMdm8ybVor?=
 =?utf-8?B?eUYwMUhGMzNRWWgrYlJxWjRzTEFyNk00VkJsRWh3NkIzS054Qmh0aW9CYVhX?=
 =?utf-8?B?ZExoZEhiWHlyS0ZpN2Z0TndWM3c3ZlhjNmFkODVWVlQ3L2NvUmhMMENDMG1v?=
 =?utf-8?B?Z3ByRDh5S2twaVg0V254SElvQ25jSEpGT2RWQjJOWDdvYTNBU1puYlpHVkI2?=
 =?utf-8?B?WGR5Q1J3TTl1Y3B5RllHQURmVlU5d2lsV0VuamNCM1NEb3IzdktNei93MmVQ?=
 =?utf-8?B?QkNnbkRTSStjQTBIQnRndHIzU3pKSm1xbHRpMGt6V3BTQkl0VllaMy9KUkJB?=
 =?utf-8?B?NWpHaU1QaWR6bFc2cVNZMmVjQlBrWSs0WVFwMitQbVU3ZzlVZ2tyUm9CeXRT?=
 =?utf-8?B?MGpOZzVBZDA3UHRvOXFUS0hUSWpQbU9yeHR6Q2lNWkh3U3JEZFVxdlM2TFhq?=
 =?utf-8?B?OFU1RUQ5TXlDby9iVTI4VGkvVG1FUVZDMGxuSFlMK3hnb09JMEJnbk9pQXc0?=
 =?utf-8?B?dE8zdHM3Tk0rbW8vSVA2djlDd21WYnk3S3BoYTlHMWdsbzYwanpLNGV5TkRj?=
 =?utf-8?B?aXNDcndKYzNzelFveGFSRDg3OXcyV240b0tETVRVSTlWVU9kalFiQjluNkV5?=
 =?utf-8?B?TDM4Wk5CTllGWHptTU9mUTRNM2UvalJUaHF1UnpMVVJEWm9sWG1oQWF6MHQv?=
 =?utf-8?B?ZHFPNkFLdlJYMG1wNms4dVU0SmVXVmdRV0xhMUtVcG02bGdjV1NqYzdmOTUx?=
 =?utf-8?B?aTJCZ0lEZTJkV1YrVkF0blFuZ2VqcDZWbkpkSEo0WCtBTGVGeWJmUjdtalE1?=
 =?utf-8?B?eEo2bCs3ck5Zc0lWcXd2RlhJR1d3V056ZE0yc2RTcERSVXUyRFlVZkJXVEZo?=
 =?utf-8?B?UDdZUys0SEJjSXFCclFnaEIzZmxFSDZqYUFUY3NVRzBtU0hBcW9Hb2NrUk11?=
 =?utf-8?B?THFtUFpPODlicy9TUkRDT0w4cjBrekpKd3JZZ3BDK296bUZ2a1QrOGYrcWcv?=
 =?utf-8?B?REJTYWF2VVI1UUM0SXRCUDR6SHdUVUdUMHdJUTZieGgwK3pZOU5nVUQ5UlRD?=
 =?utf-8?B?Q2M2OVJZZk0xWjRXZ3c4bUNKZ1FpZkZxTGJZWkFuNzdYMmdkbEF6MFdiNWxK?=
 =?utf-8?B?cHd3ZnR6SnQ0OG5rOUFqVkNJa2FmMWJiVWFLTDJQa3NNdDJOYW1RcTV5aEtF?=
 =?utf-8?B?RlR2UUtrQXI3bGU0NWhKeXBkTkwxb3E1WU5NZDlLYW5GVlNoMmwrd0N6dm5X?=
 =?utf-8?B?ZnhRanY2SENVYUJWaEt6ajBOWC83bUR1bCtvKzBHN0NzVDlvWTNYeWhHNWR3?=
 =?utf-8?B?TnpjeFZXZVYvajV3VTFtc1VrcCtMV2lnZHIybDl2R0htNlhVQkpUUlNOSlZD?=
 =?utf-8?B?ZXpCbW9oNi8yVk03SU92UE9HRFVuMlFpZjNGellRMGhyYkZaSzhRVnJGS0R6?=
 =?utf-8?B?TzRJcWRUSG5Yb3dEMExQbXBGSHBwZUFvbnVqbFd3M09PWUZ2V0x4M2RSYUE4?=
 =?utf-8?B?L3I2cThKZGFYMWpJUStndjFlOUc0UTI3a2I3L3FhT1BXdDJQdEhsNEtWZFFK?=
 =?utf-8?B?TCtQUFo1dnhPcDVoU2VaVm5Ebnh6bFlqK0lRbm9NQzZNMWtVOG5Qa0t6QXZ5?=
 =?utf-8?B?R1FYOU9MMytSUDNLdmtQUXVpQThJWHJxTFFJdyt0N1FhRU9hanIzRndFTWx4?=
 =?utf-8?B?OTFoV2VTUUVyV0c5SHFKdTBGeHVZNUVpSUdiRkZvRm9UUlZPL2FjNzlRanJj?=
 =?utf-8?B?MFZlZmhHend3VUx2ejVuN3JLNXhXcVc3RndXSUdlcG5tbkttS3RCOFgrMHlk?=
 =?utf-8?B?dVBJWUdKS3JOS3VBTEFlZHV0Skh2ZDB0eTNrNHI5bWp2a05SYkR3VzJtcEhH?=
 =?utf-8?Q?sEKW0zzZ0GaTkYdLJGRFfdzHhs6Di+Mp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDd1NHJvdzVSMDBteU9rb0VkTVFlNEpyVzNmUEptdGJmQ3FYVjVad293N3Ba?=
 =?utf-8?B?KzJQTDVYZWVYM3BOOHNDcHdCYUJTOEM0Z1oyeVpRZGd1U1V2T29BSUlrQkZI?=
 =?utf-8?B?d2ZKRE9sbHIxek5rQXp4YWVkMndxQ0RLcnhWVDZGSWU3cTAvZDNMSXN0MXpH?=
 =?utf-8?B?Rk1XcEJtMW5lRkMxNFlnd3Z2RUJqdzJvTWNnSGxYenpXa3JjanplZUZrRjVH?=
 =?utf-8?B?M0kvRW8zZUhVcG1QcmZFeERHbmJ1NmM4MThGU3ZVOXY5K2tsdm1IcDFraFRW?=
 =?utf-8?B?OHMzNHp1TEJieUw4bzNacGtYUTNHdkFDazJ5dllnUDVLZWQ1VGlGdG1WSUhl?=
 =?utf-8?B?enFmYXVSVUJWWkJKTlliWDIzWWZmbk9TbEhKQWc4RlUwZDEydVBTRUFNVmc5?=
 =?utf-8?B?clRIRWErUHlvbWI3Z0lqc1FucmVvUm1nOUo0NUZibm55S1NQYW9KM0ZRY242?=
 =?utf-8?B?cDVqM0FOVGtZNlJqRlJ5NU5ROUY4M04zVUZoRVhlYWpSelhiM0tpalVsMjNv?=
 =?utf-8?B?TUxDV0RDUCtCcjZUTlkwem9icVhORi9DbUNCWWdBSnBPNnEwR2RkTHZueWNR?=
 =?utf-8?B?YkplSGlnZVU4ZldicWlCTWxqRzhGR0QvdTNYRmZ0ZGo1b1l2Z1IxalJaU1N3?=
 =?utf-8?B?dnQyUEhOWEJSK2N1eEZKbE8vZTUzVDViQ3BsZ0h1RHA5N0hYdkhyUk9SOFdQ?=
 =?utf-8?B?U2w0a01UUjg4V2crLzNwZVYvNnVpNWtWektPR2QxQXdNcDJadkdjVklZUWNo?=
 =?utf-8?B?dlQvRWZSNVJId0Z3SzFLY0JwZU02R0N2RDgrWFlTOVdQMk1ra25obnJvdjBq?=
 =?utf-8?B?YitjdWpTVGpwZE9jM1hhVzF0RHRpTXhCSTJKYzNmV09qczFyUlpGUGIzeGNL?=
 =?utf-8?B?d3RYR0NzVUhUeHlTK21oTnpOZ1VMT1VIWlFmRExlR2RlbnlVU21GWnYyd1Iw?=
 =?utf-8?B?bUlOSUNNMXZNZmdxQ2NwVXJ6TTQ2a3Bzd3dWTnMxQkRpNW82UExFOU5YeTNY?=
 =?utf-8?B?djZuSHlUVFU1UFc5M3VzbjJIdTRWZXZTWWVTTjlmb09zdHJxeEZVV05GNlZz?=
 =?utf-8?B?Y3BNME9lZEUwOUtyUDZVY2N1YXRzSnhtL1dxYVN2YXRXeXRKNjNtWEhDbVZ5?=
 =?utf-8?B?MG5pSC83c3RYTWdoeHdHaExuUEdaT3JqQUpNRGRPcEFFekhWcUtkcXc2S3Bm?=
 =?utf-8?B?dU5EZVhqWTJ6YVdVU1k3UERUM0VKYjhXditsTUFuZExGUk85b1JuRzJyd0NB?=
 =?utf-8?B?UEFnOWh2REsybE1TTWJWeS9MeTE1UVJqanVGNmp1U0tXNnJPYmtGK3RVLzhG?=
 =?utf-8?B?VVpYK3ZaaVlwazVvTzl3MzNQM1VjN1Vxa3Z4N0JyYXV3b1lrUUF5OHJSRmx5?=
 =?utf-8?B?U1lZZitJWWZ5MjVqTzQrektLa1JBd0lnMnIwZnIxOVJ4ZHd3NWp5Qk4wWFdo?=
 =?utf-8?B?WXpCbk05S3NPaDF6R2xpTnErKzk0YmZWL0ZLN0w3K0ZWWHhrblpVenRlRmlZ?=
 =?utf-8?B?MFQ4UVVuN0lyMWJRbWhaN2ZGNE0vV0tpa0N3Yzd0VzdOT0ttNkhKajBLRVVH?=
 =?utf-8?B?bUYweXVBNGRMSFVLZmpndTdxbUVVNEE0TUlCNHBqejBEcUhXNnRYUFZsZzdV?=
 =?utf-8?B?RFYwMm9xNFA2bmtHTGU0RFA0Mjg4QVdvVmRHbnN4Ykx5L2N0dk1KUDJuUWU2?=
 =?utf-8?B?Qmo5eEhqem8wR3Q5S3MrSUN1bk04OW12VWNURWM3d3VnSVhEY05DZU1ZbHlo?=
 =?utf-8?B?cGtCSVZlVy9jTjE5eHhXbXRLVXJDZjcwNFVMeG9GRXVDUlpieWVmdHl5ZDRu?=
 =?utf-8?B?NlZpMWtEZjg1ZWI1S2ZkOVFwQjRRdnRZc1puaFQwSElrcTBWMjVKdzVmdDVM?=
 =?utf-8?B?UnY0cmZyMEU0OTVTQmQyMjRkQ1JxR0hwUDkzTEJTSUJVWkwzQlA5a2svNTFV?=
 =?utf-8?B?cGZTVjI2Rk9GV1pxdUhpUkxoVThoTm9CcGxKZGdQalFEZDJFTUZqaFErbm1q?=
 =?utf-8?B?V01HbTc2YStGdk12cWswVDROVVpWeHMvWWt6Ny9uTWE4aGVoNm5ETnpYcmdy?=
 =?utf-8?B?OVJvd3lrZWpFazBjK0JieFVpZ1dWelNzREg5dkYxUTlFV3ZjcjlndkY3Um5L?=
 =?utf-8?B?SEFCbmF3RjVTb0VVN21ISTN0WmRCN3RnNmJwcGlFWnNTMkNUSGcyYk4zNER3?=
 =?utf-8?B?L1BoY3BTWlU5UHpGRXpUaHF1NmxqSUl5UnhmNXhCSmxWcGMybTZjMkdkL0U0?=
 =?utf-8?B?cUVjcFJ1WUw0SGg4UGRDRW1qSXlieStRNWZOL0ZwcDRjVHBXM3lZRWpZVlEw?=
 =?utf-8?B?VXczb0dOc0NsMnRETW9KZ1BzU29INFhMT0RnSG9iNU54b0lSdlRUUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bf900e-c6cd-44af-1532-08de52307d01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:15:34.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGKBhp77Fl+es8FZD74S54AWPm8qtpP5jmFoaw5wjNOnjiTx/KnRbqeUWLHhc2bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 16:49, Matthew Brost wrote:

> On Mon, Jan 12, 2026 at 09:45:10AM -0400, Jason Gunthorpe wrote:
>
> Hi, catching up here.
>
>> On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
>>> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
>>>
>>>> On 1/12/26 08:35, Matthew Wilcox wrote:
>>>>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
>>>>>> The core MM splits the folio before calling folio_free, restoring th=
e
>>>>>> zone pages associated with the folio to an initialized state (e.g.,
>>>>>> non-compound, pgmap valid, etc...). The order argument represents th=
e
>>>>>> folio=E2=80=99s order prior to the split which can be used driver si=
de to know
>>>>>> how many pages are being freed.
>>>>>
>>>>> This really feels like the wrong way to fix this problem.
>>>>>
>>>
>>> Hi Matthew,
>>>
>>> I think the wording is confusing, since the actual issue is that:
>>>
>>> 1. zone_device_page_init() calls prep_compound_page() to form a large f=
olio,
>>> 2. but free_zone_device_folio() never reverse the course,
>>> 3. the undo of prep_compound_page() in free_zone_device_folio() needs t=
o
>>>    be done before driver callback ->folio_free(), since once ->folio_fr=
ee()
>>>    is called, the folio can be reallocated immediately,
>>> 4. after the undo of prep_compound_page(), folio_order() can no longer =
provide
>>>    the original order information, thus, folio_free() needs that for pr=
oper
>>>    device side ref manipulation.
>>
>> There is something wrong with the driver if the "folio can be
>> reallocated immediately".
>>
>> The flow generally expects there to be a driver allocator linked to
>> folio_free()
>>
>> 1) Allocator finds free memory
>> 2) zone_device_page_init() allocates the memory and makes refcount=3D1
>> 3) __folio_put() knows the recount 0.
>> 4) free_zone_device_folio() calls folio_free(), but it doesn't
>>    actually need to undo prep_compound_page() because *NOTHING* can
>>    use the page pointer at this point.
>
> Correct=E2=80=94nothing can use the folio prior to calling folio_free(). =
Once
> folio_free() returns, the driver side is free to immediately reallocate
> the folio (or a subset of its pages).
>
>> 5) Driver puts the memory back into the allocator and now #1 can
>>    happen. It knows how much memory to put back because folio->order
>>    is valid from #2
>> 6) #1 happens again, then #2 happens again and the folio is in the
>>    right state for use. The successor #2 fully undoes the work of the
>>    predecessor #2.
>>
>> If you have races where #1 can happen immediately after #3 then the
>> driver design is fundamentally broken and passing around order isn't
>> going to help anything.
>>
>
> The above race does not exist; if it did, I agree we=E2=80=99d be solving
> nothing here.
>
>> If the allocator is using the struct page memory then step #5 should
>> also clean up the struct page with the allocator data before returning
>> it to the allocator.
>>
>
> We could move the call to free_zone_device_folio_prepare() [1] into the
> driver-side implementation of ->folio_free() and drop the order argument
> here. Zi didn=E2=80=99t particularly like that; he preferred calling
> free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> which is why this patch exists.

On a second thought, if calling free_zone_device_folio_prepare() in
->folio_free() works, feel free to do so.

>
> FWIW, I do not have a strong opinion here=E2=80=94either way works. Xe do=
esn=E2=80=99t
> actually need the order regardless of where
> free_zone_device_folio_prepare() is called, but Nouveau does need the
> order if free_zone_device_folio_prepare() is called before
> ->folio_free().
>
> [1] https://patchwork.freedesktop.org/patch/697877/?series=3D159120&rev=
=3D4
> [2] https://patchwork.freedesktop.org/patch/697709/?series=3D159120&rev=
=3D3#comment_1282405
>
>> I vaugely remember talking about this before in the context of the Xe
>> driver.. You can't just take an existing VRAM allocator and layer it
>> on top of the folios and have it broadly ignore the folio_free
>> callback.
>>
>
> We are definitely not ignoring the ->folio_free callback=E2=80=94that is =
the
> point at which we tell our VRAM allocator (DRM buddy) it is okay to
> release the allocation and make it available for reuse.
>
> Matt
>
>> Jsaon


Best Regards,
Yan, Zi

