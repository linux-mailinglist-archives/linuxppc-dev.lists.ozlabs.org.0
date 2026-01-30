Return-Path: <linuxppc-dev+bounces-16447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNb2JvqRfGk4NwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C1B9E65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YH85Tltz2xWJ;
	Fri, 30 Jan 2026 22:11:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771492;
	cv=pass; b=VKICNRFH/I28bHWdgICJw0Mp0jLesmxq1X9kA/HW4WMDCRIEP8uFK42M5KLakiY9GDVTPjMpW2sGw8PtrFQ1h0qM1rZL/PAlgU7rqzxjr2NEO5bYbHsZ4LtP51RBC9wJ7SjWNc8yjZoj7FoTtyT9NQj7RpHTKLKWNd1B1s/GPshNTNXYdJdWTHfrfhM5dTzSzH3k5x1eg6BKrZN42hwUsoc4XrrkhSxhW7H7jgGKHu/yrFLrjTJWTrZQTBtFD2H8M6HcOSnngH5WMr3DqKukAmLMSl2euh5VAoSNyg6fiiPQcGwIPSA+d7xGxWmMnsGKFUjfeKQ3GrGifAXowvYETw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771492; c=relaxed/relaxed;
	bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nUeNFFlgZ0I2s03LcTh6U5qIOXQDGbO3FYYPwxOROMPXwI34yQ3au0CmNOn96hwIYBwEdTr70eIrJI5MNzoBbTFNKuNQn+m0uU0eLC+8w0vDrR+RT003kVAkGUDVYqsOhRxN+b10w7dg+/YbEivxHLMIR7/2d5qAQO5+Dwh+B6oETGSSNDdlcvSWxFqUMlrfWgDyHzxNYd+Ww6zRGuOs2u+wCMg86jIKoKnQ+lXrakgDq0MQ2vo9erWxeE+CSh5XV8kR+79KTwBQcjHKEey8QPxPNsDYja9rMRMpyuKlrHOKsw4xGgDvqREkkEOJza6BCuKwuYJWEfi/xll6jO3YNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nNNN+zPB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nNNN+zPB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YH80DqKz3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5cKHgUIAIE09eNLhjJDpu8NshXgWXGFi37EW6+/19gPzR+WECzIhpD3zaGpgvfIr4+FoEUT548fJxvtiLKnJvIhvr3Cio+moq3z0PHt/kJPJXhA72WNslMtzYU772MxB7/213pgZT2irBqciaJnJhNclSyMJ9eluClOmD/rY0FL7F5IoZqWgWqqdldCssgV0+FB1A2oTuhjVJtp9qLcwCeDs7pNNMhwOq/YodQTNNClIv5QMQRUrwM0sgVjjycB4s0OE/+TdJTmTXNYQXkQP6dX5nQPhYm53e7RDM8b8lNlEtIJPV4LSe6wo6qlxI9j2yGdNdz4VNbXUEjUaRspiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
 b=J9JKWhs/S5vXzfo9mVRY/n85XcEQ+ngq4oZyD5XwVWWOpYnOTX8RB8gA/QzNQNLgVpqRqD7DHhf8mRgVLLsCMDwHILHShz9fp0Qxlf2OIBFUSL4NuhBNwx+iMU7mCUrTPh+o56Xg2QLCPSsyhA83pYCLsNJzm34NIJNjc0LJF5A2Iwn7oEn4+BBDK/LAt8QCsS9E1OiBpXu4Z3gXvqQal7vW3Cyisruxjly0mf63jQWYiY8GlQ84Ml2uriiypBC6+qcuQmj0Lrfz0LLw1+l6tJk45svn1+lX8IS/b6QpAheeShDTRsdNz9gkin9qz5lkHg4kmzmghid1yIwIZVTsng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
 b=nNNN+zPBoJ7uFjRZpkSJaSzltfwLqJl0lqEKVaW5z6XgQfge9utrnz22WWsUnkZTvPQcvH3OTFK7BYBbHFVD50JmMLzDhtGop/QyMynx/lZPQPbI6Gif2vvyIW2+YXWH8Pb5eC69SsfLHMu9b1slv8qptZftuDrRianAlyHPjYprwuEfrPSrpIpJBwJw3X4zIPsT9J5THZvyVriqidRVy19qQi+43fZ0YZ5knckX6S6eq7vriMAe5xIu3rbUpL8KT4z2hpYyYSoHRIEuikw3pkvW9vocaTejtPa+AL+2Mtx2VOpkNLl8vS6a0NJ0eNf8Q3oW8lzpW1qG/guBtsmJ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:13 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:13 +0000
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
	mpe@ellerman.id.au
Subject: [PATCH v5 05/13] mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track device private pages
Date: Fri, 30 Jan 2026 22:10:42 +1100
Message-Id: <20260130111050.53670-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 1125c002-f584-4768-1aaf-08de5ff047c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nhPWL9qytZXDhqtfMhAWehjtkFWkpHj81bnVik4Q581xy6q3Yzs9fdckCcNz?=
 =?us-ascii?Q?FVl9AG2gz4ztSKDOMt0qH7BLaS1K10ve/2EPMCTH1T7kMi+CUvam6Kkzwihf?=
 =?us-ascii?Q?stDC6y9Ind1kPhVe2ateOCnRsCp6jClCKAGztosYcpmEkqx48RmUft8quDmV?=
 =?us-ascii?Q?jbF2V/ObkF9gq54MeGzJxihOAARU/VpfUi4G59/3rRx7kMXFGetUK9filnZf?=
 =?us-ascii?Q?Ud+a1zP7f17h4H9iiOPOeBO6iUTbroAr2qCPx4OQJbp7Miud9IRN35x9zrCs?=
 =?us-ascii?Q?AgpRmjImrFFAirSIJh9JXdyCyWWYnsc4xYpSo9fs/jl2NjnuIZSL52Auhc/L?=
 =?us-ascii?Q?uYGGyzxE6y81dadBhYdTnplV6K3sU8jqrUFsUKQA7ECqqMW7LM2Aei1+/8Gn?=
 =?us-ascii?Q?4TbZMbQM/XsR4lcU6dv0tpytfx0GeJKQWpXfZW6uDISbAthPV7PP37o8YExW?=
 =?us-ascii?Q?ghRryvk00TFuPnvWMGEzERzzkPpkfPsAFXOVqE/HNlt1NKVrfPPEqC5vdFdk?=
 =?us-ascii?Q?/P+OQFYX6dEoxk16qNsq3etALMwT56fl+SZ6ndsWcasL31m2HKmYBOLJ7+Gd?=
 =?us-ascii?Q?KLXf5LZ++Ssa7uwoiJopOmHDKMDn4XzGHEwb+QnloZ9pEiaKOQ0ZLql4gYz7?=
 =?us-ascii?Q?iwhb9k69W/9uuPhGyuPf+08xLZqt1WK2p4NaKG+zGWzhU5L/2tp0a3u4RNpJ?=
 =?us-ascii?Q?p5vzV0gSPBs7PA8J/p6u2OnaiM0W6fCHZo3fWSlRYoxTTv8FtB6o5EUsuRuc?=
 =?us-ascii?Q?r3Q6Vs4/T3gFvxLqsQ1xCNEpyG5PD7uEJNOq6ITSmezLsjfz1GX1hY40ED6S?=
 =?us-ascii?Q?zVCYamV3YAg1zUkTl0G2x5TyPWxo1FvnvZqwhx3Jb9A2blQN9pF/xHL2J3/v?=
 =?us-ascii?Q?RCH2m2C7IEs8cbijCpORgITTRuCwCnyRtscPSH9OfS27R062OfJvzP7pE3yL?=
 =?us-ascii?Q?u25/7h+YDE4b94fvDmfPDsPl7SfWA1IlKdHV3/b9YqSkogDQOm8qpsAAuSGP?=
 =?us-ascii?Q?Fuyta4FbTBPurj9+Qe5itFXZVPDvCwYJdgbOk+V3sQuuA+Sh5dgfm4v3ANT9?=
 =?us-ascii?Q?opZsOPo5SZ0szFO/xuHGhyv3CVKvWQ5gksbMgnebucyUqd5vrYkef10/8n4H?=
 =?us-ascii?Q?XwrXM0IL/zItGJ77nYoWqViJhoyPgaM8pCI5RRBnVWbtvWCGJiNr5khySI8h?=
 =?us-ascii?Q?HCtH4cwdPVEx1wMZ5qU/1TuMKz1URIsE5EiVSWTXvDzZnEbXctNwH0nvXu9l?=
 =?us-ascii?Q?RK1BnIXXjuWBaXRR1tdEVD9FQpGA5NKD8jXyA3TBNadze0TNULx8YLM4LEmR?=
 =?us-ascii?Q?FzToq1iWpSYjkzTb+0i5nVAZ8bt8kvkCYvXakS7TuWUqa2Pc+z7+lhQjCpNx?=
 =?us-ascii?Q?C0FdA4A7ecKMQf0Bgjldn7xZsKyiHKrc9yVTyirDnTZi3F7jyB9uwwc6Bowg?=
 =?us-ascii?Q?4Doq26+95xu+A1H2lzfpMb4M46SLfpOqVcItBWz5G6wXGqmFmiygQSSeneas?=
 =?us-ascii?Q?gzAqCfCiNPNqdyQThuDtpODIt2OcZPo0UkLUcSfxIpmQdIBfwe7NsoFueR7i?=
 =?us-ascii?Q?4SR94p+JD9+IznNWGiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yMp1PoCkYo9FwtheQ89jLt3ktNO0vwnWl+gPSPoAQBTEq7LP0U2lWIHDnm4y?=
 =?us-ascii?Q?+aj74zVihqTEmUcbmL/zpDj20+ZyLBITH9psJ29npA2n1UEkM3NaJgeoFlMF?=
 =?us-ascii?Q?x3PdyU0j9e+XUnlc9INLuZ2QVr/oONB3Xyd2sKCLMwYo+tIgRXAurENrnrhI?=
 =?us-ascii?Q?JZD86pI9R2QHPA76VULDBxb1uXczck0B5JTbfUtvbcTdYoKNwZSVfw3OYzdO?=
 =?us-ascii?Q?zVWNWy8yWPU8leNucOu2Y8X0JezqZs7jHdwoIpELqpRhnWfOE50dhLOHSEpe?=
 =?us-ascii?Q?K+/3lCwXCF+UcjIklrY8O+l9XFWY/R10xQNmIBvC/UjSr7bpTXskPRpXZZLL?=
 =?us-ascii?Q?eyui5B5FZheW+Lq96SbypiJ7n9W0lYHv+u8pqIq4vyp/4omgfycrHg9Ta1+b?=
 =?us-ascii?Q?BOewxLdOHvvIdzNOilisS2On2eeWHuF/hNchjJDhuk5JcE4/LA/pTRq2BSmX?=
 =?us-ascii?Q?BjEhYhhiDrcJZqkIv4SCoPuXTyWQEOGz2B1m5TQs+6OEWWEHxsWAJ2FIdAuV?=
 =?us-ascii?Q?Pn7oQO95E1nCaufu93A6bJHZMMf8OyUYFHyrRqlnfhgmEopClxU0xmEaS/+f?=
 =?us-ascii?Q?yyjxYju2Xr7kutNnmYdVNkUcTJU7/WTd3Xpe7C+P6uVzRZoOd7H2L/P2gs9z?=
 =?us-ascii?Q?FGfndlRiB1QLMt2tYJEpyoSstpS92brIvUGffdAsE1UWbne3QFjKZXjlv1ov?=
 =?us-ascii?Q?shBZcy0nIZdxyEAbPE3712DTk5KoJfHpl70ywdxDJ4FVtNyQdhSNyL16OfVy?=
 =?us-ascii?Q?ydT+zDNcY2JeJJQcP8JOzwtqJbN7BuwrTiCb8e5NeyY+WiPfkHWHpxe4uImB?=
 =?us-ascii?Q?a3DtaNVwgvkwV61IGDBraE+NlVvhNZrHDdwJvO/X7DICJ966yVJwWHieymxn?=
 =?us-ascii?Q?7pqQWyiNRhCiXZCeZhCwakPpLyK+Jp3TYTt7vJ4uWPO/ysyvLH2EmdIVKWke?=
 =?us-ascii?Q?z3i7LM3sjDinb8BgFW6Jwn2UR/FuS7mvsm1tzSdSgKIQ5cvzIg4161wsNd96?=
 =?us-ascii?Q?mgEn14lANCS4uXpU/gbLfpdWaUWEZXtyeQ6p0OlXiVY63N8rjTLKb4PlmrvP?=
 =?us-ascii?Q?AFdI/02sNxZSr1FkyDfUglKndusFkOUKRkFQl71XZUg0rBIqj8jBy9j6F3bZ?=
 =?us-ascii?Q?rjLFwEl9lPn7y7vacbXFo8/sHdVy/8W5hnzVz5d2ZeTz72s4TfMpgLkiacvf?=
 =?us-ascii?Q?n85cFjCEgldLime8qm4QmY6eRhWXcsLza9kcuXWWDEsi/zJAyKWpcIkShXnX?=
 =?us-ascii?Q?y1b58eWlNjPhStgooz26exsRotAPVVvaiVhIe4/Hc+qoXlN7e1sfMMlSHCAc?=
 =?us-ascii?Q?9Jil1wTxluZit4d/72NN1xKNI4KOyVczoK4yml7HKnzSLCVpIG8W/hwULPOo?=
 =?us-ascii?Q?7M2PtNkAOEXlNF1XT6xRCleB8C/d+8zhPJMQcSXMck7NBXNDvMk4236ePv7k?=
 =?us-ascii?Q?oA0No5WudBgLbwSVZp4MPZ11UlJKww46GLwziAbABDul/Lnv5vz3EYozLeXh?=
 =?us-ascii?Q?MfXrKw0MfDjdOPwCbSWq46MjYH1Rj9g4TxGTj3XsyvMrSAJSwEwld9htF0jA?=
 =?us-ascii?Q?JzXSrGr/qEia0s1NyroXKi9PxDFNwzRzoT4egzzhMKJ9SzI6HjpVm6lSLqIL?=
 =?us-ascii?Q?3qrEuCwOOdY2+sEERdh5JTqIvKcAeUldbf/m8SQxIscF8a/QD/BUIXJrYlrv?=
 =?us-ascii?Q?qBtNH7dQzi+U8/SMtHqfn7a4POT7FCzx0rrKeqfUnOzshMw35CO+OyuVA38d?=
 =?us-ascii?Q?82bVu8OLyA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1125c002-f584-4768-1aaf-08de5ff047c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:13.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BsvKo4Y666MKMRzlFxdwl747GhmriHTvir9I+5f91TLHSNxCI1EzKG5v25fFv+p6FTvTMytpZ14+OTlz9kM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16447-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: B34C1B9E65
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a PVMW_DEVICE_PRIVATE flag to
page_vma_mapped_walk::flags. This indicates that
page_vma_mapped_walk::pfn contains a device private offset rather than a
normal pfn.

Once the device private pages are removed from the physical address
space this flag will be used to ensure a device private offset is
returned.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
v2:
  - Move adding device_private param to check_pmd() until final patch
v3:
  - Track device private offset in pvmw::flags instead of pvmw::pfn
v4:
  - No change
---
 include/linux/rmap.h | 24 ++++++++++++++++++++++--
 mm/page_vma_mapped.c |  4 ++--
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..1b03297f13dc 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -921,6 +921,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 #define PVMW_SYNC		(1 << 0)
 /* Look for migration entries rather than present PTEs */
 #define PVMW_MIGRATION		(1 << 1)
+/* pvmw::pfn is a device private offset */
+#define PVMW_DEVICE_PRIVATE	(1 << 2)
 
 /* Result flags */
 
@@ -939,14 +941,32 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+static inline unsigned long page_vma_walk_flags(const struct folio *folio,
+						unsigned long flags)
+{
+	if (folio_is_device_private(folio))
+		return flags | PVMW_DEVICE_PRIVATE;
+	return flags;
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	return folio_pfn(folio);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
+{
+	return pfn_folio(pvmw->pfn);
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
 		.address = _address,					\
-		.flags = _flags,					\
+		.flags = page_vma_walk_flags(_folio, _flags),		\
 	}
 
 static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..039a2d71e92f 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -350,10 +350,10 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
-		.flags = PVMW_SYNC,
+		.flags = page_vma_walk_flags(folio, PVMW_SYNC),
 	};
 
 	pvmw.address = vma_address(vma, page_pgoff(folio, page), 1);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7b9879ef442d..7fa976b7fb5a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1871,7 +1871,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -2298,7 +2298,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 614ccf39fe3f..101e1a16d75d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1


