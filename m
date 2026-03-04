Return-Path: <linuxppc-dev+bounces-17648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJCHJLCKp2nliAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AD1F94AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQZmV32dXz3cCJ;
	Wed, 04 Mar 2026 12:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772587674;
	cv=pass; b=eJk/Wc17NusJLItPXiYAKLfrr9nme2mSwik9dAlRm58w79a4de843hBUzpvcQT5VVQE/H1lcuVEA0vLntIZKGX+Clm9F4j8RRQUjg/NqVSmlpBGJDdJ3tUe2fALu5Gfr4mqHqLH57s2vRr+0b0gwEbHluB5Am9csj2A7flBlULpg4yZGHj/vy1wkg9yjv2bHffPBBFKI8o+JXIRFSPfbDDKlu/IobUcUK4Qz+dqVLyWloNHa2mdNFHXFipCj2qa8/G8A4Q9ncu+jDMpi42k3dPjVkYaVqAi9Tuny8iPit/bzTNNQ8622uFKsbeHy5+T+Ux5+ENwDgrUBKiznVzUqfA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772587674; c=relaxed/relaxed;
	bh=NsJTnERJRzZhLCX7+/1+Xs6KkE2zo4OgvkEqpZE8A8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QMUlOSro3vKsohTELdZ2sYs6DlHL9LWfxsCts7+fVns4aO81qIJRwH6RwHN1hYkh7K7yyfTG3Wa6Myt6qDPZlOxcid25+k+ruZFlh5W4LHXmqB6le2KibWDfqNExtj+G264lzXhXng1ZkLp/otFJ8LykTNbha87HXm6HIdzXb25vEEXSYS3JQzMvXwkbv640Zt8oNRW319gNqt+egtp4RR7W1KBuhkwBMT4GmIQ445JfQXinO1vWQm3slZV6pYy1FdIss82nJ+EbrqwMYlliLqg6u1EfZUN/sSt5CP89KJd4FNS6iNnWpjYtsFEHVhsXnZX/lWF8hfz0OlAZ3RpYRw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PbJxEn7G; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PbJxEn7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQZmT2nCHz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 12:27:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtYbkjF6j/cckPMLctsjtszaImOU9ZmtO+EqP+j2ORwzMKxXJe3bI77aOmn2S/XcGc1WJD2/1Jn+jmpN2k7HdWtI98cFoxh6U1LnISGNxLoUTERSg8ZkCq7nbcM3s1SWZUc3LZ0uicurVNrqfwRWy/sFigwX3ooAJwgUh6ojU1LZQGSbkTgwJX9pnTpUe/Q06mwAoJUqNjxA45WoLouWNLJTKyoSiOESCs30dFHFo6NUpFzkun5u+H4UbcGLHekzkCKS8t+SC2Sa2VuJIhTv7gMa2Q6IThiQn7bO2xdA6huicZ4aN92nYkiRwF/3DHOfGOzoBLWitMyJ/SeQEH7ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsJTnERJRzZhLCX7+/1+Xs6KkE2zo4OgvkEqpZE8A8M=;
 b=E18v9nkNSsHVeMIWL/LoI9pyKcyxfSMSgSTN/6w5RsgqPazWaDQO/pkYiIsYhPo9Vjx5NXD0KDMoweSQXgOVCYD5hcK5Z5xiyG5WDbpPWitzh3lK2o6gN1zvsfTiMpTemEVKJCjLhaniS+5peAzqo/sDCyjdPmBD/jzrS4k9tuXDEUPe+KKS0clVpUXhaQpREupcCVej9NQAzBGB+cvcuVqm4aY4kK3nx0bH+YqA5yqvwrI2SljsqAYyfjsuvyKEgj5zrHXXtZYVrV5BrKHtK77Inv1WPylNoqrBQLdVQlEUeUa5KDhfAL4YQO30v3bWPrrIuHu40iArdIVTXXuB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsJTnERJRzZhLCX7+/1+Xs6KkE2zo4OgvkEqpZE8A8M=;
 b=PbJxEn7G+bS4KSMUxBgg46xddct10ZkhjQScemEdN/gpDMagU91bawODu8Pdm5K18m52HIkUFZEJ1dEnBPuYjO114YrqnYyyJzoVl9XYneOhjptOiiBjLx69K7wokffoYf3xOrC6yyJzOzWWZA/r3e7X87i4jMdt76OuovlA8miRsFdS/ScO7tNNoh6pntyVsZEOLdg5JnnTlm3HPtBmqI+CsMb/KInoW5//v50YE+PlKH0cyo6iq0xtaN9m4s0Yu3h+dMmtFcgyWvud+zJJZ0yOtWKaeZrt1iDVBGCNtkEVqXvtVFetko+1VAu4W+2Y3bB3+mScPxYZLuL8xmi+dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:29 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:29 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Anna Schumaker <anna@kernel.org>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Aswin Karuvally <aswin@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Carlos Maiolino <cem@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jens Axboe <axboe@kernel.dk>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Zheng Gu <cengku@gmail.com>
Cc: Yury Norov <ynorov@nvidia.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	dm-devel@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	v9fs@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/8] core: use rest_of_page() macro where appropriate
Date: Tue,  3 Mar 2026 20:27:12 -0500
Message-ID: <20260304012717.201797-5-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:408:141::13) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3321f5-58f2-453f-5285-08de798d3366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	2bU1Zgdgg8fizy0j7DF+Bij0LR23XaHZoLO1x5kNaZZTZ8wNpGFJ/vX/G4h7UWom/z0NhDFAN7b4Q7P3g/JAwgLAPzuc3HwJOWg+ys3klcS2jI2YrgS5XTHNd1ReeWfZJthPb65KL2xVO6MR2ugndghKxMxGl+Turbo52l/QpFs4e3wat6zf5Bbm0ByxO8sm36toVsRPXChQcQ4HGaGobAdh6r/wXr3HNtWz/vWiafQd0dP0rAQX4cFOCWp9bPulnvAYbD43PMoMV04xgsOPod/VcXPBH2irxM+VH4ZuPseotVhF64Q1ym2fanC+A+7c4cYY7cINPwMTmrzUDiPs4ePPwpXcFoH01bWPMReos3tWfecXgZrAkSLTz4xVkSYhYLkgU2PGz+/fX2uxHeiJMcpGE5Se+M6iptqHPNVbrV/jE/NeYseeooOZicU317qfbBW7Msyjxqq4fw5Sj9MdObdriBRfiH7qWNTGA/bEDUqjrN9tF8pxt7mALPAP+Sx3Z+EvhPoO0KzviGRQguPYE50/MIHJ4Xjacew9zBQO+f81G2lZBqeg21PBYTy/ITcrhBonEvsbRspS+gObiM1XiYjxP/XVjVQfqYQY93+/AeNHW1TH96VM8kUwdfFtYfa4m1yDta7tL2/7Z1TBNa9tXgxZrxMj7uXyLkUMSvZCPV8XH/j/xfucUaI/XkNvtSmqLP2Dh9xZTiqYljgDNp/htcurwFA7PeEG6M+iExtsQH40j7aE7tFAbtJVl1PmQC733dtLxI+wPXZoSMlISASWZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLSUKEpnuUW544SwxGwrhhMNk8qp8Sr4uH7HRvp89Br0GFhxPRZlF4nVLAuf?=
 =?us-ascii?Q?9cbxAnUU4Yr9Qodq/neTvvZJoZU27/0qEqHDxlDg1GMv3B67nf8h+2pBE1B4?=
 =?us-ascii?Q?AVg0nLDTMLyi0X4VkU+2jGRcjllIYrz+oBaW6UyTN6f19asc0m2ggf6rfjHH?=
 =?us-ascii?Q?bArwZ8s5GnYSKj0VV1XTS7MkQxHb3IFxT9RGLfSho8p6MsaC90jg4eUv32ER?=
 =?us-ascii?Q?vdmeTv5FjGzt2M8fQEpjcRglbWMQ7SjnEKRPq2IOl1CRghfTyTEZP8MntlUD?=
 =?us-ascii?Q?mX9+1+Iq8XGMLVevmT65dxoVKiq/wC2hLYpMgCLUtJnlAb9tG/ZEiiBxI2d0?=
 =?us-ascii?Q?ZGoZqE5StbiZ6PhQOI8CBeTiUVq/KLulLFJ8H4M6750WEnmcFS6fGiM2cub/?=
 =?us-ascii?Q?oTY9sH6rr/Pef3BgOjVIU2i1YUgu5+ab8bInl48INoy3pyZDcSeJGe/ZadA/?=
 =?us-ascii?Q?17tK8Pg2LuXWScGSf7Ty5vy9wODwj58v3GeJF/pqnXtDqUx4mzDwzWxboc0D?=
 =?us-ascii?Q?iAdvEzxa2DU1HkaFqE+35CCCEd+ITB7SiEd8jEweFvlU9O3wG9Wq1xpOAdrM?=
 =?us-ascii?Q?0YKghEn+M+MpR/A+isdjW1APAbhysW2JPN4sbyu1b3y0co1BfU8vk1UPmukh?=
 =?us-ascii?Q?LgBSFCHWwfgUaQbVbxpqfomjIeIB/lbBS0M/KXlh5wgP71WQ0rIHqt5CwvNn?=
 =?us-ascii?Q?79gzEPYEQNyq8qeqAsua9C1/Dmr0so/BhIqfEQCIdjDjDwjDj9o/BfSelVSk?=
 =?us-ascii?Q?u0kRek/gBRysGF6M6icv34XWivsleUhsL9CuFikZUtUGYNI+vvLZG+orY176?=
 =?us-ascii?Q?WUu9n2LEuNrOCUw+2iC3rFnvQ7rebARLkVpAsauXky34GyaKp4b3dkhLxfFk?=
 =?us-ascii?Q?eC9f8knwrC6hSYM6BMfT37rgWxOhXsOtIXya3yF507Q2jozncX3+iqtwQNU5?=
 =?us-ascii?Q?kydHjcIT9HIShwe2CpFAt1MOGSineOPJKvJmGTdsalPpuBDN4Fzo2QuMROyW?=
 =?us-ascii?Q?LHXeeKN6o2mYGyuQGZbiKW4r2RwkjJGF/Tee7xiT1D1CEuIcGDdAx2RIcDZN?=
 =?us-ascii?Q?5q3PaUkKalvgIURESxDPLUcFQPxUzSu4ZR3II7bqVW1x+BcytJhBCqksmusK?=
 =?us-ascii?Q?zx8uRU2zu1FKBXw+zOdKewNd9NZWlWEo8ieIAgJxjTrBibZBg+aZShu6/sjV?=
 =?us-ascii?Q?TOY8GB8lbWDvslKF4AuUxDqTwDIyQuDJIMNUm8/Du8CJfrwOsYwdtQdC7ZmO?=
 =?us-ascii?Q?Tcoumo0Ox/5bjuEHfEEQwPvxYMmHSADbCq4nNU5WCBK0J9HH0IXtXb3gLyEm?=
 =?us-ascii?Q?1f/RrFgjqQMEypJTgAEjTSXjB5kQWZX4sQYfEFdsidbrO3H/lDjPCyUfZBel?=
 =?us-ascii?Q?mAMUIM90cvomiBWcbEDQsfaSzFCXGlDOpRYh2jChzWVpXxrGWHx40Nz43Gif?=
 =?us-ascii?Q?yvTl1YSbMdCUiJLm7W6ZtKTyWQ+ZjT0LYo6CPblgros3Oe3oUYEURGCf9Xjn?=
 =?us-ascii?Q?HVpeHe+o0iCb7xXKf/dKY+HyA20ENFPjnaVPXLsmcMNxr4qk/31/qL1kCZJw?=
 =?us-ascii?Q?6AJt7lF09XAfZStNj7dKOvwZEivg58ojkdH4TAeZc9p41hKYkfG0iI/3FXIZ?=
 =?us-ascii?Q?yDqQMhQoEKuwdWMTmWHQs+dODra4vyZptQLUcqbkEU+Y74+KdgTAmqTE0MG2?=
 =?us-ascii?Q?k7/h/p492MZ1Y+NBbU4T/0o6az8K1cAZaf+I64jVY37d6kvham8GL28W5sn+?=
 =?us-ascii?Q?oapzuIVKp4/3Vax/KXq+5E5gtaSDI6Z4jY+Rw1kUo+/BY5Oz1gSw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3321f5-58f2-453f-5285-08de798d3366
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:29.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKugQiQpNaSieM+KubWVyA3r/4X8bz0eN0Y+a21LkKjVOAfxFj76HJG2XRHAse1XkLqFszUAxZx6OyCgFMahgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DB9AD1F94AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17648-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux-foundation.org,davemloft.net,redhat.com,mit.edu,eecs.berkeley.edu,fb.com,linux.ibm.com,zeniv.linux.org.uk,dilger.ca,lunn.ch,kernel.org,opensynergy.com,alien8.de,arm.com,linux.intel.com,gmail.com,codewreck.org,linux.dev,google.com,gondor.apana.org.au,perex.cz,kernel.dk,ionkov.net,ellerman.id.au,szeredi.hu,dabbelt.com,infradead.org,intel.com,ffwll.ch,suse.com,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:davem@davemloft.net,m:mst@redhat.com,m:tytso@mit.edu,m:aou@eecs.berkeley.edu,m:alexanderduyck@fb.com,m:agordeev@linux.ibm.com,m:viro@zeniv.linux.org.uk,m:wintera@linux.ibm.com,m:adilger.kernel@dilger.ca,m:andrew+netdev@lunn.ch,m:anna@kernel.org,m:anton.yakovlev@opensynergy.com,m:acme@kernel.org,m:aswin@linux.ibm.com,m:bp@alien8.de,m:cem@kernel.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:imbrenda@linux.ibm.com,m:dave.hansen@linux.intel.com,m:airlied@gmail.com,m:asmadeus@codewreck.org,m:dongsheng.yang@linux.dev,m:edumazet@google.com,m:ericvh@kernel.org,m:hca@linux.ibm.com,m:herbert@gondor.apana.org.au,m:mingo@redhat.com,m:jaegeuk@kernel.org,m:kuba@kernel.org,m:jani.nikula@linux.intel.com,m:frankja@linux.ibm.com,m:perex@perex.cz,m:axboe@kernel.dk,m:joonas.lahtinen@linux.intel.com,m:lucho@ionkov.net,m:linusw@kernel.org,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:mpe@ellerman.id.
 au,m:miklos@szeredi.hu,m:namhyung@kernel.org,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pbonzini@redhat.com,m:pjw@kernel.org,m:peterz@infradead.org,m:rodrigo.vivi@intel.com,m:seanjc@google.com,m:simona@ffwll.ch,m:tiwai@suse.com,m:tglx@kernel.org,m:trondmy@kernel.org,m:tursulin@ursulin.net,m:gor@linux.ibm.com,m:will@kernel.org,m:yury.norov@gmail.com,m:cengku@gmail.com,m:ynorov@nvidia.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-block@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:dm-devel@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-mm@kvack.org,m:linux-perf-us
 ers@vger.kernel.org,m:v9fs@lists.linux.dev,m:virtualization@lists.linux.dev,m:linux-sound@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[86];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Switch core and library code to using the macro. No functional
changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/crypto/scatterwalk.h |  2 +-
 include/linux/highmem.h      | 24 ++++++++++--------------
 include/linux/iomap.h        |  2 +-
 include/linux/iov_iter.h     |  3 +--
 kernel/events/ring_buffer.c  |  2 +-
 lib/bitmap-str.c             |  2 +-
 lib/iov_iter.c               |  5 ++---
 7 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 624fab589c2c..c671d5383c12 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -73,7 +73,7 @@ static inline unsigned int scatterwalk_clamp(struct scatter_walk *walk,
 	 * page due to the data not being aligned to the algorithm's alignmask.
 	 */
 	if (IS_ENABLED(CONFIG_HIGHMEM))
-		limit = PAGE_SIZE - offset_in_page(walk->offset);
+		limit = rest_of_page(walk->offset);
 	else
 		limit = PAGE_SIZE;
 
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index af03db851a1d..05528ba886fb 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -507,12 +507,10 @@ static inline void memcpy_folio(struct folio *dst_folio, size_t dst_off,
 		const char *src = kmap_local_folio(src_folio, src_off);
 		size_t chunk = len;
 
-		if (folio_test_highmem(dst_folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(dst_off))
-			chunk = PAGE_SIZE - offset_in_page(dst_off);
-		if (folio_test_highmem(src_folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(src_off))
-			chunk = PAGE_SIZE - offset_in_page(src_off);
+		if (folio_test_highmem(dst_folio) && chunk > rest_of_page(dst_off))
+			chunk = rest_of_page(dst_off);
+		if (folio_test_highmem(src_folio) && chunk > rest_of_page(src_off))
+			chunk = rest_of_page(src_off);
 		memcpy(dst, src, chunk);
 		kunmap_local(src);
 		kunmap_local(dst);
@@ -580,9 +578,8 @@ static inline void memcpy_from_folio(char *to, struct folio *folio,
 		const char *from = kmap_local_folio(folio, offset);
 		size_t chunk = len;
 
-		if (folio_test_partial_kmap(folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(offset))
-			chunk = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && chunk > rest_of_page(offset))
+			chunk = rest_of_page(offset);
 		memcpy(to, from, chunk);
 		kunmap_local(from);
 
@@ -608,9 +605,8 @@ static inline void memcpy_to_folio(struct folio *folio, size_t offset,
 		char *to = kmap_local_folio(folio, offset);
 		size_t chunk = len;
 
-		if (folio_test_partial_kmap(folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(offset))
-			chunk = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && chunk > rest_of_page(offset))
+			chunk = rest_of_page(offset);
 		memcpy(to, from, chunk);
 		kunmap_local(to);
 
@@ -642,7 +638,7 @@ static inline __must_check void *folio_zero_tail(struct folio *folio,
 	size_t len = folio_size(folio) - offset;
 
 	if (folio_test_partial_kmap(folio)) {
-		size_t max = PAGE_SIZE - offset_in_page(offset);
+		size_t max = rest_of_page(offset);
 
 		while (len > max) {
 			memset(kaddr, 0, max);
@@ -680,7 +676,7 @@ static inline void folio_fill_tail(struct folio *folio, size_t offset,
 	VM_BUG_ON(offset + len > folio_size(folio));
 
 	if (folio_test_partial_kmap(folio)) {
-		size_t max = PAGE_SIZE - offset_in_page(offset);
+		size_t max = rest_of_page(offset);
 
 		while (len > max) {
 			memcpy(to, from, max);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 99b7209dabd7..6ae549192adb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -142,7 +142,7 @@ static inline void *iomap_inline_data(const struct iomap *iomap, loff_t pos)
  */
 static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 {
-	return iomap->length <= PAGE_SIZE - offset_in_page(iomap->inline_data);
+	return iomap->length <= rest_of_page(iomap->inline_data);
 }
 
 /*
diff --git a/include/linux/iov_iter.h b/include/linux/iov_iter.h
index f9a17fbbd398..13a9ee653ef8 100644
--- a/include/linux/iov_iter.h
+++ b/include/linux/iov_iter.h
@@ -227,8 +227,7 @@ size_t iterate_xarray(struct iov_iter *iter, size_t len, void *priv, void *priv2
 		while (flen) {
 			void *base = kmap_local_folio(folio, offset);
 
-			part = min_t(size_t, flen,
-				     PAGE_SIZE - offset_in_page(offset));
+			part = min_t(size_t, flen, rest_of_page(offset));
 			remain = step(base, progress, part, priv, priv2);
 			kunmap_local(base);
 
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 3e7de2661417..1db2868b90c9 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -590,7 +590,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
 	to &= (rb->aux_nr_pages << PAGE_SHIFT) - 1;
 
 	do {
-		tocopy = PAGE_SIZE - offset_in_page(from);
+		tocopy = rest_of_page(from);
 		if (to > from)
 			tocopy = min(tocopy, to - from);
 		if (!tocopy)
diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index be745209507a..a357342d5d6c 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -58,7 +58,7 @@ EXPORT_SYMBOL(bitmap_parse_user);
 int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp,
 			    int nmaskbits)
 {
-	ptrdiff_t len = PAGE_SIZE - offset_in_page(buf);
+	ptrdiff_t len = rest_of_page(buf);
 
 	return list ? scnprintf(buf, len, "%*pbl\n", nmaskbits, maskp) :
 		      scnprintf(buf, len, "%*pb\n", nmaskbits, maskp);
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 0a63c7fba313..c7e812349ca2 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -483,9 +483,8 @@ size_t copy_folio_from_iter_atomic(struct folio *folio, size_t offset,
 		char *to = kmap_local_folio(folio, offset);
 
 		n = bytes - copied;
-		if (folio_test_partial_kmap(folio) &&
-		    n > PAGE_SIZE - offset_in_page(offset))
-			n = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && n > rest_of_page(offset))
+			n = rest_of_page(offset);
 
 		pagefault_disable();
 		n = __copy_from_iter(to, n, i);
-- 
2.43.0


