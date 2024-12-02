Return-Path: <linuxppc-dev+bounces-3688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8B9E0E97
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 23:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2HwC4wvHz2xVq;
	Tue,  3 Dec 2024 09:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733177275;
	cv=pass; b=GL6XtqeNXZu/0Q6T9ODxng+1ezKIIqwzz3uGWXPAApNJfSYlX9rNrprFkzH3N7rlIYMGFPF5P3xgN+u4VkSdoRJ9dBlTK8DW9U/AL3XThv53HrbO/fWrRlP7G4o9j3AzYhJtn55RM5To7hgRSmTxHTZwJQYCyzC9XPX+oD03jK2g4el1rgMhu6T6gRIFf8Rx0eoVc5Cz2VOqxh50lZuxka+pwzC9+atELG7OHUGe1zdEpaG/BUmdQOufIHwykDp7UVA5tkhHY3MIGBTMZHB9cwThUJae3Yu45OrKCF/TLy20y+VmKv4aCZJUTUxzGAhYcsBLn8jpoehKQH6YvdMTcw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733177275; c=relaxed/relaxed;
	bh=mMMbmvPqaPauF5Wn1W3WmMn8etIouaslOI8m5RlKBe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XEcfa1FTUcV3XsZPe5U4de8UvaVpTiSTcbpaUsGK1bXbUZIDRRnpmF5slO3+dN8Kb3zKaw8CNYKLGFPP3X39xkhyicWLzMjXmJ10m2qeEE3IijDlXyHdpsUFWeVC6rkAISlPyOu1ZAtmTye86VP1iLa4ktKfukV8jfG6P5O2FDHpRzQ+uDFCP3Hj6CImAt93bB8+0tQLVXGq63zQ+rxJSntdUv9aFFeBtU3EtVkrMscWQ4tsLn7O2HDtNcSzrvDiHPLEGU7q9rlktTSLUwIwSJu1V3UIib1B8SFFX3aOd5Q4Xm8GGXBJqeAH/yShAY/XKr7i9x8mJ8hEyeF/JmTdrQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tyJ4G0jJ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::62b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tyJ4G0jJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::62b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2HwB24bnz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 09:07:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfTEt0F7ig6sxIjECSHYvq+F4lFS6waUFnKRoyT3LIJi+55jfdfD4lCxPRSakLiCfToDTDm3JegCo5Ik6MAob7Y0cm/8ZMYg8CbGXK6WLO0u1TCrlAgURQUy1qBS/GcxsT7r1t9AHVLCDy3aCYBI1bAmNEzlZRovxjzMwVMvw0zJWCaY07SmzVprCGRKzo8ls3gvKWyJq8yjszGHTBK+nzd+3E1End/SZI8nMFSUMB0Ee1tIrNrPBk27Ga4bgIiAFdrPXpEbFFyPQxOxLcgbq6hS3+KeF4r6Z9GoOWMKqfyVxDZ+rj/AgpH+xZzGGJjuLKWXzKC0sJrXh/elw+ezrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMMbmvPqaPauF5Wn1W3WmMn8etIouaslOI8m5RlKBe8=;
 b=R0WI7BPnJJON/OmRNgbE1kuZ15vjQoN+PMKHbtzZ1HtnZFJtxPnIkIbov4grW6/m5UUE0wcmuygA6k3Jvkis91ykfTWxE52atsS7lltOT6X4+ewyvQUDZjhQjlLMEZ1kYbfhaTSvvBJtF8QBHELA2fQjXQ6NJfwF/gYg/PrlgBJbPLBDglTaFFvHGwqpiZ1kBWvXKyPdyBSKvQbpngcJVoAZ5PXOe1HE6P/zeg3LvUJ2KSr/QUcza0z0VmkrQR6XusGng5iO/e+g+gwn054+X2yZ3K8F2M9qLfiuSZmKMI8fDE2lq/A4o8cFsKEMMlEf6JsX/kH/q2xP7MPafUXO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMMbmvPqaPauF5Wn1W3WmMn8etIouaslOI8m5RlKBe8=;
 b=tyJ4G0jJ7V8E2vYcEDbsa3CIkQqduhQGxpGeE4kAEBP9WHPtnhj8e6OJ+KeilepfaFbyDQ2PwDiH3326A0pHW7EhNSlfPG77cwX10RHCp+kL/6tSAx4l6p1WyNdeqtPB6tKOfIVSD4901eQZQOi0bWpbd138UgcikRPmhN3YKRQ9CsA0K7YEHOyQ2CA9L4+pyCGcc4Ek8jxSYLxI42jO61wHDAkkzcAVcKdkVUH3DED6eFWgCEfaTgI9046qABOUz7q8hockTn7MiHQU531nzUe7h/X2qwysGpcAHA/txD8kqeAjoGT0UxNcZLu8y2ZyN+l12JQ/sEt+7g3v0gUl8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Mon, 2 Dec 2024 22:07:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 22:07:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 0/6] mm/page_alloc: gfp flags cleanups for
 alloc_contig_*()
Date: Mon, 02 Dec 2024 17:07:26 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <6CE8BCE0-BDBE-41BB-9998-D9165CF05A1F@nvidia.com>
In-Reply-To: <20241202125812.561028-1-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00013E02.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:18) To DS7PR12MB9473.namprd12.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: aac3bb5e-86fb-4e92-c168-08dd131db62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iXgnWa5rT0iu64/jEWhCbaOa+xPeOx3SwK1kJhZ3yQzHAawWykWe41yjJEd3?=
 =?us-ascii?Q?ntdh74GWZ96fNdIOCg5FBtwMkeS2VhglN8f9ZZzN+GjtHtaDbkwYIn9bZJiE?=
 =?us-ascii?Q?VbuvDe+Ml5cZ3k8KSIMdFW6dyLHGc1vlqifATN8etL/3ODGQ0ITzH3Jy/ssi?=
 =?us-ascii?Q?XO3fO89eZU5Z1mnAAlZmscp6a+EKgzPoahXKDCtzcCZRzPruWHDN1SEgx24l?=
 =?us-ascii?Q?8d2Q5Ov+M6YzxJuv979ozDL4+HptHL6zn1/3jw9RjJGZWHGZPtCAHt4odjes?=
 =?us-ascii?Q?LMk+koV1rEbXwi40A/K0XK/aL7gB1GnXYfBPe7Lcx8xjCB1ozpDl4yJx+hGn?=
 =?us-ascii?Q?SauYTDcdPRuEXs7cHcCW0amp2RmFvdKvnybq8j0w5f++A9K6Y0FlDrFRbGgW?=
 =?us-ascii?Q?tPOrQ7V4Oc56R2nwNGsM2Vn5zJ2MLYGL2Z+lT24Xc+R7shVcNIPfm0IVEO7i?=
 =?us-ascii?Q?LkHq5BvNhm1qX1XmPW7VuRshmUSzgoEaF8OzjEHOXQWi8o+u2UxRT4HBsJ4B?=
 =?us-ascii?Q?Yq8PFcFM+RWSCXv4YGIZ3sJlCoPMJmGyS/RbUf9+3t1UzWZWeIsAbSwVpdWD?=
 =?us-ascii?Q?SjinzNgBvH3IcdEw6zibQYYd2zehmxCH3GYCryKK3RrBOcgvxGFkg9oAfILC?=
 =?us-ascii?Q?+yPzHSubnszn5b+rmjvO1w0Dqr9EyGbJrSrxdW0pVbhF34lU7EBo1I3ASdLy?=
 =?us-ascii?Q?H61F8n0W1aEerEsrPp0hzE+mUs7KfJheBV/RM2Tc8Yp5ksTGVBGLPOEQ+ZNM?=
 =?us-ascii?Q?Te280so09IswH0IQTyxQ8P4lH7QYEibW+m5P07J9egbKJQEovqrG3mj5DS4X?=
 =?us-ascii?Q?VWG9AfMl9Z7xnjIa+u8LaORCg38O8RpOLZV3rbPqcfMVc7Y4G1XKXKZHcChp?=
 =?us-ascii?Q?PfMttzePe6kk8K8OHXmZt500oKefY2IKrs99KapZ2pQESb0M2q421kNFau3Z?=
 =?us-ascii?Q?HPMHfykuo82v+BUlmhwZiQF8hw5CpTuFxbprk+u/AQb5kKLY8Tnqe9xuZthh?=
 =?us-ascii?Q?CkGxcujKywoMvkGPFjPwptC/bSg8FBndTM6xy9ZTj2zVV5U931fn2glGX3oM?=
 =?us-ascii?Q?OoiCFUXAX2VEFHRcBxBP9m6Pet0+4qRQzYM7GkRRr8NRp3tldF1OJIyEyM3v?=
 =?us-ascii?Q?KDlGNHuGOjmC7CdRM7WR66xEHwwPXOJLsLhIEzvN6XrXK8NCOVi6frcclSJb?=
 =?us-ascii?Q?fuXYjTn0bcH9eXwaBIeZyAAptPHrmlHOYLkM6FXTmKB3OWYLby1UxnXXJIch?=
 =?us-ascii?Q?IFPHYosxMSMAB8Ovnea9YVqoT9J5xOxlryFsvnQjcUf2huF8SA1VBjO8Woef?=
 =?us-ascii?Q?l3DKgMRgFWZC3v2S6rz5ZAvAv2LEvlPgAlhknaQFF1xVsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+0waCXEf0ZrxffSHmYOK19Y2dXoyAn4HJ0QCGzIosTgIGsuZidQW1O2yZLQ?=
 =?us-ascii?Q?1t5DOr/SwvgLI7KHm1V4A/Os7ghRdPaFZIy0zuUpNczP/obz0KNucJCrqjcZ?=
 =?us-ascii?Q?pnzFzQj5mrrPhC/csIYqg4FX4oEf8LndmqbEEnnvtTggKamO6oiz8QEgQEQ3?=
 =?us-ascii?Q?9jkP0rjuTS3ckl+DefWlj1Pfh9nl0PHZZRzKgvAj+s4xa3Dc9jxer5f/rpK3?=
 =?us-ascii?Q?6hFZsYqjgYScgceEuX6jsdl7aZ6OUm7NDLb4qPW3SA914Many4ZG/az7Qoj6?=
 =?us-ascii?Q?3ftdhiAuCAQnSfo7hFYS8YSb2Sx8FFLH1xBUP+ElDfXAgMi2eJam54dg1fDH?=
 =?us-ascii?Q?ywOgF1OHHGrCaxcbRwcR7xIW+HajxMCpaj4juyyy8FI8A6wlvFLknEbVl9I8?=
 =?us-ascii?Q?ZchDTJVeESidzZEfI9Xv/IORfNWvIheP+A+ZKoOcAfYSTWxZCxUKqMSaFjgj?=
 =?us-ascii?Q?Qjhh1nEHYp4Y11X2AXd2wo8glDegctXOt8tAUgZn/AvDNnnhY1z0R2D0b++t?=
 =?us-ascii?Q?ph08IbyiRuPewM6DP5FLo23lOWb/MY5CLuQdRG0PgEkKP4/QEvhh2VoE8hs7?=
 =?us-ascii?Q?56ZJ+UxnNPCTMK02eFI8LYq5B3zmgC5aa7vG2Ozd9rpylBzBV6kXNLNUY9jg?=
 =?us-ascii?Q?ig9QU2oWM+84BBA9enzJrPihvNC1rDpt73yrWklofsJ3wXzFHOPR/Y3D7mky?=
 =?us-ascii?Q?Yw6xH444cfQ2/ek8r5ZL5dgtPeX2DeXeuxyZv6VRZkCbOLbnziso6LHVK49E?=
 =?us-ascii?Q?w1qfFMQW4PRGrl0trz2hsCLRADhn2Shl/o06/NTiJlDOz6k4qdzF5ICDipbH?=
 =?us-ascii?Q?lwqWbTH9wCuLglJeV6PwDE/0opOlBVPLho3ogJBpnsDQGo+gTDyw7LtB6R92?=
 =?us-ascii?Q?Sia0l3sPLaWPyvaYLrk1MPn/cmmMl6GjLZ1vrRuxD0RITi9Fi4WMCj+PNpNb?=
 =?us-ascii?Q?N5YdO6o+UKxLJXOEzZZQykzxSoOAXsJASi9vLQZGQcuNFEZFzo2iOkZSECzJ?=
 =?us-ascii?Q?RceaeUqK5TQQQbpaK6CVXGBHeioMm/O+v2jlug58VFJzUKNlipeyo9eoSy9X?=
 =?us-ascii?Q?KIAEIBAzoCl89DKgwsokye2QvrAF620HliWuklTOLpjE4ly0Shc5V9dhRqSw?=
 =?us-ascii?Q?dWc/mf5BG+HZJAXUGqxPezFNMJXSLgsh+sqpSLvLwhtjxi5pCfWCwtCtY4Fd?=
 =?us-ascii?Q?+vUUK02WXB3SUaoovf0kYuDGk6qz2qhZ3omC8PgPfOUCi3fT+AwV73ms+rcs?=
 =?us-ascii?Q?X9CI0Zidu6tBZ6VeAQd1Wetyvj1OyeVxi1YQf31m+As5XYZ4xoie6P4sweCd?=
 =?us-ascii?Q?+aYVWF2kBx1LegyEyj3BXuQkKcxQQF7YF0O73wU1NBSpom4pH4uc0yZQdXht?=
 =?us-ascii?Q?H/LGtKKVuJsvPC2AWXkPD5JFV/qmdt/L9NyeO9eBNGQ/o418AW9hc1GI12hC?=
 =?us-ascii?Q?1LN7K5SmWDktq7XRDjxpkDzlAgV4kNXR8gDl6tKg7qNtH8WL9LDfDI5tTJO1?=
 =?us-ascii?Q?9mDVq0GT9edQOXUXLI5Henb75Sxw5Lo9FYePOmAM/8ZsZBx14395w2gEF9kI?=
 =?us-ascii?Q?nsAjt/o9FCEtshFuZXIrDYoegjyU2FwP5+u81SC7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac3bb5e-86fb-4e92-c168-08dd131db62b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 22:07:28.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDVco667ytu1WzuwqqQiE+jxsiljVmiND5JCh+CN+u9wG9Dh7z2P7/j/WuYaJ+iy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2 Dec 2024, at 7:58, David Hildenbrand wrote:

> Let's clean up the gfp flags handling, and support __GFP_ZERO, such tha=
t we
> can finally remove the TODO in memtrace code.
>
> I did some alloc_contig_*() testing with virtio-mem and hugetlb; I did =
not
> test powernv/memtrace -- I cross-compiled it, though.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>

FYI, linux-mm does not get any of your emails: https://lore.kernel.org/li=
nux-mm/ECFA727B-F542-42E5-BE32-F9FB27F5DCDB@nvidia.com/, but linux-kernel=
 has them.

Best Regards,
Yan, Zi

