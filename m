Return-Path: <linuxppc-dev+bounces-10696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A0B1CBBB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 20:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxyyz6zcmz3bnJ;
	Thu,  7 Aug 2025 04:11:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754503867;
	cv=pass; b=Crhuxz8RyYVr8pkgP0lgaFJackYoZ97lhC5Bl/oK1+KdBqw68mB0Ayf9s26jRQB3we0ysGRhCs0Ohu1T1DyjhaGBZLlEoXO6C9CVxp0gayeY3+8jGXm8+HwUET61Ex5bBePqutPp+4p5nOq07WOPIIn2/h9uOUwsMVmTjoqoQvVyJZ5Yh8gxJz09Aj3H+JzkUMgwTZPPLACVx+M7KTsH9zuJbF/FMb6hP3XhxscYHb4K7UvXq54Hzy6yDECcp3ml+tnHc6o6dJOu5KXIlAyS7K4T/f67uC26+Tqg9I1zN0SD2Xhm950G4D4qnwOXucLHYAeEiUzH/wOtidedOtrSJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754503867; c=relaxed/relaxed;
	bh=BhmvRULt71lzNlfdmUfFLRjqdndltyCAJJ0V75nB3/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=akO66PhaUUCSKwepeSDvLSzLf9RaptWjkJsnbty5PpKdCLveRYESwjfxk3GLsG1WHYk7rOlvsBGGXwgfcdAgp4spUVykuw8RPo1SHl4LCKHAhTlSJmkmvvzzjLJxQ/s1pzIcZ/jQoflNYOgWCn8C74NE8K0VbvEggN45SGalKAjlQFFC/JQqyYFcqxpo5S4r13TQo9K68j7yqpmjPVFJmSoKd0BW6V28jaUHKxf1dEW0QQ3sX0KkbAq1o34z9mxjQiblTF6AjJJ7cnQo+/iZbhWetHJkaQsPB25SYPNF0pQkbhAZ0Jzy4OqaGN5Fb/oQn2C3VjAbY4FovkseKSWMcQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HPdzjbYj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::611; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HPdzjbYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::611; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxyyv6t2Kz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 04:11:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/xGIwO8l037lIet6XDnEcFADS1S4j1v+xJwq0xbosit3tvuqIY0absR1Ze6wMZ/TKCGl5espW1F2qu9dgEs6hTCxmawYCRVyDJjqkx7uD10rBjCwn9thhOntxISwFDEopAsxahHsMDlteNOsTJTkCdL2YGQDqIORFmMOM+3FPlwgdzAeqB2dGIczqSr30NvwqpnUgihCVGp1w5qoXa+kZKJKBiL8eIGeNkj+On/3ej5JAQzmOa1eNWrANLxLbe4sN9Kqc3Ro6ZWap3O9DIHRdwYlqL09vOTdhX/ylkh+94s1oda8c4XWXi1LgmDah3KH5A6OmG3mbY2sYOXPqS5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhmvRULt71lzNlfdmUfFLRjqdndltyCAJJ0V75nB3/U=;
 b=OfRNJMP8osnjMHer6JHInrB65m7fKLygp+Zaw4kPvI/fO2epH1i54gQoMtc/g7fcD9oCsP3R4D7x5HQrqLdVpmAjYX1fI1UZo2kgN1eJG+WzQgWenMsETr6zko5fX6OsVPba4mqTddkBLydlbQkDWEzamKI5CDfzaVKtaSIzRY9RSbKuv5DjHhaQ3Ja3mWJpxdvT4gdOv/JxTLdThDEal0FfLizU8YSyasLE6+Yebri6vKbxL5AfS3cu8gjlyHfcdXsqqbB6fv3jl7ZY4TUVG4eb5xOMbSDNyXi+wBRbChzImtDLGpmevb9ks0SJ3eQoWEXQCPq3fIHE7DyNJRxb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhmvRULt71lzNlfdmUfFLRjqdndltyCAJJ0V75nB3/U=;
 b=HPdzjbYjWyAM0YIrP7JN/Qv9VjR1knp1b+AZSzy3OHlN6i9+poG4a/ygS7kbPE/w4w3CkDMVoi1fhRxxp/RlDzNUfWjTa64t1UTL8F1y4dXdqPseZx0vaKjS9mL46TIOUPMlyIGcpFhRe/ph9w+1c7PfX1sTMRYp8VVK8rKTotrMrTt1QzJRovHrYKDAPXvm4gCIsbQ7tv6J2df+7qgcLOX/APDtSck+iS4VdLgeMc3OVf2Bf1nm7AEK5dtwugkfpvtmhV0VUu7p3ftHZP7JMrhoKtDN8FbN3VFMslO/QQ+wtqqye4OevJQooE5f8r99Z52fZ2sbjCjHdKoMfbogXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Wed, 6 Aug
 2025 18:10:42 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 18:10:42 +0000
Date: Wed, 6 Aug 2025 15:10:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/16] iommu/dma: handle MMIO path in dma_iova_link
Message-ID: <20250806181041.GB184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <52e39cd31d8f30e54a27afac84ea35f45ae4e422.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e39cd31d8f30e54a27afac84ea35f45ae4e422.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: BL0PR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:207:3d::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: bc710f14-af91-47c0-1a00-08ddd5148e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wVLnAhfU1oPkeBVGmvAU/NjH/TSeWNoRRIFzWOltqiha8M23FQAybsbpsbZ8?=
 =?us-ascii?Q?4l4viwCu5culuho8iDDBGWEwTq5CXF/Ngqk90oWIfIjUq5vAwtzT3hhe1nou?=
 =?us-ascii?Q?RfHnvfTyjNJJBuNajTKmkrOGxuljQcHezyYYeUOLG8J7e7YhoUfBKi18txfI?=
 =?us-ascii?Q?hy7/LEu5hLaURAAotyzklEoBhtCcuF7b0wjIbikh26fAB0AZcdevouc+gZJl?=
 =?us-ascii?Q?ti3ebAKulXWxzMRy1HKeWCwDMydUyj8or18L2n2kDgRFSozaD5v5MYot+TdF?=
 =?us-ascii?Q?dKxC2QBL/XGhT2R//kxm/Z1i678GXWr53qAvo6Mc8mHvDJOsshvXhzgmGGB/?=
 =?us-ascii?Q?1Y06utPzxf9qZyCI2F1LJWhLSf4aNoLYR7ieU2V2hpnKr0S2IdGAXNglv/V2?=
 =?us-ascii?Q?NbgCREZxnz6y58V3BD9Sto4B8J6D0WmOSREtfBhKzVNd+wqZQEawog1Fo6l3?=
 =?us-ascii?Q?eRHt230nua56QWjnnXCSpemvdaFAgSKyHpP2nrc0T8ngDw+BS+qk/NKK9dKv?=
 =?us-ascii?Q?2miix6/Inv7eZLR4QvFRHYlQVH8fCvteG8WevBDiAT1ifHwyS+kdJMH8MQGa?=
 =?us-ascii?Q?h2oeqnJ+pRCKKqoq3l7Xdxtc06wtRFd1swF3vJw5r9832y4wpSyaBH0ABxQZ?=
 =?us-ascii?Q?/TX07M/n/4wX45/p1sgbqJYIOsZ0f4Kln/pnJIVSKrohhzOpGyheofoWZZwr?=
 =?us-ascii?Q?zXK4lEn71gfSBgA5dXwibv+GitvdQntloKB8klvUD0TvVZmtwBJThY49DnbC?=
 =?us-ascii?Q?SaGwAetiGd0ewGNePMd0j77vgGJ3S9gqeItBg9HkWW8nbdofeXTiplfgFybO?=
 =?us-ascii?Q?lNs6BYW5LAGJmg5Pnawnlkaoh+Nu2SQBxWVZvByCSr2ZHmU6y4hzSYjah2pp?=
 =?us-ascii?Q?1GZgNFRY32XyTX6LfRGJggIvzUvpSKMuFrq/0QbyskUfTnXJtDJqF0u+r0vl?=
 =?us-ascii?Q?FHzw8sLP+mEJIfzWRclp/XpMBrRAtaUz7RJbNp49GDoGb+fHebg/sui6tJqa?=
 =?us-ascii?Q?wBts/fdjF4cWzul1birOsqA2+3Pud2Qkx8i2mJUFiA56ilpf7GZYh/4BAKqM?=
 =?us-ascii?Q?OAzISkmGBsUomFlDjgPXqH/Qtpqizg5ROAIex+09zc5Y9oC7rG28YV1LqC94?=
 =?us-ascii?Q?egOWspWxPkTJ+R+F/qXelpRIyqn/e5juK2Wy3HEjN4aUfEMGE97D0f0V/Yij?=
 =?us-ascii?Q?syps8uDsBntlosNdSlMw7fhzyzdd06tVoGAh+PdjNimZiG3526VvcP3FONDU?=
 =?us-ascii?Q?KeMnRP53LaaCcC4Lr3AycUDXY7BzbMLA+NiIjU7SYQ82Y4tbyP6+KXMLO7oR?=
 =?us-ascii?Q?KZdVJYnIwvN0wJ00oOIphNxFr25xv8l9YxKjGSH9X0lfl5uX35COldoJjmls?=
 =?us-ascii?Q?N3G+dMU9uhXhk6kUq0/AGJnwyceFZ8ROJfy6iKa44R5ANOUgva4Iwo2J4sMs?=
 =?us-ascii?Q?1Yj7dqgsMO4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxar6JHm676v7S2VA0b2tp/6YMZTPFXTUBggGgPT3+7w2y648Aing5nielgU?=
 =?us-ascii?Q?C8RGQR5E58Tovl/J41NfvXPwqo83HFAte/q1ThYUU8DpXUJ7xyiOtLI1agTm?=
 =?us-ascii?Q?cJCIeUGMb9nlAL6DL4HqITNVhi1xiGzDJTxsise2ikW8UjN21FJkGKqHdOUx?=
 =?us-ascii?Q?X/NlDLBiVPvSQUFkiKhqQLbU2EEshCknX1MeN/X+GTK9p7yYbr6l2wMFcY+9?=
 =?us-ascii?Q?ND2X9L4Sjj6dAZp144RnyvH9xB1EeMcQ3MsqbdVYA2Ohb6AJiP1WZuEE9jTE?=
 =?us-ascii?Q?XFged2dzreWxtqlRa6tgiGz7uZkQbLA36UuQlGNftfAreBjl1O5vF36LOuVR?=
 =?us-ascii?Q?zTHLQ2sKkyx+9cLiddBDG3UiMuXP2mRrPQ017uORc5S9zBMDpq3jpRzbWLRT?=
 =?us-ascii?Q?OVurgCMW1L9Z6zBg53ZYKRLC/qgk+o8quUk6BvWqo6W4P5Rd5IMUWHGHBi5y?=
 =?us-ascii?Q?zdrO8nCMOYop7lH+MmAFmSuLZhUg6mt/5V3y9Fp/vWWfSmLAzwsQkSU7dsgg?=
 =?us-ascii?Q?IAB3+JkLsRIpcJduXAoL+sT45A1wQHO/TB4imafngd0gcyTT8Nm5dui7KsQu?=
 =?us-ascii?Q?ZAhJZZJ3+iEN4Uo6RQYdG3oU5rGuY/gZN0+7fSIcjdEYFy8qUweayZycVBPS?=
 =?us-ascii?Q?uZTvHKGucjLJA2HHCw5BagLz7ijI619ndghyaq4NY7lrrhDyNS6MdJb9zDTh?=
 =?us-ascii?Q?2ZeuZx7xpC8KaV9ALslVxl4yBLn0WACNoPNnnl+qKNv9Ld8VGZa92JNAkL6O?=
 =?us-ascii?Q?mbSbXlRHXr/hjkElMKDR4FLunfOidt0S4xNZeK19Fuk3N2Z55CsnM5dni9n6?=
 =?us-ascii?Q?AZ728B8IPw3/FN4p5QbS/PdWs5zSXzyPNfdPLZxq9RH1sBV2zdLc3Hjj3BHu?=
 =?us-ascii?Q?8LDmyMknR3iaD0SNhgHj6TZ85GYy/Tx8lFGZAF4XQ1LGJnO5FifPUQE4QmaD?=
 =?us-ascii?Q?1kP0GIcg8w798usyvr0wYVhs4GZo5+Zpp3b4dpymUYFqmXP2hQBqYCP1bM3Y?=
 =?us-ascii?Q?h74ncSMb98quwFZXCze2mn/T7w4TnOnr/4Dcp9XX2npo95Yj4h9SYCXafZGe?=
 =?us-ascii?Q?jVL2DPa9rh+ENyPMGZLYi3KcMJWqmKkGj8Jvx5Ypzo0LsTRiHR8GsTpKDvr0?=
 =?us-ascii?Q?BTOXJuD8u1xnH5J/ttsctfR8qI0NZ50tfYg6KKv6dOO7kwrpZpsqHiCzA8M8?=
 =?us-ascii?Q?8d0LTLkulB7BiIULaMxBzFFXkXy/pUia/A51+edj5UoRdDi6Ef7h4QGrxd/Y?=
 =?us-ascii?Q?UOKnpmM9pkkJkhcM1ufy1RiOi9tFwSJhgqM8ttWgYxD0qePXUBTH3eYMoyhU?=
 =?us-ascii?Q?TUzWO08a7crrOTEWta5HWlFQ/WxCNtSamczRCSy2ZnNeSD0r77+9YRkskgZF?=
 =?us-ascii?Q?llQ6s964oNLxAP1n0oPbz6t2VSbJe+pK1mJMbHJFWwYFZ+zSofvu4kiYHzRC?=
 =?us-ascii?Q?KICyKCvRLsCxNdOToQbBeBEJNAp8AcjnYdGopdOCo1EWynuitRyDGJk/V5CM?=
 =?us-ascii?Q?VaBwfFAxVDY+usMsHxhCwVNi8gUwS3FmQuDxqFeLd4A4XIh04K0X4u7fUifG?=
 =?us-ascii?Q?zTlIkUmjnOYfRUF6+uo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc710f14-af91-47c0-1a00-08ddd5148e90
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:10:42.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57xtDWWsAmS2DZ7qtHKMR4Dn5D+k0Cp1JThowypQclS3wEaF2KtlmBeaDSAVaxXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:36PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Make sure that CPU is not synced if MMIO path is taken.

Let's elaborate..

Implement DMA_ATTR_MMIO for dma_iova_link().

This will replace the hacky use of DMA_ATTR_SKIP_CPU_SYNC to avoid
touching the possibly non-KVA MMIO memory.

Also correct the incorrect caching attribute for the IOMMU, MMIO
memory should not be cachable inside the IOMMU mapping or it can
possibly create system problems. Set IOMMU_MMIO for DMA_ATTR_MMIO.

> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index ea2ef53bd4fef..399838c17b705 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1837,13 +1837,20 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
>  		phys_addr_t phys, size_t size, enum dma_data_direction dir,
>  		unsigned long attrs)
>  {
> -	bool coherent = dev_is_dma_coherent(dev);
> +	int prot;
>  
> -	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> -		arch_sync_dma_for_device(phys, size, dir);
> +	if (attrs & DMA_ATTR_MMIO)
> +		prot = dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO;

Yeah, exactly, we need the IOPTE on ARM to have the right cachability
or some systems might go wrong.


> +	else {
> +		bool coherent = dev_is_dma_coherent(dev);
> +
> +		if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> +			arch_sync_dma_for_device(phys, size, dir);
> +		prot = dma_info_to_prot(dir, coherent, attrs);
> +	}
>  
>  	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
> -			dma_info_to_prot(dir, coherent, attrs), GFP_ATOMIC);
> +			prot, GFP_ATOMIC);
>  }

Hmm, I missed this in prior series, ideally the GFP_ATOMIC should be
passed in as a gfp_t here so we can use GFP_KERNEL in callers that are
able.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

