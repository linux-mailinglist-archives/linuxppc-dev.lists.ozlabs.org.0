Return-Path: <linuxppc-dev+bounces-11429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13CCB3A338
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 17:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCPjm2H2zz2yGM;
	Fri, 29 Aug 2025 01:01:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756393276;
	cv=pass; b=izCO16nQivAol2wUgHSRjgmnSb4Pq4cknWP4IfkLZxzrl40GIQpD91WKsqrPmC5xR3fOhz7eIRR9McE7axtk0T/0ktFB8ZniOe3IJ9ffTk+XP3SpcaVXzdUG6oXuBdT53ySAi7BGvb/rFtWmkEdNRVEQK13yTH7AsdtmE+JzqU7SdyM4k+Kdr0Kh4AUz3rrKhwPZqIbHQ5XXCADhvr4q4mSNr5SIj4YWq1nijf7TUh00u2a81GmBxDai6Nd7z16zANFpy35PxhM8kOxFeGT9D2VLUzRkuHhweLDa5x6Rg/9iiEV7a/vZmkZKFYBwjq90zLL9N+sJmxgxNlDsZ6u9jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756393276; c=relaxed/relaxed;
	bh=YhYgIuXMPDyneIixgb3ayDngq33diPvUwzKhingnZUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FbiqZPKMjrl1eIIY2u6ZHTwDl0anCAmrnC1O7FAN/hz0x31K6NY+S6mQoqIBer+u1yYJ3x0Iuy/tjPmuNN0KG8Qw+B8E8ij/wiLTSLvVVt4Yf04VItaHRBHUFheFfP1g1fVFaRmS79PYsW0lcxtKDqb/B48XaRV+uKFXPbGAiYXtmvps20bSZdBRzYVIiBa4okO0vxuW+Fj4JUeIio3xlahDsDTDqZ07FVO7VUPNL/BKn6zVND+jnHb5UgvRUVmVVLNG7rYznFfn8oEYCwr5XUEvxUsfHmkguYRqrAJRXtggaVpT7whssfI0Mvq0QpOmHID5c6aw82vw/XJefr9zdA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qkezqVMz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::608; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qkezqVMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::608; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCPjk4NQnz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 01:01:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS6QF9PmkhPSetggaII5CehTlNqOJP7vlZ3U1FhtbEJxV7OqYGAMEImFhkSEkVt8p4tMk12Kq+qkyt9hkXaA3hNTw0Q/M8JsOk89YCE34YUJMbwpcSbThpcPNb8wLgyaPwW6ZGVpAgcGi41Oc/cey8aZQgz7mbUCOQ7tc/sczz3afaA2QRRBbuXquufQAmJf9sL/A6SD/TF4rdhqnMo48S2K6UzD9pSyjxqV2sqNVzD6z6Ip+oi/OabsECcItshuq8tNhBlbjP1tEj2lLzx0DCeMCiupm+JXR4h6uE9VaT/OtZ88vfpoUxv15tHzMBQ9qGXmW0QvuV+wNoRl6Z0AFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhYgIuXMPDyneIixgb3ayDngq33diPvUwzKhingnZUs=;
 b=L6kKIA+cyA334TB+HD6KAb0poZQRgfS+mi0YyYxUih9dP8c8uDGCwry1fq5E3IAs3r0+l134PJ+M+RHZ/x8HD7Yt+f0tP6ddNZ2aQLxcz/QkPJ+dRs7igP+u5glEEt8uY2/L+weMU5UCN+OPkEvsRWXhb/OIZ9rh4KubDEOvFUoAIj1k+4YBSjFfvNJLXgwILa1QnbgC65cHcHmZFKcKirSMgnxZcz9ybBWbtd1/tFdgT4E9kgmr5rYCWQyGWRJD+FZmq1hKglllDlaj100v7wtivgG8yRUcVXZh49dztnslaMANyvHcOUx+C7KrcwIl/VaOfumTn7GnMsKKVVxsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhYgIuXMPDyneIixgb3ayDngq33diPvUwzKhingnZUs=;
 b=qkezqVMzVT99jJQz5M/PGYi6BFwhFdorcFX4nk8XC3yr/uRWXxB6KzsAKoOE4GJgOzKfcnz3wm7ks69mL1QnYz6lWl6fGk2FqtTEsADsI9tDC0gBUny76ogXICGsiXeF4Tdm1k8iNvLwaRl2aSeMULoKHlkXhnk6VBhaR97BpE7FQljWxhk64RLUekpCMpzP6ZjvgbpSpgalw0RFZI6wBTTTCx+PjZqmqSes0JXPnN1R2rSbS3YoHbeswtL/3eG9cxNd9xQuVrhnMh5RRJFdZ2GqU0Yv5DWHI9tL0Sthc9UIMXJDdQlqYhdwIx2MHfr5sv+sg5Unmy4c+jKesWCk7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 28 Aug
 2025 15:00:51 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 15:00:51 +0000
Date: Thu, 28 Aug 2025 12:00:49 -0300
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
Subject: Re: [PATCH v4 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250828150049.GG9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <f52ab055c9ffa4da854afe47232c7d06d109d8ce.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52ab055c9ffa4da854afe47232c7d06d109d8ce.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT3PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::25) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: cd324a99-7b50-48f0-b0b3-08dde643ad87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F3t8pjxGuYiqQXVRHHoABfhe3+nJCLYfL6dfMX6OVHmrSntXdCx5WtVVMFHz?=
 =?us-ascii?Q?yIevAB0p9919JudsrpMU6LZXPwxOeB9F3UoThU3jOmE7GG9uxOE5qnMerxlg?=
 =?us-ascii?Q?AN/UIs/2Eg+OivcbbHEpPHCi39auQu/YZ8nvFxeTPjZk3Ada64JLqqgnkSht?=
 =?us-ascii?Q?543bGq64xQ4iKEYNxa2ok61AsVkpvnT+Uw7NMsRGYJRPYMAsP5PBjypPdUBf?=
 =?us-ascii?Q?81RH4ul4DOiq5i+njO8K39Sfezmnlh6jHSbM73vKdx78Kp2e/lXKQOCqkfKk?=
 =?us-ascii?Q?GqW+8ek12Sua17KiSbBLTYD6OHXBdB/KEbLwIUYy46n4iVYEXrek8Peoq5/7?=
 =?us-ascii?Q?K+OpIeuHCsarMY09f/7Ske6UqL3X2966rZkUOyW8bBJeXZF/5QntDeEXO5H4?=
 =?us-ascii?Q?XSu/AU+Smc0Gu9vuwbA7xN8mb7/fUJw4zfSDUaI1WXJhnh4aqcraj1hcO4O+?=
 =?us-ascii?Q?EDIwkRaibNorWjRo2KD1Xm308/+ExCCE+H5o+9DL6CvUSuvGuEjPZWHGWh1L?=
 =?us-ascii?Q?Qk88DLWsKxzmwnorlRypDjuSrRJbB5gLNQthol57IcMc3Cup1IIXsKyPmYSk?=
 =?us-ascii?Q?IWH2yF8gaH0SdOuca7KzzBqW+S4YE/EC12HojfMnvk09W6nqqb4fF7aaQ/Zu?=
 =?us-ascii?Q?Orj1BFeugwUPXkm2LQeGmgm0hEB3oh/qLZnJS4cA1KO9cp3oYLx+FJayhERl?=
 =?us-ascii?Q?sjLXgnd1db4hPQgzuFmeXwoGL7Iy+wcTnr2oP90fVeq+t38aAtCMB/BRHQjs?=
 =?us-ascii?Q?x9O83XsAWqorEs0kwmGsD/wWNCY3rfNgCxM3Jg6wm7FkAkUfXd8ZQV52+779?=
 =?us-ascii?Q?a5jofWus3cV8yAr4swvRu8HqzElhF00CvUSewWnDVPEETGebx85qNIZFxgS2?=
 =?us-ascii?Q?KYtd1Vqd+kAd8m/rG/y21hHXjwA8HyOBgkLV1oW/H3l+Q5F9Zj358PhlumsN?=
 =?us-ascii?Q?ZBkEOrfZg0VQFTj0dry4OGp4HYTN4KEMh+yianvgfkREmfLiYJNy0xLGrvfP?=
 =?us-ascii?Q?zRNYmHb1BhypYX+XMP4ZqHYhe5wqD9omzX6FhepSaws2mnbL6V/h0843bI7f?=
 =?us-ascii?Q?9J/g7OWg2AkezlH5prpTFen+dMQMWjPHAXqZuMW/hT5Bz4/etFPDwTgv/L7X?=
 =?us-ascii?Q?1NCwRIzvfKHFkhIYGOBODZrs8NLb5i8KHZ0YEMreb3KDZuZNRvRHMXnP2Il0?=
 =?us-ascii?Q?pGtu9m8/4F1vowQ4SUYg8H+QpznU8ztibiwxlnVAl9Y6dbfkoYvwnTb2kVxl?=
 =?us-ascii?Q?CGBs07j5ssRf0PygNTBsuIRc+MoGCDkoaxHNF41xLXDg1HMby8oaNi/d+Z+F?=
 =?us-ascii?Q?/jiqKkjDyWZSULX/+ZIfD5k5Z3aNv7sQTvoozJTNKQf+hutgN9PNPqMM3aps?=
 =?us-ascii?Q?QY+hwbAR76MfSkDtNGbY8H+YtiEZvOwrF73u/2Lko0T85eWLr9f3kbMsUy8S?=
 =?us-ascii?Q?1FKnLopyHwI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uvpwli8oU8wOvJLyl3NwVP+TQsbxubD0QEkBmRvQ2Jh4ZZJP5qipOjZamH69?=
 =?us-ascii?Q?B+PbjhWcvbtpGKlhIxRiDqqYfHFPEPCBZqhYcM3T3ZJCwQw82zG9G2Rke9q4?=
 =?us-ascii?Q?CHgav7pRRa8j+o2jKanzZWaj+WSOMGZy5DY+0AHtPYJI0nJ5hOZvUn3SDpkt?=
 =?us-ascii?Q?0Lj6tDEn2MUr7dn/mRi5s+tS4G54SGWL1gmMMjbn3782+tcgUScunIc00GN0?=
 =?us-ascii?Q?3pRE8QnZ3QHE9tNZwhIa7y+X0nMffa4WSZUKiKe5KdNA8VOOl+TOtsOWaCd1?=
 =?us-ascii?Q?jcHChVqL0T/rslHr4WXAO0p+c3Z1RyNIMo03ObYJYsT182PvejTMDMYVcPW2?=
 =?us-ascii?Q?TxkEmh8HQJHQ4C1zp5n+5QiKUrbxiqY9ujbKvp0SZsFyrXRl0y9aGhqFKY7c?=
 =?us-ascii?Q?s4JSDoQbvQ6HGj3v7qDJDWH0FLS7fYF1+N6yLGUyrTyqzOSuJuDY+7aUoI2N?=
 =?us-ascii?Q?rOZahLnSaGGsH9jYN/jH2gyt3RIa/wpjbTeaGNfIaNMmv4ypGsc7LxZ4a5i4?=
 =?us-ascii?Q?qPt6RFV0Ln+5onDrvs+VTLORC18S6Tu2yzJcwprZV/lJEtiCP5kZ0uWmoXqs?=
 =?us-ascii?Q?Zu+lwyG4f1mD8rOfNV+DnPl4KlKRekyau5weSSnPlOVlVYPg/gRl8KLZCEJ4?=
 =?us-ascii?Q?qIbh1Rs8xBJ8wOG1jy8byWrqFGCUVvzZZROHHnuwjFw0P5z3CDGu9b1s1NRa?=
 =?us-ascii?Q?l0Hj1TmoiopLBTq6x8wbyh2ilDgffTBbrmu+042g58KDcRxv7nui3UD/+nJI?=
 =?us-ascii?Q?yOM9GnMdDPLDOgrfrL7iMO5SEjt83MxpwQoxdnZ0851+375n+sQrnKKouUza?=
 =?us-ascii?Q?5tdZqUIRyEgSx00YK7nwXErvHKgJfWsAsz0+vEnKoOPzwQuo/j+3VMvxzvLE?=
 =?us-ascii?Q?COndN5Wm1bXxccaF9kAf/g40DSjFJPH67o4ODthM9e12YFPj/IxsCaJUDVZg?=
 =?us-ascii?Q?GQhSbzT1xXF2YdalACMmlmSTrucAzSSmwfbiNfM6aElZNJ6NWZgO6ORB0u37?=
 =?us-ascii?Q?G9RgeLWXQ1bv9FUe0PmKyv4Q9COG32CMNhjHgqSML+tgId1eianjVIc3N0HU?=
 =?us-ascii?Q?dcf5rlhw0KvJ/WcSFLUrcXS4Hq10eLpBr9YnU3iGxkE/Z6mqccKBwxjAHxku?=
 =?us-ascii?Q?GTufKt69kT3PxhVdyKrwpZOER+7hmU7Tb6AOxxFAmRiGqOM9Y5JoMuQtA+gQ?=
 =?us-ascii?Q?TQs8oD7Ni9Msd5adVQqHsRdc0ni8RZkTR+IrDWPZiBkkABiDKLMRbpQR9dA5?=
 =?us-ascii?Q?7BSW1ESHp3r7W789bDbU8cdpRR5rKVroZ3TE3SsFAHi/jckiLl3IbxxKZt/d?=
 =?us-ascii?Q?IaISd75BGpc4lxeH8Achj5wt8e/8Q8Qxttl9cgpN9M0ijzLoSIx07nLAJkTy?=
 =?us-ascii?Q?FNG58ONb0+qKUHcGPeSkaO9cE8SCYUNrtCPXl6/aDaEFD2ZIhouLTLWqXE+3?=
 =?us-ascii?Q?cYw6VCnPhOlZhYR/jfb4PjNOvSOX6aokxBVUQa86yqNxMH4vzfOMMQZLHTUc?=
 =?us-ascii?Q?sV4Yc109BXOL/IFth93oiQUr8pcDxVyh5M3fp7VE3fHzDVMUx2C49eAGfDzY?=
 =?us-ascii?Q?u6BMG3n/8GgM7hjb++E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd324a99-7b50-48f0-b0b3-08dde643ad87
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 15:00:50.9010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z15O0VvpBrGAOGITkb5/Y05ckWmkWXcBfnra5oKm94y8bsDpfspUxCq/SnlW4BPn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:52PM +0300, Leon Romanovsky wrote:
>  /* Helper function to handle DMA data transfers. */
> -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> +void kmsan_handle_dma(phys_addr_t phys, size_t size,
>  		      enum dma_data_direction dir)
>  {
> +	struct page *page = phys_to_page(phys);
>  	u64 page_offset, to_go, addr;
>  
>  	if (PageHighMem(page))
>  		return;
> -	addr = (u64)page_address(page) + offset;
> +	addr = (u64)page_address(page) + offset_in_page(phys);

addr = phys_to_virt(phys);

And make addr a void *

Otherwise looks fine

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

