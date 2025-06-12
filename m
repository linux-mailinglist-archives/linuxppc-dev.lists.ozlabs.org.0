Return-Path: <linuxppc-dev+bounces-9299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853CAD6851
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 08:56:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHtbN3lzmz2xPL;
	Thu, 12 Jun 2025 16:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749711360;
	cv=pass; b=OlqiLGMv/LwNPe+BPWQaCGaFE9SoWFfmqlneUVY7Wza0gK0FcI+bF87huqNA/TVCg/HoYnV5rHOZJR5FtupZCQ5tTWfHO5Wwtazg5A0JunN6S6DhAL19To9UVQoyUxmyOT313YjA5eL0fJqmZCgPn5yXt79ZVs5ll4RPpqzhnfOni6AhXh9rVxLWlNbJ0EMrt66vs7dktFD5KySQ60khSuNfHpJCHha48eLEl4IVN9dbVi+/TGTJ8tgKqEwjQfhrIPvlhO5KS8HIEbNPLEQMc59psI+vWKRWQCTOtH5vDkndmdmItAIexqV31s1s6C1XK8hqxegfVJhzNH18A5/9HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749711360; c=relaxed/relaxed;
	bh=mDCNxCiX5CIOfx/smFjNPbsKZhAyZ3eCgJahtTIlnys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JuZx7ztYQnnyCECUH1uUlTUG/4ou9M3frB71DCHFJRF17fSncBGyXfVGfaITdvBMBsouwLQdVat/LkGP11uzgr+0vHfwa7Z76v8+M12rG4Jl9EbmU/jNPYX4ZQuWHjkdG3pXE9GWnamDYdBPsjfZW2DsT+WO/HbuoD+lZXft/0lWV9Jv7HrnMX/Zhkj6T99ONv15ImZYc0R+N6+yIGb2T6a2GUnT7WosquCi4uZ2Iq2P4i9HfWLRhZsFJ3QtpuFReXA1Shc0ztrU+zKZOlkqsJuPJbwFYesf5qgSj/wsFIkpaVIusAX5urXij1l0oN6GsPYUzHPSOzGm1RjosbtMUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EDijHz/G; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::61f; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EDijHz/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::61f; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHtbK5fb3z2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 16:55:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne/mWo/3HIyKHZZXkuivVrlUSy3LPdP8WsKcgmVOmaO+o7mP8cAceChMLaq7VBrDHihu0TpCA+3rRBqqmlGaxvwVSVEWbOS9PWmosMZMm/uf5tOO5DqLrRXtKJfk0nQmSIs8t1A0bQr3Ha2ccIICxd8YW8coe0ENz7CycVV/il3yBzf1zw4G4xJoJ1MlL3yW6cdhx19t7UD9L49EqVZ/9OBH+9qiYy/dfIk71wpAKXlX/EoeSDJHTk+H5sGWvwbnfT4KP+sy4HQnnz7fYsNnFl1nfdc1f0L6XMwpbxNJ0zr1KU6FU97vWXiPT6XWA6FE+YGjb9Fz9J1sPTdztuMNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDCNxCiX5CIOfx/smFjNPbsKZhAyZ3eCgJahtTIlnys=;
 b=GuALqvMTbv81a1wkhMcfsy51Mo2vX72F/jKXmtCMKzMyBQuoAywcsoMmdjuHc+La1BWMPPmML9OGB237mfHuqIbEhisDo9NVypuQGShi6kEjTGDZy4JyC6xLz3xzKeubtSw2By75So1VpgHPb9xuDPD4Racyug0rLTHJHLQyncfjxkXUMiCnSLq5yIEMU9L7LpcxUrFGfzlwptwdklpCS7efCzDwtiGR9SZETs/nT1+OqhYUmDvt4Vz4zfVEuBQB+rGKj8lWTQfgR9U9kE77cLNHrwlSdR7k93+BT4RSJmbczcRFU9dDmR0wpyrfsPDdWNfekhnQpSWBtTUZ/HhMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDCNxCiX5CIOfx/smFjNPbsKZhAyZ3eCgJahtTIlnys=;
 b=EDijHz/Gen4f8CgL1DFQwbYkpxNLz8kOMmTeIcIxEgsk4PRwQCb/ag8vL8Z52iD9MH2TFN1FuXZ75GWaOz5HTq/rxvwoWUCUdRxzJumOkHZab7hRmWa7FJWoZ8WHc8rrEkRecHup24MIqGpoJxcC/gVpypUW6qrTUSx9eTqtHtAZqxTJqukwHBWOjAHRXSIwNlnVgq4SrtruH0ucmkeGWcBDY6ctNnWi8Zla44Y2ditoPmWsTNhywZfjruYnFGhYC0u6qwEoSDPmcJYyJJY2VT7MAIDFTrep9u3O+kct9GcS00oV/vSsl7mxEiRhZs3Kjx33nzxisrqfkfsR179log==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10)
 by PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.33; Thu, 12 Jun
 2025 06:55:28 +0000
Received: from DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67]) by DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 06:55:28 +0000
Date: Thu, 12 Jun 2025 16:55:23 +1000
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com, 
	dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com, 
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com, lorenzo.stoakes@oracle.com, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <ru3g42fdhlo4hrffkmuz7usqe77jetgggx7jmjdx3nr5gw7lrc@3te4cu737jqt>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
 <371b8fdd-129d-4fe3-bbc7-f0a1bc433b30@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371b8fdd-129d-4fe3-bbc7-f0a1bc433b30@redhat.com>
X-ClientProxiedBy: SYBPR01CA0191.ausprd01.prod.outlook.com
 (2603:10c6:10:52::35) To DS0PR12MB7728.namprd12.prod.outlook.com
 (2603:10b6:8:13a::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7728:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d71744-93a8-42a1-bcaa-08dda97e1d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CivukSvRdq+PrSaqv4nvjL0iIkAAc7sNQG4AEGFuHkj9kCCE1XOO1EdqCXL/?=
 =?us-ascii?Q?XFGTXJE4lxUP9tF8UMyuefgydHDYkqca4KGEkKhOfyov2vg3Rw9WMu+8Mq5D?=
 =?us-ascii?Q?1iNSXcVqq3XtVhSd+JlY35VDl/1xyoeJB00q0SPyhQ6JLJImtgsToH6sD0yR?=
 =?us-ascii?Q?MnHPdtQMnb2W/5zx5tO0B993E2zEs/JpARr3pvNs8OQpMDbsApEWEi447eGU?=
 =?us-ascii?Q?p7TAu43EKA+PZd3BKWi5o9ctZx/UWDi2lEt1we6XgTBC3wiBcJac8hsKIjtI?=
 =?us-ascii?Q?nI3BNdrcqqTmzpVk8dd8F1V8D7ZQs52haAIUl4R+D/5OTNxyGi2ip674X70L?=
 =?us-ascii?Q?XQzQvna464fA1gHJ3pzz6QFLR9pZOE+egawwkmoIKlHiYQT4ZtYI234Sb/5M?=
 =?us-ascii?Q?6eLZwWBMP8dylortGt/sVTIIEoJLdrPur3EQ5UKDzgY/DGkLo9zT1J4FFDUW?=
 =?us-ascii?Q?jDJpUr7E5Wz7nDgiMMn8DJF3Ux2S/1G/VXI+Gdafy2tZljG9e7FECSdsNLpm?=
 =?us-ascii?Q?aH5qF7SN3jlaoKOrXEEIBylmEG/p7AoKzoIXYn8+MBbFgelp3vUkCrcTEDCy?=
 =?us-ascii?Q?iJ4rpDYXrW6Iy4Sbv5FHimSC0csm8HK4pAhUyoEYYuMDytVygL/NKna3rHg2?=
 =?us-ascii?Q?N7QryyRvaDCVsIOyD4YYcwvn5riIhoZ8+yA34ATNWAWkKH9/4hPHk+VrHY0L?=
 =?us-ascii?Q?oU5CzMFzcHwIIhS0ztBwtMtCU39AwVJa44qaG3Ia1ij68ZXwaFnBUYgjlJpE?=
 =?us-ascii?Q?PMZPnh+v6FJPif9dYziOOEVRyOIyw0+BVT7DtdIcwn0gXlJbvH3UCWMh5e9J?=
 =?us-ascii?Q?ZsdJM0vmPQn2NGTNrbiEm9zlP1NRV5uTovqBZJ6ZsmorCIj8xQxaIMmdv11v?=
 =?us-ascii?Q?w+qNuTWa2nwbWo7DjaKUQqM0Mr3gG4cZ9KWyhfyT+6asYVV2N+CT9DYoKFiT?=
 =?us-ascii?Q?6RsGeb7uEhU9H/55A84Ck16xspbtviK1WDvMogKvmOVu30xv3o+wfqEv+NOp?=
 =?us-ascii?Q?ImEjTIt2PLMYN99SJlXqOiiX++dr61NvVO5RxGMdNGUtKZFcuQAw9J+awxJ2?=
 =?us-ascii?Q?dOnYbQKCwaO7rN+UfUpGCOOWkloYqFoe1ubPbGJyeLATrgdtECz1KG3Fveyw?=
 =?us-ascii?Q?50+tlBm6NQqydTjSr7KaWE/X1mSKcj5pJ2fyNllFakLGkWBXWrzHevvd010C?=
 =?us-ascii?Q?po8mnxQOQeaAxGiGXu2CSOWUrpll8rwQLFh8LH6eV3zyag3wMkxZkhgGhGvf?=
 =?us-ascii?Q?PhQAlge3qtwDW/bpdut3h2vWj+GdcqaEyqlHj8Y5w0jco9hUfKWDTWr8occN?=
 =?us-ascii?Q?VWCatG4iSTKhsQYPrF210UwUH7EtUYe/Rhm7lf7/wEiiqm8NFiB12WZ5BU6N?=
 =?us-ascii?Q?DjwcUN72vv33L7ll/wfeSGvEI3Z/DypR34H/qxR6T0U2x4aH9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7728.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/EV+KhOxFJJGglJgod7Rp1eIOACACuQaPgNUfLCnTQ3sPV3/Qp0Q4Bluc9Uv?=
 =?us-ascii?Q?hbMLdCkg0/IduXgKTBeJt64CuAJACUYSX82Amh+cDS+U7OAqj430LQru8ULN?=
 =?us-ascii?Q?2hjUBYmuuNKJ2FCbNaXBN8aMcUbOoUL4eVLUWHscEAFLB+f2pqOV6m7dVVHb?=
 =?us-ascii?Q?s44eUjne8RHyz+zQx6KOsguc5Z906g41SxAVQSxoaNKB9jTHLMs2aq+8AhaZ?=
 =?us-ascii?Q?+csOSirW2mD123CYHCd4zc32jmJ8eSo6uZeuQSfCrqX+koeAN02aDZ9OLEiA?=
 =?us-ascii?Q?+8PrT27OFOKdxAHKCpaxPh/lvB9ge8jWfdVz4/qysxetEA0Iar6NIcRuEcnG?=
 =?us-ascii?Q?8H4PLrHj7EM6QwYGSfb1qRLIntGfeoH9XRrvrN+QUhnAEkGlgqyBWu9kXgpn?=
 =?us-ascii?Q?5xwY3XI6IBHKPd77FcZG/GZZw6dBvGULB8cmezB/V+mG0cHVH3BqFUo6/K8Y?=
 =?us-ascii?Q?NhMWQiqXCobcW7TsyqiTvSwCMDcHlZMGVXdhaU/h9PDCsw3C7SiNvbwCelYi?=
 =?us-ascii?Q?kEbrM71ibDDmMiscwkRIWQ6JEGcj9ACWX4bm5K9FTs/aH0VzwmZwSbEVD5E+?=
 =?us-ascii?Q?QXMCy+mQ5YhxWrmMFWMaZjJjXW63E9NpNRw1KOZaqgvmPkP9wWyjKkBMci9/?=
 =?us-ascii?Q?3F83F8fTfZ7cEanVnBRf8vqXrH7QNqhiE99VxDS6zOZyDHj+rj2tBsW+h3zE?=
 =?us-ascii?Q?YdD17PAm8IOMt0GgyDWW7auCyMhbiFQjLSeMffQBQYmJgqtjzHq7OR+9xZho?=
 =?us-ascii?Q?G4CHttylo1ip69L2YHgxxJf6CnTMuokNhMlDOQ3jKBqKSSPGocu4gSD+T7MA?=
 =?us-ascii?Q?rdLyW0o+/ZF8CDrjmd/DbPmSfMCkCypoIVQVLU5L315+jA7Ek97YJ1mnz+3E?=
 =?us-ascii?Q?TSc937Vdbw2AjwRhJkYuWo9L8DV4CmZBjcA+f82Q+aUZP6r9gJdi4KyD4+FO?=
 =?us-ascii?Q?Oaa3XVk87SkwgKzIbVNJegwaoQ0pyVgVk6qi2hE1qIlBhctviTlOl1AZRKpw?=
 =?us-ascii?Q?IpQpwvZU1cbAPhhLwHey+8wOHVBFLLGgG5SMTGNdT/pgKjXvWX2jh5uHbSkw?=
 =?us-ascii?Q?+UX7qFF+uBOOlE7DwjA6wi01Bz6A+ytMOP1ur3e7WnyoKWTd2eGeWqVvMrte?=
 =?us-ascii?Q?Z4xqXmaTwfZ7fyFcY4kfyS7OzLJG49AyPfaxfL/KGb+U6uXG3cr7Ky20FxuF?=
 =?us-ascii?Q?VAHng2Laft2TuvnYdP6Pdf4JL8OizYabgStLTD8VP5U7lkd9kOKITEoqz+sc?=
 =?us-ascii?Q?b3XPztB2B1xchpAgWZNyPhxjXJLKCk7drZFJGn3/gOkIYBte+QZSTaKv1+t0?=
 =?us-ascii?Q?dUN6QJ5f2VCblPY69ysxugeRIEVI3sjaJYUEPZTTiiQI0Z0Ftpl0nrqu1/GU?=
 =?us-ascii?Q?ADjq3aeVomLj3JrnRBng3fa8EWYN2Wj27gphhyXQ3xjCNwC2o/9rIEiJJhGM?=
 =?us-ascii?Q?oSbsGHy8KKXLjxUqdNtqsFOBBu1FvFisBogbm7O9HJ3O0zlBdY+ihGkd2C3A?=
 =?us-ascii?Q?2OOqucJpvzTF1oRBIp6g8iObrbcQy5b9tPye7EqhKrueQeOpgdbn295sCpwi?=
 =?us-ascii?Q?vUtfrJFWKO9tj+ukCZYzdGHhqyu5N2ZrtZMbwtcV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d71744-93a8-42a1-bcaa-08dda97e1d59
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7728.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 06:55:28.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Pg+G/Xmvc/7fr9U1Ar0JTrj3yzIX9zeKy3WdQq7UKpk3WoSinUm94fuWOi7+NtzFwXFaT2o2TYHzBKKJHG8Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 11:37:21AM +0200, David Hildenbrand wrote:
> On 29.05.25 08:32, Alistair Popple wrote:
> > Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> > pages. Therefore page walkers that want to exclude DAX pages can check
> > pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> > meaning dax pages are mapped as normal pages.
> > 
> > Ensure page walkers that currently use pXd_devmap to skip DAX pages
> > continue to do so by adding explicit checks of the VMA instead.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > ---
> >   fs/userfaultfd.c | 2 +-
> >   mm/hmm.c         | 2 +-
> >   mm/userfaultfd.c | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index 22f4bf9..de671d3 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -304,7 +304,7 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
> >   		goto out;
> >   	ret = false;
> > -	if (!pmd_present(_pmd) || pmd_devmap(_pmd))
> > +	if (!pmd_present(_pmd) || vma_is_dax(vmf->vma))
> >   		goto out;
> >   	if (pmd_trans_huge(_pmd)) {
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index 082f7b7..db12c0a 100644
> > --- a/mm/hmm.c
> > +++ b/mm/hmm.c
> > @@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
> >   		return hmm_vma_walk_hole(start, end, -1, walk);
> >   	}
> > -	if (pud_leaf(pud) && pud_devmap(pud)) {
> > +	if (pud_leaf(pud) && vma_is_dax(walk->vma)) {
> >   		unsigned long i, npages, pfn;
> >   		unsigned int required_fault;
> >   		unsigned long *hmm_pfns;
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index e0db855..133f750 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -1791,7 +1791,7 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
> >   		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
> >   		if (ptl) {
> > -			if (pmd_devmap(*src_pmd)) {
> > +			if (vma_is_dax(src_vma)) {
> >   				spin_unlock(ptl);
> >   				err = -ENOENT;
> >   				break;
> 
> I assume we could also just refuse dax folios, right?

Yep.

> If we decide to check VMAs, we should probably check earlier.

Ok, that makes sense.
 
> But I wonder, what about anonymous non-dax pages in COW mappings? Is it
> possible? Not supported?

You mean other non-dax ZONE_DEVICE pages? Currently not possible, because
non-dax ZONE_DEVICE pages can't be pmd mapped (although it is a future
enhancement I'd like to make).

> If supported, checking the actual folio would be the right thing to do.
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

