Return-Path: <linuxppc-dev+bounces-17652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIt2Ic2Kp2nliAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1351F9500
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 02:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQZmY5d51z3cJy;
	Wed, 04 Mar 2026 12:27:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772587677;
	cv=pass; b=os5PM8PPtjAO6zs63woq6mcNNmiW2OPqhWWVe+qZesu3Yi/Xf0Xu3vUgH7PyuMv7CyLkdVYjklBxvQzp9h/JAq0SXqonMDP40jeR5bIR5Lz8LgNuTKNwIXQ/7wwWmFKUexIxhomwcdCOUzz1Fq/A1or5FD6mWVCwkctT3Byt23YtO2Zch7p0BAU2ofIhdRV9zErV0rPwIVeJWzGCTMeQPIzBv8cToQKvOBU4tCL4d+7ac6r19RBr8qbh/mH0zYCESGKAR+Y/hIpYCeJnrbMghhn/5O4Ehd4ukNpELppNgZCAuIbDIoit4P62MiTl3CDqf0Dt37Ks1DN5T9DanVBwIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772587677; c=relaxed/relaxed;
	bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j/LdoCOvObp/6kRf/gNHFXbhSaM4cm7YCk/Wpna7tC9fcQnfyilRKeu5hRhpi+wvgPg1v/vIAGEBrE+3xsjIsRGjFKzPTtPM+Z0aHKP8I6ApZeZjpF4TRppZrA2ECOWJ06epvbuvqX69SgM6tUpFSwvpoKnL1NaW61Z+LE4RK5pt2by69Ij02TZkUIaPeQDjGMEsNvIX9LOAaCO9tNCuelLSlYuBCVzH+Gj9MaIJfnNW/cLy79PR/Sslssit4wohKPnnpncN4bxHakoXBLIGvtiLB3ldvuyy8GK9LfHHmyy2y31COqpapojPD1PkxuM5lpc+huSdyqf9Ds2J5bbcfQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=maidt9YU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=maidt9YU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQZmY0plmz3cHS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 12:27:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7IyXyBnfC59bhh/QDlC4xjm8gnxI/aVjCQ8NWjD+TQ/phVsvcvuW+NLBwz88oegj1uUlu3Eo3WVXfBEPFYLVctAff3OGVKs6Xv8Wggf01j3o0MSOeSxHA5GJqJjudqqXN/2oDkFpLWG7rNbgythWaGJW701F+WT+MDBwzxmlu9SXw/oaP0PeGTAWeV9kaOO841TnqajI5htVvdPBVcphxbO0+fCcLLs3ACa6zPrI8LdN0/pSUTyF6rkpr0iKAmaNhVLW3qunh4s7ITlNquQXbSIEekdoDCyuvRtVfUJe+oVe99SGOdiQIwubQe36N7K0Itb8+4Q5Sa+OhGYRxeCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=;
 b=w+esDmCCph9thTxJi6D9QEtzrUzS5rQDHMVxzz6TS7qPP7AfnGlXihVXA05VntXiv4B6vEmeBEDvccO27e4Ko2dC7bs65ACkzY3wPreezzZgngCi9P8sE/duNHHHgFmmJN9NBZsU0Us9uaLpK0fJZ3mT/4xh4/TBtjrO2R3aQOUNEn7ml8MMFvfkHLLP3AVkyhgcLytd9ojZ31UtxREx6DQU0dataSsAq3aoeyhGOxQFcMtKumoym/0xXP8VzElidNH1V2VsQqfhnizX85t/USGwEFg+FsJhWpfu+cj7+GVZy9VnGvbC3Ym8VvzmSwj3kSb6OPoRbdlrpNeO3pp4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=;
 b=maidt9YUEg9SE1s2e15IkLkTmsj5XGLJ0eWvmZLG17QCRfvRHNiGN9W3S5yzM2gLA3ZwjtK0HMjZkNSiN9sN7bTS9l2uk3KeXEbIqBn3LZ9aPcH2V7tMnIv7aSCbInGtrtlF2wl2hQtVVFRA0iLD8deJv7DgLNRD88+Qtd+yFA1TrYXYHfU+Y/QQCMYfQ8QTzb+CCv4rUUsIG1ZLmGNhWtC5E+8P0TBA208y90uayInBW54MyAATkCPSzlbHYLLHap/J/tssthm9awMpbHFDACRlatTjRTT4e7jAMrCvGEqGDgfcCtwSioUqVWfEw6oStZDZTh77KMsRBqjrVmO03A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:38 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:38 +0000
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
Subject: [PATCH 8/8] arch: use rest_of_page() macro where appropriate
Date: Tue,  3 Mar 2026 20:27:16 -0500
Message-ID: <20260304012717.201797-9-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:408:ec::26) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 2609bae3-d7b5-4d6c-cdad-08de798d38be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	xtr88SI7Q4AcFK/iCkO/xPPWk0+R3vDrTpAEkNkbZ8qomfK3bAqE3XXgk3WCNroUewaQ35DD4OpAJK1mIhUjhWYvBFTqoeATTFnLAmqOp15cQE84BTc+8CnbiKwRE0wOPvR4+P9wrFVo6jX1SM5uRem1u/Gq0/uFWMPPtwK4pVRqQ6TaZagPbb9tU2AbyJI96CdJV+D/9u2lDuLkmio5k8PimILuLSWNRKkjzizNdjFIBx5FcpjDsKEPd36qCC8fgQ8K5WsoA4hd5dyEORYzDfvI2oH/zoDgA0hctTSJSGry0uzr+8AI9tV8nUZjlMsrDCf2UMGeEBPxCmE01gt5eH7odkBaAXu3EvlsN6LtmIu5GU5fD4aHKyOhJRiFYkfo3RM9lHPrff6Rd/B1e0mihJxDWgodSpZDp2Bpzx+5nG3mrD3EQJBDgDvfDixNyRZ+D2aSppWErIY/rwuO20KAcDloK2pH91Uj1qnwopT2ICDEqyTmNOvm+Gnr6DBGgKdRRa6zeWiOM/aYM9V6u0Pp7f4YTFLa/5PvZfCBhkWFIQy0buCigXXjKYExH4rTtmmMH+bAOCnV8nCxPP4RNKGZRMZGwhL9BYG4V4IVzgQ/aZ3+XTJFWe/5uwHcrp5qPa1zQTsFD/7c32RWrSRS12+/v+bw81rbNRTnOAvEZy5XDi1Eenxd3W6HyH5I09MHMhmlW1TOC/u2untYVG3C00LNI6+bNraN5Rg/0lUN9gfUQLS/TQXgz9Ud6SR48QdzfL6/4dmZN94g9vM+nkmTSClPgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZT52MDM+eEm2ajfhuGGg1je2uDA86dzD5RM7cWtaSUcZsmLo3p4LUo+VZgH?=
 =?us-ascii?Q?CcFY4fZq73cONvgI/up9p5BMyftLSMlvV00Vm3N2XA2UaJorXSvVHlN6e9rG?=
 =?us-ascii?Q?+BS2M5jomKURFg3P4QGjVyE9mdjFeF/n4cBQznI+N8UtjPZtlqzw/pXI8KHJ?=
 =?us-ascii?Q?Jx8Li/Gt32NxfUzyb0Re2KRK2EpLasBGScpnd5rc93/stq2s6BEU/S9JEtQK?=
 =?us-ascii?Q?0J2Ig3D27nnZt1DlT36YFV/Z+bGIN1t7oc+eMYIJpkmGuytatGb6NtHeW9Qc?=
 =?us-ascii?Q?otPJ6O82PeDiCAbVWKAIGs3yRNs/jU7k0xlBn6jLHxH7TFNKFK5kVghg523j?=
 =?us-ascii?Q?oX4r5I9M2ZnolMGZb1AZcCOyJZe+YZOBWqTA8i6z72KvugdAVo9VtSpTTxLS?=
 =?us-ascii?Q?BiAlthrnV8VTo2+a4EracIh+n+0e5ma3dxFtYhg41j2oJp5krPwgvyFpYE1q?=
 =?us-ascii?Q?gMgzWOMwd+/EjN7Jmg97D8iRFNCImOLvjk/FwATm86gkRu7Fpj/L2qJLcp8f?=
 =?us-ascii?Q?9OirouLpKCmoGuAycTa4DutOGkyJXTl0yb5aiFywqakzGWYOCiK8p8fOjzVw?=
 =?us-ascii?Q?iJmYDNPuAuXYA6ifAnDtnyXjSYpku7Vd4oCULY+YgrnR+mD8jN8oUbTsfxDJ?=
 =?us-ascii?Q?70dcbbGaemRAcZ3oDRNwmkIIMM3OmgbkVbyPt0V4HT8ZIOCAN8xFEF4p6cGO?=
 =?us-ascii?Q?eW9Ix7e20XVgZMGLl7Rf4bR0GJbrbrvHzK5p6O8K530TWx2RmTkMKKovm9d6?=
 =?us-ascii?Q?hRiCXlxG9Mwxk8xdLTLIgXKCd2DteHO+ouNXq8Vy/6bTe2q9lFY/nozPKuSj?=
 =?us-ascii?Q?3XiTDROtScMtG+K/Sx8p0yHfEDmN8m4+AcFQDS5z0pUFiNGUNxzyWTdSlqXp?=
 =?us-ascii?Q?NCH3PO6j9oS5Rz6N9b7La609E0iQ+8jqEkej5ry+SuPdbJtjfWcZsxcpbA2l?=
 =?us-ascii?Q?PKq1KNKu5R4L67Dt5dzmNkYIj1t5aezZMVNdaTUYopF69DGNpu6XCnMIdzmx?=
 =?us-ascii?Q?YuclF7I1XJRth9WYwy50lhD7wU0Yx7UkWn0srKPJcBh6COcsxslET61mBVZY?=
 =?us-ascii?Q?hiRG2fLtJQw5l3Y7iLDndQBLijJWAeuWbrOFhTMeYQiOJsLuZD34AcS4n6I9?=
 =?us-ascii?Q?CSKMBYHwj3GQ1sjrBRQcLTs5r/rAu524+LplcySqtzj31wxZWNEsSGDhkhWq?=
 =?us-ascii?Q?gUHEJGESGgSe7ricmXWRJu/bL0g555G+7khTbaBSErtMHZO8cp4BPDMjlF8Y?=
 =?us-ascii?Q?AJh3p8vJq0AxIeaJW7+CEweIQWdGYANN2l/oBAA/seklaYQhht7LMXx47aEv?=
 =?us-ascii?Q?fe7x/gjpSQ6qh0sxrjjga5a2bxc/M1BYS1G0gpwCM7jIEl3r3Woh6Np/SssN?=
 =?us-ascii?Q?0bRjcJjYMdGY8VfCjp2wtkZgxg75kLzeHKTUkw1jiUTz+zJxIFneVF9ZOBS5?=
 =?us-ascii?Q?TZdcNGY9VNNZdRgyvbi61Lu/TOCIf+vn3O9hJ4SQzqE+XF2Fyvbf4qvfYGAj?=
 =?us-ascii?Q?TC+KI43yWW7FPkdnVxH0fYofJDaG+Z7428TtImGS7j10tIa2cscZjOsPhgHW?=
 =?us-ascii?Q?7r7El9t92QBbstiWTNULLaGH0t1N2FN8XcT0xQ8t4xk5O7IeK/48IZ6YiYqg?=
 =?us-ascii?Q?Nb04R/5oI4l0W1ht89mqdstkVexYsc2UQ1BQEX0A1uDg7sXC0xuBvZQ4yOKh?=
 =?us-ascii?Q?5ceyzxrZLiFnpOfqTHF2HzrtUnQDhu2Xj+OZwNZcxC1k777PWjJy30XAifgM?=
 =?us-ascii?Q?XXCFrLmaSRas1lUilO2bKMt1CtRSz/X7urTZvi79BSv9E/gD9ePe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2609bae3-d7b5-4d6c-cdad-08de798d38be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:38.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXt8e378FJ0B3MzdzzWaWK9oK5KIDe3bPOTtrn+uSqUA2hwKB8rT9SRgsjZlbcdaW7oWw1Rhh0hszU/hvHkVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DB1351F9500
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
	TAGGED_FROM(0.00)[bounces-17652-lists,linuxppc-dev=lfdr.de];
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

Switch arch code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/arm64/kernel/patching.c     | 4 +---
 arch/powerpc/lib/code-patching.c | 6 +++---
 arch/riscv/kernel/sbi.c          | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3ee..4c3a4401719b 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -116,9 +116,7 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 
 	while (patched < len) {
 		ptr = addr + patched;
-		size = min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
-			     len - patched);
-
+		size = min_t(size_t, rest_of_page(ptr), len - patched);
 		waddr = patch_map(ptr, FIX_TEXT_POKE0);
 		func(waddr, src, patched, size);
 		patch_unmap(FIX_TEXT_POKE0);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f84e0337cc02..186a9cb79ee3 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -463,7 +463,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -514,7 +514,7 @@ static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -554,7 +554,7 @@ int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 		size_t plen;
 		int err;
 
-		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
+		plen = min_t(size_t, rest_of_page(addr), len);
 
 		local_irq_save(flags);
 		if (mm_patch_enabled())
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..9a2f656f776f 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -602,7 +602,7 @@ int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
@@ -631,7 +631,7 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
-- 
2.43.0


