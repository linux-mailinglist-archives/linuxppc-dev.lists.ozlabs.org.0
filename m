Return-Path: <linuxppc-dev+bounces-8164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3CAA18AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 20:03:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn7TY6cPSz3bkL;
	Wed, 30 Apr 2025 04:03:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::623" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745949793;
	cv=pass; b=bK6+9abKsEMNcFFmBsoyV4OgC6EVfQ5Qj188bKbKrpUBPlSA49gjvl6ZBwTHlI2Ruve0LntuTemnkUI9ezyKYj/PLz28bsn/H5I00QRBw1F2nhpBxmzOhwJ1UrA/ctvonbM8cNK4vHzDA7BNiUjUMtZ9+4w5IVv+CqiGMLGBlZalM0T5z3TU39pg0Gbkegw/7nECyP1nAnvMydwEaP3NNksKxWCgxV6Ee2DpFKJLz8wThh8n53U8Cziu9WgBLrrPNCGtrgTPoWIE4Lfcc4rTZnLqQHvfDaZPSoi09RNgeAUhB+u+2ZyW5aGzah4gFEpzAyWvR9jgSv3PK28KtOf8UA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745949793; c=relaxed/relaxed;
	bh=NDjOHl+lLPTkou1738NRqNS1NzILUzL9V05ODi4qG7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rgh4gzfZjYeYYx1XHN0fi+Y+q85cq+FgCnDWL0N0Eg+s+BFM2XA60JI8H3H6gBCswt+ANfpOXFhWhUPj4pT9kD4TS3ctXxiTDUr3k0hzya4yM8OZew50HWFcV2/wPB6pyfReXODm2H+UOst0qVoL/pocyWR+Rug9lwr8DFxLZtihZc9++rDXjXTh2Ron/TQet0yU9Jl/Ix5GPyLYMddwIMZN2OSHJ8eOebPn+ng+m+liL17c/4EU3A2yYwqEYy6RqqBMqNIUUGJxnb0tLKKKWKzqA3962ArVf7yKsrCaiSiD/GpTkPNOVbxhYOy1IJ5HWRz89/WS/iz56VCRtN98eQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OfV/IS2g; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::623; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OfV/IS2g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::623; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn7TW5s3zz3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 04:03:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMSyZMIL3FSYie4lvor5/P6GX2xOUi1DxqnHvAwlJXt9tEQorMAem7Ni2z/4iEQVhVad8i6O1ZX7lrWXLfRzwCyj90RSm19aYcGuOXBTryK85NjW+yOrFsb80T34johE1gOah9zRrfDQnoSkEZewCIUfpCOk9kUiCSAJKeusuvCqV5aMhyFinvY4BZy8zkEkoDzJ2V5YGHvZmLZC8mvC0JYWDqDmr1gzxLQBvyofzzsV6VUZhnfSFw8TIpGYYhCGlVjLJRRbHdXLZt6ceuYTa0xx6lIBlEIlJrhHIDf8N2xJB7OKftHid7LxuK7iNyP+s5L3qarOMjiroEnSZotGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDjOHl+lLPTkou1738NRqNS1NzILUzL9V05ODi4qG7E=;
 b=ngpsKKGEe30wDbIOSWne7onVGQUIPXKDsXTY30eO1/SDIhOT0AwVJfUO5eghywnmvle8u+9z0z7yHtJn3DNDq57MZw0q3QhGlU1USi03B1ZaTJdhagG1Ea4k5CjkIpratP+/m1bc23MJQADGaBcd6gMwziSKeEHVZIQfqS/X3kPdTFB2iaIlHSNgvfgvxj1V7Mst5KoQL2D/HpaIi0FU9HkASbrzIBo7akPbIkC9gizlGaAbHwAedx+D+uqQocZw4VpN0C3IwmjfA5KjGQRMWQrUgJ7/2BtNlm3MuMO+HdMIoAB0pipDtCkGWelDvDVKdkWFKlOAmIVm83OSYiHm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDjOHl+lLPTkou1738NRqNS1NzILUzL9V05ODi4qG7E=;
 b=OfV/IS2gHJwf2JeVsSl0MdAEEwuLKhjtQGMVeOYVuPFjFYgHNhJGB5kxPGxftRrjclbDhy38TrP5yGGIhL/8IZIOKyYsvRmJHNYRIfbYH1oklr9exPxwpUEzigZhEVuKhPoVgzSUk6gagjPI975CZgXH05cqQCkDmT84mESYZZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 18:02:52 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 18:02:51 +0000
Date: Tue, 29 Apr 2025 14:02:42 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 3/4 v2] ACPI: extlog: Trace CPER PCI Express Error Section
Message-ID: <20250429180242.GA76257@yaz-khff2.amd.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
 <20250429172109.3199192-4-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429172109.3199192-4-fabio.m.de.francesco@linux.intel.com>
X-ClientProxiedBy: BN0PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:408:eb::30) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 849fda7e-3d4e-4f26-e9d2-08dd87480ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FdpFgpS9ljHIJnDWbschJbFKfRhuz5x8knPpSh/2BAZE2bzOJsyJh2M4vG/m?=
 =?us-ascii?Q?TZ2nx38jHz/wLjEnFb5K3svdbTvj8sLnVnLnSpu26zVFe6il6npmpxXAmXx9?=
 =?us-ascii?Q?BomsI6DWiqMEGpWR5KZVuwjfzxcV0zvMYTCm6b4yTs5KD+uInwp63D+cV2pS?=
 =?us-ascii?Q?KX/PS+A95dH291W6+PbGjD5f7UFIymRKq+EXTNcVVMkYrQgrO+Wl1e7rAXrn?=
 =?us-ascii?Q?fZOtLNtp5cdrbb7o+gk5w7RxzDWpNj4f57rOOdVuwOoQzJC2blB5eesRhEBN?=
 =?us-ascii?Q?P5y9774BtkUb6uwlT2Vwk7HL4tDW8UOixzs2a2gOmd/dh1EdnQOtl1mWgLy1?=
 =?us-ascii?Q?83UZY2LMYq2shuZGo0sJXUKyNfttgvvWsMZiNKE8uDkNwbcU86L5ujyCvX/D?=
 =?us-ascii?Q?gxid7rYTm0nJ8IzCp7x0bpDfGHJCnPuxVB8jXXCzyphX/8eETo3TQYPeOcWs?=
 =?us-ascii?Q?r08WFu8tDs+imvKZjZKZMysX54ncNXf3GE/3qJcl+LW0+GvqFcUK62R7xBOI?=
 =?us-ascii?Q?SBaoI3FvB7BAjKqYIfRVvP1+KhCKjKEAE+UXZYsjF87Ej4IY+8wmIeFoxD2f?=
 =?us-ascii?Q?QUHwFdKPHJHxbcUDD7Z9kZyFSfJPlkxzwCYnAukmEU11gzJHkC/h/OohXOIS?=
 =?us-ascii?Q?QTp9dzV4R5wXJfpLji42e49DQsqSN4F+0rk8AiLndF5JjkGqDmSuCXVUJaob?=
 =?us-ascii?Q?QBVvqqtOaaVVdRqNVGDLQ3tFnB3yvYrJkW3nVGmLSaDBI+kCGEfnRXfL2GWi?=
 =?us-ascii?Q?8gVA/FAp9p+euJ5CmquCKG5O8U6+L6+F3TvRdWqV+1Omwhj8xv/8H5+ri9b+?=
 =?us-ascii?Q?XO9x0KzuRM6GTKCxWKa5UM8QXqF+bgSOoTBxCqLNDggT2UMUFtziLRPwiWfP?=
 =?us-ascii?Q?JqBLhlogNr4ctSHiwZ6r/NZQI5448kDGooJqwpwANho/Zjgar5gM3ovdepGT?=
 =?us-ascii?Q?IpcvLUZM7qhB4pMuYezd+o4K2e6wDk4etTD4Th/2jCfysoBmKxU3reYga8sj?=
 =?us-ascii?Q?W/V9yTRzxQEJClakBmDpY3Rjxy2E2DIE91VSyxcH7q7wGtJzn5S1kQUuoF2R?=
 =?us-ascii?Q?ZalwO1payieg6qvOcZymcJosuXkGVTLFpYzQVuWvg8neXnn0WV0BHgLJuoQs?=
 =?us-ascii?Q?OTO2MXqdJWsjgVh93X0qgnIyZqM0idw1IPgMprYqSpXeUASKkxqBJvvmZqwj?=
 =?us-ascii?Q?KZRwbt9Y5D3s/qvxR4gkicG/1emD/N8L15006nLYcsJI4Z/fiGNcCNszBpkl?=
 =?us-ascii?Q?UZ1qhrBEB153ZDYgDtTKsrOTZswOlRom136yNhbrKU+9TlnBhn7cRjl1JqBo?=
 =?us-ascii?Q?JI8fHW14sOBxxYLYT8s2P8pEDcOMVVKtCVA832XineByF09OY6yO90UC56pF?=
 =?us-ascii?Q?Ohg9/kggYzpJGFT/OoYjY1QSno3pmmmkA1dgzxSHu1PyeKNly4xCmZ+5mUF9?=
 =?us-ascii?Q?IGT6GeX83io=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mDcFa4XVRLDSloU+xkj8j45930wiCQerIXLeVB5/qCSAmuiOnWSlPc90zNNH?=
 =?us-ascii?Q?Iwd81yeH34lIbRp4HsMzwiuiFddMO1jMVcXXRD9TJx+/er5CoDCXP2gX0rst?=
 =?us-ascii?Q?T3hzTSeJjYRDqie2WCYDUi3mmK9JYpior2RUGyRUEIFI2m7P8NVt8ADZdIjO?=
 =?us-ascii?Q?/O8ZtE5FesUnh9EZvyGOhgiEUZSQhK6BiEWWVmWc0KCgpJgIgLR9FX73uYc9?=
 =?us-ascii?Q?xNJpuuWlC0zt19gZLqnJFmxBKFX/7hBh4E3oW7NBe7KfPcBv1o362hb/yGvz?=
 =?us-ascii?Q?0xdy/83Ibq2sEpcZitW3ev6LKah9sTF/Qe2mdXi4hTjMSrwF2w4nDNvLgZck?=
 =?us-ascii?Q?6xY7/FrWk7djm2Zjzv6w6CKJneaXUjb9OQv5kOlZdjun6aiYFZfwvxweepHq?=
 =?us-ascii?Q?PRDtMFc6PTwBIhwnTGjuANCgNZekZUjihYSwQkKUFuEWc7kA3xgeVmG3TTlD?=
 =?us-ascii?Q?gDTw6nKbXUupu2Dm0jCmVm2KP5b4GI8gZzIhHsrDc3G1SA2mVbJAIP7XxLj5?=
 =?us-ascii?Q?dKisLW+d6IxgcJcmd77YJDkA79eja7KZvDPsL2q26JXiI/za11QPdnc3Bn+Z?=
 =?us-ascii?Q?qmNCpAk78zUEAHwquy2q65Zj8JOaYnNfw3O2AIRcdIQqoG+lpQIssyGuxWoz?=
 =?us-ascii?Q?kZBw56wnzS8epzzIl7NQgYpNdL6tsLWeGrvnlP3iMNGO4Qospi6vwcZdqOi9?=
 =?us-ascii?Q?FJjyHpqL8foUb/NBt+oSHkU3oQOrc8poneTcXiWTXVZpwd5W/0OoMjkppKab?=
 =?us-ascii?Q?qid24qNYUNnO/p7sSw4yYdNYQhva1kRYMay0znH9+ogoNapIrtzpsesKLrxk?=
 =?us-ascii?Q?IyDTh06vD93KK1O7YduEgDSTndq0K1csWBfCBmjPdceiiOl9lzaZiZFe3Ypt?=
 =?us-ascii?Q?CZYcRQGcI58yDnsSbhsmgrQdfXJygkOzefFyi3gR6v2cR4jglZD+xEXMXctf?=
 =?us-ascii?Q?gwAduIEQegIEleflPmduqyUmOhUuSgYiiomeIPC5DJO5j69NnJNlM2FNgv1l?=
 =?us-ascii?Q?AtBKo2lXG+ukNREJ5GO9i3cjVZlgoA9EvA9Le5msges17FMVl2Xxz7T6NYts?=
 =?us-ascii?Q?GD3Zegk+owhdbhILol3J8c//3nRRNN6iC4BJV0IjLuZQSG/dXWLvTDNkTh9b?=
 =?us-ascii?Q?nu8akzW77kzSnHim0BLCK9HT0a382IBj+CA5/5Hx58g0IgbJooO0XdCVXQ97?=
 =?us-ascii?Q?jwfPkMuNngYtumFGOd20cFc8ZRdfKq44boWk2y8u24vZ8NUgqB4I8N8PDUtM?=
 =?us-ascii?Q?6ngbVKMIsMobrTQqtCgtVU9XGn+X7ZB8Ja4E0v1X/Xa+7Ey1m4WVz7+NoS3L?=
 =?us-ascii?Q?Eim+Wf4mgyC/FSMDQpxm4qCLTghujuv2ppczpHSw1YRB6ws50jmUepU6pdu9?=
 =?us-ascii?Q?q+vOMwGl+sUf0iIHUaqoP1gdcMtTOhiuSLCEjacRvL5UioPiy5FNHCNZHeKm?=
 =?us-ascii?Q?CWHbjsQtGRJSmQ59lMN7nZP/VXP1kcBoheHmzE7pA4FyB9GVhnv4SkV8I39+?=
 =?us-ascii?Q?XjSs3KydZKBmDS6dWTaetsaj8/uaFVovyNV/+o1ZP+yk7Q8ne1tzHV3bNdFF?=
 =?us-ascii?Q?jHXbZxzbNJ/3gEz3NeEkvyp9XTq9T4atB6twWUF7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849fda7e-3d4e-4f26-e9d2-08dd87480ef5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 18:02:51.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7gRDckWOOwKAtB148y2IFojc8xaTlg1M7F7VqHpo8MV8/80ZblOGOdy+OPzVUdH6y7MpYJ0/U5l0uEgAimOnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 07:21:08PM +0200, Fabio M. De Francesco wrote:
> I/O Machine Check Arcitecture events may signal failing PCIe components
> or links. The AER event contains details on what was happening on the wire
> when the error was signaled.
> 
> Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
> by the I/O MCA.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/acpi_extlog.c | 30 ++++++++++++++++++++++++++++++
>  drivers/pci/pcie/aer.c     |  2 +-
>  include/linux/aer.h        | 13 +++++++++++--
>  3 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index caca6ccd6e99..7d7a813169f1 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -131,6 +131,32 @@ static int print_extlog_rcd(const char *pfx,
>  	return 1;
>  }
>  
> +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> +			      int severity)
> +{
> +	struct aer_capability_regs *aer;
> +	struct pci_dev *pdev;
> +	unsigned int devfn;
> +	unsigned int bus;
> +	int aer_severity;
> +	int domain;
> +
> +	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> +	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {

You can save an indentation level by inverting this check and returning
early.

> +		aer_severity = cper_severity_to_aer(severity);

I think it would help with clarity if all these lines were aligned on
the "=".

> +		aer = (struct aer_capability_regs *)pcie_err->aer_info;
> +		domain = pcie_err->device_id.segment;
> +		bus = pcie_err->device_id.bus;

Many of these variables are passed unchanged to a single function below.

Why not pass them directly to the function?

Even if you split the function parameters across multiple lines, you
will still have fewer lines. Plus you will not need to allocate the
variables.

> +		devfn = PCI_DEVFN(pcie_err->device_id.device,
> +				  pcie_err->device_id.function);
> +		pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> +		if (!pdev)
> +			return;

Newline here, please.

> +		pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);

Why use a debug log level?

> +		pci_dev_put(pdev);
> +	}
> +}
> +
>  static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			void *data)
>  {
> @@ -182,6 +208,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
> +
> +			extlog_print_pcie(pcie_err, gdata->error_severity);
>  		} else {
>  			void *err = acpi_hest_get_payload(gdata);
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d0ebf7c15afa..627fcf434698 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -801,7 +801,7 @@ void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>  	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
>  			aer_severity, tlp_header_valid, &aer->header_log);
>  }
> -EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> +EXPORT_SYMBOL_GPL(pci_print_aer);
>  
>  /**
>   * add_error_device - list device to be handled
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 45d0fb2e2e75..737db92e6570 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -56,17 +56,26 @@ struct aer_capability_regs {
>  #if defined(CONFIG_PCIEAER)
>  int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>  int pcie_aer_is_native(struct pci_dev *dev);
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> +		   struct aer_capability_regs *aer);
>  #else
>  static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  {
>  	return -EINVAL;
>  }
>  static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
> +static inline void pci_print_aer(char *level, struct pci_dev *dev,
> +				 int aer_severity,
> +				 struct aer_capability_regs *aer)
> +{ }

I think the "{ }" can just go at the end of the parameters.

>  #endif
>  
> -void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> -		   struct aer_capability_regs *aer);
> +#if defined(CONFIG_ACPI_APEI_PCIEAER)
>  int cper_severity_to_aer(int cper_severity);
> +#else
> +static inline int cper_severity_to_aer(int cper_severity) { return 0; }

This may have an unintentional side effect.

'0' means AER_NONFATAL.

So the function will return that the error is an uncorrectable AER error
that is potentially recoverable. At a minimum, this will incorrectly
classify the error for data collection, and it could cause incorrect
handling.

I guess the risk is minimal, since CONFIG_ACPI_APEI_PCIEAER will likely
be enabled on systems that would use this.

Thanks,
Yazen

