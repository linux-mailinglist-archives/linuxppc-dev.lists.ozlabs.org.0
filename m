Return-Path: <linuxppc-dev+bounces-15929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACFD38A95
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 01:19:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtHR92V7qz2yFb;
	Sat, 17 Jan 2026 11:19:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768609189;
	cv=pass; b=EZvbrq9RNFFbc92232zwLFBDkGuZ8TaZPWiammiVTw75dnWFzzkbAk0j9+0WNOiTkSozD/rknMpPjFE5haHfXrlTqag02dVNEZ1FT+fa1+Xyhp6mQSNbBqWiBFuXrx5L6VHC9qj3g35psjNMti+rzp0ew34SBqIYuwJUatEGdp1ahU8IxxplTHFwbjhr8PEp9+nCuMFJKSsBRFNYWZ48IRI82YSf81yZQ4vInk2yDnU8ojQURFkF6gykJRvZylrOp7vxjgFzUdaFzQPuy0XztozDsVk8bFSNkHxul+I3otdb/aHCItntqA+vivO+zQppnmCKgSgR0m//pJhJLsTipA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768609189; c=relaxed/relaxed;
	bh=rRAdcQhfayoNsslexGh0S2TcjkiUpR27hknstU7saqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VRJPtaCdl4fmxLUGWRkxZa9fpiR9Zz+epKo/HO9O+t/NqXd2x58Uudy9u7oy/DWwVl5Y/Wov3SR11S/j9tJ+KBKsN1eGRUVbiUZx/uHJu4jGj0/hxRZCFb07IOEKl553o+QbS5pyIukl3cl0P4exjCN4xd+f/3Om0auI5zn+VTpipLlXaDKMrYkWtvLcaAqEkZsQePZqBjZijlYVdq1Ez6K6Sxcbh5lF5OgQIFKxXUjSd5B0WO8GjMsDOH+MvRm2ZdfTu0F1NiQJwGkWyRUjIZDGGw+cy8m1rxR9WA8pow6K25oJDeIhK0Gz4/rU7RSqNaM+eKGOfFvmw4M1iBqhYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e5m1AwqV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e5m1AwqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtHR80562z2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 11:19:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuij/mtqhoBDQRKxx8xGDOu/3lGZmxUv24mmZO/ifO5EgUZgM4IpWs5uXKIpZ0lpzh0RcwCfefEDSldH5tUUCA8DHNbXdVkd5GyWVhih6PPjT0ynDxzAe1TY08f9wP4F9VMT7M4/n5B5J7fng6GeO0SnaReGqBfKAqQ9fRfF+kSA05wnMv9g4SczIzeRT+IbR89BTIEeRrIA3tZGitGcNIB/HacYrfZoo6y0ckx5BsmViCYUc2ewXjZUsZzNpZI3Uhc5t3zrgvUQ9KpQ0ztTrppvrpV/BOWGREiFAGYpU0sQlZN7lSuErDhLmLMQNX0MVo1lomcHdYFCEA9OSOr1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRAdcQhfayoNsslexGh0S2TcjkiUpR27hknstU7saqg=;
 b=cBq4JHo5df6+JdJTB2JKm0x+rDdSuDw5M3m3pkHhj8Rv0LTkA93bPlqjCWd1oOZSrKKB0Cwq6k7WjRph9VsVzhXuIqFlkVsPPGq/6JOwdFN8Wdv84852LRfUkvQVsMt378DVB9sDdwnt7JIUGEQFqspPcx7Wh2KsFimHdyAfRFRwWFqiF4isUnqK6TSR6mO3dUrao/Mpz4D4Z7Mo5k9Ydb/yfzygYfvxreF+F6HutgyW+uMHBV4VV6AxAsu0FUK7QwwOVfAokmb9rQfYuQz1hVvzvMyu3eu4R/v4JoC5UJJ5gDuRqJGN/2FBAHEVTQYQgOptXs0iasVLHDCF0Ui0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRAdcQhfayoNsslexGh0S2TcjkiUpR27hknstU7saqg=;
 b=e5m1AwqVPvZCYqUEegcVQDDNdsXhdB6EupMYSy+OcMFQ+FkGWnRN9G5koMdhh5Gj1pGRbyp7UsZrwp/OunV8iHpIob71dpQasuUtwci3W+4gw/59VPSSfc5lR6rKt2LImmzhvKe8wJL2rGVZFOjiippkWV4nWounzzh7O/MugPFh/qd4GGPZXTKBlBwZyF0eQaVsQE5iOgVPLFKmKkU+YnSc0cirt10iu84NVKmeIT5LUZmpbtJcT2BgTdY52peGQDgXL5KYHax2Rw3hyTKYIuZY8VO88+V6JBHZe98khooi7QIzBfJethaHGkLPNFRHe5Kl8Pvn0G/Fe9lSFygLzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sat, 17 Jan
 2026 00:19:22 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 00:19:22 +0000
Date: Fri, 16 Jan 2026 20:19:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
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
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260117001921.GB1134360@nvidia.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
X-ClientProxiedBy: BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::10) To LV8PR12MB9620.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd30a88-aa13-4306-5bde-08de555e1062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d5gKdZsbGPdwdzthGjCKMzcgaSScR3J4AdM3UXkFjXMOsvBjkvRNvCUzZmxH?=
 =?us-ascii?Q?/fpf7JlxVSCZgtD1L7FvEZqx32Cioqvpo6yaIQY8tCxi2xmJpMd6wBzY6+yc?=
 =?us-ascii?Q?ncy76d2zNXqcNxL1M0viGNps5Jum/Y3fdO4Y1Rc0H5QV4mBTG46EOYiJqW59?=
 =?us-ascii?Q?hb7fr238sHK+4W0Tqxf1MzPISqDFklCF7L0M/15Eat4O0rIlPtm0E2b4Crv1?=
 =?us-ascii?Q?kl3tEFd0ILyKc8gNAhEuTBxOVFoP9aBzFbIwakS4yPFkuiw7SGxITgj+NkGj?=
 =?us-ascii?Q?DVOnBwUnX8QF/HaBTjtSOU/+cxsxtxA4buljgTTVEGGbwFBC+P/1SdSy8UTz?=
 =?us-ascii?Q?NxolhV5dL8G4/zDeyMZ0Pqjryv6+rXIhEaS1gvwZzRg+nmxm27a/QeL9aLXD?=
 =?us-ascii?Q?xDLg8n180jqfGAwSD+wW+1zC7oYhEoZAhs3jh6pwEdSt9xfmT2gR3tjOkcbu?=
 =?us-ascii?Q?eNzLvrM13Ws+muDoizPhRxjw+HYAhRWAuEzXW66Gj6+BKLwcdSIyeRRnYiyG?=
 =?us-ascii?Q?DvSP70EKfpbZwKbs/3/LklTbEDhpgl7iE034nL7jaDuLYlOJHJoBbEXidlcl?=
 =?us-ascii?Q?D60BkeC9PQrJX+aSKIpzsy50K2iQF6sjUNUk7Uscq5hnJsiaF4SPK3P3oL+6?=
 =?us-ascii?Q?23/yjTxji25kjUlHfxTN9l5gAlJtFFLJMYVOjscVV+FQk0sP+UQAdDrFek04?=
 =?us-ascii?Q?3Tnn+VYni4Cu13XKr68EsD+qAYlWlpSw2mFQB0yFOAD4fR80LXsfxG26+P9F?=
 =?us-ascii?Q?hiCqsGzRCYOBBc8zQf2Te+E/GisdufDURK+0qI9zAaJq9YGrgaUOwU2npdTv?=
 =?us-ascii?Q?ute1QaPaKahlBd9jLB79BGRL2O8n236WlcBfPAtk/oAP5VwYN7nxkt6fwxDr?=
 =?us-ascii?Q?ugBkP+zVGf/jaNYut4VJvJ0/i+lEKvbeVo57AaWU9QtJ4psy0zgZC3HDmiR0?=
 =?us-ascii?Q?4UGEEi/UuX5SqTQFgeW1uUucpl9QzAo3Jf7PEeGFtpbVmq7RXsV519eMGfWj?=
 =?us-ascii?Q?q6EITLJ3YOki5d58bLCVD4oQoXvjkf23Zwp1ILwbt2vHmWhT10USPagQF4SA?=
 =?us-ascii?Q?nrtdbcK5xQd1CSrP5kC2lzvA6wcmR6pDa5SRsWsj2rKw5HYYkI2r/vlLU/Hh?=
 =?us-ascii?Q?2c2ai6fuxfqz3NhUt4ZtBCXg8UYcckHd9Xxgvnuadl8PLm62gRP68bCiPmpm?=
 =?us-ascii?Q?QDWi0Qid2CK89BAkjanrFUJaO08ezBh/F/tbAUsAB8ABN8LDJWZ6bdJgQnQs?=
 =?us-ascii?Q?FvOI++R4xGkaY3CNXxo8njXyqGiLqshMABYpy6ysMZicDLZx2ymQLgyvil50?=
 =?us-ascii?Q?rT8qxdeQIAOpRXs3BX5vhGrgObd+vaP7mfOG+UY8BN5qm4hTAucCd9IXqO2z?=
 =?us-ascii?Q?y+v/7o/iVvD1BH2isqMmendFZsh6G6uTRZ6PEEl1R1bGmc26GYaWiMXV8J3H?=
 =?us-ascii?Q?GeFLGoTC0Jhoc5re0UB/dKZyJtMTvF5S93/HOjKapNIen3P0NcluKm7zd2+x?=
 =?us-ascii?Q?65SBiKaRNlYIq75uRhN7YMup5iEtNug2rNGLMYFwoALaKFhKhGI1dxie1FpZ?=
 =?us-ascii?Q?DnD7lLr0MRlR8ws+/Mc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3fSugEm56nHigOLo1OKUhM/Vjr8PtrnW2zynWiF9QLaCY9pdpqr/gheLImOG?=
 =?us-ascii?Q?yxo08UbKxyeNcxPC8Z2c0//3qzN5KgJVfUhh7im/VOhdYHKyK4Rgt7Wh/iFR?=
 =?us-ascii?Q?p6R617rWjntjBvRRSMfEh+gtLfc7P/0YpuxVm7dM3goOdwR0Jxs0WyyGSOz/?=
 =?us-ascii?Q?wgXuuo1llrzx8eBy7Asx56em0+rsW8hQLamg/qyl7EmaNInWYv+ZaCkZrspe?=
 =?us-ascii?Q?ZCjV+NfD67SODgEDSJJ1Ym7ZjxzUCYPwzPEx8GuiB2cChXbXzViPAADsj4BG?=
 =?us-ascii?Q?X8XTjCH+kQIF0Y7rgLMshDbq54PYvo+miPcrbSJQeN8BOWAfBy4I4WzlOvF0?=
 =?us-ascii?Q?l7s0OoWchPD8n4WbMj/ogC+Z0weWw/vupk/r28R/b5gWGXnlRzU2mR9xkOpp?=
 =?us-ascii?Q?pPMydFCWafWBizRYCmL33wYFBbJsYN1vwMb7lBlOllp+bh+RxUi1D+Y8A4JI?=
 =?us-ascii?Q?GOYMLZyK/74OJF2uQa4CLVx56Umn4+sN4pH0ZXJd9mZcz50vzkQuoAAkrBmD?=
 =?us-ascii?Q?uosUGiXsrHI0Nhc4fxiVjrhG7uDtWL3uZO8ejn+Wn7Uj1odrm7cxpx3kv+sk?=
 =?us-ascii?Q?zczG84+bSSt08b+/jg+gaEo1Q0AxaruNw4hVQnHRb26xSf+hMzXmQenNUWki?=
 =?us-ascii?Q?Rc/j43jKe4lumh62mToX/apAU/SjYj+jvI9Pto2eh7L5nrhMa4oab8vBdRx8?=
 =?us-ascii?Q?8Xvmq7VUfzcNQTb+z+hU0795ndFgML5Dyv6ap+OgTu9U1mnViQdfDX58BN82?=
 =?us-ascii?Q?VTR7p3LF8V4SzWqfuJ7Oi8uwF9QNyJRfNnGq7By6TjPP0BbKytBig7TXTiNE?=
 =?us-ascii?Q?J9FbQvSHZMUWVng9cBQufRnJl4YOMewiuoXUXcUv1ngrFfWYhC6SouxDYClw?=
 =?us-ascii?Q?bJsgBTuEKwFrsfqEPET36dQolU+hOb2ZbSnZpSc04JG86eFzdmO73gFA139f?=
 =?us-ascii?Q?2jMupdaWuo+I7Pz1rtOOgaEjPYqzFhAw+FKxrq6zpufy5Ra3aXQmUBpAHH5k?=
 =?us-ascii?Q?RmYcI5XBsr/G0qcVK7w5StOv0v0lt/iE/q3eukSMhdW5WRwuDk9bbvPoAYqk?=
 =?us-ascii?Q?6haTqveWyIWnEXCI6frrVPARhLRCwg9mqCYqGGEeYzRYDaZEN/sGUEtnVAYn?=
 =?us-ascii?Q?tLrayRYjkf2ljPcSHWN2q8uH3qKabevzsSB7HlEtWE320UIyWsdyvXILox6C?=
 =?us-ascii?Q?OOEwjXfcGPLYEjrdGcYgXT092IAwUzqpV6QclEhEVf7oKtgLyCHI164/2f/a?=
 =?us-ascii?Q?KlxoDiINbKURl6lIQ4NTZXnzX7JPWOT4VOnYupASIeT0Hni5qg9ESspLG01I?=
 =?us-ascii?Q?uuYlnvs3baHYvzirfb9RfPbFDXVkZwiGm5CdsAcodrTz2F750kDf57KIvvYL?=
 =?us-ascii?Q?MtOF547QAqGEGFF8cicZ6hFbwPdZSdVgOlzUvsExmBUqnmWrvZG1hCCkgibp?=
 =?us-ascii?Q?l8OiBnp0rl9YvEk18pWUxGY77Xj0LQlS3Cp4d7xFk10U62pi2z87ZSnU5DUB?=
 =?us-ascii?Q?KdB6wU0Zbv2dphIGmadYMdEduxuEja2yTFeNgMtsiAcW/fH8hRUdigGfmdnX?=
 =?us-ascii?Q?jxXsByJWN8RnwUn4N6Tbolu05pJaFsPemayP8vos82TyhSwjKZhrOkrTRvp6?=
 =?us-ascii?Q?pcjkV7800RiQAQzZWJ26+vaTeDU7nlr1jmTmXpZmfae5aLd5bsbzBEehRocQ?=
 =?us-ascii?Q?Ad0ajuZk7B2vjSJSVSzaY4Q0+zQRrVFWG/w7dN85jagA9UOqdJ6mJWSMT+NH?=
 =?us-ascii?Q?qfRutIWVsg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd30a88-aa13-4306-5bde-08de555e1062
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 00:19:22.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfJJW83q2P0axrcGm9Qw2eNF+SGdTjW72ZeplvJo94AjBQbiwDOSxMApvzObEJgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 08:17:22PM +0100, Vlastimil Babka wrote:
> >> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> >> +		/*
> >> +		 * This pointer math looks odd, but new_page could have been
> >> +		 * part of a previous higher order folio, which sets _nr_pages
> >> +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> >> +		 * correctly locate the _nr_pages bits within new_page which
> >> +		 * could have modified by previous higher order folio.
> >> +		 */
> >> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> >> +#endif
> > 
> > This seems too weird, why is it in the loop?  There is only one
> > _nr_pages per folio.
> 
> I suppose we could be getting say an order-9 folio that was previously used
> as two order-8 folios? And each of them had their _nr_pages in their head
> and we can't know that at this point so we have to reset everything?

Er, did I miss something - who reads _nr_pages from a random tail
page? Doesn't everything working with random tail pages read order,
compute the head page, cast to folio and then access _nr_pages?

> Or maybe you mean that stray _nr_pages in some tail page from previous
> lifetimes can't affect the current lifetime in a wrong way for something
> looking at said page? I don't know immediately.

Yes, exactly.

Basically, what bytes exactly need to be set to what in tail pages for
the system to work? Those should be set.

And if we want to have things set on free that's fine too, but there
should be reasons for doing stuff, and this weird thing above makes
zero sense.

Jason

