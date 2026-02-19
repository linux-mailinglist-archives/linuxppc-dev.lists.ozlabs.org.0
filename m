Return-Path: <linuxppc-dev+bounces-16966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD8CEfx/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE0162C6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5z55vD7z3bkq;
	Fri, 20 Feb 2026 08:26:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524899;
	cv=pass; b=CSpE00uLuSdj/CeuV40nGF7Qx7cV+kR4SKd9a95iQoZpssoY69bIwctwDEQVVoZvv0pR/btmEuk1MJEtycj1GUhpJaXpY8Xz4XMLA16YDn7OiJpNVLe+D369WtjjdUDOi7gVn/r5xGPYv4Sf0qBRIbZIP4nfuDAVY+FYOH+sBTZZKJLJFBZuPRRDVm2W6XkTkwumIF008Z2WvPb+inpcp98QCU4NR/b33erKz8NlXwQ0dNF3F1tJHFMLd0u4Y7tLQ3EHsgkZHdFnwOB4yrwfpx4dNwp0LHIgfZwYfrVvIlvph1UGeeQ7H/j/UT02Nc761JpRJ2RLgDUwXiMgOrHQYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524899; c=relaxed/relaxed;
	bh=ULdBrUgJJf3AqL7P5yzGnoRBrsfbngQm05zIK5QlUds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NTteCKF/rCWQWuvwmqBdoOV6JlU8HrDeEjahICeSbvgESG5T2ntigyhgbSdU0EHf3293MaeouC/2/HICXYHRRP5knWnBUEVsjREUuiL8kh/O6BcLkdHY32P8SUg4lPI8QSJ2nWyvT/SAwL8NBS/9S7xij635jUQjlKYmFzf8b4EXu1IdBxF88RaDPMZ39O5usE3y4SzVPQx7c3waaV5bBVPSrUak/qZr8FNQyVB+SktEsqtqxRptQcD1d3i8BDTY1gc8GriqYpBQ1ZJ8qYOjW5QXeXUJk0nYyQWauIpH6PH51KkgMCFg8kU5XksS5CMDKCmOq0QB8g+hjK5rF1RlXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bV61MuHw; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bV61MuHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kV4cFMz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIsBlLTE2etv3qWbFxAnQ8KbnkJfArG+Cv8TuwtBVnXr6B6hT4RzQkyHXPav/dssGfCWr60cdqXP3XNK8BWpbRP4+Wy0DIUwDiltmUJrGXz/Lr0LopXFWOHn/a/mIs573of/apXYdNh3OqEEdkyTXN273CFpE1oger7mgAC0r1OiawN8tuzgkI5v7NnLF8PUbbqulxJa2DiMi53BzHBjy52pX3DZEfqZJnseE2tQdX57wTZwkFRXpMdtkBO1wW8d8JL0N10zY3LBzhdlL0w/f4sY5d6DJS4wymjm6QlL9ytCoEmAmFpVVy541OdZ3Lkgr51GUsV98Puo4KVORhVdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULdBrUgJJf3AqL7P5yzGnoRBrsfbngQm05zIK5QlUds=;
 b=GTEZraW6xVSMJMmlSaaglPqdkFZzsATeX1cZWVm4EP6CEgqWk6ZrI7Rr5WCMkxTDq+OQgQUhW/D95ehaoDG0lMY+XAO4tIcmN5yWzXl1sisjp9uybzCkwBJ2jjd5hRNrnV6JQEaCUlx2nW+x1D8DRPasaxangTZdqW18pB6W3HCZkoHz/OTJKc0ogoJapXVDwvhwA1HEzH4YnIkBTiUH/29yP/C8Axm8GNnrx6DOsRPQ1lNDzkRMZHK8WM90SCcUKgb89RdqDsYePyZyHn39K+ZXkcsL85IHl1kFRaxlkfGuQOBHYYMvZEKyaIZfskLS4bA5rg8+jSN9EPfuZ+7cEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULdBrUgJJf3AqL7P5yzGnoRBrsfbngQm05zIK5QlUds=;
 b=bV61MuHwBph0L5YvLwmD5052v6EA5Krq4sR28ITciCK1VCIE+RtM8KQPHXGiyAeSl14+wLNni5LvHicn+TkG+e+7FldFKtsJYYyfp/SW3zDZ4U/hPiPfff+3auPxvdCbjhvzByUsDkTZbmuCsdhmrAv+DBD32Y8zrQKlLJF8ZtZSj/67r2K5KgNh3zKzVYyzgneCj4bNmVoegv5c/ESqKyPa1Ar6CRf8J4VJjR6QE/D9qBroZ6JEmuw/sqV/HwnRhsfoAx8n1ATUo5/PwQVMkfmulR2VtsOIkOeV4G8ywPzD3soxOgZNbCsq2niiZI1uxoyKOMouq6MKwghN7CESWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:39 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:39 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 12/12] bitmap: drop bitmap_print_to_pagebuf()
Date: Thu, 19 Feb 2026 13:14:04 -0500
Message-ID: <20260219181407.290201-13-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:408:ec::30) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 807c0036-96bc-4c52-fc04-08de6fe2bedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SbWiriWEbcf51nIJ35nrCbq0VoQZCNtKmr/rMfuuwiqcA1iOMFssd73PdpkD?=
 =?us-ascii?Q?bmw80kaqnbyGns176EKMDqTNZwEZUO6TTvlGZHH1NZjmWOEfX4+d7tC6YA04?=
 =?us-ascii?Q?mfFBH+gR6l79N0jkFh7TyVi8KBD4NTym0cwKLn8Qo8e7EeLgqj4GmU1J273p?=
 =?us-ascii?Q?vRRqpsYePfU5uL+TLDmccnDZwR9ra/RrR5Y4ywBs4XBS5u42sIR4wtYG8TpK?=
 =?us-ascii?Q?YOvNG1RIQzAChPdb3udwPjbbb2SlIp6PfZ8umOoCIEfSGHPTfnjPr7Pr8NQG?=
 =?us-ascii?Q?kNxlfMXP0A8iTihInYb/lQL4DNz7Kh/oW3S7lcVRADWerAmRHO5hMjbvPf68?=
 =?us-ascii?Q?AaAOxB/GkcF+PTW59ptPSAyVgrjby+hCMmx1vAZ48EvQvuGgGF/J33LyDyKz?=
 =?us-ascii?Q?EanMoOebjV/7BNSo4bgvR3sB+y9m6nHS1yPzON6heFOMTHfCiJjZrtSiCZoY?=
 =?us-ascii?Q?ZBqPkjMQHhEvLMukgi6FZoy4lxxup9WfwaHsRG9InArk7P7k8eDFSLCRxpSV?=
 =?us-ascii?Q?P3AhgEoBZveB1U2sYgvXpY5EujP1yUuMclBfBibOqMyKJDL4rUNA3Hl1YLF4?=
 =?us-ascii?Q?hBik9kYakpABDEOdMAJTU/6CmQdbOx0HN8dXhJx/qwU0otjbh9zV+MytscLi?=
 =?us-ascii?Q?MRmSDQn3u2t+WVfdfaKooz/TeTVIYGHn4UNEXv3YQ0N/2jRf+NXfQL25PKfc?=
 =?us-ascii?Q?/723+8u1B+4JTqGspgyQ/+jMInBPihW8TSiDnaDqT4Usu1lojeDqZM+F3MG0?=
 =?us-ascii?Q?4MhBLwmkmBES1bqkcUxW8+g1pkXU9S/d6bRTC+lflzYJg0KbjbfuWZQYBT8J?=
 =?us-ascii?Q?8ipONOVQB7ORzmR0TcIUI66oqlqhZJYuQTEV4UobQYGRCGeJHY+w/ji43SWa?=
 =?us-ascii?Q?E1IzIMtaLrGlbdnNGp8MANkpiMSxhm7OHibJmsxHK53DG+Ibgg7lwjeFHcu2?=
 =?us-ascii?Q?Qll4EG3c03TloYomzUz3qmTvi5R1dqrnXQ8og11uffn2JW7cePi521dvTYTv?=
 =?us-ascii?Q?W7zHXlxDaFi/V/WkE5yz5UnfF275zDPcKG9oc/EhpYjY5YPTrZPpPjykoue9?=
 =?us-ascii?Q?6c9YN0/Zv4vrP6zvOvMTRKuRLMZxEeW9b7B9mD9rWwk5M+7syh8FBAW2pe0o?=
 =?us-ascii?Q?tHivp2g2eNwqXZ64BKZlRKU7wtF/f9DcSGxrRgjUF4EeoBDUyv3ahF5lf41M?=
 =?us-ascii?Q?QE29toa+NZhgLsf44c/q5DHAh7xhBM49Zwwq5mKcfUcq/mTAJmpuAuAo6K4k?=
 =?us-ascii?Q?QzxchpGOuAe1uCMGz4Tg7OXPfxA5nw6lnhov0acUahqmxpXan4NJAj3xJ+wO?=
 =?us-ascii?Q?KNyfdlm246mlJ4+BlKvESzTjg0ig0vIOH5MmeE7E/AVqQpvyHa0BZWFnaE6x?=
 =?us-ascii?Q?wSRMUz+3c1likYb7/M1G2gmHpExIVxdqQtCYGI4YLrjgQ77FspjYZ4MrtZ1A?=
 =?us-ascii?Q?Tos9BLwnyMZMg0yEQw54JmlOCtwetMwPsI5ThWGtF9aUlWugrLAYg7TJGKzQ?=
 =?us-ascii?Q?YnEZpR77uPRywv6SojV6W1DLUq7/5rqBonpoV/IRA2Znk/guEAgzWg5EDsks?=
 =?us-ascii?Q?IPgsg64VtGdWAK4FSavNUPpkHFEGMMeFVko05xY7ayppfD+8BH73hOYk0Pv4?=
 =?us-ascii?Q?PA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xwnbcz0jEsAJwo2uYPcn8BvdIcszVwkGtt1iznF/U/GJax48C3h56yyCciJx?=
 =?us-ascii?Q?n4yW9d28C6COwy2D9++nm0ikZf3wgJFBbgKxk/XWV3Vn/VGmMNAOL5jitR6O?=
 =?us-ascii?Q?Xz0F0hEj5vjPfYKbP9BV7NW7hvMorO77NiL0m8e5hPBNISntimMS394YuSBj?=
 =?us-ascii?Q?qbld95i2v5Lk3ncXSuPONJI6g229Y8UMxXBctfBNhLG9R9ieq+vB78CnZB6X?=
 =?us-ascii?Q?CKQ6nv+bQqiIyJ2FXJEbRJZ/6Djmse9f3Qt+/lY3ft3Tlz0J09Gg4WZUWe5h?=
 =?us-ascii?Q?81NxP8ThxTwHjBYGE1KowGzQ8nCujs++9uFYMJvxSnfeGsbcUJEBfcKFNvlq?=
 =?us-ascii?Q?j/PC8F6feY3KxuZZ2txrJsJ4yJnCkLYG4JN/bFJmUgUY/gvUCfrpeqhzD6i/?=
 =?us-ascii?Q?zXNupSKFVgKj/9NZvNwMhVT9iZJf+BwpKVze/X+1C95ZLH1KomvejrIucK+O?=
 =?us-ascii?Q?i7zq6pGZIR9VCiSmvsDnMK+3XJzfibyxnQl53tenpzju4mtgfanG2BxrR498?=
 =?us-ascii?Q?mFSIjXp4llubeoqtQZStP5R4OOFRJmOmE3072sL6OoU8fzl4cEewXrs2KMvf?=
 =?us-ascii?Q?KG/+9wMZLhcvdD3p/SkWRPa170MhOO+1aiv8yKJXzGuGQL9+bt+t8QIeJcnx?=
 =?us-ascii?Q?0t8S0O1n0eJSfEMqE3yJ1USLOZXX4eeEibfsrtH+2S16UoUH9hDRVcW06d/a?=
 =?us-ascii?Q?YqoYc0lVSizIazNA82cSh+CVwdPitVIGqW7kSF/xdOc9Lz1dO4OztRbH4p5f?=
 =?us-ascii?Q?zJSZzTGqdLPt55T3hU6Ak7jU0RfzzXv2GV1BQWPLy4AzU5uxTHMU8efR2FvW?=
 =?us-ascii?Q?Exi75x6ffv5S2z9TSFdSFV8aJ97ApBuYSsZobUJz2YG5AJX7t/t3Hxnu5LQS?=
 =?us-ascii?Q?QSYxYZOZGaSTvn5ktpm/TuZ14ldv+Eaf72jQZ6pd6HSWqGR133a3tNoT1y/B?=
 =?us-ascii?Q?R/8xGOB0Oz955fZ7hWrDSRWgQszhftK4Egw4cKKzAWrh82XubRsu7vBbIvdG?=
 =?us-ascii?Q?+dzKdFV05fAeYEBeNv28t2goiR7nXvrCKET218ejgeFpC9JZWx0xrtQdnTlo?=
 =?us-ascii?Q?s/cUv5FIUbniCDDUrInlXtvQzs64400i48J20zw9SSjnMI562Gj8dYf9BDAQ?=
 =?us-ascii?Q?4Kt+VcjM4QoJB+kpE7fEH+BXik6s+rAEjn9lCrRnimsB6fMuXGbW+wZnuL1K?=
 =?us-ascii?Q?Zx/YpVszYPr9dkcqqatdrkDUy+jnDCnm0Y+NeepO4uLAJ/y3KAJYOyH0NPWw?=
 =?us-ascii?Q?CzhxgoIyl8vbCwj0pHNgTx3cJnyxf0EdFzWyvfEpwKyobw3+NpwZrz+HvuOX?=
 =?us-ascii?Q?zRPbqXo0o3bMB+4CoYZqbSaiKqJHWjm48OGUcn/bebR9kFGpboF6rTa5+MBw?=
 =?us-ascii?Q?QvE5K9313S+NQ1jwn38sBumqwzD96184PoYs5LzrVQ/CbCr1NtdawOZ+1ocf?=
 =?us-ascii?Q?9PnJ3PUovsabWwDLCAqPU/IbuB44iD7HbbtymvBc3DCPhYuBuNWpheYNs5IP?=
 =?us-ascii?Q?qx7jMwQvHFg342xTmRZgfCk8+rf8MKPxQGr5GaNUfB/rTD4pGFjAq0XWgHZI?=
 =?us-ascii?Q?g5cu4x3Zk+820JIu3GeMdzLLzwZQ+wdKmq4vWQwdWI0tTJpeX12DZPmteuuj?=
 =?us-ascii?Q?upAEuhXqkJVS/TnV7cTtsbo4HpBjK1kbsdrh9TbFC5b+u4ySj3wl2EmesYpv?=
 =?us-ascii?Q?BOboCaWLzJR+Lwp2AwVyztoosjpt1vqLWC7Gek1qdcJ+jPsBELBXWJ3oHWhS?=
 =?us-ascii?Q?5zrYqEe7RdNB70j6WgYZMqxQbU8LT59Sk3f1yyT0K/akX0LGBjGl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807c0036-96bc-4c52-fc04-08de6fe2bedf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:39.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bioaco1tNd3mW+rjo4wtJOR0itiVHJzaVDXbBo/aduMRpT4rdc1gV+OjjE/MH2iknGzN8Nhyc1tcFRZ9ejywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16966-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6BAE0162C6D
X-Rspamd-Action: no action

Now that all users of the function are switched to the alternatives,
drop the function.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/bitmap-str.h |  1 -
 lib/bitmap-str.c           | 42 +++++---------------------------------
 2 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/include/linux/bitmap-str.h b/include/linux/bitmap-str.h
index 53d3e1b32d3d..abe7a69a846f 100644
--- a/include/linux/bitmap-str.h
+++ b/include/linux/bitmap-str.h
@@ -5,7 +5,6 @@
 #include <linux/types.h>
 
 int bitmap_parse_user(const char __user *ubuf, unsigned int ulen, unsigned long *dst, int nbits);
-int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp, int nmaskbits);
 int bitmap_print_bitmask_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
 				loff_t off, size_t count);
 int bitmap_print_list_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index a357342d5d6c..49f4118c5cd3 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -39,32 +39,6 @@ int bitmap_parse_user(const char __user *ubuf,
 }
 EXPORT_SYMBOL(bitmap_parse_user);
 
-/**
- * bitmap_print_to_pagebuf - convert bitmap to list or hex format ASCII string
- * @list: indicates whether the bitmap must be list
- * @buf: page aligned buffer into which string is placed
- * @maskp: pointer to bitmap to convert
- * @nmaskbits: size of bitmap, in bits
- *
- * Output format is a comma-separated list of decimal numbers and
- * ranges if list is specified or hex digits grouped into comma-separated
- * sets of 8 digits/set. Returns the number of characters written to buf.
- *
- * It is assumed that @buf is a pointer into a PAGE_SIZE, page-aligned
- * area and that sufficient storage remains at @buf to accommodate the
- * bitmap_print_to_pagebuf() output. Returns the number of characters
- * actually printed to @buf, excluding terminating '\0'.
- */
-int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp,
-			    int nmaskbits)
-{
-	ptrdiff_t len = rest_of_page(buf);
-
-	return list ? scnprintf(buf, len, "%*pbl\n", nmaskbits, maskp) :
-		      scnprintf(buf, len, "%*pb\n", nmaskbits, maskp);
-}
-EXPORT_SYMBOL(bitmap_print_to_pagebuf);
-
 /**
  * bitmap_print_to_buf  - convert bitmap to list or hex format ASCII string
  * @list: indicates whether the bitmap must be list
@@ -101,7 +75,7 @@ static int bitmap_print_to_buf(bool list, char *buf, const unsigned long *maskp,
  * @off: in the string from which we are copying, We copy to @buf
  * @count: the maximum number of bytes to print
  *
- * The bitmap_print_to_pagebuf() is used indirectly via its cpumap wrapper
+ * The sprintf("%*pbl") is used indirectly via its cpumap wrapper
  * cpumap_print_to_pagebuf() or directly by drivers to export hexadecimal
  * bitmask and decimal list to userspace by sysfs ABI.
  * Drivers might be using a normal attribute for this kind of ABIs. A
@@ -111,18 +85,11 @@ static int bitmap_print_to_buf(bool list, char *buf, const unsigned long *maskp,
  *		struct device_attribute *attr, char *buf)
  *   {
  *	...
- *	return bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
+ *	return scnprintf(buf, rest_of_page(buf), nr_trig_max, &mask);
  *   }
  *
  * show entry of attribute has no offset and count parameters and this
  * means the file is limited to one page only.
- * bitmap_print_to_pagebuf() API works terribly well for this kind of
- * normal attribute with buf parameter and without offset, count::
- *
- *   bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp,
- *			   int nmaskbits)
- *   {
- *   }
  *
  * The problem is once we have a large bitmap, we have a chance to get a
  * bitmask or list more than one page. Especially for list, it could be
@@ -149,7 +116,7 @@ static int bitmap_print_to_buf(bool list, char *buf, const unsigned long *maskp,
  *
  * The role of cpumap_print_bitmask_to_buf() and cpumap_print_list_to_buf()
  * is similar with cpumap_print_to_pagebuf(),  the difference is that
- * bitmap_print_to_pagebuf() mainly serves sysfs attribute with the assumption
+ * scnprintf("%*pb[l]") mainly serves sysfs attribute with the assumption
  * the destination buffer is exactly one page and won't be more than one page.
  * cpumap_print_bitmask_to_buf() and cpumap_print_list_to_buf(), on the other
  * hand, mainly serves bin_attribute which doesn't work with exact one page,
@@ -158,7 +125,8 @@ static int bitmap_print_to_buf(bool list, char *buf, const unsigned long *maskp,
  *
  * WARNING!
  *
- * This function is not a replacement for sprintf() or bitmap_print_to_pagebuf().
+ * This function is not a replacement for sprintf().
+ *
  * It is intended to workaround sysfs limitations discussed above and should be
  * used carefully in general case for the following reasons:
  *
-- 
2.43.0


