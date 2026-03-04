Return-Path: <linuxppc-dev+bounces-17653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHhhJtWKp2kUiQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD11F9519
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQZmg2Bg6z3btf;
	Wed, 04 Mar 2026 12:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772587683;
	cv=pass; b=fA6BSuK0cB0hy8iGi0z27LI9rnpVfFsZ2+wYxZf5ObWXfOJgkd++GK8c/WZYRw8VmPJktCYGFGRUL1J9UTYvJSuVpdWHg+2+N3bMo+IY3gtX4o1X3q9Xj3O/+i68vr9hCC/C+L17sUySttsADBK/4g9zigrffhUcKv6XOXYq7NU3TuS3XPvqiU+lXJ5skSglxgm3FwJCiOc1z3AyGRyJVLxvyqN/PIiljS90jE4ZGK0K5LplEq+o/BJmGqEMz1rhZCn9S5JRvVgPQWQGFRJUnNTOpI0HVi6Yj2VxiUoCsWFu0L3jKa+H08o2jxQetHDbtHeU28yPrU39qE9mDaXoJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772587683; c=relaxed/relaxed;
	bh=b/9cw4rVtdp7nDwwEt6tY6A4ufMWASgOefh/bePnT78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fjyb9NQfsLfeWHdbrS6J4MJ5FWYBwEEZq0VI4W/nLBzRAvBZ4wyABDHvslo0seI/bvdSVznwq8TRDurkxtLKv9g9BJ78dERSd1vmqUPc2EsDF3zn0bgY9WkgXYb8xT0wThUIkON8NQ+FJsY6xjbX98rULCH2ljEcyXudMbu4+TPebvnOM23C50sdEesFQ/VypASWOZMXm7sGtj1E2XYfbRrxFWynFd5tkfUxekubLPYVq/Inr5ihsg8jNi5LrCbKtPrRO8CDEH2HRiOn1exC6b183vgDI4D9UXJuJn3toTztLLz9ONh+6CR/tuio5/gL2tz/sb0fH1spD3Ni0tyfbw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eBEpHeIO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eBEpHeIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQZmf468Tz3cHS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 12:28:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6TZgo+oeI/syCj0K89Lqw/iVCGlbrnb0GosMxKMYmR2n7EWuQou7itMFJ/D2xh1Mnf4AyLISZSKqMxZ3E0cR+iCxBCGm6NPXWhrT/YQ/OWfcdnL5i5uJ1JOyEXubgDgJN+RqUbdfiFoTLrPW3/2O4aeOlw6qeezy/MjQYXvzG5piPBVukrV9n5ySMq6QMPNxN7RKj5Hqeu3r5ZV/1Pg9QWZx3Wbx+kPlKNazdRbEcJ8gC4caazcl8S4OQOONj0UERVtfBlRC0VhQmNxG5jSNsP8ytCtUAMTxKf9QecpVNoKPTiCXj+Vg1Rq3AYNstvLjM4MvukES/+cp/oZjJhKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/9cw4rVtdp7nDwwEt6tY6A4ufMWASgOefh/bePnT78=;
 b=jqEVC19h6/2MTph8IbumFi4ofPBD2jbcJXKbZSULPJdHV8iyX7Py2mISBxuAzh/gx/oss8Cf5XmzVwALImk4yai4WTCRLkzkeEEANWFkHTWjBxVdAfp8uPEuqCeujsf92cf4Pnq830WqJXB4CEI9jhDf/5Q74vgaZsX8SjdzVCJnL/HsaJ/wNUuGzhI8e2xKLcXFCAa72f+d9/m5Tqpte9Rjf+OklHSoLZExvoSKh0iPDQCI1/244FUBY/dhfaQQfJaQ9u20Iv0jZAXrsc8i5cNbGfYycA9HWqXowGqdi9HI1npVQoGLU7pyykSfxxfwWgW5qjTg0OmSgZAvQasW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/9cw4rVtdp7nDwwEt6tY6A4ufMWASgOefh/bePnT78=;
 b=eBEpHeIOM9IjDQVERlKqt7Na3Ndrd2joTLomQ/4Ka89uyT6w4Ydi36IWC1XGhKT0S+ZD5Tm0hrYDK0fbuF5+P/Ow08Jrf27KLb2ZfwSDtPezeOVGZTI8dEkxp8mc4VX397tw142+t0lHK7PqTC9IiUpBn6rSfF6+F8ron+BTAkpuT8mRv8S9yF1mNEeqEj4ZmIVuoPW7Pu5+jE08lWTHaskZJk1oPAHDscg5IF5rxfid5HTawJiZj4WB1tZsYCDW3KfvSy0cNWPKDEgWRXEBn+hsUbo1LrXZQZVgoiXJgOlHC2vWQeECyJNsvZ2GHeW2J4bsOjEv0R7ZMbtpJUsUOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:22 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:22 +0000
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
Subject: [PATCH 1/8] mm: add rest_of_page() macro
Date: Tue,  3 Mar 2026 20:27:09 -0500
Message-ID: <20260304012717.201797-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:408:ee::25) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 91646663-0fb1-410c-8504-08de798d2f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	fU99pqqk17BJVt6QXvk2IuF/OQrOb+DohtX6opQBkFEUWcCy3b4bk3JK1L0f85TLXFomh78StXNK4lFSZ0itH6zDsXIyxPZ7J3nzdCGUcH6USmHStqJDYEZvl+hS1x++wVubsSYRGwIVBeokUSNZYAMpQLKZO7z9SRqjPIvWja1PlPuJp87sGMyvK8dQGTtE717gdagFzdtdEVyKgYvqaO1QiRTJESvGLpeL7tv7kt9txETSWKZdShLKVeO43wejV6DbVyTCRDmPRSKZvWtBJUb+I/1r57CiRKt4xS4rFT7WvT01Iqnh/658bMWfc1kxV7DSAO1XZ04WgfWwIi+yeZXKRwnOGwd3lcZiPg23XAUuRN1r8GLosNCUigbfiyF5MhO3kqjVQOMD7OVxT0Qy9QFs3J4y8gVTstGhWI1j4lAHVYHVjvhyQ6Gwp9IaLs3XcSSMkhd5Mhonoyu0awxffzzdMzactv1pt58D+bMBKB8KyGC9oF766vZoGtlguKufS9BM0zmZ1awmEakTCM16TrwiNQTMc2G/VZWNskfd5MdKlLJ5C4O0rfYlz5EjOTbW7hIx2Ej22oSD56QJW4A9SrUvNToK0jmFW2LYUmC72g4CwnBg5m6WPvV9ABdco7Q3/ER6EjDOeyUs6mTdrsCpoJGg1K4xeHSBF16L1cc87q2rI9CxmDdZxv5B6WBIuqSbDihenlq4dGsDmpjy4AOgALXIyJM4vku0KGgJ2tf+eWoFwiCURfuyBllcV2xxevkoVUXdIVSaLyJSwFOhOdSvjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q9Y/45eNtOTC5hhXD0yobfpuY8bV4TLTzCHMAG/P8tvYRkl8kGT+Nd7eA5/O?=
 =?us-ascii?Q?1iGyhULX8Iq4xoV/C/Bu7bPjW68wTFJRZWXAoa9xSax6haXTJOaao6E4woHX?=
 =?us-ascii?Q?aZC7YNBEG8r9c4HZyhhJv1YnQcu0Qr74EgzNLsQqonM9xVlThd0r50f0vHtO?=
 =?us-ascii?Q?Dwl1U4dQkwFtuS+Zyw7Tk091HNwZkmvu/1NrI2K9z8Z5tfsAaT3lNvl0M5ma?=
 =?us-ascii?Q?MhltJilH4B4osgwEmIpDKFH3ky+PEga9efiSyJVqP/sJV+G2jKKqg9aQogPT?=
 =?us-ascii?Q?jLkg8Hh0BqaHEilvi20YJv23gqkQfLFWq3vs0M+9iY8WXpmT0DJf5px+APW1?=
 =?us-ascii?Q?bNBBgFyCLvfHec5F/m2IplD9DCXYK4G1RVjTLlb9ZaxeXzw6bMBLjULPrmXP?=
 =?us-ascii?Q?Ujst8um9kY8WiCqYQDNYz7N3JZU1KWhYxoxmYBEfDRGEKybh2Flroyz7F0zP?=
 =?us-ascii?Q?Zd9QZ6zxK62a1ebzrPrHFFiG1zJdkGxhOOI5iD41Hp0XReUX1aqazah7OO4R?=
 =?us-ascii?Q?SsKH4CG5b90NCtrMfwIIyz0RcTfy1Se4iCz8BXvar88XRL/PSYqSStqDSpGh?=
 =?us-ascii?Q?yLupESAxb1g/j9Y7qJXLgazSH1FaQU04b6SG04fcgQ1MQ9KdQLAFjiNt4av+?=
 =?us-ascii?Q?+C5rrJX1GGmNJ+t3yw9tt1xWlk66tgCXDcAuTAmbkP+EL01YJs+XWGnLp2HB?=
 =?us-ascii?Q?nxec7rPO8MS+52H1pkmArujIpvhSc75sbZBs3FnRFiH+cmH8hx9zWtI0zCw+?=
 =?us-ascii?Q?0rz/CNb2KwE2/lkVarRitHI7JEcgspxZjHxX1whgepK3NY1GdLdQw6EjN0jE?=
 =?us-ascii?Q?TYMXAASpN24OPEkdiBwkm+6ofuG9UUsOmjpp/Yif7l4EceEZkYAvbTzCwVvx?=
 =?us-ascii?Q?eQ72mnVl3v7UYVIwTAtkOUV+Wci+894cf2iauzJvcV+fnojbb3zvov+BX9YE?=
 =?us-ascii?Q?BGZgQ07mQad3w0jM3fynXmlo34yU8NLVazlcUg+9BaUEBlLAoaSPUuQ2NVtl?=
 =?us-ascii?Q?bkPFa/A5dZ9g0kV4/b5PECTZNkzsBll7iYyRWxiGdcovGcDTOt5m0tcEUFwW?=
 =?us-ascii?Q?L4BlMPg1rXYjXnv+EO5WiQHLRHRHzJUxNH881Jsmoe0o4RCYKAx6PlOdtIwF?=
 =?us-ascii?Q?rIpVH4F0ay6bzsNbXmi49BNbLVid5XHBJbh/hZcFrBXWBGlx6mCwsxYjYVLb?=
 =?us-ascii?Q?XTTeVBWQ2+5Dibte68YCJA2z6NW8fpJlaxSbVKWltz8SLI5Xlhxdri06K+J2?=
 =?us-ascii?Q?e6doFceslyFfdFApmmvY/R04Ew52HFjxWCnRLV5ijSuIALH1Xe30VXd1pILw?=
 =?us-ascii?Q?aWcl/a/UR+/o5QdhJl8Kv5EqSa5E/Gy/EUMGfF3ANOPkIBVW2/Pi9Ar6h21U?=
 =?us-ascii?Q?wbuHY9df1SVeiuoPcCLMa7i+kB1SmP2eF7DKfwdMSLl+8ltTEs7U/3KVQLp9?=
 =?us-ascii?Q?ljwpBiC1LU2uYJWilvNkYt2t/LzsOF4wd66U6Cn2FngAS6S2mPhaWdO+2G0D?=
 =?us-ascii?Q?glPCk/2ElZltwA/B/naAFofSZmB0Z4mpHL7I2bhJTZ0NFgef/20VVd4o8aMC?=
 =?us-ascii?Q?J+JsHkvb5aPAO8wR4yF2wlDgXuh1E596fAuM0pyo1+eU1OOfUPGmt8O/XNff?=
 =?us-ascii?Q?aXAdrIwQd7y8GeoUgaD8igUQRYqbpNYKDywVPmEoi4Zq7+QKHhxXURACdWVD?=
 =?us-ascii?Q?JImA5PCzD6WALDYOQQkOxX2RdKJnlU8LK4M20JO8UnBSsfh+fXu7fpnqmsGV?=
 =?us-ascii?Q?jN+q+yc1BiZUsev5dh+te4LU1syKdI+tMXJ0tWYlC1TZ9ZGq2C21?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91646663-0fb1-410c-8504-08de798d2f20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:22.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tP+vYllAriWEV5CfNanTz+7OCoItPyz0x/RDnguVzEzo324IJjPvzKK15Qg4SElyt5HvhUOM8GVqEm1rSxdolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D6CD11F9519
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
	TAGGED_FROM(0.00)[bounces-17653-lists,linuxppc-dev=lfdr.de];
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

The net/9p networking driver has a handy macro to calculate the
amount of bytes from a given pointer to the end of page. Move it
to mm. The following patches apply it tree-wide.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/mm.h    | 2 ++
 net/9p/trans_virtio.c | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5be3d8a8f806..6d1025c6249a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2793,6 +2793,8 @@ extern void pagefault_out_of_memory(void);
 #define offset_in_page(p)	((unsigned long)(p) & ~PAGE_MASK)
 #define offset_in_folio(folio, p) ((unsigned long)(p) & (folio_size(folio) - 1))
 
+#define rest_of_page(p)		(PAGE_SIZE - offset_in_page(p))
+
 /*
  * Parameter block passed down to zap_pte_range in exceptional cases.
  */
diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index 4cdab7094b27..1ca53209d036 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -87,12 +87,6 @@ struct virtio_chan {
 
 static struct list_head virtio_chan_list;
 
-/* How many bytes left in this page. */
-static unsigned int rest_of_page(void *data)
-{
-	return PAGE_SIZE - offset_in_page(data);
-}
-
 /**
  * p9_virtio_close - reclaim resources of a channel
  * @client: client instance
-- 
2.43.0


