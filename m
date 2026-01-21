Return-Path: <linuxppc-dev+bounces-16088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FiLCKhBcGnXXAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 04:02:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94880502DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 04:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwprM0qdjz2yFg;
	Wed, 21 Jan 2026 14:01:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768964514;
	cv=pass; b=VDhi8zsdeU89j+TJHBItvsLEfpqE+CtNQRBl9mBJ1Y35u4FIlLu0wd1jxvcfT/fptXbBqULJRsWEAEAWhF1qrmNuxRwWM0HwP7khAek8HT2EuCZ9friorvO9/7YZDh+RjTs5u3Sx68BTXStd1TK/mgUzphDE8rmZsBNpcreNwA1Jr39Gtq4SwZGPPAHqlYf2QzQxxxq+aLo1c5YaKA2UqvCfWCYE2V0l8rUlVh/ZCo9esNK1Xorv+S+aabkMoO9BrYd5SWpKBzsTQDs2yhf1+3KUot/+baQoVuG6A2g+PRB4T4PrcsXIZaXOtPtaBnrsxnoDf+R4VRWtHUHMExIcAA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768964514; c=relaxed/relaxed;
	bh=RGFm5omnIbaI7TAwbR2BigF2BJ7B7uq7yqX3EsQ89QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R93+U651rcSjYlYgCGcXrrEWMesI9Dgy5v1uDjDJSZHuU9+1jd9V1k1MCgFLTGVn5AfXSkHeTaPHf6t/Mh+GSAYwH+SbO5zxnujikPbsJnoa++O2h3KPPr+QqOBQAItqlChKJXPZOZ8A09KwdH3tbvgH7PGTijUMypzUhSr4UqoULHyEIaZQDkv3pnq5fzWAYGx67e25VV2Zht1x0TNC9U19gu/vlIRD0bmfeLuM6MiRcObNw/irC0x5zgqbMEIAHrAdbjZY3T8qM+zgdgycZ7dZkvdixlVFFRtWWuEybXszjwvSjsfuubk7HD/wGXhfnexoX/i/GzD0y+WFNvJ8Pg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LqrT5m5/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LqrT5m5/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwprK3NtTz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 14:01:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Urqq3YBhzbNZKP8ys0UTVTp2yCsULQD+2Hrh+Ih+9Ri7rpREWWf9hgQpybPiTfk+qeooCK7KEfxPoSqvKbBMmcQYOkEONK7/ShtgB9jN4NhEJXh4xAHMwVWE6Q2iG3McwXaAyaCEaOBYVVAjrORD2SUuY5uUVJprm/98uPu4xggwVqsRCE3/u6ukflqYiROiIXF4qvrK6LJe1HT1oYy0cLQC2vPhqZC7RCmgW99N2j9dIFsNwXvIUKQNTbYVUNiPKXahJ6nN5y9QXBNH5BHXJR2QkfrL006wGbogDmpHYOYr3COgDGX8D6J7IGgS5lLS3avplv7HGst4wMiI7Plw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGFm5omnIbaI7TAwbR2BigF2BJ7B7uq7yqX3EsQ89QY=;
 b=jrUxvawLzoTrDMcSCbd505z2XPzbAd02EzMEbCcWWahJ8DL0kjBSsng2Odmgd85iX1qe441TUNMljpIRdVQJWYRarR2KPh6d2Ng8BFxwWJB5D3q1m1p8s+agZ6XLzFxCFEUOwQ67Of05rzNQj6ac4mljcoF/l+1qrHd/6umGsdyhm6Sv1Gm2qQqskAp73CGge5ZtqPmeyoZVvgcw5yuRJuJhFHwPQcYSDtaOFBR6CSwA3JUlDaWg8rmEG9M9AR1RFqOwf2sz1vuKEZJeSzapAjf9DHWlbKxUkRjgqRl+RfaLjiuQ+dgchf3vjRDYPagc9B7RiWkcHXTYRcwyI2q4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGFm5omnIbaI7TAwbR2BigF2BJ7B7uq7yqX3EsQ89QY=;
 b=LqrT5m5/NaVC/cikPYwj+WQCasGEaY+ZO8A4u2AgI48Ee46wiPiLUrO+S3c2U41zP3ddiHtpGCsEHuzx50ZAJYHjTWmQNpWHNJl2QJ0iaI9pdJ47WDxnAw6ezqx8omrEJbxCS79i/gL7R1SjF6lCWrr+cPN+LgiGw20XWLnc2cV7Uk20Lr44WCB20Ip5G9vSjzGRcKBtfUO2sDW6wh37xS5Xeg3M6J8XLWs8m/UqGNMHlIMkQQ8YjcQ+zN99iY5YHMmePXPYvBKNVWzgIrx/U5K/fYhe5bESsRpXwsqLWpzSY/Xo9DxY7uTZnq3yD6zF2rcUxVCfGIy0ENv5YGj0Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 03:01:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 03:01:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Date: Tue, 20 Jan 2026 22:01:18 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
In-Reply-To: <20260120135340.GA1134360@nvidia.com>
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
 <20260120135340.GA1134360@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To DS7PR12MB9473.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efbd241-e62b-464e-db2f-08de58995ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lfuh+qkEQaKyB2lJwwjUa0vFHhPgaa/HmR6thYwVQC1HLEC9Pgad1PXLwA0j?=
 =?us-ascii?Q?5YEP7+WXyjpnlHMXxfW2tPkSkvdo8o3VlHWINEIeo3mG8CH/Wgsr69D6d9VO?=
 =?us-ascii?Q?7pD47HfaMr8mik6onZYBfAfPTxp5Va473xf+iGbk3ZGJiFwVxn36xtEUsjuZ?=
 =?us-ascii?Q?S/ZtgZrf/RikT2Eob66QPhzNCNixlfAXa6VLrFVnUg2YyseGlgotwKy7Tq43?=
 =?us-ascii?Q?jraqthFX0HvP1iBQkv53DJppnUUUC2Hc4JV8WhljF24BKVTKdutiZ4kuxzDB?=
 =?us-ascii?Q?txCqly79zwvn5OI/RAiHMgwBdozq3ONzHjhmlVygBV/s6pe3gvn6MzachKK0?=
 =?us-ascii?Q?n7CrTCMe69jnVEB2Xh6ERzAfAElb4+9aVt93Piwr0tgYpaT4/6v41D1XeSTu?=
 =?us-ascii?Q?jcI+Jix6yb1im7qwU54+E8xIHAmNaGIhIpNkpHDQGpwiET97rdBkIaUKz0Nj?=
 =?us-ascii?Q?OkWfW2pW1A8yjvfBXpohR8AsLVDNHXLLw99deqPo2wf0vKLxe4B0oPu3RB6u?=
 =?us-ascii?Q?sQog6GeUmpS9TjNewIbUqvPwgYXUYfIA69v6KKe4uu0CJ+mVglcIDg9LSwCK?=
 =?us-ascii?Q?uULoVKZ4fVJ/Oydv49rbn5/vrKG7/hDRxY3L0smehEFZyuxOS9eT1v2FR/pR?=
 =?us-ascii?Q?5nuRnLZd6xEeYwzvpc/KXfY/xnvNJvgJWOmJeim2V4Ip8vIYD4DwfMUwpkif?=
 =?us-ascii?Q?UmD25InoHVMFfRjfgcD9RREVQA9LevJB/vB5BnYoomUjv2CPtiMBgM+2ldnN?=
 =?us-ascii?Q?j9yUoiXXihq5u6nHFgWk9IxAP6vwx+0Mg9niU7JrFw7wdipdl+07l9WirKvS?=
 =?us-ascii?Q?HcAhYntU3+FiLquiaHX41j1UcvfibevtNsLJtpDsgYScrxqaPHK1jXSA8xgs?=
 =?us-ascii?Q?9Q0Fx+IwDyQrTsUd/pBUEZwdGRGFmjxjKEgAI/n0XKyZ1CJTm7ovD7tramcJ?=
 =?us-ascii?Q?d2ELjaPZOe44CNzopgrU4+hWKfLs6NYbGcw2olDGIL5GxBG555PP9564A5Ca?=
 =?us-ascii?Q?TgVxBhmHGmGYLN3EWmYRXXRoe4HdbBm6usbRicwy6CRMN8My1O8imliQSN9L?=
 =?us-ascii?Q?bP0oteG5J2vlvBF/f+JR/jOjwoJzyM/4PrHV7h6ksY6uSxpCGAovv9QAiIy5?=
 =?us-ascii?Q?jQznbTHDOHTUjXQrr9MM0pXLOTg/XbV3vZLahVmt4z1QSIJcugnxyjo7A19J?=
 =?us-ascii?Q?UdJxW5l+FUnOtSmkpagDMMNVjxHPijzQDtVYs+jhyFYaV1vs53W0GB/kXsm9?=
 =?us-ascii?Q?GCDgk5VCn/m8kLzK47kcP75N6F34IqiScwZOdWIE0L+Y0MerFx/lewGyWMec?=
 =?us-ascii?Q?+I58hb8JQGywi4leFb7ZgIxv2iICnBstXIZ6EclWfC5hTf57zKHAFWLbMAaX?=
 =?us-ascii?Q?ksHiBXRPeTAslRosRN6SGCpV2/idDWdkOnwvba/FpQyqcpGvdh8IX+h+G/eQ?=
 =?us-ascii?Q?gPDRErnLdlsUM907Eo2g7wk+zV/9NcU0hR0PEePKVy6LGN/Pe8uV6+rUjD6T?=
 =?us-ascii?Q?MKQf6a92G0wqd2oHZp1NLh2mvezwYJ/XVeZEEHb2BWBg6vGlWhLmMmhEjy1s?=
 =?us-ascii?Q?4flEFgX38rBihYgjUXE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRtQCVXIz6ccof1ZDmXy7mnbpwUPci5DGqAVOk5KEuVorU8Ke7sgiENw3YKP?=
 =?us-ascii?Q?ToXamJvFZ/mloO5o4hoCbPczNrAh1K0Swe+yzGxsmOmvabbpOo74dLnjOZBA?=
 =?us-ascii?Q?cgyTISfpYKiljqgbSthQsVsCf1MBrq2AU2rXMdx5LgsZNmX/eHhQNjjsZ4Bp?=
 =?us-ascii?Q?Q9NjVSEUTDKWwaso2fORM0VEqhBi4qXXXW/ASo8MQF3hjpdmfAVP6sXL0b6R?=
 =?us-ascii?Q?iK1Z4P9Dnxcop7YgzXJFvZuWhCu1dr82jZshixCLb/gzYxbu3I0zsaZqjLui?=
 =?us-ascii?Q?qD25CR43jSsCeagmr9kwt0qY+23TYq9COp5Uhcakaab1MlGdTxokLwyB1V5K?=
 =?us-ascii?Q?76AeCN8MLbD4w3AsB0LXEW0KrkqZAVemZkdFlJDefJ5PjYzPC9xp0qdiOsDT?=
 =?us-ascii?Q?dMacWfZQk5rCLfBysmo/KdMVUmfKUof1lIIprLJdL4RUxP8PwQwAD6JQhsnx?=
 =?us-ascii?Q?CmwZgLuHjklihp9hfXJwC7aVG9tc5X8JkJ1Xneg+NILeIx9wDpVHj0vlRFYy?=
 =?us-ascii?Q?XlncR/bXC1ys1AiMJAGE7GhPzGMm8f30raN8kumD0+XZ9iOPlX7BjQ4KwQWQ?=
 =?us-ascii?Q?3ocNFKq/TKWRf6kqZOkq7YqfG3xmNzXFPKX+7n/PLG3UMI0ZRFHLx4kiqpdR?=
 =?us-ascii?Q?yT7U4+mjLfOM9D9AjxSmYHTEQl9BIG9pcCDWXzj2Hga/Y82Zl2HgnMYX0wMn?=
 =?us-ascii?Q?hqKiA0EeyrR33QWihhBrbRCGesjYUZ4o7vTQoGl4KaudPYwtvjm3D7Oo4IvB?=
 =?us-ascii?Q?yXiczJdzdPM/Uv9Fdxj+v8ekQV0VEolG7CINU4TOcdiOIidOcElL7TzmMv/h?=
 =?us-ascii?Q?B9ybShkfyNUq7WMYZBAOG60VFnnq7QAv6xQmL+8e6Jz5AXE0A6uw4lLFb9r+?=
 =?us-ascii?Q?ai+CLOr6PoRhDWNOecXXN6nICCRfzIeiwc1jCfVI5DXb9cZQavyefLz3z/Z/?=
 =?us-ascii?Q?lzsNaFJYjCO6dFNM9qE67hQseE1oDJY8e55ceXXPu831zpmc09wPK+4cC5KW?=
 =?us-ascii?Q?NDdP+N1U2lay1W/MrK7z9QL+8vRjk0tcmxcxtIc8FksIErhc4NpUdrYDyEre?=
 =?us-ascii?Q?yQxmQkW9Kin+EsDgY7hQZu58Cfba2SiOQNQ3b6279V6pk3Q+QgytlsPnPiZ6?=
 =?us-ascii?Q?PiqoibmBY0fbPG2f8I7FveYReGcGHBSidKaBXzfd7VEueVfSUKys034Fnb0b?=
 =?us-ascii?Q?Cwcix0YoqUmG3eOAu/lHh1Qs/b6zKgVPGmMymXqO9C0Z8YhelX15h/IGj2iJ?=
 =?us-ascii?Q?bVdvIZAlmHZmMJUKyw8ln5rk6jjc5ItmZhRkFlRtisMTVpEXpIKtrhjI4WFz?=
 =?us-ascii?Q?kB/OsYoL6nOJEmvvQd140e1xZuxqkeAR2OUTyd9AdzD/Rrl0e7WzMUmZrNHZ?=
 =?us-ascii?Q?UBx9xSOaXSz/lgLIJpnF1GxXBHrkVQfgTdoWvKmKW8J/sTuFNNt/D2tADN0/?=
 =?us-ascii?Q?1hlPW/5zGy8dRV2hFjyE+q4k8IOdRnI2YtOpyqU25pRnLG8OSCcbgRSbYE6J?=
 =?us-ascii?Q?fqnMOG/hSATt16XAsY7LZXu89zkffITe4a2vxLc6Y9Vx3kNJv5HOE91ZuDUA?=
 =?us-ascii?Q?fPy+L0Y0VPYd9vxAfRuy+hzwZYFHWjTwUkjJbYUyLr81+97jQe9FZCt/fYze?=
 =?us-ascii?Q?2JZI8hklfmKVK+c5y6OcoAslDz18AwdMIzYBSVfAzIoSCCTAeDa3KuSva2F4?=
 =?us-ascii?Q?9LDV99k7Bv820U0qufheSBC3mzUFtEEqOKTtRnZZCmv/M21sjLAidby6mdG/?=
 =?us-ascii?Q?C9FSxM7C5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efbd241-e62b-464e-db2f-08de58995ee5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 03:01:27.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aem6RdwLpjonSfd2FXJ5u73h39IXM+leI13R6v/jjfThlpJv3jC46ShxirGGhY7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16088-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:balbirs@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:matthew.brost@intel.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,intel.com,suse.cz,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 94880502DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20 Jan 2026, at 8:53, Jason Gunthorpe wrote:

> On Mon, Jan 19, 2026 at 09:50:16PM -0500, Zi Yan wrote:
>>>> I suppose we want some prep_single_page(page) and some reorg to share
>>>> code with the other prep function.
>>
>> This is just an unnecessary need due to lack of knowledge of/do not want
>> to investigate core MM page and folio initialization code.
>
> It will be better to keep this related code together, not spread all
> around.

Or clarify what code is for preparing pages, which would go away at memdesc
time, and what code is for preparing folios, which would stay.

>
>>>> I don't think so. It should do the above job efficiently and iterate
>>>> over the page list exactly once.
>>
>> folio initialization should not iterate over any page list, since folio is
>> supposed to be treated as a whole instead of individual pages.
>
> The tail pages need to have the right data in them or compound_head
> won't work.

That is done by set_compound_head() in prep_compound_tail().
prep_compound_page() take cares of it. As long as it is called, even if
the pages in that compound page have random states before, the compound
page should function correctly afterwards.

>
>> folio->mapping = NULL;
>> folio->memcg_data = 0;
>> folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
>>
>> should be enough.
>
> This seems believable to me for setting up an order 0 page.

It works for any folio, regardless of its order. fields used in second
or third subpages are all taken care of by prep_compound_page().

>
>> if (order)
>> 	folio_set_large_rmappable(folio);
>
> That one is in zone_device_folio_init()

Yes. And the code location looks right to me.

>
> And maybe the naming has got really confused if we have both functions
> now :\

Yes. One of the issues is that device private code used to only handles
order-0 pages and was converted to use high order folio directly without
using high order page (namely compound page) as an intermediate step.
This two-step-in-one caused confusion. But the key thing to avoid the
confusion is that to form a high order folio, a list of contiguous pages
would become a compound page by calling prep_compound_page(), then
the compound page becomes a folio by calling folio_set_large_rmappable().

BTW, the code in prep_compound_head() after folio_set_order(folio, order)
should belong to folio_set_large_rmappable() and they are causing confusion,
since they are only applicable to rmappable large folios. I am going to
send a patch to fix it.


Best Regards,
Yan, Zi

