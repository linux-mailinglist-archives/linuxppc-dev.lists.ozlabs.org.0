Return-Path: <linuxppc-dev+bounces-11421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43462B39ED6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 15:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCMdZ5xckz2ygD;
	Thu, 28 Aug 2025 23:27:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756387650;
	cv=pass; b=gp8qhPgm01adFOjzrpNlaz6LWkrMIdYw9K7XyWBW3LdhkRqG1tvJNGuJCWgjkye33Gr/Bk5E8mW6vhYG/Vb79Xv65auKNxKD1a9bd2EXS2ww5Ucsox4riJJ/CVVpKYAc8Gtj0ZbGH/sWH8FTXRnFBIGYBtmOALJy3WoGW3mIkM9zpvfqOHduS8XSi5xJXWh7/NBNrzX/B2gr0M2PNnntmUkKrZfGO2JyVaGoIrELaKwgCc944YrjMqMRd4TI+E3Ss4Mex1OAlmJODDRZIAnDuOt1wrseGCiT9fG4SeoaGUSZnHDKvbr2bIlOcsR70Z4iWS/fskTwMHj1BpmsJjPq5g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756387650; c=relaxed/relaxed;
	bh=TLwGmU6h1uV0qCtV4HRWJIIn0VTSZ/dqI+IK434meUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FLsuFuJnbtmavpyTnfrFOVTlaDeGLmT3zVkWAf34UpNCSZTu/gQ6m9by3X1sZlGphNJT19aAFj7EtShi3Uucld67ehtRgfDMYCyHdjL+JXfWZ4/4Flx9Y4NizqkDMxwy0GtgitvFW6WMRFaXJl7VR8HRAkDnPgLdQuhNEkrbAeHKjwRQ10TOFa/gac2kwym2yp4xvGzPOdoEoxyMqzBPjO27jGz6/cM5CPmXkkiJe+LlMH0YEp5IUCLo23qe9fKN7TxhOuqn8DTRB8eT9ZP+4zJyO6v7hL1R+KrdcK1qwlvwCMD/eda/AE7XZLQEjcu4QGcD7dc+w10JxJ029S7NhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rQpn04c6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::60e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rQpn04c6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::60e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCMdX4k5Rz2yg0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:27:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd9eEAx6A2rAYOyJozqfEX4RV8pU71nHjjF8ahljVKWx1NQMvRardEdElvB/WLJWdGfh1iWphfsop7gmU4O83xGqhwKe9CMp2i5e2ww7gtcmDzTPUhIKFGmVqq5F2Y/aY4iyTFcqZReAKNjmRMEtEXVaenDa1+AR0NhN6rqkys7BYzP5lU8Jxd7NWmd9eR+pKxlYB7YeT/MTZ9ecVbk4NAIjOvBSqjE4QBOl9F8HkU75w8bfq2ymm9BUHal42r04VkHnkOsARFDL4T73ds0O89kh1jHQP40/eugTRr53dwFEuVUo2NbjhoAq98tw99MHu0qQEymri61OZ8Pg4KEuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLwGmU6h1uV0qCtV4HRWJIIn0VTSZ/dqI+IK434meUc=;
 b=coRESzXsKw6oIUoaQOkD/Z2Hb/qmwWanRcWqsFG/bil84hSJg2sWTljACrFB20kddSUSHDJ6RDvQNZsJJNejQE6C3asVyiCy+RLXL+nAD+VZSxLSgOlZ0KHoCmX3fmjAV7NWkAZ+dWR5dwLYJKd+2REngROjN+WlYAdMbdJ/yBCKUX/ZvH0aLUDOdwqXs9oA9IM9o/xgthMbD6qAQO395y0BF4TGMKTzBqprQ/1AoidryjoluftRdfCK3fGNLWuZ5IbImpCh2bzBeEjm6+zxXvLIN/yqrFhDKd8maQ84tmqsPUV3ig6nvXgIt9BcnHnGm9yqB6EpLk/MPpCEITFOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLwGmU6h1uV0qCtV4HRWJIIn0VTSZ/dqI+IK434meUc=;
 b=rQpn04c6Ye9UKItxO6SXH14Ix8cRtL2UDHs4ISRAWIIqMelceLywwl8MMECLUBEUSVsX8JNQAHJ9BjCdev2psJbKyCBRJgiXxbxP5n4S6irWwHUo4Kyha2w5jeoWEkqtzb5b60BgXLyGLq1w3pI4tCxJyyMMA3hlOo/2v61c5neNn+vGhy1FO0+SQBm+aV2rN56fd3v3X0WWne1zDGq1WGRGT/zTQEXRga0PySUWzy/D/eFx9qrUphcqSrkh3CyGi7/wQBvVHa5kHMvyxipnh9THsyTDw9nEDUIDvEiN3VUAKnfO7kQJXrXL+wODlONxrGiGsTo0NxZu59wsBKAiDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 13:27:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 13:27:04 +0000
Date: Thu, 28 Aug 2025 10:27:03 -0300
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
Subject: Re: [PATCH v4 04/16] dma-mapping: rename trace_dma_*map_page to
 trace_dma_*map_phys
Message-ID: <20250828132703.GC9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <d7c9b5bedd4bacd78490799917948192dd537ca7.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7c9b5bedd4bacd78490799917948192dd537ca7.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0293.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::21) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 297629e9-d6a0-4274-26f4-08dde63693cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?czdNvlljPZsTPbzSSuugKdYWnNsYJthpm6ajyxrlWHCasD/3QUWoECGQ1E0T?=
 =?us-ascii?Q?jRhPZXNnjd9X2r7rXqWMakMIm3CMLyQzWXxiji5gNdlJvrMkg9r2sHbwk70d?=
 =?us-ascii?Q?EJTKr6t7B1UHuLxbuGZ89kzikre2Sg1AcVozknNd7eo+XihYfGlGj+b4MrP6?=
 =?us-ascii?Q?VGriNtg77zKiRNfyrOfRDm6XTZjEPiZW4w1tCqc1+I4XdGR+NZjPbUUqIbhA?=
 =?us-ascii?Q?XTl7CdVtpHFrzdIFiKePkXujr5QyRYFspeVDWq1tRTJUO3w0UJ/B3jfYNkvU?=
 =?us-ascii?Q?PSiC+7tyCX6m9QO8TKAgMUXNsA6uj51FE/YlyI23728UMh6Tb5/lhs5rwnyJ?=
 =?us-ascii?Q?FviOLoEdR0Gysx1R+sLsVQ+QFCkb7h5br+DAjgW/dz837ikefNnNDvxnI50f?=
 =?us-ascii?Q?WWkyqwA8hF4HbkP+v6ZtQZwiMiJFHKUc82muWM9mrCU+CYGmkmYiHe9cF+Nu?=
 =?us-ascii?Q?cq63AcRoVoumS5h61MMx2QaBkGg0y24V8DNYrWP8lms78qrS/Bgisik5aYtm?=
 =?us-ascii?Q?1qIAP7bvtoBqMYXfNRPdBi6UO1uA/U47dWUojABKhRrTiz45gRhyNz6ra/Lu?=
 =?us-ascii?Q?U22LAfdCRgdDD+bcIWfVTdSPNjO37bg6EjKQz7x2lpo1Aborn4roOKrC5oTn?=
 =?us-ascii?Q?r1hIFhETU8+TYUi7U2X9alkuuss1FxJRxiHsJ4C1pc696ZDJiLb9tGGzAOno?=
 =?us-ascii?Q?SJ1Z3Z/5OK6GQkzSIfrh4TxN9DAOLxDF8491hljTgmQrMWki1eVYjfrQElE4?=
 =?us-ascii?Q?hU3yqGMsWsgTnda4ZD6iFniASa2cqo6hOcDSTW7TzjYiXdMY9NMZH8S9xT2i?=
 =?us-ascii?Q?ZItA0IwZQylPwLeZWr5EDDWLxmk9LHYpw3kTCSIqAKaU00dt4MWV8m4sXZIh?=
 =?us-ascii?Q?h4I6rPAJUth0U2gcJjonT0PwsrQV/NxHbV4VZi+GyB7jZsCEe6JVGoswD3yu?=
 =?us-ascii?Q?KG3hkuEiHT28V3bsajfefAdO5ti3/kqmhYJ55asM7+edmB6rhH7+IRXXZXd+?=
 =?us-ascii?Q?f+KVlyoR5IdWUtw6ScaV0SSH94eUXDrOflNMU/qaYsQWFVufY7xOXl+6P9N7?=
 =?us-ascii?Q?FSCMzGhv+nz80nqIIInjMYZ7v3/FP4A2vbGJ/Mcl1JkF0701tFtRJQHyEo2M?=
 =?us-ascii?Q?rM+Mu44UFIpfiaiVKVELFHCf12vjrW3ddKIsMhWWMKvvhsiveTG8OxjPEZnq?=
 =?us-ascii?Q?Yv0oD1SWyaeynNQZ6rpJAFtHMYy47sl3akZOs653VcHl1qcODZ4LPbnsRg/8?=
 =?us-ascii?Q?C6f9IdwM6mgY6zLzaj09wJV+LDYIZEWNBZLZSEjA6e/Pz417sBpIVWU9nzsP?=
 =?us-ascii?Q?rEeKG92slLYu+hEPVkPg6Rb8U53kZ7oCm3UzgsrX6SX+sFnEwCuBuvH+vocQ?=
 =?us-ascii?Q?kpQPVWVQgBdWZ1AdnmVFfX4C+IUR8D4PDIQLI69skou5Vw0Tw44kgP9KPXLm?=
 =?us-ascii?Q?sOiL6Nbe9uk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZAKmjLWoSz34gFmZnK/Uz5xPsr89Vcmg6Q1YT77QQxenOMeXPtDZ02X0k3T6?=
 =?us-ascii?Q?DG3OI34wAP5iIQkS/U4S7ya39155iSFgLhzJmeQnOBEKzOhR4Pi9Ozjg4pY+?=
 =?us-ascii?Q?K6hiepGCVodIn8tdfiCuf6a+SrWI5EHPVfkXoFQIILjJrYBQwzTa7jm+AgWY?=
 =?us-ascii?Q?9kS4Td7ddLAue+67qgmUTRv8BFFBwAi7h+AGAvo/y4rbGi3rR7hAXom6Y7cT?=
 =?us-ascii?Q?eFwMu+2o7uDeQNo/9sd7PkYcNvwVTSm5IgyNd5ZUXuz2nueFL1YKn+arh9K+?=
 =?us-ascii?Q?HjvkxOsaq9RFsWke+hB/3LA1kWO49y7DdJJGvnAcs7N9w2t2GNjY4Pv93wIk?=
 =?us-ascii?Q?6ilj+2AGI8nvTTX5HWUyJPZ/d1MO/TLKQe9rB55cleSlIT6E69RJgCyOLKeN?=
 =?us-ascii?Q?60xwGpNkCePzmIV5KYEJMcdDDYe4doYTMNRX/kzkNzNWrV3zIDY1vCwWgvnW?=
 =?us-ascii?Q?WG4mUE4bvSW170WTSDPb6V2ZnkUX9qhtaqoOjqeDc6QosbMHfXxt1hYKHPjt?=
 =?us-ascii?Q?rEJ9Dl1+hS04/VOmMqitUchhBJREEVoCd1amnMKOgT9PZnb3KBmTgeTQYbw0?=
 =?us-ascii?Q?54HrYK4YEoxB/6rpPe6KuGlcOFFgOCyN1IS3IQpz6g5aDOVPxRfvpA6WBVWy?=
 =?us-ascii?Q?UvkNDmlEquMYXfd1jCBc69iKHCqS3JBIZWCkOBaxm+YEjhORgByTuEZaj3zN?=
 =?us-ascii?Q?K/iIsUPmXRzUn8xIzuw9tuDHO2DKkNZohFrxVd0XxEtuid+tteoYGS64L1/k?=
 =?us-ascii?Q?oXeMH2ze0CXia91priLXtYAS822ItxYkcGe/mXIRc3YwMnnzXYmLddBBGzox?=
 =?us-ascii?Q?0ua445bUBZxYG3XpnJHW5se02szr4kukMu8xMA+S94P3No78I0o8wGKfOMgW?=
 =?us-ascii?Q?4/Pu/ZvxzE3RZICBYBH35cdT+UdXe2koKMnO06xwLEMu3QhLGo6RpB2Av66q?=
 =?us-ascii?Q?rxaoMAyQr7jlpLC8FS4+bpv1m46ptOYSnMLqZhw0dG1Ur5epxtL3CZTuFF67?=
 =?us-ascii?Q?zMQFAIVQus4PusJbVFUfWViaM9z2LdUb8qOKEVc9yHFSKZVhY4tMXQU4uelB?=
 =?us-ascii?Q?WIno3jK6BDm6Hzf/NrwDDsUXAFiQH5N5gDla1kh5yXNWssmvSKyR6nO1hKL4?=
 =?us-ascii?Q?lRngphKojir5/gDZy7DhPndm3G/Hoj46qaOo59FgXNnY+z0h4gTWwbEmLhDh?=
 =?us-ascii?Q?ZQKNRj8hEJEJqtv0MACzJMQI1tvS8G0CIw+ilHS+5uArgY4VKhcrNoZhCqiB?=
 =?us-ascii?Q?5MnnBDvglG+IfHWu6IMcX9t0KZ1728gzLjB833lLBE4qYcpD9cnES7T3Tuw5?=
 =?us-ascii?Q?dQeW9DjxbqE1ILRGOLB0/CsOFrKncHc6CxXHX6kxfO4QDESQ6qzHoD6bAHkr?=
 =?us-ascii?Q?P8nlsRBhh+eaPtkNqgtA/azmq6TpNKZxMQnn8eN8V5KuLioq7n4cjlOx0rNb?=
 =?us-ascii?Q?LFdNRJMc5g+0l5xLl7wWc/W7AnMpocDfyVDwUtkhrEY/S+Q5FoWzIL+ayFwE?=
 =?us-ascii?Q?VmTpKTDRNfqHN7SR91nghMOKa3EZk/r3karcJCmOXukZez9mlZ/4F6IgFrlH?=
 =?us-ascii?Q?ZO6xPcvjZRXhs6E3ap8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297629e9-d6a0-4274-26f4-08dde63693cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:27:04.5221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGO/7rFcEAJDfFVtKqdLW+l6RopuuLnfoyI6/MoVuOOAhziHFak0TU6alJ+R6uUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:48PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> As a preparation for following map_page -> map_phys API conversion,
> let's rename trace_dma_*map_page() to be trace_dma_*map_phys().
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/trace/events/dma.h | 4 ++--
>  kernel/dma/mapping.c       | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

