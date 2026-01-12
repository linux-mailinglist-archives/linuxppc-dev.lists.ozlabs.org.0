Return-Path: <linuxppc-dev+bounces-15549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55DD147FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 18:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqfwm05Jlz2xKh;
	Tue, 13 Jan 2026 04:47:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.45 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768240071;
	cv=pass; b=HGHrJzFJKLt9iMYpQlw7L/ImF0Vyr/iWs/qC/i3fDL5hUOJcyBo/0vb8uyVlR8Nllu/HsWErwMRnzmSvwCiZ3InjmgoE1JVRWtZNgkZg6aGDrlLI+ic8wmQ1D1PbfFeajEdb5ENeb9f6Ov9NqjgZiNXGoPHuGEne/kVjqXNGsCzzuyS2PymkPCPAOM2WOx+5vV/Uvw+RqxdDM6m1rL68dfJQutCcOAdYEnEEMJm14i2exdmflswZImiThvdGe6EwrSMAGzaQqLl6FzSIDAZlVwdGoHErEwhDkKRg5RLBQe49BnaHjpByiAzjGdHCxGttncGfe4ykQCEmL/pqNV1eFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768240071; c=relaxed/relaxed;
	bh=N1J+BdCt6tiyG5IlAf9740izsatqm4Ntj+zK5oiEn5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ss2DcOcOxMNIfuqqFMM7wEFIdPwXu9t4nSOXmwU+gtcM9P32oKA0FHn4S5FcZgvKKA5swC4gfqIKXIalmHEK/5a3ZlJC+mUuOl4T9Aky7uE6/NSP5x2hNLEfMuWzW8fT+/MI7ceUMULk5+WfqjT/Q5s8qMG6c39HXIW17K1LdoDc3OjXrj3U/nZImq7JAkPDhfAbOoyCSb1LtH9VGf7Rdv2TwasNN+R5JHf6XnUS5+2K8ljyNp75JwAs/qiEjAyKG21SuMXIAsnfwngGWtU+KNfRUBLVlvAO4CjhvZ7m0d9Yo2k7Lggf3E/QAPdDPSkpNefwtEkkUAXrTzs1SmVRbQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxBqF0Pl; dkim-atps=neutral; spf=pass (client-ip=52.101.193.45; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxBqF0Pl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.45; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010045.outbound.protection.outlook.com [52.101.193.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqfwk3LsWz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 04:47:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YILb9ezFyb3MG9kKGXbgAts5PVvg2ko3eHKPYcBRr6ug7KJjT92f9RHlQF3sG143HdTHOsUVVxYrxyieR7Pg7WlJR/G06k7nD9dWF5UD00hVjBBRUq2lbncGGkWA62BXTXLgnUcfV0RYNAVFz1HXRj4VMBswPkT5HaL8zQstZEQqEhU3BpV57BbVCJD/HUP43HhNuaCj1QnvGIQpiUTTCs0ngUu4tn8bNfbLC8nFvnEkM6jBQHIM2fDL60h6C7zmXRM4CWNwzOGDjp7CGVGBOjs4O9S6yVDJsF3jRiSSoIowoaZgiq4Ux8rIyTBzTnOJbd/TRyx20xxLeILMfW46Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1J+BdCt6tiyG5IlAf9740izsatqm4Ntj+zK5oiEn5g=;
 b=qyvA6xHOoul1NBtABxTwOUecPxqUDUeWVzjEqzYZvXvB+74L5O/XMgc6d5qwaWoQU85hBdpnmb8p/+7tBi+oMzUN5aJFiMa/JnXHsZGjxZ+d7l7F0NhphYYFasyA2OTuVHpZCYmAq3FKfp76BJi2M1B16TaI0offEa7NAMy5UCoCVyO05wvghrZxpvcYwavZp5b4v/QOaLMRhxrLj34OX+kcs3HIX4FTJURCX9Q3xziFuL0Y3OqZlR/yuIcL5KMMNwEfy6OZe3VZ58tryfmFQ82xM4W/efRYi5OoVNhn2kHFs7h8wu6cE1zU4RgppgRGAK2+w4TyvIQLb4LeH+xsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1J+BdCt6tiyG5IlAf9740izsatqm4Ntj+zK5oiEn5g=;
 b=pxBqF0PlH3aKPOw1Lws0EBbewATSYCKIGXibh0/NWJo2Swe83FpBekNjpw3gy+3xX58+VynNoC+mNopbqz2C6iG60dROhUuR9NMs6pQRGP+558XsVYtBhmiMj6HyYFbUB2dkqTVnUf5lOG5t93mSE6nCMZ+NIKp8yNq7dfM+BgSthOeiJmC2n28ttJadOxDWmvLLBFpQRqoyw3qoAwsewVV1dGY6tK44KR/W219p3W2ltoGnwKH1AvValA2/UK3Qoe9EHOwVKo6vIKYVmIsrBVkrkDM7q+VTdjcZA0xW8GhUdmRiibOwTzvHQudXGKFTGaMqlyrLv5P1/Jjndra/2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 17:47:07 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:47:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
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
Date: Mon, 12 Jan 2026 12:46:57 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
In-Reply-To: <20260112165001.GG745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed69ae2-ee15-4670-2fff-08de52029ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dytEcXlBTlZtRDNiMFMrbnloVEVaVGdqa2puM1FJeEY2VnJOWDFtL1F0TGtl?=
 =?utf-8?B?SWZENVdMdU1ZbzFhSU0zb2ZRSjVqcXRVQmFDZW81NjU0UytYdGZBYjZsNENv?=
 =?utf-8?B?eWNIUkJFYUV1cmd2ZmtEYnZWSjJWRHZpUTZyUEsyS0JIZE1Hbk9JNGRvK0Z5?=
 =?utf-8?B?Y09mTTlPNThNS1BGa1VvOFFMdGYrVjIvZFVNNWpoWTkyRGhRT2cyRHhuMVpG?=
 =?utf-8?B?aWdpTlZOTkYydVlmMDlrdnZuZXhmRk5FTERBTzZkUitlUHdyTzZGZ25ab205?=
 =?utf-8?B?YjBIL1BBRGNyazBLYTVlSEZPM0JiR3lnSS9GWVRheC94OWFrc1I0SmwzQ0M3?=
 =?utf-8?B?WDE4WmJLMkQ1bjcxY09hSTVmUXlUcVZ1UFgvNXJSaXk0MVBCSWRJdllDWnBH?=
 =?utf-8?B?N0MyTzV2TDE3T0NrZFRhOWtGUlJRR21HNFZGOHlTVWRlNk1hQ3JodlF3RUNk?=
 =?utf-8?B?dzh6WllVdTRyOEE3ZTZ6RUk3TG00Q3JtT2llUjlSTm5ibzRlL0VEcnptZFJY?=
 =?utf-8?B?L2NNb3p3YWVBT0JYeWxIeVd0VzdwTU51bFp6c2k3MXcwbjRldHY3SFZMU1dp?=
 =?utf-8?B?alp3K0YyNGVSenZ6WWVVRVQ5WXd1bFBrQ3JqNnVUb0srNzdrK1VPTDVVUVBD?=
 =?utf-8?B?UytMa3d1dFNvd2d5Rkw0WExzNndkbmVKa245d0lhK053YWpvL1FRYXZDTWo0?=
 =?utf-8?B?UHpQQkFIZlpwRnE0cTlsUHA2VzRwQnkrVFVmVytHNHcwYTVZQndvQlRhdjVZ?=
 =?utf-8?B?MVdPNUJrd3ZNRlNRaE41VUI5cXZCb2JPenRKZXEzdEU2aWF6Q3VGcHpwRVI2?=
 =?utf-8?B?dlJLZWxzQXNNQmJlQ05MemV2ZUM0bDJBZEhMc0pwZFQrM1hITmVnYmlyTVcx?=
 =?utf-8?B?ZmFJbEJaL2dNZEduU284MU1Pa0JobmpVWXRtQzJ5d0kvVVJrVmxBTjhNK3Vq?=
 =?utf-8?B?TWR4dEpjZ0lDRC9iaE9QSndITlc2QUhwV3V5YmVta0RiVzJVY1FycTFnTDF2?=
 =?utf-8?B?UG9RWTJmUjdJMHlRbVFCRm4zMXdOV3lWOGZQTVRjU1ZpS0dvVGt0K043QnZ6?=
 =?utf-8?B?Tk5NY1Q1ZmRkOWNYMXZvMVFWVVFQUGxaQ29sM0JMM0lFeHlmUjhIMWlCNndM?=
 =?utf-8?B?Zmd3clI0dndnak5LTnk0cEY1SEgvWHVXbWhhMHkzY0NEc1p2YU1vcGdMNllR?=
 =?utf-8?B?TmUxOFBOSGhFVE5XdU5QRVdSdEFSWTlzcHRJdGZkM1hOdWNYbnBhc2oraUtq?=
 =?utf-8?B?MmJYL3NoZVZJeVBpVUVNUXN0d0s1cDZlc2hsVnhrYmdCMW1tTkFwS3d3dlN2?=
 =?utf-8?B?YmladmhiUndaaDM1NHBmQUlsYi95enBHa2FPUWNoU1JQdlJla09icHBZK3RU?=
 =?utf-8?B?bUtLMUw1ZTIyRWFVZUZJYkk1Y0FqOWw0bm9FZSt2dnFUWmNUbXlacG5iV0cv?=
 =?utf-8?B?RVlZSld6RWxZMldoOWlSdlYyZklPRjZtZTBxODJYVlJXaHRhU3BrbFdHS0dT?=
 =?utf-8?B?ZXJyMkhNMzFBci90dmJ6Unc2Y29HNXM3Q0p6NnFnd1dXS2VDRm1UMkF2RVhJ?=
 =?utf-8?B?VXFHSGRMdlc2ZGVxaGtjNXZIWWRCRk1SWWV0VWpuMy9pbGNVcnRzbENtSmlw?=
 =?utf-8?B?ZUxWbk1vRkN4a0wyeHByWnNjYjhzckVCc3pWdWhUME1DWUl5OUpwbnlmWUto?=
 =?utf-8?B?OVVJZzhSZnJVdzJkUmVKek5PM1pzTGs3ZXdVUUk4V2pDeWtKeEFtaEFKWlVL?=
 =?utf-8?B?Vk14ZE8vckdkOUJhS2s4a1BGY1RBYVFxc1IzVDQvWlVmVVh1VVMyQ09BNGlY?=
 =?utf-8?B?UmttQkNycHVZd3R3VExOT3RmTDFPZWtUSVZuT1Y0dnVqZ0xxREw4OFRsWWFt?=
 =?utf-8?B?ZHZ2VUt4ckZOd3pGT2poOFlaVlZoY3oyMjJQTnl2ZXV2Y25pcTJCZnZsQ2lX?=
 =?utf-8?Q?nWRc6PnT2UOD0jXlRWGp035ZvNOS9Aq4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEdDZXE3Qi9QUjFJYjB2M2x2VytPc2xPTVd1TE14OUhzMElRdENqVTJKYTRS?=
 =?utf-8?B?ZU14RGxaSG9uU3dxd0M4Rm1PVXlmaXVrcWN5RTA3YmFxRHprOWx1T2EzVmpa?=
 =?utf-8?B?NTdmWWY1UWF3MTdRcFduYjJOd0ozQTYySlhjRXp2Y2xtbC9NWkV3TmQvN2lv?=
 =?utf-8?B?OStkZjZQNm5oMXprWGpRekFzamxIUUtlM3BMdHk4MnpMZ2NKbDZiWlJvNnZ6?=
 =?utf-8?B?ejZYZ3BUV1dESmxSQTRtd2xBNGtDYUNHYS9WS2hhelRzVzNlVEpTYmNHdy9O?=
 =?utf-8?B?OWdRVFNBUkVzNlBlMUdVVVhaT251SXp4V2w1cmtHbmxKRExBcEdtOFpoSWlZ?=
 =?utf-8?B?UVdxbURRbG1ZK3J2QUNvUys5cHdaK0QwSjBWa21XdFZvUzdqNStSeU91U1U2?=
 =?utf-8?B?RFBTY3htNjdSZlEvRjI2QUlPTWs5T1B0RGVhUlgySDVNRFVDNzVqMFpCTHFv?=
 =?utf-8?B?YW94N0hiczNTOFFhK2R5bmR0RFFBUHNvMXIyd1FzS3ZVWCtndWg4citJUnhK?=
 =?utf-8?B?a1FXUGJHbCtYK3ExbjRIczFhM2JPakxSY1lsam80ejhVUThFTGZPRG90amFB?=
 =?utf-8?B?VGlRTWtNVXhMejIxK2VvcFpZd0s2aml4cy9Gb2lUYWR5NXU4MHlNMzZ1NitG?=
 =?utf-8?B?My9XVmZBYWNuaGlJcG5ONUJYMUVWK0VKcGwzWU5XUFIyY3pJdTJ6SGVEQjdl?=
 =?utf-8?B?eFpsWFpJbGNheWt2S1orejhrVUk3emc4MVhOT1FkUzdYZVdaRWlkMGRtVE92?=
 =?utf-8?B?ZnVRNmErN0RDY2tGV0Z5OW5FZjNLWG13Wk5QbW5vcUppUy9UN2tURitPc1Js?=
 =?utf-8?B?SGlobm83YldoU1I4b1o1ekRJbVdvSk1rTkt0N0xnZC9WV3o2dmJBZkwwclRD?=
 =?utf-8?B?Z3NidnUzSm5EM3k3SWt1bGN6TmtTdGwyOVlsYWlCM0VjV0tjc251eGVRRGth?=
 =?utf-8?B?RGwrYnQxeU0rN1djNVpjcFBKVlduV3VqdG9wVTZWNVl0T0J5OFVTcSt3N2F4?=
 =?utf-8?B?TUJIRG9CU0xhMUNKVFRxeXpOMmVzSHBqNjhDV2dOY0h3aThtMU1HbUxnc1c1?=
 =?utf-8?B?bU9qUDZza201K2VwQ0FSZ0t6ajVkZWRsYUQ3VUZwTEhWbmZJSHNzTTVLL05p?=
 =?utf-8?B?NTdmNWFWRDE3UG9XUGFkZEY3c29KVHFXalhCRktSTkUzWCthOE5ySkd6V0ZZ?=
 =?utf-8?B?eXQ1bnB2eEhDN2JNOG1XNGtTLzBhUlE5VkgvUmpYcVFCd21NTmZKODc4ejFM?=
 =?utf-8?B?SUdEZkdzd00wQTdvTHBxdTVGbWRjaDhjNHBGRXVzdlM0R3U5Z0txcWFsYW5v?=
 =?utf-8?B?TU5uT0RKcERUZ2ppbTIrMHh1S3hPYy81TEZLQm40Ym1CWnZYelpkWWtWWFBI?=
 =?utf-8?B?V1Q2RVA5RjJKTXc1WC9rSUYwTjBCRUd1a0lhV1VDdC93Z28yNm81V3J6TUxy?=
 =?utf-8?B?c1F6V3BBdHFQNllmdkNmZE9SMTNjV2tuOEZBZjQ2T08wWS8xVUY1M09UQ3ZL?=
 =?utf-8?B?VkJOME1RMHdQL1BXZ2xhUHNNY2x0Nm1TUHk0YzdMek9RQ0w5aStLV1RURGtC?=
 =?utf-8?B?QVlrVDgvRzBNUU1HTStVbENXNHg0bENPKzdwVlNSNTlGTDRJb1Z3dTJYYS9E?=
 =?utf-8?B?Q09MZlFTU3Mvc1dtK05LdzJpbXlCQmNWajNVYnN1U2dOS0t4dTR1RXJQaGxM?=
 =?utf-8?B?UURuV3RkWVBBS09SNkhZTGVhMnNFVE1nODloenJWWmh5dmpWb29XdHRRVzNF?=
 =?utf-8?B?UVlMU21yU3BadEpOTHhOeVpPODMzcHRLcC8vejFzMithckpuZ1FGc0tDZ3NZ?=
 =?utf-8?B?Y1U0OFRVKzg0VHVxV25aUXoybkhNVXJwanVzN0N5ejQreW4wcFpFVE5XMkdQ?=
 =?utf-8?B?VXhVdGloTDJzNnBpVmtodGluNW5SaktmemdNOG5FVVRmYUltek54bFBHT3Vn?=
 =?utf-8?B?OEM5d2NOTzlET3M5STRNS3Y1OEhjMnJtNXlQaHMwdVErMjlWZVRvZ1RNT3FV?=
 =?utf-8?B?ZXVZNnBpU0FvNnFtVUtScHM1aXA4RUxqV3pBdHBXUEltRkpwZ1A1L3Y1dVpB?=
 =?utf-8?B?anNKcjZ2K1pCN1U4QngrZnl6UlUvZDJGMWVYZVZ1ZnRCTlBObDdmTTRYblJ4?=
 =?utf-8?B?aERZaE14Nlc4eGtMUlFuOUF1QXllUlk2TW9aK3RmMDdIQ2hablFTcWdZZHZy?=
 =?utf-8?B?Sy9hamMzMTBYamJzbGhoNUF6MnFoVGVjMHlJcUk5OEg5OTJWa3Q4ajYrZWtY?=
 =?utf-8?B?ZklraDhDeWtzanV2UFdadW9hSUZadWdOV2RuaVNaMmdEUUJQd1ZJdU1EaU9L?=
 =?utf-8?Q?0qRRHi2DIoGdMi79k9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed69ae2-ee15-4670-2fff-08de52029ac4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:47:07.4247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7z6sPf+8v8slvfmOJEmaD3i4bGffy247ah29D6PaqtxxpDfobutQ0aiRiYvbdrMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 11:50, Jason Gunthorpe wrote:

> On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
>>> folio_free()
>>>
>>> 1) Allocator finds free memory
>>> 2) zone_device_page_init() allocates the memory and makes refcount=1
>>> 3) __folio_put() knows the recount 0.
>>> 4) free_zone_device_folio() calls folio_free(), but it doesn't
>>>    actually need to undo prep_compound_page() because *NOTHING* can
>>>    use the page pointer at this point.
>>> 5) Driver puts the memory back into the allocator and now #1 can
>>>    happen. It knows how much memory to put back because folio->order
>>>    is valid from #2
>>> 6) #1 happens again, then #2 happens again and the folio is in the
>>>    right state for use. The successor #2 fully undoes the work of the
>>>    predecessor #2.
>>
>> But how can a successor #2 undo the work if the second #1 only allocates
>> half of the original folio? For example, an order-9 at PFN 0 is
>> allocated and freed, then an order-8 at PFN 0 is allocated and another
>> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
>> without corrupting each other’s data?
>
> What do you mean? The fundamental rule is you can't read the folio or
> the order outside folio_free once it's refcount reaches 0.

There is no such a rule. In core MM, folio_split(), which splits a high
order folio to low order ones, freezes the folio (turning refcount to 0)
and manipulates the folio order and all tail pages compound_head to
restructure the folio. Your fundamental rule breaks this.
Allowing compound information to stay after a folio is freed means
you cannot tell whether a folio is under split or freed.

>
> So the successor #2 will write updated heads and order to the order 8
> pages at PFN 0 and the ones starting at PFN 256 will remain with
> garbage.
>
> This is OK because nothing is allowed to read them as their refcount
> is 0.
>
> If later PFN256 is allocated then it will get updated head and order
> at the same time it's refcount becomes 1.
>
> There is corruption and they don't corrupt each other's data.
>
>>> If the allocator is using the struct page memory then step #5 should
>>> also clean up the struct page with the allocator data before returning
>>> it to the allocator.
>>
>> Do you mean ->folio_free() callback should undo prep_compound_page()
>> instead?
>
> I wouldn't say undo, I was very careful to say it needs to get the
> struct page memory into a state that the allocator algorithm expects,
> whatever that means.
>
> Jason


Best Regards,
Yan, Zi

