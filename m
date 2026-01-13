Return-Path: <linuxppc-dev+bounces-15602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB4D160C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 01:36:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqqzg15X9z2yFb;
	Tue, 13 Jan 2026 11:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.55 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768264559;
	cv=pass; b=GZW9/rjJl2JNXF+S5KEYtrcJ4893IgzsUMozbqYR1GtPvBQsUGNlv/vEKgNKR4/7MA2N+Y93U0PTZ+TEzYuXFnOPpMsjDDYWC+d9tUdL0xsyDFWK24fQJBkQB29DJLYnOeagCV2FSvAq39xFks06qWQlYY22oordGf4r3KFHZv0FL+YF0Q9oVPy+IrxjafrbfHviagXI7BBdahAelDPNucO47VdVIXK60NX5ioXcsqdnNYiCpMzCkxKady73TlGc68kBsokBYS7Y4P1LXTv2L03sy8vJlPnysSf+KKsMpYeTE/boKrmyGn9aVFTk/DCSwASnfKx8kQGac9xJ4JQdnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768264559; c=relaxed/relaxed;
	bh=dKkzBvM356Vb7Drbe7hPtcCd4IqpPxo9tF5DBFgqcXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ArYM96sl58aZacz/mqtoUT/I8LbArTDmQvKZS/1sBV7YXXUycLbvI6neVLV6DJ0TG5i+9ef8Oh2FBqPWcc5m7DzBOp+bpcAUD2jdx9vLuRSil/GYsS86P9dLE77bqi3Edp03tb7C4wV1bws/P+pOwpaLjI/A4kLVLwEdnjrgyVYgWWCYnq2Hf/SA56MzJf5/HJXilrJk7Nsyk7qilXKvRw+dF3qWhTioT8BTzQQ6OL+8NBiyANvkK8hIUgH2t/76XfKNDAygL3X58f6JmeR079BvwmLZUfZR+7IQQiiMbP8RyOY6NDaxMz/mdkBf4OPn3SQlutHQKIpjhvgcgjeCSQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CoYiFPdY; dkim-atps=neutral; spf=pass (client-ip=52.101.193.55; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CoYiFPdY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.55; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010055.outbound.protection.outlook.com [52.101.193.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqqzd396Vz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 11:35:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIbXC6xcrZoNh5XPCR0XfFwWZeix+Qj6l3+m2jRssSjVWtVIASPA2ea5mrrWARIoAoutje2O+ni7OLJxora4ihRxVa3soLbw9ssTxPb0Qw1yvLhJuLNIOLS+NqKXz7vxJlX+HTKhvFLVkhIBl6ycj1XMqyOKbj9+4A1MpPZ8130QMSAeJsCGvZZ4HIdS9nB4OnlGTwh776feEn9A4WTCnKbyeSzUz+yYP3zXExD5WKI4CJ3HIzZpdyX5vZwnVOWU+pdy9XR6H45mZpxqUQKdj09RbgI6puL4btmzBuiM/wkxMeDaROgNsNyiff8jn0E0qtELrqwqMQDBDGtaHQVqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKkzBvM356Vb7Drbe7hPtcCd4IqpPxo9tF5DBFgqcXI=;
 b=tN4rWBMZHnqcqygTMOkqOMLbgDuk1eEo+uR0C3FNDRYwQoN4kPtIhH6wi6VygbSzEk8yv3zPru7dKAIdJjz9mmLpsep+yA8CDnaRpqFgjROIBNL5b2rft/P3hQfKsLaIBSaQmz5Uw1AYj7haOLKlr0/VBt1rVP+iu0EaH2Z+gBf1QMHSxnhTSuVOhk36JKZcszYByDSlbmX8LVB8Cz6A/VSzaTH46wvmEgnfjOtij7CNa2CH1R+SnflRTi7cvjCa7tTz8tibVU80aw7JpPQd2eZXQ+2DGheffkUkrHguevZwaBs5W1DJyJiLkGo6GqoBN4WEgYMA6MF0NDDt4ZPo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKkzBvM356Vb7Drbe7hPtcCd4IqpPxo9tF5DBFgqcXI=;
 b=CoYiFPdYmDteC8ZDILeaDduEa3JOClUK1b/vCEGwhHzq0OL6mZYU9lz5+pkItfUfu5el0NJFMho1+5GdYVy+4dhpqFSzxrsSF0ygCIivrS1ohOqv8RoQ3fpdExWtb6158TyMARyFgsDnoCcjcMnWo2mNaIkJuPuFPBbHe94EBJpYN77AnGliOl8XCQ1Jby1Y3uSyIvSIP8k2dEF6/yMg3/n+jdEzYq+AxCKLSnpfFDWvX8D75qtdPqIed3nq4JXDIFASdL3h+98chgQ3OOAIhvEAWG3d+41NV9RsvxOXRm8XuV7urSay8wi1fSDX5rioR0sZSrEKZwhIBAV1+nrF0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 00:35:15 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:35:15 +0000
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
Date: Mon, 12 Jan 2026 19:35:05 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <23B46B7B-66D5-4557-AF78-F82EAAA5A168@nvidia.com>
In-Reply-To: <20260112235306.GN745888@ziepe.ca>
References: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
 <20260112192816.GL745888@ziepe.ca>
 <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
 <20260112235306.GN745888@ziepe.ca>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: a76cce5f-cf71-4936-6de9-08de523b9e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xTk5IFRFX/7flBE/ftBmVFBXYWBQh8GZiqMiSrAXpnBG/pfDeJ7aaRHt+cHZ?=
 =?us-ascii?Q?Xa/CsbPytB2EJl0G6T4ipcBWI3+/kz+/oxNOnj0uZxA4T43dWrRQngtmmmfT?=
 =?us-ascii?Q?BY0twrxkRupCTcBOc76gOpLCsokRZuJY3h4gHK63THcwhgqam7V/61eC0Tw+?=
 =?us-ascii?Q?IQ5IKvsWfmq7v//0o/bd7+/S/oxemtwUOyuLogE95QMl0mnHS92kS1zvVz9z?=
 =?us-ascii?Q?io3bsbrxU0Q6chhb05YrpK6O3SEnyJtMZEZ79quouIx5rE2M5oH1a4bZtZjj?=
 =?us-ascii?Q?bP7X7HEr2Z9rKcgycH4XV21aHaZli8nW07uuvBN2f5HcToaV5JOt+a/Q9K4q?=
 =?us-ascii?Q?WN8E6ursOhPB8VX3NPCQWP+i1sZZ2yAEFP4ebqfopErrlbJY0z4ogNk7WPjJ?=
 =?us-ascii?Q?ay7+cCbH5DXewb9rCEs91dNP4LPirli/Y3bYkmR60V99kdhQ0vcC4C7Gqxo3?=
 =?us-ascii?Q?CL1ZK62HRv/aRgkCv6GbogpIXsGi+ynVU50/86QqD8Pvtdt1mlY1N2gBvR5Q?=
 =?us-ascii?Q?aTWvT2AWSFSNsTmT72pVk53YNmJME7CUrsrXn7UOk/RuZTA2z2gCgfEDjxdy?=
 =?us-ascii?Q?lWYuncoYywIBwDDhPQJqAbvxLqmCzgMC+pWUb+OOgBIn4vaxTzftALejrmYv?=
 =?us-ascii?Q?WMGsqj9YbSiqqZM5ezi2/trimjjphJwAUTcxrFdD/HvUjkIbBRWAE4V6Mb7x?=
 =?us-ascii?Q?dZZCzy91da3BEwBM3260TXXw8X9fw/x5UGChnQ0Ptekioc3s5+0l2YelCMEV?=
 =?us-ascii?Q?XE9YQHi9QiXcdBRsaYJJsfsqPGYUE3ZNCnhzBFAUftMB/2Bbi0b4DQ+38+Kw?=
 =?us-ascii?Q?wYCzpm52kuzp2X5JdA2A6kMT90SInJg92/LkPPKeX3YMzV/DMApBes0CTssP?=
 =?us-ascii?Q?J1kxZz/KBGblvDPEfUA4RRodZnGm3c6JKJU4+25VNw8MsGdYMFdpnsyhehWK?=
 =?us-ascii?Q?Oz7nu9VvGv2bN+6WyQ94OunnqRRBK1v6Q3hUeT1TxF44nT+J3pkjfqPsi0HP?=
 =?us-ascii?Q?WRQWl+Xt1JGLYvq7nVms04y1CZQUVgVFtVSNOkMg90WyN0Zf2naxOqDoNc6M?=
 =?us-ascii?Q?grvLN3jQzplFH4k4WoQGIx8mMETJtM3n4h5DAhtJAKMP0isAqergiqpKJe4r?=
 =?us-ascii?Q?KQYk3r9WlkzOo8U7yZMYEriKXzgGi/CkiTh0zMPbo+WBbzESYxYdso7PL6xt?=
 =?us-ascii?Q?xeCg+M4vA48tcArV9gHyv0W8/Uz6gzjI9WpritDF+t0etwhiM8C4oIYg0bwr?=
 =?us-ascii?Q?Li7YqwakWw42SS5/UaKOcJ5bvOYB8b31fPGt9GnIoEFoDP8FVwWrTrPJIWxi?=
 =?us-ascii?Q?RFbSquSGxUKovQOOoppw5Mi2Ut2CwZX0xEBmAQoZfb3C+1pasrmdsrAQfNuh?=
 =?us-ascii?Q?DB6i9Jdl4dZXW73QGZeAZFIl45lR2nWzgZIWLhIkXH42FLnc7C8UjBkrl+Wb?=
 =?us-ascii?Q?Q4iKUulnGcBNMQG4yMeYsEdBXjbNV/4u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0xHcZAamwfuh9aNRGbqQHha6GtGKj9pU/9WHb6s8Qand1+tYwTX14cIJHt78?=
 =?us-ascii?Q?ABruIfKYalbLrBJ9Upk7AF5MTfCrOd/bNdxUn3VCtcCp/AcEf4XRXEwDlaT+?=
 =?us-ascii?Q?0PplstRnuGk/Dh5Ra4dgHOwu/1gJXqXNotxPD1r80Fi9ZNZye8kRYo/x7bDU?=
 =?us-ascii?Q?OJlBE1LokOJc0Rri6mRBl1vQX6WqLIx4+7IjS7ezGsSs/obPB8vpLdUKB3NE?=
 =?us-ascii?Q?TzHHriJm618OeYGfG6xg+MNJbtzmtU3DOX/Zr7e5Tgpz0kpQdyv5mJGpIaTV?=
 =?us-ascii?Q?yqUDe79sIN/o7WjXdPWy+0o+XcWi+gi47HaZdn31VooYpZDCiouaO7IdQUbc?=
 =?us-ascii?Q?kAR6psQFey63yrXS8LsaqE/yTx/PTcFi10fG++EJ6eXTWktvnFbrn+2C69zL?=
 =?us-ascii?Q?CuaCx8S+MCVeEycq2i51BP4/LFgKq/mZhPZXWhtoQoSJqqNK0LgoofqNmdtB?=
 =?us-ascii?Q?jkWmgKCfcTC6i6V6Fu/p6xI5G5Q3PI7tXdWCc0QQ25/dRjBQl42J3fuzVP8x?=
 =?us-ascii?Q?U543tnjmX9VIl4QJcdbNDjIWDJkOtbKKtKc+qPsNYzZ9UmGfNoyvFh9eyY59?=
 =?us-ascii?Q?wMhLT+rT5E+dsIIDfwNTMSgUDMMIeQP+ibJ0Q1yVnJzExn94slVQCU079dg9?=
 =?us-ascii?Q?IvU1qbwQEfbKNXoJ7+4p56q2MdqROyVFI5ZJ9grWNRE4ijqgd4dZ+kO8SaXX?=
 =?us-ascii?Q?vTGB6YJCsOTagubZ/Bcek5jQdeqWACQ+01YG+pkTQY/nBcSC1djaAbxQuyfr?=
 =?us-ascii?Q?fKRDgOJ8YpCI1EuRYDTgzVplKKZCxlxKDwssLphMM43RT9OlIYoaOT4JZ9PN?=
 =?us-ascii?Q?Lu7YYrE50JxFkXh039qUuq9QbODzf+GXf1lTmFVZ3HY9cOmaDIdRN6+Ok3/Q?=
 =?us-ascii?Q?GD2y6LbofeS0fvgJ4/zqvrIkgndbAMMPC4fWOvM15IB/cWZ9rLtOymqSD9Hi?=
 =?us-ascii?Q?JnC0kqLCElPyu58KXlVz8qm5qzHpMf4DWEhkd34TjwkEMAvRSli3okwPaIJ/?=
 =?us-ascii?Q?giCiMmYoXv8vnxrWCL6o5UyznvTBMF3ZaVdWirGyyeXXWR7FrskVC4A5HPAt?=
 =?us-ascii?Q?/XIEhUMcngSSLOaYsjOfYyijiqETwhYFZ6RtFj1EVVBEoLZqJJPV0O8GOAJB?=
 =?us-ascii?Q?mBu449U3kL848+2gx6IssBi/zK06ULs3wzUpQEIfz8oG50FUmr6N9kQ0AVv1?=
 =?us-ascii?Q?7q1WE86ZR8e2dBeoX8d0j/R7/LN2sAHxMdiu0Fxj3Xui/QAZlJhZ80yomYPI?=
 =?us-ascii?Q?NF2zxuZgJfKXhGCeKP6KJMCO5kndB43tS8eqBlVi709C5XcgWsgfXKeixSOx?=
 =?us-ascii?Q?yzWxMdqgc0x4NwLshF+8jsB1pOLuzFxqa2DmSRFuQPsS+jH7lSkHyTjjKPKI?=
 =?us-ascii?Q?hiXYAn/jjz05lNGhKV47tIc3/BYLCrRhoZdd152iG1p38KOFKUN1VZzf1ws/?=
 =?us-ascii?Q?Vfsnz0A4EJwnKQngrCBlEMdQQ+9rDO6wGOv77DLEsnfAN96r3GAuH4gLa51Y?=
 =?us-ascii?Q?+kJFxQfprdQYE3ErA2eHBIYjcenOFH3PNXhuq/OTthSf9/CCMx2ntE9e99FR?=
 =?us-ascii?Q?FfTPck14DQtPIyDmjtz0C/Mcj6BZUaQa39c5RjMSsW6c98L0Y4jDnHl24ZQL?=
 =?us-ascii?Q?abwGg1ApQ3rVCYGNFy6cHH56W0D5IaDdbsFwUEEyy7yEvDv9aUy5A7M9WbTI?=
 =?us-ascii?Q?IFACeW/PclHmv3aI0YJ9a4MtEDdHf+mhWqN+XgnCijgnZm3d7wPIMMxBYbEK?=
 =?us-ascii?Q?LktIgx94uw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76cce5f-cf71-4936-6de9-08de523b9e70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:35:14.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ll8VV26aSRh5TgVs29YPjedve/ynX1sbFtG78i+QJFAIQg31CJTOPiao9lDV+nP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 18:53, Jason Gunthorpe wrote:

> On Mon, Jan 12, 2026 at 06:34:06PM -0500, Zi Yan wrote:
>> page[1].flags.f &= ~PAGE_FLAGS_SECOND. It clears folio->order.
>>
>> free_tail_page_prepare() clears ->mapping, which is TAIL_MAPPING, and
>> compound_head at the end.
>>
>> page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP. It clears PG_head for compound
>> pages.
>>
>> These three parts undo prep_compound_page().
>
> Well, mm doesn't clear all things on alloc..
>
>> In current nouveau code, ->free_folios is used holding the freed folio.
>> In nouveau_dmem_page_alloc_locked(), the freed folio is passed to
>> zone_device_folio_init(). If the allocated folio order is different
>> from the freed folio order, I do not know how you are going to keep
>> track of the rest of the freed folio. Of course you can implement a
>> buddy allocator there.
>
> nouveau doesn't support high order folios.
>
> A simple linked list is not really a suitable data structure to ever
> support high order folios with.. If it were to use such a thing, and
> did want to take a high order folio off the list, and reduce its
> order, then it would have to put the remainder back on the list with a
> revised order value. That's all, nothing hard.
>
> Again if the driver needs to store information in the struct page to
> manage its free list mechanism (ie linked pointers, order, whatever)
> then it should be doing that directly.
>
> When it takes the memory range off the free list it should call
> zone_device_page_init() to make it ready to be used again. I think it
> is a poor argument to say that zone_device_page_init() should rely on
> values already in the struct page to work properly :\
>
> The usable space within the struct page, and what values must be fixed
> for correct system function, should exactly mirror what frozen pages
> require. After free it is effectively now a frozen page owned by the
> device driver.
>
> I haven't seen any documentation on that, but I suspect Matthew and
> David have some ideas..
>
> If there is a reason for order, flags and mapping to be something
> particular then it should flow from the definition of frozen pages,
> and be documented, IMHO.

Thank you for the explanation.

It seems that I do not have enough knowledge to comment on device private
pages. I will refrain myself from doing so from now on

Best Regards,
Yan, Zi

