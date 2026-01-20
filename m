Return-Path: <linuxppc-dev+bounces-16071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIJnGZyrb2lUEwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:21:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5D4757E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwTMN64nLz3c2k;
	Wed, 21 Jan 2026 00:54:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768917248;
	cv=pass; b=cEmiMNyornzCbs3j1u18Tjx75NEntYH9JpuhL64UYBp2X0T1+VbV0g7Pd6ATxv9gkozK4mtQMZysuiYFi7g3d3mQIsZIQ7Ray6rbxpbUaBB2Mq4XVyG2Ecr4B6k3PeeN/jd46XpH7nj+jx6MKhLjCTH6liwxOJr/Gi0g/GGuZfGJDzRBdeNRIu/5MVaj1TzW7Oo2uBnsyyFCD3gBQvw+aYs9B+nu+HAdRQOY3H7xOL8oG/OZQiOZ2Xf91VF1OnkXZ2qdG1cwmZIlhN/pCOic466OWcf33+tSFfCSD/3P7keXGlto9Ejk3LXKtYgfMa9/CWzMtqVjCQDGZTUPr0qR2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768917248; c=relaxed/relaxed;
	bh=6yV0MjnIMSgXlCPH6QjRGrABkDPiQV9OrN4wQZMvM8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CfFX/bBcVSzt8BFn+PdysgiogY+7ENP3IvN/bVXfKjehD6jfFheGF0YxVtd3XD3DZZ3cSZqR4Jv/GVN68TicuZ0JeNfC6iS8fMO3lod3B564T0lfsQXr8gpl7FjwQsbGjcnYTI1/guuI2ntuxn/e+W0ZpeVn4Vbk0OBSsEUK8gZk47Q/XbMzFpIC24fkq9YVDV2PHEG0llgZrWSWJBuDHmdj5bSUekx4mN4/Vde9Qqk0deEtH00G3NeExtWGDYXlYyp/uG+TmcvmX/Cx3oB7U78VSmzBN8un/bHiB4J3IQ46vlTnrHw69yTnH5xd4AIcA2llzS3NF/bN4dw0pqOVdw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ctUfXaZk; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ctUfXaZk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwTMM2fWkz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 00:54:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/yAV2OsVWAKUCbeHT8zWYP976PzAXsd0c/ov2sLr4IDvUmwkAOGpSaQ8kc0XkwX1uDNarEb6o2Njd3Fcr2lcrU1F9BlS5+RZsaflO9WLHhtq4daUaQFNA2zCYC39/U4Zjx2T1dOKzfHCuPFd3refb+feRIezuvLSpmvB9HqI5QrlhFUO+PF9Bxzf2HlXTNQdQj0YOROy8K1uaq73jjDAWddMSDxA66Qh147ejJedVWh+heD9ZsTWDePltJMWfrv64Xv5reISWNw0r16LJbmq/ueqVs85K7sEMxP557nDgGmP9B84NXc2/4UQDLPQSpiJA/UCAj3x8kXcBdJZ9oNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yV0MjnIMSgXlCPH6QjRGrABkDPiQV9OrN4wQZMvM8U=;
 b=dFS0+CUNNAIuaW/dX2uOle6juvJ7ykG0teSJpCf5nzXaISVUs7CwgfvtZqxB5EkinAUXOLbEMGwnBNm3eljnO2Rubyz12BMRHvAHpHNgiJDaxT+ULJOmODqsY8Fq/Feg0kG4XKCslweJQSbHXuw/IlP02P9/aSfKl9BuBjkzldo6MOWAKw4biuvt9EFusH78nF20+OxkxO+17d4lt4ZpXDNM1E7f0TLw6/VdWIX3PJ/rkDgeX3mnsdItE2wBDlPShyp2/5HJtaNrrDpz9zX+Rro3lckcK7WMUyeSjmCSCsNDcS7uH8Qc+nmf5AI4Nxd0nK2asF+knxZjQ5/UZHGWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yV0MjnIMSgXlCPH6QjRGrABkDPiQV9OrN4wQZMvM8U=;
 b=ctUfXaZk1UJrlj4hzhLIhjK7vgXAOtVETlQd8NW+XwHiZH8u79q9+725pKkfnuGk4ojBougtFEDtIMjVfNBFPU1qeV94HMCmY4rRPmptco2T4UQlXhe5M6eWNhDpUkdmsosV9dJDsh6L1rHcqqzXPuw5xkTaW86SEY7WBNeDZ61hZ5qzsPF/IclWckkrvmaRffdp0MvIzxThJPmo4faxUdN39M80emo+hkxIXwddMCvc5AqiEp4iAHtZbCgxjbG7hOaRMtBKOu1HorjDv1wNmtPErIJuu8IPafAP8LL7A2RvrZc3S6i7Wf46xz5H5haZ15RXX7bBcP5Q09sQRSJG7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:53:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 13:53:41 +0000
Date: Tue, 20 Jan 2026 09:53:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260120135340.GA1134360@nvidia.com>
References: <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
X-ClientProxiedBy: MN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:530::24) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 71829233-679d-4bc3-4863-08de582b51e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eg9I9g/PdacY1gF8NG/ttlR7nd8IqsLI6dUu6HtqCOia6cHxf0+sNoyOc3kr?=
 =?us-ascii?Q?ITyn05E7d+3k6ItUJKKq93sjxZ7UStWK4nWotPlJCI98eYl7FuSK4l8nXO2K?=
 =?us-ascii?Q?yiUTcqrBFa3vpcuOmUyG+wlSrAC9N9h3hfmx0Ic3+DxpgwPeJpotiQUw5mkV?=
 =?us-ascii?Q?UfK9y/vwylINnvx3JlWB9Gvdtcvev6Cko6GGur9Iup6nP13SbG6hXyhhskX7?=
 =?us-ascii?Q?2Fn4UmpMS8Nli9hjNooQWrTxWOOIvNFzKrWmLXBwGlggZvR+P3oSNHzNTxT0?=
 =?us-ascii?Q?mcFoqn5CjX2OzFCOhNpFdvM8fumQ/a/8/RPq2YoE+ZZIyA9WwKkGPHKntgPU?=
 =?us-ascii?Q?pMBaZXcyfB2cHZ5N5c5dSi38xHE/Up0KTVWyEfJDX0SMB0HgloeydQ7nDMdS?=
 =?us-ascii?Q?r/WLebz1kyyHt9l9J8TXaZ6DUEc29izzIwDrC7VjkdagSczn55zxplSYze/J?=
 =?us-ascii?Q?kONjxqs+TwTG68dTOab1hcmYYFyu/jkrC2UDVv7KfTV4xax6UvFF90zv/uOY?=
 =?us-ascii?Q?qmy7FsmXxjMgXYczWs9IGElB4wDmOWEBs9jiKCMApu3HFqu2k0eqNebn+OAF?=
 =?us-ascii?Q?CtnHuZmlLSPhOuSFrmG/qFAciNQ34lXyezwFQqf4Cn8GRaDHp4fWHIVFltT5?=
 =?us-ascii?Q?x3FNbXTIBbP6uhLBw+FgglQ4vAFURqaln5R2D5rAtcjNHVFwH2WYf42hABHv?=
 =?us-ascii?Q?qovk8HT+quBeJxOWz8i1UjNyVMbmAmi/BbDlLM8S+pIfoKbZ0anabvAbw2C+?=
 =?us-ascii?Q?/O/1qvU+id3gBsgz30DRLJ0+8UNBO3ngLJ804npqxq7aNqOnURCdRyM1cZIz?=
 =?us-ascii?Q?OOM4ZaM0WvManQ8XtndefiqSU4j9S1Qf24zvNio6gH0Y3iiykYy3pAXetNHm?=
 =?us-ascii?Q?NcC7RzzdBmQR6anL9P+VQCIeyhfPzHaRG6tEExxn/ukdDBXyDwXOQ5zlO9cZ?=
 =?us-ascii?Q?Op5jTs2qJvAx2YV0YXTpUOeeiGS7z4JZahDMq7wv7Czn7GNe1kzdBJTu1Z7b?=
 =?us-ascii?Q?BpkyPD566FY5NHMpYwpaHesa0CyAZAb/Pb6gQYRS5TSWMJmUCWdSUWX/1I9c?=
 =?us-ascii?Q?7s1BkBDl85aHmBhKHwhOaRLKBdSaEnCAVZ+Cu4UdOkdTuRy/Xsq0h/0PFKLI?=
 =?us-ascii?Q?vDxoGVVRWbcgRgzrO6s7uLgYe/CSIvmIKD9m3YBuswQQR/5RX0ukKIsezxlI?=
 =?us-ascii?Q?LFBOklOuCwCeE3MWqeWDGKlCq9fxKQCQ/FPCOLdWj6nhdYzE9OkMdsD6j7pl?=
 =?us-ascii?Q?idglFNGH1iP/aUtaz1hzvuvq6gHEQiQVQrmaML0Ar6jo+YwKmUlOfUGLWQ5U?=
 =?us-ascii?Q?kgLaQczlCNa2okvnIIYIj0WqVRMzDN4rF4VuWh+K0bW6shsxRRp7BJjn5Cu9?=
 =?us-ascii?Q?kHmIOtxvZHzVuHVXZWRbx8nM/WL5g8HxYlAH+f3dRIf5zVnRaLQQZmTX8xZ8?=
 =?us-ascii?Q?FN/dM/5wSsx3QE2uCtjitGCEmd+rdi/dNfXt/aEUHe6ezK1SEGOtGJK46V0E?=
 =?us-ascii?Q?D/i2BD66KQlGKRbXMI+2SB8NSLs4rldCChrbbW5VM4H1napG0aO4K4Gq9sR5?=
 =?us-ascii?Q?9ENWTokdj3w42kNTZL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?glynzuZQ9be97VaA8buD1+Epuo30eglKyBCYM1tLXW1XW9OCebq3RPJWWywN?=
 =?us-ascii?Q?p0lZQpcgVt7wB0KEBtnLkwNjRrLw8y/vzBK9JsqT3dAZfQRgp8Gd7O0Qloc4?=
 =?us-ascii?Q?CgjKELzVxI7aC2tztb4cMiI5qjnzHbGeo+XeOAezYUXU5jZlRWIZDCJ8YrPF?=
 =?us-ascii?Q?xVUKqGGbrB9ZLF/ETfaG75KWHMKZTlHWaK8VrHc9IxkEJ+n32nRar96LtEE1?=
 =?us-ascii?Q?0dsoUGqatG5AArLJbO1FlIbQH7AW1IboYNacYGBtrb3v35MvGRGuL1EFZih2?=
 =?us-ascii?Q?DvpAHgE9KozoUkbxEaDu1m+K1msmH2kyidzJLbE9FIA6neSa+b5aIQdFTKOS?=
 =?us-ascii?Q?m6MZe1kzOpLDNyBhdNqwQ5ELVDmEMCy8sLLDV8canDh5t2GjkCVVfFS0xBLV?=
 =?us-ascii?Q?tHgMPnFtSSKPoxr4zAFk/EBQXlkpw0ufyMWxb7xngc2slY8B05ZvA4ta/8SZ?=
 =?us-ascii?Q?CqgyR+YTyjAn06EI3hUqLp1HS4IvOiF6X3oUXF3G5QowCdNDhk0FXJWM4bZh?=
 =?us-ascii?Q?nZzTiplZz/qVlBiVgX+oxBieP+dz2HYvbAsjkUURCaNvymGcdml7YBQHFPTF?=
 =?us-ascii?Q?HijIRbNHvy2OQ3JOkKclF6kziFnsxu175+IAzK/+mGiIB1z32o0+i+typf8b?=
 =?us-ascii?Q?x/ReCqH4l9A3/UyTv9TuYDyqw650WeO6e1j7443NzXQraxfDdJnQCS1gV8U3?=
 =?us-ascii?Q?zOlAXpiv4XkEQ9wo9O9lFbUBES+rPxK9rm4eoxttAk+TicYzzeorpJPv7rGj?=
 =?us-ascii?Q?noFu6upmlrvompjvKAQ43uMw8Tmx6rLRmR8Yz56qC8XdiwfFpPxV6H+KkAi9?=
 =?us-ascii?Q?dnqWMxUyZ9SIQwi802KBLeGh7vkgTWBO1CuvM2tNAXPR9ApaFNLyK5uOamFj?=
 =?us-ascii?Q?dL4hx+xuEZCR2XWpIugC7JsP6wCnJq3jj8hraW3Xj12KKf7fE8gj634/qs8O?=
 =?us-ascii?Q?0YqC3WjISkLXbDvZxe1GAvfbMcXksfbW6NB1xZ8tUhoFCrT+2rZEFBwA4tJ+?=
 =?us-ascii?Q?QPALs6YMoFgE3UYDgDtOjR4ajn1LMj++WL3kNkh0cVxvkztX4hVtz5Y6iBFo?=
 =?us-ascii?Q?eJ/ei66KtPB3+vToH+YGcgQU0RmrfQG4paHBxBM+mEP0ADRNVsPrv+pkbuhc?=
 =?us-ascii?Q?G5Zt4orsNO4fELGOb0QwatsmIoc2JG/QL1fHFdsezJee2k4rD4s+bubA+N4C?=
 =?us-ascii?Q?OgNsHQr93Gs1roPfpD0/fmziDb2qDieg7fweEGV02hBqNFVw5fUnPhTvMiya?=
 =?us-ascii?Q?GPQhqa/eUZaNurZqo6f5DgPpFZsFg9gmLUjqW/8BoOiU52rYKO7JCX6W2Vbx?=
 =?us-ascii?Q?xPCJmW0HqF0yw91+3qeoJyTHb3dkvyWFQU2CQ+wz5T0IqkRyNQP79dJHAwyi?=
 =?us-ascii?Q?RTHtIE2OOXQqs65TSGs8MZzU7BMxrrQrrTOsLv1OAdPTH7bF+InRoowhM2jz?=
 =?us-ascii?Q?rLpUeKMeo5tIjKKay9A0mmX20aogJsFEicnQTbmhvCf9eNvSB04DkxgG0F5B?=
 =?us-ascii?Q?pDq3ECWZMqKo5AS5z51dQnfduk5rDpor4DoL4hobsHNyctw2t2sXoJcpwaKx?=
 =?us-ascii?Q?znKF3oM9Kbpi1EMjcLjrOa6AaUWgtP6MqG9U9QygZfw2LB/PJCOC+/slUAjc?=
 =?us-ascii?Q?ni62H3sBHeffelQ8159mRswsztncSJK5FDJXtQIO+B3Gmp4UEsBnSSOZnFo2?=
 =?us-ascii?Q?3i9TMIxrh+R7JxUP1oDKMbsJLmGeZzoiEROqPePvxzoOAnmrTvyXuDwC1IXN?=
 =?us-ascii?Q?w97NMoiCrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71829233-679d-4bc3-4863-08de582b51e2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:53:41.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku7KMIEOtPh7gWQBRyQBeG9s/g1lvhq/kYisr1/5PylT68RySaM+h45Ib3Mi9DWv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16071-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:balbirs@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:matthew.brost@intel.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,intel.com,suse.cz,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 71E5D4757E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 09:50:16PM -0500, Zi Yan wrote:
> >> I suppose we want some prep_single_page(page) and some reorg to share
> >> code with the other prep function.
> 
> This is just an unnecessary need due to lack of knowledge of/do not want
> to investigate core MM page and folio initialization code.

It will be better to keep this related code together, not spread all
around.

> >> I don't think so. It should do the above job efficiently and iterate
> >> over the page list exactly once.
> 
> folio initialization should not iterate over any page list, since folio is
> supposed to be treated as a whole instead of individual pages.

The tail pages need to have the right data in them or compound_head
won't work.

> folio->mapping = NULL;
> folio->memcg_data = 0;
> folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> 
> should be enough.

This seems believable to me for setting up an order 0 page.

> if (order)
> 	folio_set_large_rmappable(folio);

That one is in zone_device_folio_init()

And maybe the naming has got really confused if we have both functions
now :\

Jason

