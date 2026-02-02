Return-Path: <linuxppc-dev+bounces-16511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M5SE4KMgGnO9wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C1CBC78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjS4zzYz3btw;
	Mon, 02 Feb 2026 22:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032236;
	cv=pass; b=Y6Sxdiq1AcBg+Pdd4XXGjseweR5Mpo+fZVmqIeT6Yn2BQoZ7cdCSTT7S5Sy9RoUp35tN1XcpleB2lRIWqBnIiBcG02C5Ow+4ggeMZTKGS/f7HU5CxYAcXsRa3q2ao93BZDK6/0ccT1Axqjp7/bhMNIjXnAAum5Vae2zhcpR7Psl8DJTfOHnzb23b8HjmROWpbk32H00gV6DdHTz0EqmqcqXpTzRy7x6F2NMQZADvW4x/L/WY+Mibuf/ne/YGWecHqss5aMFyxwS5gEiSoPCdVhbUBwKkEx5doveJbUX0Cxis11eof958L8YCN7n2QOi8SPNm+RQ7yp/4VcMsxvy33w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032236; c=relaxed/relaxed;
	bh=9wKgWRrMWCDMbMQV3Bb0nKkcEXPzaKQ87y90vQ8iQMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KEp65QWrQeDeTKkwPHTqL7sYsjEVJGCeyv86avcN+S+rRK0ooi+yxALkCGD7f8aBRCkYitJ5u4WAyNRXMTE4kOVq/5wLbU50aE4P2D/QKypjaO+jHx7rdWM/xiPOfyIfsRN7Wzo8ouH8h0qL6TH/pfmv3G81tkUEM16OS7dqS6K6ZyKf3DFGacmV/qEae9CAsNe16jvj6hxUzimi95Kfjhx7zL21OqXTOw7AWIbjBy78LVo0x64hAAGN9X41yvZJrqau2u+JlL7mTE44xbERqo9sT6nbNA2GPn1i11EVLwE94XjBFFOun+wfgCxUD4KxSyOygTepNPh8T8dlNgma8Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kfa0bUq2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kfa0bUq2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjR5nhZz3blq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEEypveHWYJ8B7pbtLVKOenDeOijtjyGO11N5GogPs7PLUwQ8ZryBgxTl91FGX3qVKj1xtLfoLan/lhs6DBz7H65lm4fqoppH6P1dzO9tamLFLlzKLfvS1lwPt4QwSeQB5onkxJBhiOD8WQazLoo8xidzsixcfG+iFto0wsLlyp3ZZ2YGgmCR8lGsjntdyVrS1xWoDBPVZAf9ZnE8dTCMvXf1G1yM8wVKKoMDDtURuPiqfcPxT2jGXuLPmVuD+N8EFDMEb8GSDOq0BtTg+jsyztoABKwAwYNU5unH3BR17NQVjxsiKc/WxdGnNOya7lMgol54p8YJz646+F2COUvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wKgWRrMWCDMbMQV3Bb0nKkcEXPzaKQ87y90vQ8iQMM=;
 b=byAd4BlFv0poLtWX/0NNo3ZEdOhBpCVGtpHCtIcIvXk7QphJJOiLT14ZQTmA0lYFsco4S90rUxrXHp+k12P074FKyvPIS/EcdbaYorifb0c4+zrsjrTgMjJ8WGjRQlhg1Vg2fzBRI4iZHoYoVPD50IzSjM88O/SIuiTrsY5O9vcsBAsc08lCMuQ2Ui62xO5+nUXN8XgbrjQWlfxOGbvz6jm+QZejGD5LaZg1zSRBvIdtGWhL8EMz+h3A56ejmk9m9/UKQkn/xxR5OgNLJ0ESBvBCzGbfJi0TMIcsa86sEQiXdZM/TWnYLRL4lRTs9OUfaHFzp4JdM4Tn78O/o/2Onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wKgWRrMWCDMbMQV3Bb0nKkcEXPzaKQ87y90vQ8iQMM=;
 b=kfa0bUq2NgFwRDM57LfH777fBTJRyT3paB5g2aUvBHG8cn0GUj4aaRhuQ2qYe5eoi55lkDRY3KiT1bIURszqtIQA//n0VyKF0sFlr3s+jMeZP6hXQuINZjc6fdVmVKtqkKu7sc6Z5NN5JngukxKmU9IxhP1bZJYMRRF/VjwXM3EhJuaKqA9+ucPLlkcvhj9f1XimxHVqpL69HtD+GM9O/gB0NBZPal1scTSNKko3p0QcWgfOgy4hwKckjLPogROpcB5ySabJ17mzbWHyVBs2mU04Ga1MQsLGTOpr4Q1GxdeBMroxB7y+pQQsws1hH1oW/FMuCg+Ic6vYXkkJvQv4tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:00 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:00 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 04/13] mm/migrate_device: Add migrate PFN flag to track device private pages
Date: Mon,  2 Feb 2026 22:36:33 +1100
Message-Id: <20260202113642.59295-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: d5293550-7fbb-4213-0c42-08de624f60f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WfV5T2BZ3G0tOxS1NGWqBfwUQXxS/WPtN1mOV1S8b+vAXp5DA64UNjb71FSG?=
 =?us-ascii?Q?UdZW/hoz9HCa8z0OpKn3j1rNCbghnFkB7OPQDSFm35H7LC/UWXHPH0vH68ID?=
 =?us-ascii?Q?RmO9BETN9JKk4DDHC3ZdidgoPj4kDJIHtBAkZXFJaeqX2lsiTU6obsdpq7ID?=
 =?us-ascii?Q?sq+GqxWT5+nsaTSH5qpV5Z4VdfLuVSfCiGwbB/5bDXO3pcAgfpfqkeA5X5yP?=
 =?us-ascii?Q?oZU4qRoVI8sH6IygQwcoA2++cWbabafIUKPyVU+VwXftlTZ/bASjACMZYiVE?=
 =?us-ascii?Q?4A4Joaa47unTpgB9MSOpfJXB60oxP/ndobKScs9J0J3+Yrbh7IL8hwBnY/GV?=
 =?us-ascii?Q?WsAMxrr5m+U9f3RbOA1FmrQxKsjW1I6r0ThFxoskEb4937w1rVKMDo9Pn9fO?=
 =?us-ascii?Q?Z0LzOF7ZX1zGHMLxZIs/XGMIIzevcHl9EeJMHNSSacA9wZDaJJcYVaRn6H+X?=
 =?us-ascii?Q?XBMnkoaHw4HiAJbD5GN4fzVaKdszz6fytcIZZEuOVn1EQIlJTy7FSki+z02V?=
 =?us-ascii?Q?J+Y4o0yn4B15jAm/0tVNo6vyFjWuxu4ejdTLVV3Qt8K99IId7a0lArhwNHaW?=
 =?us-ascii?Q?QEKBOGOxUMkZiYLffT1x2Xd98nTHJfN5QbVQ27PKblH2pi9r3VAIFvaLRZrn?=
 =?us-ascii?Q?yRO87VCxwDOZko3ht3P12oKnM0YaRbQTQwrPjkTVNc+++1on7PX3jEns+UOx?=
 =?us-ascii?Q?qCZN0Nt+JzGBuRfzDnLGz6X//E2MTI033fJzlL666KrmpPdQjN9r3bCITwsE?=
 =?us-ascii?Q?DMbyt/7jXjSZj5+QuKU9YoppEkLoTS+EOPBUiRW+/mi0waY/8H4vf/0Y44Yx?=
 =?us-ascii?Q?y9qNiV/F9L7wcWdiK3oc2g5lOfUUvYoTUcRRuB76RERAT3zJRG/gRKn2WCuV?=
 =?us-ascii?Q?j6ynkvE67vgyUUsbJx9ZfkOX2rrIVyzNLzTmC08BMzZQDh8BRrZt51LNNllz?=
 =?us-ascii?Q?v4kAzvHUPUKsuprYzYdfCx7jc3KF6kXw1fjzU84oaoX+rJYZ0cIBoAd/6Cr0?=
 =?us-ascii?Q?cZBxVy1Yfcr/pYLlrv+xynMGo9r/aLQ8qfLx5OTJJ02C5dMQLS6G289tHRrf?=
 =?us-ascii?Q?jv01FADYU3fgZORKUgmJtt4pEt983gubespxyO1APsyntvLjRdt7LWB+0v4D?=
 =?us-ascii?Q?jPT/ZICB6aQIx4MzKkgzuGG0Syd2kYSsFOwVs3+7Ses9LKssNTY58Cjy9tQ1?=
 =?us-ascii?Q?gcw8YNyNobkk1KEjRAukTDI8gaKS29thgm/2FuI13Y07uBYYB6EOHqwiFzwy?=
 =?us-ascii?Q?cHTWkHy0+QFkVnNoWfVtt29fGd/cTPIYSasH5K8GcmBOxaYhkdh3k0gEFDf6?=
 =?us-ascii?Q?iOFnuDxoJeslf+P7yrDd05Ymz89sBoU+lKePq3o376JBc/B9PMoLMQPg7TIm?=
 =?us-ascii?Q?CO7j6N7g+DsGrqkD0YeYBJuLsKs6g2sJVqg5eAAydxrRlTZuKPHOixVXsmEb?=
 =?us-ascii?Q?j4PJfg8McSCo4qrzAFzBr/czT0dCOe2saP1dF4zYmgntk9dyJZ0Myiv6gbgn?=
 =?us-ascii?Q?Ti4GSm5xk4Fy2+p/YKBRYS7RxdM4xNdpkPlA3EzMOLaWdE4NAHIXnOcsDRRL?=
 =?us-ascii?Q?62+ZovqqLcNCEbKK/dc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7SQq3Vb8z5cWdqbsR1+keL3PTwcSEP4Q2O+t5mh0RSTRWgVbX8GBBBlu558a?=
 =?us-ascii?Q?Y1gXrUtTfAls3xA6XyUU7SmL6Nnt8DC1WTF2Izv3QcFa8NE5wlxawbkTlKWW?=
 =?us-ascii?Q?3cs0tFjUdAmv+aCVBnE62PS5SqS4GbvD2gXxc6wgMmu0vc6kOB4yt8iC3omn?=
 =?us-ascii?Q?2JHTip38gzWG7DRNKwY7qOnYxtPsCVwXkyKArXV3NftlWVAVoBzHIcepw7fB?=
 =?us-ascii?Q?vW303mjvWUjW9kR85cIb8r1nOH2FJCkOSxwzD/r7V/d8sxYBa/wtVWyeTSjY?=
 =?us-ascii?Q?yBXTCm176f+9vMaVUdfmQouGgYQG8Eh4YAbxmPAP0XY5h3/3xydBcIKrMjuP?=
 =?us-ascii?Q?7vDoBdVYaHIl3l2EkMUiX5GP+DYloW5VFojP6Deqqf0oMKewHj7ehzDjavYT?=
 =?us-ascii?Q?B6KMH/dzs5czVnPNVyKKY9s7d7bIlpa6ChNYaRu0i96giOYyLtUKgv4cV0kf?=
 =?us-ascii?Q?80C//l1Kj+5TEHdbwpYO9kkoQ4/8nb3Xea0C7YvFRz3R5KcvDEe77rnMaQFF?=
 =?us-ascii?Q?fhh79jnwbI2fylBJt8dyKuVwpdSz/OHnDDYhArBG/OaThgPDiw6RcnrRPZ2q?=
 =?us-ascii?Q?QT1rkK5w0ZCrL2K/6NTB/h8Swuc5aalgZkhEtKrTfYiGlXQY8rskovxq+Mcj?=
 =?us-ascii?Q?PWaFUIEkxz8R0KxirzYYAO3j2gw2FFBxcC5ym/E/EUvn4KscGU6bVAbWA/TZ?=
 =?us-ascii?Q?AKiHHU5Y0cDP9Px0VKWlwYgyb5wbIekCHGOAuPV498DneqQGKjlOATRk1dgS?=
 =?us-ascii?Q?Ur5hHknTo3rOfHANSYaAC9MGL6DQ5Ns2oPo+OmxjGD4Za2ueWz2nYn5IB3+j?=
 =?us-ascii?Q?V0lCczQmXDoSV5sklSQw8nOgFaJY/YIrSYqeQZsYSA3bZ3g1hDAkJU1iQ/Av?=
 =?us-ascii?Q?ZYdSvHI5isa78IfbdA3TK1g+0WKk97BUigYC1hdv5pD10UTd/AoDc9vbdMj0?=
 =?us-ascii?Q?tZ+VhfiJ31W1c6L0oRjkBt/tSM5J4npEtgBMVtHJ6xMxhuhaIxCbMLhqeSpu?=
 =?us-ascii?Q?8vquXEQnqUlXGlICqlxcg04ihrcIccNQ9b9ao2oV+RfkqBeVJEO/sVqoUB/V?=
 =?us-ascii?Q?uNhy1bJA9jg4wDEOl89BPBb/0a2iviVHECz1SZsk6W2hEnYMPFSpWwjKnWQf?=
 =?us-ascii?Q?qbR4P4ZC8dzYSfn8z7M1PAKpnOGmyH+9pzNmbRaMLNzumFjIwG4fnUTHIlEj?=
 =?us-ascii?Q?SQCKSlDyPX7liFLvSOPc9T8UBARk9uKdNWSfUWtHBgmdLMHafhdYSSeTwl3C?=
 =?us-ascii?Q?hbuyC7RAQGbT+6WMVNStmSMMb90Rx9rzth2Ou1EvX6cGzSQzfEjOTQsGkyzj?=
 =?us-ascii?Q?SHSwww12ISmUQlVIzFz/5mz+8G7EyZiYEeQcvbesrT714jILGciUGzgL3BRc?=
 =?us-ascii?Q?FDEGuUdGIOW9/dbaP0b0WWQaELYCfimuQAIpNZXtqSHv8LdobFv2568jgtVM?=
 =?us-ascii?Q?NSKZhUyjezHbA09HYf/H11XkUc/heWUYiV0C1KU9GK4+EaSHHeKKrpsLhFFf?=
 =?us-ascii?Q?LudZ4B2c11I7WdH7iI+TNp/1O+HKTd1z8UN5N1Ei8c1eAv0+v+nfmBjn/6Vj?=
 =?us-ascii?Q?AQ83qDexqby4psbvqCzP6lDT4I23AAIWvRdgUjBxqgMVY6jiwrQd3Gw+K02e?=
 =?us-ascii?Q?IVg685fcnyBRBie5Akgu2Nx9dT/s+LaVSvAjiD3vrakbc4bQVF7TiJlv6qjG?=
 =?us-ascii?Q?r7k+j9A+22g7di5byBb1LSubrzpGbePtLrGENGi7tmFTXzL27t8ZNPtiJ+Bn?=
 =?us-ascii?Q?ZuVGbEr/1w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5293550-7fbb-4213-0c42-08de624f60f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:00.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMaYQOB5kstxCdaha6alCDjCZtPDTWgxJ7Z3vMInjf62LxiDvOg3duArpUuQinfvp9DMIvAnRlsuJnDJAFptxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16511-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 853C1CBC78
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Update for HMM huge page support
- Update existing drivers to use MIGRATE_PFN_DEVICE
v2:
- Include changes to migrate_pfn_from_page()
- Rename to MIGRATE_PFN_DEVICE_PRIVATE
- drm/amd: Check adev->gmc.xgmi.connected_to_cpu
- lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE

v3:
- Use adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE

v4:
- No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c              |  2 +-
 include/linux/migrate.h                  | 14 +++++++++-----
 lib/test_hmm.c                           |  6 +++++-
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b6075a2808c2..fc9465db6d5e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -212,7 +212,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 unsigned long
 svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
+	unsigned long flags = 0;
+
+	if (adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
+	       flags;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 9806236e6d6d..3fa097ebdf1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -484,7 +484,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns,
-			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT) |
+			     MIGRATE_PFN_DEVICE_PRIVATE,
 			     npages);
 
 	for (i = 0; i < npages; i++) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fbf5fd284616..a8aad9e0b1fb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -770,7 +770,7 @@ static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocat
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = migrate_pfn(block_pfn + i);
+			pfn[j++] = migrate_pfn(block_pfn + i) | MIGRATE_PFN_DEVICE_PRIVATE;
 	}
 
 	return 0;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index d269ec1400be..5fd2ee080bc0 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -122,11 +122,12 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
  * have enough bits to store all physical address and flags. So far we have
  * enough room for all our flags.
  */
-#define MIGRATE_PFN_VALID	(1UL << 0)
-#define MIGRATE_PFN_MIGRATE	(1UL << 1)
-#define MIGRATE_PFN_WRITE	(1UL << 3)
-#define MIGRATE_PFN_COMPOUND	(1UL << 4)
-#define MIGRATE_PFN_SHIFT	6
+#define MIGRATE_PFN_VALID		(1UL << 0)
+#define MIGRATE_PFN_MIGRATE		(1UL << 1)
+#define MIGRATE_PFN_WRITE		(1UL << 3)
+#define MIGRATE_PFN_COMPOUND		(1UL << 4)
+#define MIGRATE_PFN_DEVICE_PRIVATE	(1UL << 5)
+#define MIGRATE_PFN_SHIFT		6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
@@ -142,6 +143,9 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return migrate_pfn(page_to_pfn(page)) |
+		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 76f5cf753bd4..8f5590bc4897 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1387,11 +1387,15 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
 	unsigned int order = 0;
+	unsigned long flags = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
+	if (chunk->pagemap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn) | flags, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
-- 
2.34.1


