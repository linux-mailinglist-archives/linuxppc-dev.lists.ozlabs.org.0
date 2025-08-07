Return-Path: <linuxppc-dev+bounces-10729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D33B1D950
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byT2X1ypBz3cRs;
	Thu,  7 Aug 2025 23:45:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754574356;
	cv=pass; b=ZdYRShbsGlgckpZRCgIlTN4OBtkVebEyJjb+8l/Yh5+i1VawlDMFtzvuoQztAS93DkUf0FIVQAAVoExh9cWQrtgASIaByK+dFDeLQ/BsxJlyM6nNTd+mXJ6hHlQh67ktH7l84a1VPcszs87iQx9qCAFpGGxLatktchpMJN11i5Pl9J8Yel7niTluhLG9/yD9TbmnPtA9IxvvU7KVL42HeUykA641Ak0m4jNumAc3YbI7EP8KQ/wEyL0KBCDMCBGyDFxEMyUa7+MQ6Q1uftLmifou/skCDzcyCp93jup9+LGntcfjHQLIVKcapz91stNtcteiU0nMb967Xps/UlB8FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754574356; c=relaxed/relaxed;
	bh=BqFmusTHMkkxrcuxFXcvb9JKzx3GQS2+1TQSkSQmtJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Veag6TlWQYBmKqIjC+TpD6sWOxA+qgHosifevRwRlIqKeuMOKGGv5nvvjalEbKKoZkhuoDJ52r0KEilf8eiynhXMe0YldaUzD8vuW0e3ol56bw2AKq1LXOJY/5mUArujwVT5DxtBo9B9RPdxl6kf6wXLc9Qd+O5UMy0hcVSRuRLuwi9ChcP8vXZYN231e3NBVZgUhiZY7P9V7JAozP/WJQws7QqBiwwj4F3t3B2bFxHADDYouptQ54vIZmIRSUCgy8GBurqlru4mOmJrP8km98gBbfZtTbw4HOs6zGZVsbNsZblvO1QT9D2jGIrqPzI3gVzcxBeAKtNA4XVjvHeRig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e1cuXmoH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::610; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e1cuXmoH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::610; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byT2W4hbGz3cRk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:45:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyPo4KZx1mo4QWXFJhOemGlhQ0nGX1Ev42fztgGvIhBIaWQUfOWPbsaAfrZ9mUl5L5gSc0ru/bDbZs6ytMod5hKqeVSatYKWSNuPDdu+qJRHj5LV4d3ofbLFANbU+qYQmU16FYm/v9/6+oY/2SiR7c88L9uPNMOn8SmLwDiFr7TQ5vNZi1Y1my8JcJkELECA73uxCtAsQ6soCd6MBPKEkGSi2PYnPKzhDaey2I0OgVRntSR0U3TlDOM8g1+66H0aJMweX2ApsSuOuuIsoWLmq6vPfJUBDutY1O4L3jePQGc0ayAhZfEu4R5oemeGKRRZEeAAm5kuhGgPv0JD3mgBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqFmusTHMkkxrcuxFXcvb9JKzx3GQS2+1TQSkSQmtJ8=;
 b=bV5NWJNRbBciaVnywm3XVzKQOdmouKrcuLgG8M2+inVQXL3Di23KJT45Yiu9wcFVbrgijTdw2JjAgRWYcVfBkXZ0AHuQQVf5tzyBRM1z6M1gNrFcncF8nxfJH4utXGj0rEMNy7CRo1Wl2jXYvWd147mNPSRdvOWjLF1NrAU9OX4CeFpRAhOomtV+9gvTASrhFd4h+SIYbOdeDpsNz56erpOvvicif1h561hizzpEWXUDsIwhGYAehDFHZcEuWXAUt9RMWA8wWSHik3zO33e//3c+iC4+erf0heO6vQtAJ8p8pQvUEj50FW8oQGCjCYON35mdvpSlCtLNSySaghXYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqFmusTHMkkxrcuxFXcvb9JKzx3GQS2+1TQSkSQmtJ8=;
 b=e1cuXmoHKlPncJOfhxM0EK5STNf/i/W8HLj1PN7oh9DZUNgV9SVfoPg2iv8freUD1azJcfct2BSl+aucuJzbX36Sjme8g2cPsrwgDwy5qN4xnDEHS+x2WSJSkliRJZTcpzRXaOiEKc08AP0eTsFtnl+pktbRyE8Uqn0FjBbZuJZDyQJpXS6lhDaL57G2QqkLv7pAxriuS9bHb+kV227B8mg2mgtfKuFdUihWnqHyknLUlQ+U8rUqh2aq2dIVeFuxQl775rhEo0nKCbAsQzOtrJz4/zytof4RCcT6mbGA+Zd/9PabNyFquXoE2UvHomjTDotY0H3qqvzlmBiwKy3D7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 13:45:35 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 13:45:34 +0000
Date: Thu, 7 Aug 2025 10:45:33 -0300
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
Subject: Re: [PATCH v1 16/16] nvme-pci: unmap MMIO pages with appropriate
 interface
Message-ID: <20250807134533.GM184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <5b0131f82a3d14acaa85f0d1dd608d2913af84e2.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b0131f82a3d14acaa85f0d1dd608d2913af84e2.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0366.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::11) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e4fe19-3ccc-4d01-7dae-08ddd5b8af04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WDXvgPGUhS8WpBtlERwsgCYjRKS8Gfx/cjnHty7Q28G4eDSzV9wvqstcw6yw?=
 =?us-ascii?Q?4jfdhirce6xAw/pUbWg3fbu6nHGHyliFkKC9QDf1/ugii2Ei2+Vt0wpphiZY?=
 =?us-ascii?Q?aj4Nrly39ao1YlPg/VaPLQfHxaEoSaTgsoJCECUBIOjPO/QRSvPnFe/dSJMm?=
 =?us-ascii?Q?2uSEY726Har14PSd94XC/dZXlhatbVDjW26+7noxHKuRbNlOSyrdph10h922?=
 =?us-ascii?Q?H49ihXeT9u7QnmflupsSg/8AA6riMyH+fnr5JF59MTFwuNPEG2KPejhDlFsW?=
 =?us-ascii?Q?UQ1ZCjbx6MtvXJf1i+q91VDYUKGmgua3T61eVEbBKmuhsRX0O9qeZyBI2cjW?=
 =?us-ascii?Q?3lXGvTAysEYtawHM6UrdwDS/RiqE9MmYcIG81xSwc7jk/3gx5SKdBpdI5M5u?=
 =?us-ascii?Q?cHFOo1xFGbehxgBp5HLJgDChohFM/uyPRjbLcCKK3Bt4a0lDD0F/UEBVci62?=
 =?us-ascii?Q?qUcWzxDznPoUFBTU2xbJRI4elzPfnEAGc7PKT5OVjO4kmVoYdevktyHVlm9X?=
 =?us-ascii?Q?R6U80lTflsE8pkcZREytNdRvWz1LeLhh+yniYjqYtrx95pMjSPxyPL9Yl8r8?=
 =?us-ascii?Q?TcZhwTLyQMTe5V1NFnq0P8+0ZypVRxN1zbrB7hQMaMTtrHoYEdJU8GNHmToZ?=
 =?us-ascii?Q?aFD9hDD7obzuiUuATRs+PgE2LocXp/6b/vqjAu+iWu5EwebEQRRlwGjiyYhv?=
 =?us-ascii?Q?ybU6OeHsPkfw5DzhD1fvbQ8PqJrV9u2a4YYQsVMMSfuCNivbhlVgEU2Y2+Gq?=
 =?us-ascii?Q?QobKltiJ5+7iWYpfX7BYBIOkQxjgWeg9B67eZmPbJyIrEsUgu6AZx+S9t5Vf?=
 =?us-ascii?Q?xlNvfRerWFyk5Jo7VztKY7NXaS2SVgztXRcfSqefmGOkPNW/Fg5a0YJ1omE4?=
 =?us-ascii?Q?C56pKQn6BgULSoa2XbBpV9Qtko6gcNXUMDNepZsirersNub1k2FQVF8g9TR+?=
 =?us-ascii?Q?EnZdk85xrW3usda8JzmhlO/7bki/ARqgj/gI8zQcRQpNvLXWqmkpL/co6TLw?=
 =?us-ascii?Q?8Emj6s7KSTJx/THFAYF/KVVCEmw/2vQ3cZMdS3UMgalseKK237M5ioEIM0KP?=
 =?us-ascii?Q?PDd/WHWoBQ+Cy7dagZxx6LToQDxTPNDU7MOsRhNoiAzT+NUgcp8b9JklDKNT?=
 =?us-ascii?Q?7XWp1bJ5QnKGVGY6gAe5q7gbj+kMgp2iJbH4zoTHVTg91gDPcdp9/NAiwg3a?=
 =?us-ascii?Q?XRIdRCbeNhPzZaFWSbIFBA/saT91G3GnZGBXU1xQbPQGwI+l5glIegQQTXmZ?=
 =?us-ascii?Q?Llw91xo+W+2hGNGQ/hMD5QTVwtuQTQ8x0J8MXzzc296wQj7bExU8jncVqvFv?=
 =?us-ascii?Q?APhndbVrMQukd7LWC9/D9icY9CA4Rq+/nTh/amGPWSdKtkdSuum5rE7FL6fY?=
 =?us-ascii?Q?Qr3bIPoStYraRAe6EktVj33PwN8klTIuDqo4Wvg7SwfW8PSfL/JKrU3pjaNI?=
 =?us-ascii?Q?LRULsD5Cvuc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1UQX6TFMBcy6Vs+trTNtXib2FJeK9rtIhNCBceB4mjYhsDlm8RlLJE+/3YqU?=
 =?us-ascii?Q?NbEL3CVunkrrN+XY/L+YoKG47Xj+WtrQ79A6M6RaVD0SooEQp7A6DFOucKiv?=
 =?us-ascii?Q?KMe3PCuB9xxyFwSEiNP79JtO+ffkE8sN2nODlc/1eUZoszWsIn8+7zj4dfcc?=
 =?us-ascii?Q?INRXn6Bk1Ti1gpwzbhCwGWdw2IaAIFqxo1D+935OJ/3sREtvFKnd/CZgPw9X?=
 =?us-ascii?Q?cEx+tdXJFgyCVhX6Sfky+JpBeqG6aWrZ6WZoOm09ipkrCVFfIPlCGn5NNeSe?=
 =?us-ascii?Q?qSYN/KFyVtT28gPfKPtB6QT0xbLhMnBGSB+sHGrfOL0eR2LSnuMhFc8zsBFO?=
 =?us-ascii?Q?e3FIiQELp2lMet8pirel0YnwgKuIYmflzJ5t73L0KZVYii/C0APxPOck453m?=
 =?us-ascii?Q?CkdOHLWVXwizjQGIoMgXngtrShcYYwNADzjNLagLg0XeWFa2nIsJc5BqkMdq?=
 =?us-ascii?Q?EUqHMS0UXFZaVUcZa9Cb5iwFbUG0kq//aUK++pXzR2CODwXmMI5yZ1dD3UYP?=
 =?us-ascii?Q?EHrpvfaLYQHK995WzjZ8EIJ4otP/ebDucVwBjI3Ktffc1/9o8O+SNuuoWUM5?=
 =?us-ascii?Q?gHrqw4clcI4/OchmuM6aASyllQJnGRCtKHCUZFfDqAvYM2WCdP8BZCCvntck?=
 =?us-ascii?Q?Vc501vzs+o38MGfq18fXE0Gn7IwQGlGuq8kh80dVMN0jjGRjYe8OAWW7vWOE?=
 =?us-ascii?Q?6f10j64Vj31KZ6niN3FHHbPHqxrG8Oexr5dhz+/2ZLmSTaeKDs/gxB5q9HeC?=
 =?us-ascii?Q?PbZfpcmWARFDn2H03mjMoo1FbKHPVQSn78HOr+ZXdK97oi5swsKb3K9N/c1t?=
 =?us-ascii?Q?6Ojj1/QCre75J9p5ifpFyXVvTc31dY2kykDbII75dD3JyHMDn4F48V8EHlHA?=
 =?us-ascii?Q?hKakMmdO2KvfwZV2J7ZQMefKQg1MEdvWnz20raKOEtTfEnnwlqGk37Eujnpm?=
 =?us-ascii?Q?s8BTDEu547J+qOkK6B8AyuAdTNOsY+l8EZ1uOUSk+499rTVW4BH7QxrskJi9?=
 =?us-ascii?Q?3LQREu73jz7GJ3i8eRr4/OSgF0bx1uOyJuSTyCJyxvQsiyM3Q66kPMmDNOg2?=
 =?us-ascii?Q?zYQx+ezbZOABwR1PD+97X20i0ufTZp8AJaJlhb1/CGDAwSBggQsLBjAH/PL7?=
 =?us-ascii?Q?Gl2nwK+E66SH+FY6GsKqAEWTYf733qg2Orwuss2yPzEv4V/efxjNvHxFEfok?=
 =?us-ascii?Q?bLIoQPcjsJOxZCiaSX+ZMdInJENJGuCsRxG9gtieicufQqE/4QLPY9TtF9jD?=
 =?us-ascii?Q?JaPUxs6XhFDje/6mIS/2+xYzBfxNTENRN1+b028GqSc++LiOlGKTk0kucdOQ?=
 =?us-ascii?Q?i+J5mVsJgXlT6uU9fdk71HGmoH2SBDiSKrUx4FcIkR23BaV8Aa4d5m8LShgN?=
 =?us-ascii?Q?AnfrpcQ3Z+UHGUdTQV2s7BZlzl+tNG26a45wcsj1STZu8d/BeApaB3RaUX0Q?=
 =?us-ascii?Q?or3atunX0aL1YwD6kd/k8QuuBxhnDtglAopiolpH5JgiXzgo0+79zj6LmbUk?=
 =?us-ascii?Q?yKXaKol+waFIOYy1llv+zijOATP73oox90sNk6cTZrkvFotnMsv/4o/cYPiB?=
 =?us-ascii?Q?AZlMssGxT0v5NtcFpn8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e4fe19-3ccc-4d01-7dae-08ddd5b8af04
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:45:34.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQXX17i367Y+FuswGMUuSDPrOAkEDNqGpfqZ4jQggDW/X3Rs51lZS9V9SpsgjtzN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:50PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Block layer maps MMIO memory through dma_map_phys() interface
> with help of DMA_ATTR_MMIO attribute. There is a need to unmap
> that memory with the appropriate unmap function.

Be specific, AFIACT the issue is that on dma_ops platforms the map
will call ops->map_resource for ATTR_MMIO so we must have the unmap
call ops->unmap_resournce

Maybe these patches should be swapped then, as adding ATTR_MMIO seems
like it created this issue?

Jason

