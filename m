Return-Path: <linuxppc-dev+bounces-15546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC6D1409F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 17:32:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqdFF0Sr1z2xKh;
	Tue, 13 Jan 2026 03:32:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.200.7 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768235520;
	cv=pass; b=fgPD/eFiCWOIryviCn+gn2SuDdaF5m4PH/l1LUwrghswhAHyE2dDVZJ5NrDOT0E54MNClaqEvdSQfhfNCwfS2Uokm6vfEXydHUFV47JtfPy7AGwLRudHc0RxlJsM/nBoC1Kg+KTjutkWicLyV1/THFNP3vxA2vDR/XOgLTgrphWa2o83Z7WT7El59nY6JcMSIJT3vkumJ6O9Yz74LlBuLG4sQhiE7WtwyV2jjYf+P/1w4DJtrg/E6SFN8tTs9Ax800kmq1GnVl14f668ukjMpYlqfKlhi5iaCLM2BbpD41dCo0Y0vTxVojM+Jbu0/H1nPPBDWCyiWlrQ7BI2oComZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768235520; c=relaxed/relaxed;
	bh=LAGcnHWYw4S/NW0YnyIkSatH8wx2aIzT/mwocKFYl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQwEU+dQy1+aOYoQr00EybGRngedzvWpVwqkgCLFgCifP4SlbJoxnoC0+bZliwMg8aZCBNOtRDfLcF100g/6Z6gehUKwsgIDsKwb6Cf1ITwaQaoj16fLUBMkSh2WQ1ECdpIoCLd1lRrfsdFgNtZfN7Rkjx7ka/CG7P9N3/CVCVJUSukttiXu9qoj2N1UmqMoNKXNyN6yQmCYqLAPE/Q0T90qC2ptE1tss8lfRuMaztGpb4cjVHq6+iFZYUJcD5T90CklBjot7ZjxE4D0ENTX5XaoKOPqNuR7SnkmINae3BrPkzixoAenRyRa4ITNltVJWz3kFgoMH7bjOpBxehm3ng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gpkTPlfH; dkim-atps=neutral; spf=pass (client-ip=40.107.200.7; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gpkTPlfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.200.7; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqdFC12hWz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 03:31:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LA13iv3mPT8Kms/cuFuR0EF41mJCu+SHypXFWXZwx8ZhdYzMKmTD+w4BOwMWslwKVWpJK0ZX5tjBQ4PNhKPTq4RK0Je2R6d1tG7W+7kH/4tnuQFmJeejdic9hskPiYPEbxVs9UX4dChofjhIlmqngLQdyJxmV2Aw5tr29HtlGnpnGvZzJKzeSPum2ZOmSH0OSsYGmfLoylIgssr5HFpGYz7lSAthvIIeXZxDZi2LdyGdwRVD3/9J0Ju5/F2IxUC68oUT15C27BKvDXLusP7ms6HRSr/nEyEhEKgC7+hLU+/EWGK1XXW9RuWPwMIJeZmqMkMA/DP25juaN/pn4w4HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAGcnHWYw4S/NW0YnyIkSatH8wx2aIzT/mwocKFYl1Y=;
 b=J3p2dbhMGKNFU9EblK4oSICeyisxOZUqdxoE18c3vRG9WZt+zHHbjGaNP7+iiEp7ma/rnB9ObkYbpu98wk/Wal53YYWruRT0vcQ9pYqk7angF2jYUFBgTA0WPGsp1WluEb++mluOzLPCDSnYEE8A6IJSXGRpY5dW5B++IIk9xiuE5PMNNjDPFrB/VLW4o5ENZL9QU23IZLEpbEkzBwSTgUwBdJJtldfjsxVAJrFeq/fIIqgV7oPrWU67vs1Rk2XamV8zVZCwZaPJIa9o/ClFU73+9Htb52xoJRAHAsICMpjtRbX3/dNxfrLYCszi1lFJsHvclV8nGzSHYRBl71TPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAGcnHWYw4S/NW0YnyIkSatH8wx2aIzT/mwocKFYl1Y=;
 b=gpkTPlfHQOTsQHZzK+r6gYJigXZ+H3nWCVIrWRTEFslqH8xNAmJcKpjQ/3M4xzgyeLSk1qPvGlaB4kYmARenD6baDVD6gd/mL/UEmaJMo1LWIlNYN38WLnJCwNAlfzSuhETTbDWtgqhYd7gJD5XN35keJ+cgYUyJkwEf/zYSLjzWtTvD728NvraZdVtzwqS3u7XrOfe2Wd6FuyUEIeP2OY4ONghy/iBqN+FwNVg2Xc01jBIFzuAZtYxdjR7ttfalpOh5JHWtB93NNW1Ld5Zym5R+eH/jhOztUtubtxsX8aemF7wxcYCX6UZGkY6tsxV15n948l7BAArzkU0w3+jtyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 16:31:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:31:16 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Date: Mon, 12 Jan 2026 11:31:04 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
In-Reply-To: <20260112134510.GC745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7253065d-3469-4e16-78fd-08de51f801ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnFKRjd2cjVueUJQcFVkUnpiMWcvVndEWmt4YmtTU2ZrRDBjWmFPK2Vqdkll?=
 =?utf-8?B?cE5pR1JjSHJYU3pFVkNUSy9GYzZYTlE2eTROdVlCMDNVVnhmNXJmN1lKblE3?=
 =?utf-8?B?UmppOU04TmlCa0pEK1FHNngwdXpXZ2M1TGlKSitsOVN2RXM4UGs4aldrR2RW?=
 =?utf-8?B?bkFUVE9BSFV0Y0hMSlFtNE9WTFNWblVOaEJXcTRQaXVBS0NjZm82cDJYbGhY?=
 =?utf-8?B?YWlCcUNqd01Db1Eya2VwZE5DR0VyRjgwWWpiZ3ozc1dBT1hlWkltbEtlMjh6?=
 =?utf-8?B?Zjl0d2dSRFNmbGtnWEx0UVF2K0QzN0ZWNndWaE9UR2RnT2xSUzIxRFduSFVF?=
 =?utf-8?B?NElQNE52a0F6VVBNdzlNMkpvQVR5ekdXUDBTb1N2LzBWcG9yR01zaVhlTG1C?=
 =?utf-8?B?NWJNK2JHbndyQ1l4UGJKZ0Jpc2M0aDQvMDAyNUQzTGNBdDZvRDRFSklINTdE?=
 =?utf-8?B?RzR2cTBxY3JuM1ZEdlIzWkRZMlFtbEdWNk5FeVY5VUhBbGtoVkh1QkZEUVZO?=
 =?utf-8?B?SjgreER6L2xmTkNpVWc0a3k2dUF2TnVidEJ0dXlBTFV2czFnOXhoL2VTZmRk?=
 =?utf-8?B?ZHJxT3lPVE52OWZKdjdPZXJ4dVNkUng0VTlwd2RldzBMMTY2NS96TlMzUTZS?=
 =?utf-8?B?Njk3Q1Jzc2JGNVIzdGlpUi9rL3grMGt3MkZuc0xXOFVLQmVNK3dvZzAzWXpz?=
 =?utf-8?B?NTVjRkx1aGxnY0ppZ09VdE14Zm1FY0l6TDR6MHphbzY0UmU5eDdKdHEvWGgx?=
 =?utf-8?B?dms3YkJwVThqWDJJdzhnTzRzOU54N3pxZkZxUHVGQmNhNXd3Y0c4SHRzblFV?=
 =?utf-8?B?cmJ5YU1PdXNwdzNiUkhxQ2tQb3FmQkIvekRFZlIzaHVTN3N0Z3V1cDdiKzU5?=
 =?utf-8?B?ZVBjdjVtSUVjU0E3Q2tLa0MyMHRZSHNJSzM0cXJlWFBSWHR2SFJERzlIa3NQ?=
 =?utf-8?B?U3pwN1pJeUNNRUVOd3pBNnJwSi9PZ1RhTUxKSDdLYlBxejFMZTlyT0pFV1g1?=
 =?utf-8?B?aFZwczBTWXJYUXZ4dWtQZG9QRHlaVnRPQko0enRZdldva25VV2xDeFVDM2JL?=
 =?utf-8?B?c3pscFNWRlhUeGY2RDlvRTNiTEJML1BONmdVSHRCK09qWDlTbjIwZFZscHc3?=
 =?utf-8?B?WWJEL2FrZThGMnRhRTh4NlZjcW9rWXE5VW83cDZzaGdGblJiUi9yK05acXpx?=
 =?utf-8?B?YnI2VXFaelNMSno5bWFNcmZJM0FPY0FCa3pnKzN0Q2ovRmZRL05KYjB2eEhZ?=
 =?utf-8?B?WUV5N2YxakZKZFBYZHJoMC8ydEdjMjMzTDBLdHFMekdNNXFPUldhNUozVUtx?=
 =?utf-8?B?WE45VVdmN1JnYy81U0Q4U29oTHNyVUtVODVVNmhpWUNkQzY4dVNMd0hHSUl3?=
 =?utf-8?B?bWV0TXJYR04xb0JGcWEzSVc3OTkvU3lTRFM4ZnpZaFgwajZ6Nm1rbElJSjkz?=
 =?utf-8?B?eXRWdnRQTHhRUDVqVTBZZld5d3dUSWlYWEtHekpqMzY5eHE5aDJXM3VBQ01N?=
 =?utf-8?B?WVB0TmVBd2pDdjJTZm5rY2UybjV2UmZGSC9RY1VCZ09nZzRXOTFXOFA0alQ1?=
 =?utf-8?B?WlVrZDBleWJnTG50V3RhU25JV2ljOHR6emxXWC81VW1WTzVPdWQ0WUsyaStY?=
 =?utf-8?B?ZzZGSWRNSzIxOE84dkRlckplcUg3cFhyckJmOVpjQ21pS3duSWszb2h4dTBm?=
 =?utf-8?B?QnlnQStaT1VtQlZNVFNJMWdMN2lRQUJEVlhmNlZMcDYrc09oREdZT0RMak9N?=
 =?utf-8?B?S3pXcWg3UzZJTE43czkybTZ3NHFlTURNS3hwOXFZZTdDdURZa2Q5ck52NXlp?=
 =?utf-8?B?RmNUZThUZlpiSHlkYlg3T1dHN2RIK0VhYlhsbW8yakM1MFpxSStweTFEMnpT?=
 =?utf-8?B?WDVMTERXblFQYnJFRWhReWd5dVdZMkc2elBlbEFPRDJ4dmZQekRoM2JVM3Zq?=
 =?utf-8?Q?PSD6E77qyBI+i0qHhxhqGVEGMv5Uyaz4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUdLUmJaUFRFaERLa1FRWmdVUE40MEJYWXRTVmlxN0hjbEdTc3ozd2lOeGFw?=
 =?utf-8?B?TXN2K2xseWxqa1RFT0JQY1hoZllmU3JrT2tlVGtNMmxhNGkrRmZwZmRJMkdm?=
 =?utf-8?B?bjZubzhLcWVIZEprYUZjdkNHT2sxK0dxTmhlY3d5TVZiaXdjN1FUYStLTGRC?=
 =?utf-8?B?YUhlc0htMlMxRTZremtoeldGc29vNlhOR3ZLUlJqY2ZJaWJ2TFIvRit6cW13?=
 =?utf-8?B?U3VVeXczRnhtQWMzdHh6ajg5eC9PQzdiZ1BIR2dBcGdXUTd4K05XdVpDZExj?=
 =?utf-8?B?ZFNtcjVrdExrSkhaWC9VOG5rS1RoYVBUbE15cUovQUNRY2NQUVd2dzlNZjVI?=
 =?utf-8?B?UERmeVFEK1drSEFpQTFjb1pZWm5OcGlPT3BqblpZVXRMZXF2djVFM2V1QXgz?=
 =?utf-8?B?V2UzRkRiM2p1SW11Y3E2d09BeUdWOERVdDl6NU9tVUVnbktsTDRSZXJGaWhh?=
 =?utf-8?B?Z0RJYWtNMmRhZUJwQk9va2ZnZWFMWS83WXZHb0NpcmthdTh4Z0xDQnYvcndv?=
 =?utf-8?B?ejNES3lLNzN4eHZNRVFkVzNoWERjY0ZFcmJyS05peU1iM2I4WWlnYllzMDBS?=
 =?utf-8?B?ODRTTktIcm85M2krMUN2b3ZlUGJXLytuejdWMmtocEwwY2tJTjVFbmt5bGJj?=
 =?utf-8?B?cUpveWFVcEhiTW51OXg1SDEzQ3o0ZytjL2h1bnFsUGYrL3BhWm5nZlVvRGd2?=
 =?utf-8?B?YlNsdHpYeGRvU2Y0U2J5S21iM2dJQmxRZXYxbHRWb0RMbEZGUlpjUHh6TDNv?=
 =?utf-8?B?bDIzRE92VzdUOXU3aHc0dmttV0RXcUZoRnA1b2hYUFAxMy9QZzV1Q0tXV1NN?=
 =?utf-8?B?cmFUUStFV1ZNQXRTaXFYRFdjSUlyYmhLc3psNFk0UnFaL2VOVUx0YUI3S0pv?=
 =?utf-8?B?MGo3ZzFsV2ZRTjNVQzNVQWRFT0d2UlJkYXZsMmNBMFNUYVBVTVc3UXB1Qlox?=
 =?utf-8?B?N2ZMNm1IejJvbVF1MGxQL1N5ZFpXVDB1YUdVak9NNEpleHFIL3hDY3UwdEEy?=
 =?utf-8?B?djFmVUsrcnNSNFVuMjN4aWc1a0hsZ0Y0ZnJyZHpFTmpYT25kY09scUlhUU53?=
 =?utf-8?B?R0lXd2ZkdUJaOWtmdENGY1pwRFk3L0cyODAwT2hYdXUwVHBkZUc4dzNUemNW?=
 =?utf-8?B?UVR5c3pLTkxtNkw4L0diRkc2SWZUSXd1c1JRa214cVY1d1lVZ1dwZGdzanha?=
 =?utf-8?B?dFlKQzNyRzhiVEE4U25hRG9LQmovcEhkMEIzNDMyMnlPbmFqYzNDczM2ajQ4?=
 =?utf-8?B?ckVPang5VUxZa1lRdXo2d2s5bVl0eXUvVTNSamlvN2VjbHg4WDVKZVBGNkFo?=
 =?utf-8?B?eEZnQjZTcFBxWHJaTk50c3FNNzR4TTNnT0NhODRPUEt2TE92YkZIUUR0bVpy?=
 =?utf-8?B?VVpqR0dVcXdaYmhSblJTZ1UyV1Q5Ulp5UzF0SElVS2x2SFNwZVRyeklzNU9a?=
 =?utf-8?B?OUN3ZmZZWERTNnJMZVdqSS9tV0NmbWUzZzN2L0hROWdwL0l5cFU5a3BDRzBS?=
 =?utf-8?B?elFpVmw1UUxJMjJyWk8rSjBWMnhnME5veDJOZWRXS2ZuNUhYYUt2dDNFS1BB?=
 =?utf-8?B?S2h6ZmYramhUVmJIS2tjSHJvZFJwdW9CVEtpYVhKT0RZRG4rZTJtei9mZ2c1?=
 =?utf-8?B?UHlORTN6K3l0czIxTlF5a3FER3NzajNpWWRIZkZEZC9tK1VNS3NMNzF0b0RI?=
 =?utf-8?B?bWlzSmp6OUJlb2FpaCs3MVZtdW40Y1k2THRRWEdHcWJNWld5cjVHMjZHUUFM?=
 =?utf-8?B?U1NrSjdnTGxwMElQLzJoZ1pkbnpyZXFER3IwUW5RQ1VyMkFrMzFBSHo1MnVi?=
 =?utf-8?B?b1FtWVlzTnhyeWt4d05WL2ZMc0tLS1hzNWNFTnhScDlSU2ZrSC9Yb3BSUXhX?=
 =?utf-8?B?d2ZMRVU2enJZcnozMkZEdTlBMXpQWm51RE41eldrd0ZKZXo0blZkZDRCVDRX?=
 =?utf-8?B?am9oODcyUnNheVFMZjg2MXR2ajFERTFDSkNPT2ovSk1WNUhpcTc4WWNtS0lr?=
 =?utf-8?B?eGs2YmJvS1I4aEcxbTZVNWU0NVN1eXQrZ1lyRjBoUmJ3emVGVzgzei8yR0ls?=
 =?utf-8?B?cTZzQnVIVVlpUE9tUnNyS0lLSkcxL1NXblc2TWNGR1VLYXprOFZSdU50cUdq?=
 =?utf-8?B?RUIxOVgyZ251bHpldmlIWXp0aG9rOXFyUGtheHRiZU5mMHFDWGo3L0k4OEJv?=
 =?utf-8?B?VGZiamdpK3pjYmFIdGhyalVmWXZZeWhyU2ZvVmY2RTNiN2pBcTZiZGNrK25F?=
 =?utf-8?B?QmVsZ0VaWmJEK0xMZ01OZ3RpVVdORXkxQ0R1TDdGUlV5THloa3V3NEJXdmpn?=
 =?utf-8?Q?bklAJtmXsvugO6afZl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7253065d-3469-4e16-78fd-08de51f801ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:31:16.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F8/2jELRLRf7ruJA9Ja00GMEJaC+RqewnQMBlOwPqfjfMONdIUaQh47SqMLs3Th
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 8:45, Jason Gunthorpe wrote:

> On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
>> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
>>
>>> On 1/12/26 08:35, Matthew Wilcox wrote:
>>>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
>>>>> The core MM splits the folio before calling folio_free, restoring the
>>>>> zone pages associated with the folio to an initialized state (e.g.,
>>>>> non-compound, pgmap valid, etc...). The order argument represents the
>>>>> folio’s order prior to the split which can be used driver side to know
>>>>> how many pages are being freed.
>>>>
>>>> This really feels like the wrong way to fix this problem.
>>>>
>>
>> Hi Matthew,
>>
>> I think the wording is confusing, since the actual issue is that:
>>
>> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
>> 2. but free_zone_device_folio() never reverse the course,
>> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>>    be done before driver callback ->folio_free(), since once ->folio_free()
>>    is called, the folio can be reallocated immediately,
>> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>>    the original order information, thus, folio_free() needs that for proper
>>    device side ref manipulation.
>
> There is something wrong with the driver if the "folio can be
> reallocated immediately".
>
> The flow generally expects there to be a driver allocator linked to
> folio_free()
>
> 1) Allocator finds free memory
> 2) zone_device_page_init() allocates the memory and makes refcount=1
> 3) __folio_put() knows the recount 0.
> 4) free_zone_device_folio() calls folio_free(), but it doesn't
>    actually need to undo prep_compound_page() because *NOTHING* can
>    use the page pointer at this point.
> 5) Driver puts the memory back into the allocator and now #1 can
>    happen. It knows how much memory to put back because folio->order
>    is valid from #2
> 6) #1 happens again, then #2 happens again and the folio is in the
>    right state for use. The successor #2 fully undoes the work of the
>    predecessor #2.

But how can a successor #2 undo the work if the second #1 only allocates
half of the original folio? For example, an order-9 at PFN 0 is
allocated and freed, then an order-8 at PFN 0 is allocated and another
order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
without corrupting each other’s data?


>
> If you have races where #1 can happen immediately after #3 then the
> driver design is fundamentally broken and passing around order isn't
> going to help anything.
>
> If the allocator is using the struct page memory then step #5 should
> also clean up the struct page with the allocator data before returning
> it to the allocator.

Do you mean ->folio_free() callback should undo prep_compound_page()
instead?

>
> I vaugely remember talking about this before in the context of the Xe
> driver.. You can't just take an existing VRAM allocator and layer it
> on top of the folios and have it broadly ignore the folio_free
> callback.


Best Regards,
Yan, Zi

