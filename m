Return-Path: <linuxppc-dev+bounces-3736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9F9E248A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 16:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2lTY6pdpz30BY;
	Wed,  4 Dec 2024 02:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733240993;
	cv=pass; b=ClC/YQhi79VSlr4Q/7P4qB4/7+qZr3uoqVflJQWlzeZgFKPmWgd5PivKPrSU4s5GZwDj45uup+GZ4YxXcacW31VZe8OCPD8wUfwTbwpAX65ixTIK3rFtGJQ5RB4escUdN6dSXZ5SrQ4NMLnE9Ga3I+Oo23ncek8bcl8LmbFtBte15JMd0Bmz3ppfV47VvoQJf/Q10anUerHddjvKRLp5gP3OfJ55xyLo6IqN7pWafmsKR8ByyaS69+dOFlOU6o5silcVswc6KCaVIFppIlzIA5QgHoyoU7VXn9g6hHEJ9fLjf3N09oI0J5WouGRJEPZBFZ7rC9xtTt2sp3/05xATPA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733240993; c=relaxed/relaxed;
	bh=O3Emd1vT1DYb3cYgAIjUW3Qdoxh43qgsj9eFNoRnahs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gV7b1NF11IZLqxv3YRVHSfPDs7lofUrSo34V6rULdMUuclxlWESYQCsKzLzeUSnNABW7drIsqrEbZ+0nkseMJK6AiIyYNqkyVErM8Nd8ILdJqaeoD7SRUOJNnxEKv/zUEnO/TfSPyz1nFkQl/DPbGXHd780jZNYoOJci/PRFDX30sfpWrtU+g8tIaEVlNNaQ/N65RzuqGE1kQpQLhE7fe4fBJWiaY2lsySpaFUvTWhLiRkYtvR8xCUgac2sHkEY7Gcu03cX6OrbGX3rACQaPjzKH+qAFScXofBnWb+fxJCmnYtycpTJ0kkzBjcuEBcUAs1+aomdnNM18QZOe4cIYew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HvAa4P2A; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::611; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HvAa4P2A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::611; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2lTW72B2z2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 02:49:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU6q9QfY08jaMiIb2CyN4pklX+3GXPGqXfzLRQseCQ0j0gvbXMW2yNfOV4Rt0e0FWOZkOvXlmQxCO7PI/I3EADFDqunk/jzfmDDdEtuCNVkDqua6ibJfTiaOEI8370HSWSc05/RxhL8VwAfeoi9tROSDXreszZQHU8W6MjubGt8E9Ce0mMo3wLAXfXd22h+Y+RpP9BJDLb4t7icCW2czTciwTtaND42stgScvvDAh9FhYa/w2dV8NRBdJzJmmZ5uMrtm/wZj3VJJs/heIHXKiEtjPNqq2pVkag1tYt/DoritL6WUEEr0yd1Eci3EYpzrlx6qprDgeH2q2m6udiSX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3Emd1vT1DYb3cYgAIjUW3Qdoxh43qgsj9eFNoRnahs=;
 b=EpymuZLAiMgsGZcXHLTAny2iS22xX0KusDYyMu2DlGdjxLY/1TJiwPVopUP/uTv4TlNeKYFFmjsDxKOX0AHhPrWiBGgbMUgazUHmy6BaACet1rq+u/EqA5ff5t1Lr864UcqWKf+ZmTwWpy+zQZeODrLsUmC2j6gpD5RUpbJynwVpjviQqgnM18dPEu3Venxcqejd+38545RxPJXySzC3c+SuMP6I8yOtvBsGelwdKdPZAomNpaJnhN4NINnCSDii7pBUzHvNfYLqSyJ8bs1rl4C8hCah3EEgdf4Zj/Kk4DKSzy+rYzGXNtj8s12rFsfqSKVsltk4KsPNOByTOWpIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3Emd1vT1DYb3cYgAIjUW3Qdoxh43qgsj9eFNoRnahs=;
 b=HvAa4P2A1jhYIf4EfVhwOB8+pciEjtZXGxsKlaVjy9Jd9IRsmuo+oOuGNvtnWddOuZaK5+Ee4PBpZegrpQGyeEn8wJWD8y7KMn9b/yQefKGpMhdf8DFZg7stB5uvzmTVC0KXtWg070hRcQfy2KitYzJPWwBtswckBHBoQ56kO268L3Q8yMfhU2gSsQ7b28sEtZq7T7fwNH1xxNDJIUPFdLu8qzxQoHAQDBz592hI/6aBhY1az45yL6nx3wELKUzJyMI5B4ahvVwMn6UYlRo3gnh6EHIOFrKHk4Xd00j4OTzeqCQ8cTVe1vyvCGLOoRD1AtXyNiu2YaTnVBEsdKMAFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Tue, 3 Dec 2024 15:49:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 15:49:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
Date: Tue, 03 Dec 2024 10:49:20 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <498871B1-D26C-4934-8E89-C6C8ECE8872A@nvidia.com>
In-Reply-To: <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR01CA0036.prod.exchangelabs.com (2603:10b6:208:71::49)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: b8399739-caeb-4e36-bce1-08dd13b211fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE9pWmRleFZqdTk0Z0E3TWljOHphTTVPcWlLZnNQVFpoZVJKendoQVhvcjg5?=
 =?utf-8?B?cUFNS0ZsQXFFY21uR2s0OUpHcXMxZmgvc2xXRFkvRjBqZjI2M3FzNjhlQ1p4?=
 =?utf-8?B?ZDUxZGJOZHBtZU8zVkJRcDRHbjhrTWpsWGFLd0xVdU9iZzg2dDhRcS8rSGpG?=
 =?utf-8?B?L1N6SmdaUGwyZWpYVWxZazAyc0tXVUZmYmcwaDB5QjFtZWlrQ1ozUS9STFJT?=
 =?utf-8?B?UXRlY0VZWG5aOGtFbkt1MmFPYnpYdDBRZDNpNy8yMElhR3g5WnBESWpraHpG?=
 =?utf-8?B?QU8zR2ZTNVlHR0gvNW1yekhCV2hWKy8xbWhwNk5kYmo1T2s5VUkyV3p4UFAz?=
 =?utf-8?B?ZDM4VFZESWxUQmwrVjYxcDRpeHdubGlPeEFlM3JGK3JsY280OXNjc1BoT1Rk?=
 =?utf-8?B?am0xNDlPYzlhbkxKV0gyQm5ab0UxOGpUQnY4aXdhQldyY2pVeE4yVFh1VWc4?=
 =?utf-8?B?djBqV1RhbVp4RGtxeGRWUGhybCtvM0V0c2d5TXNtbmd0Smlhb3R4U01COUJr?=
 =?utf-8?B?ZWl3WlN4cTd4emVGWGQxN1laZ3BZNVdSQkxLbXJ0dUtWYjdJL0J6WUtaNXVk?=
 =?utf-8?B?dWNscEJodTJnQnNZblZzbVcraTZnVVB0OWlYekdEUFRlVXE2UUQ3MFhrbTNL?=
 =?utf-8?B?cmQvSjFhK3BwazN0dHJwQUhxa1hKcndPUGNJRktNclNudDFZdWI2UGN0SEdj?=
 =?utf-8?B?cVA2N2JQa0dsQml5Z0Q3VENwSVFjL2ZWK3ZaT0t0VmxoK0RVb2pjdkltbHlm?=
 =?utf-8?B?dTU2OUxBNnN1U0dmTFoyLzljUnFkMmE0anFNR0FvMW9LT0ZGWk5iYUNpTTNw?=
 =?utf-8?B?dXlUNkZrOEpLTUdTSjgyM3M0ZmoyTUF1K3ZhQ2NsSlQ0cUhaVGJXWVBGV2NX?=
 =?utf-8?B?dzNMcnAvSkdQVVlsdGhnMXA4aXBva1RlZzVNamFpdTZkVnI3bUpLVVppWkcz?=
 =?utf-8?B?Q0IyenliNWlUai9UazY2VGJoQUpGWC9VcGI2cjl4b0JZUnlrYlNVOEQ0Z0o4?=
 =?utf-8?B?ZVR1eU1NeFliaTBpYjdZRUNjaGErWWt1UXYxWkRWdWo0bmxISWRKcVNhRko3?=
 =?utf-8?B?UWFlRklDREw3eEx0REVWK0k1bkFDU094bGZSN3VtbnZ2TElTK0swdDRHVHNv?=
 =?utf-8?B?M0JDcmVtK0NtUCtHQTZORDdmOFNXN05ZWWswUXI2ZVNYREcyeWxMWkJJbndj?=
 =?utf-8?B?MStjR2h2bnJnaFdXUFZQbzcwdnJ6cER0Tk1IZ3ViNWpGK3cwdjhjTG1iME5j?=
 =?utf-8?B?VW9UK081M0lBbmY5QUJ4MUxZUEFPT2dVck1pQmJrT0NFMm43TEtqazRhV3F2?=
 =?utf-8?B?WGYwWjYrV25YbGZXd280TkoycjJZNnNiYVV4UURVRExTdFVBOW5VcUlYZXFY?=
 =?utf-8?B?enJ0MEp2K1ZQYS9PZWZrNkFVV25Sd3BHTU1UNFhHZHhjejhGTHIwU0dEWHRK?=
 =?utf-8?B?L1A3ejJxa24yZW9hbGYxYW5RN2FtNllVcVBvZXc5Rlc0b1dTZ2xHZExrZ2dy?=
 =?utf-8?B?TURxYTl4N0FvYjFuVk4vcm85dVY5aTlkZGd0Z25XMlo5TXEyQ2JPaTA3NldL?=
 =?utf-8?B?aE96aHN0WWpyQkxsZ0lFSy9jTjZEeHhhNk1DWnNGUUkrTWk3M1NhZVk5QjZL?=
 =?utf-8?B?NGpOVm14TFloSXBwTHZmZUxUNnhYTTZuSWt1VGZlcXQ3N0JyV01lMDVXTSto?=
 =?utf-8?B?VzdKTVJPWkJQUWd6WkZ3aG5tbm5GVHF0UGl0MG1wa2ZWYVl5T2xUam5EczMr?=
 =?utf-8?B?YlEwOFlDRE1qcGFBdWFIZ3VPRnpwWnM2Rjg0eUZrbCtzSnB2MkVyR1l0T0w4?=
 =?utf-8?B?MjJFS0xSVnlOQVMvRUR6UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJNa1RHNFMwc0R0NGFUTi9jTnVhbHFBcFVKY1BqSEljTVJQWXNZVkhxZ3FL?=
 =?utf-8?B?aUFHdW4zOGVoNGwzOUMrYzVjYlBaU1J5b2dlcWFCVDlEMElIMG9FR0RMYXU3?=
 =?utf-8?B?Rjc1ZEc5WFhONlA0NXFId2FpakYrNXdZQnpPTjgvQ2lXTytza0NXVjlvVVJp?=
 =?utf-8?B?VUJ0dStDVkpFb2YrUzhNMytoVDdUaHkySVFKL2dGcDAxczFMU0RDVnRuTnVW?=
 =?utf-8?B?eG51OGhtYm1XWUtTWDE0Vnk5d3QwcndJaSttcVk1Q2kvTXAxeUh0eDZlTTRa?=
 =?utf-8?B?RnpaRzFzVkVsRWxaTHp6MUtWTWYzMFIzV1FnN2lhWm1RejYwUTdySVl1eGhh?=
 =?utf-8?B?L1Rkeno4bmlKY012RWhkem5yTzVBZnVLbDZCQjhmeEoxVzFxR05rczRrS1Iz?=
 =?utf-8?B?M3YwMXFpcDVEL3owUWljb0hRVGRaVXZ5Y0RwK0owVllmVXBsR0pIQ3R0MFo5?=
 =?utf-8?B?eEREL2Y3ckxrVXN1WXJqN3hnYjgyb0FhNWUwcktqeW12WEhVM1RRaTE1Tkoz?=
 =?utf-8?B?TFVqVHd5SzY4bXNSUDRHSzNiV09Bb3ExZGkyMHlKSDJMaS9QSHFhMTlCY20w?=
 =?utf-8?B?YU44aEc0bUNabjhSUEdVRTBWcjl3ZHVZaHNLSnh6azh0M0JsL2k0Z2F4c21C?=
 =?utf-8?B?ZERDWm85S1VGM3J4Ry84QkpTalAxNTczdmxYWXNtcnlvVE1lRU4xR3ptQXdx?=
 =?utf-8?B?Z0p4VFN0K05LZW1Qby9wL2gxQzJmaTNWY2xsMGcwTjFmUkNhaDM1eWphTWx6?=
 =?utf-8?B?eTBOMHlCcFFZRW8wS1F5b2FOaGo0VnhCekxzNDBTaU5nWWNmNitGeTl1NG5W?=
 =?utf-8?B?c2s3ZEFaTENHaThmbU1kM091VWVUTmJKZDMraER2TDA4L0NHU2ZBdzRwUHR0?=
 =?utf-8?B?Y2VIaGd5aElzcVJmU1l6bXgvWmY0SDFpMTJaY1NRNTNRYWNQblNsZG1zM0ZJ?=
 =?utf-8?B?cDRDQm9zbVdNK08vQ3pCN0YrUS8wRFY2SG5Hdy9OSkRCQkpBMHZhRHprYVIy?=
 =?utf-8?B?VTB3bVNpeUNKL01mTEFDK0dxT3hsUHJNUmVIbm5WWTFQL2orR0FzVjQwWTBU?=
 =?utf-8?B?R2FTait5aTdYOW5YVk1UWTlzZ1FYc1pCWXg4ZW9MNHF2M2hHMFozcEdudHJj?=
 =?utf-8?B?bGpPUmM1bSt2My95TVg4WEJRRElYUTdnNC9oMkFFQjNETENBM3pKVGpyR1M5?=
 =?utf-8?B?eFZycytkMTM1OVpIa1ZSN0tjK2dGZkVzVEgzM0REbE1UMFVhdnBKWUtmKzFy?=
 =?utf-8?B?c2RPcHZ3c3ZicHdNeTVrSURMMm1Hb3BHVnRDSWFlSitRdCtVUWlDcTBzZFRI?=
 =?utf-8?B?bUw0dmtxSndPTU0rRHU3eFdEUElYWlB1WlNuNXRERkVxZ3JOTlI4ZEpuS2FC?=
 =?utf-8?B?V1ArTE0xeEZ3REZ2QzRkTTdzMWtjUExucDIxdjBXZytPMDVUY2d2bkQrRmov?=
 =?utf-8?B?YlBDczJWaWtEaEJGWmt0UjZ2cXlqdUlEUCtDRXhVL3dtQmdRdmY2aVFMejNy?=
 =?utf-8?B?ZDJBZXN0MW9ITklsQ0xrSFVoTHMyZ0k3UitXZjBUclZ1bGFlVVZPdzZCVEVy?=
 =?utf-8?B?WlpvR0M0TWFwS3grRU54UXlyMnRWd2JoMmRZN3lid1ZwK0RtZlVhOEYyd1NJ?=
 =?utf-8?B?MHEreVVnL1JFS2hyaUM4SGRVc20yV3dmdkQwRUxYZVRJbWxYMmsya2t4M2VY?=
 =?utf-8?B?VTJqcEdrQUN1ZlNmcUdBdUVaa2NuRk44U0hkRjFib3Q4S3o2L2UyTXJqMDVW?=
 =?utf-8?B?akg5VnJxbHVPcmFMRmxkOEhMMTNkWW84L2NoRW1nSEltbzZieHRjS0tVdWZG?=
 =?utf-8?B?eEhtNHN0c0xKT01jSnIyYXRybGhsMjV4WkhaaUVCTHFiNjRMTGttOU5sTkVG?=
 =?utf-8?B?NFc3dnBnSCsrbW9KMDM5aTgrQ3JKcVplaHoyaFFYRVVQZHFESzZtbm9GQ2tl?=
 =?utf-8?B?RkxrMVZQOUpNb0w0MnkvMnJ6WUhCYk91WnFvdTRScTc2T0tNbUxJWjU2RFdD?=
 =?utf-8?B?UVhadWdzWWtPcTZkN0Q1eVpSTldGaWl1WFBOYUIycyszaXYyRjgxZ25TM1h6?=
 =?utf-8?B?MlpWREF2a1ZjUHFYcFpSQ0hyaXVlcUxmTXR0UjM1TGxVU2d2TXE2NktiMUVU?=
 =?utf-8?Q?W7a7U2vPncpWyMuWHonCVSnBv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8399739-caeb-4e36-bce1-08dd13b211fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 15:49:28.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FifDrhG/ZMTXUSlVzKpA7rekzfeanwDeo1Zi8Fs+0ClrFlmvBmWS2eoTTmt4DJmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 3 Dec 2024, at 9:24, Vlastimil Babka wrote:

> On 12/3/24 15:12, David Hildenbrand wrote:
>> On 03.12.24 14:55, Vlastimil Babka wrote:
>>> On 12/3/24 10:47, David Hildenbrand wrote:
>>>> It's all a bit complicated for alloc_contig_range(). For example, we d=
on't
>>>> support many flags, so let's start bailing out on unsupported
>>>> ones -- ignoring the placement hints, as we are already given the rang=
e
>>>> to allocate.
>>>>
>>>> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() =
we
>>>> simply create yet another GFP mask whereby we ignore the reclaim flags
>>>> specify by the caller. That looks very inconsistent.
>>>>
>>>> Let's clean it up, constructing the gfp flags used for
>>>> compaction/migration exactly once. Update the documentation of the
>>>> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
>>>>
>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>
>>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>>>
>>>> +	/*
>>>> +	 * Flags to control page compaction/migration/reclaim, to free up ou=
r
>>>> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implie=
d
>>>> +	 * for them.
>>>> +	 *
>>>> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL se=
t,
>>>> +	 * keep doing that to not degrade callers.
>>>> +	 */
>>>
>>> Wonder if we could revisit that eventually. Why limit migration targets=
 by
>>> cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? An=
d why
>>> weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?
>>
>> See below.
>>
>>>
>>> Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
>>> __GFP_NOWARN in few places, so it's mostly migration_target_control the
>>> callers could meaningfully influence.
>>
>> Note the fist change in the file, where we now use the mask instead of c=
oming up
>> with another one out of the blue. :)
>
> I know. What I wanted to say - cc->gfp is on its own only checked in few
> places, but now since we also translate it to migration_target_control's
> gfp_mask, it's mostly that part the caller might influence with the passe=
d
> flags. But we still impose own additions to it, limiting that influence.
>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index ce7589a4ec01..54594cc4f650 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct com=
pact_control *cc,
>>   	int ret =3D 0;
>>   	struct migration_target_control mtc =3D {
>>   		.nid =3D zone_to_nid(cc->zone),
>> -		.gfp_mask =3D GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
>> +		.gfp_mask =3D cc->gfp_mask,
>>   		.reason =3D MR_CONTIG_RANGE,
>>   	};
>>
>> GFP_USER contains __GFP_HARDWALL. I am not sure if that matters here, bu=
t
>
> Yeah wonder if GFP_USER was used specifically for that part, or just rand=
omly :)
>
>> likely the thing we are assuming here is that we are migrating a page, a=
nd
>> usually, these are user allocation (except maybe balloon and some other =
non-lru
>> movable things).
>
> Yeah and user allocations obey cpuset and mempolicies etc. But these are
> likely somebody elses allocations that were done according to their
> policies. With our migration we might be actually violating those, which
> probably can't be helped (is at least migration within the same node
> preferred? hmm). But it doesn't seem to me that our caller's restrictions
> (if those exist, would be enforced by __GFP_HARDWALL) are that relevant f=
or
> somebody else's pages?

Yeah, I was wondering why current_gfp_context() is used to adjust gfp_mask,
since current context might not be relevant. But I see it is used in
the original code, so I did not ask. If current context is irrelevant w.r.t
the to-be-migrated pages, should current_gfp_context() part be removed?

Ideally, to respect the to-be-migrated page=E2=80=99s gfp, we might need to=
 go through
rmap to find its corresponding vma and possible task struct, but that seems
overly complicated.


Best Regards,
Yan, Zi

