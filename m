Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000F19689D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 19:39:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qSDw30WXzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 05:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.122;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=csm7vdLp; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2122.outbound.protection.outlook.com [40.107.220.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qS462kBNzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 05:31:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNZkBcIdf8ANLqgj6ZHaOCZheq1CaZxHVrDvsqpIKYjlNr2cNZkQSNSUbVh51qAGTCdtQSBIhlCatKDdaCq5Alu7YbAlvDy8qc9IyswaX40hpRprXeElC2Er1QcJ7Kkev+TN2s7BFqnZ7pwTrhN3Qfl+7oVfiFuSRiGU93BQ+0izrzxybVaoXJ0Bhp34fn42InUcHJ/0cg+RGh84cKiWgo6aUfNy5C9xbhu7VjWg2OcKhQ5D/WlZrrtcEB54sf2BnmoHDDCUYEENMVT2g8XxU+wGB3WGEZfMaEozdeADLrUFvp0FcM9YVANU3fKlum7+Cc0wj0VC+DuIyrtixteNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs+qF2BI9iDv7EtsNk+xvJ8nwAQz3ku2FCs4ROFIFxA=;
 b=IhFOvXQgwXpJV8q2oRYZKCWQJQzL8wBk5IZccuHqa1Dq1TDtQBe6ppyLfWvfPUJRjpHSuB9QJEJW7eQJN6FHmnQD0SWraeEm/CxzamyXd5xNva7RIyA7vMWFHPxET/NSAHJscDvjrNKNo88RL4O05hM2/XE2mnIpw4R1fIOd5YGiBLPwWHcHb2L2aMkvHphbb7xu6jI/EfPHd9ggco39B+EiSLAsWMnkZcAYjjz3aDVsoxhUt9liN8J3DRi0DzbgE6SMjBCpWZTvOG7Qj3CsKY/DEzUuQCQ+RAQmHbsBr+5Y8MJlS2iZZnZN37Tx73thzgaETwzDlGGYOBo/Wmvasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs+qF2BI9iDv7EtsNk+xvJ8nwAQz3ku2FCs4ROFIFxA=;
 b=csm7vdLp1JBji91i5zcIzmKmVW/IRzBJ6gZWnYYO1kCbaPia7gbdgBA0KUzCfcywqFgBOpnSOBF5tJ8AGJX3YfRe969HsH1gMiEbtgTPeW6B7tXZBtAYMELhRQf7JwEs/UuWtOMdpTyvKunKAZeoZ/+rqQba79SMNzAnoYqTvgg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
Received: from BYAPR01MB5494.prod.exchangelabs.com (2603:10b6:a03:127::30) by
 BYAPR01MB5205.prod.exchangelabs.com (2603:10b6:a03:7f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Sat, 28 Mar 2020 18:31:42 +0000
Received: from BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::a979:b2e2:fdaf:1ccb]) by BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::a979:b2e2:fdaf:1ccb%6]) with mapi id 15.20.2835.026; Sat, 28 Mar 2020
 18:31:42 +0000
From: Hoan Tran <Hoan@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH v3 4/5] sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Date: Sat, 28 Mar 2020 11:31:21 -0700
Message-Id: <1585420282-25630-5-git-send-email-Hoan@os.amperecomputing.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: CY4PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:903:32::23) To BYAPR01MB5494.prod.exchangelabs.com
 (2603:10b6:a03:127::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from engdev037.mustanglab.us.amcc (4.28.12.214) by
 CY4PR13CA0013.namprd13.prod.outlook.com (2603:10b6:903:32::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.9 via Frontend Transport; Sat, 28 Mar 2020 18:31:39 +0000
X-Mailer: git-send-email 1.8.3.1
X-Originating-IP: [4.28.12.214]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e0326da-4ae9-4278-69d2-08d7d346428d
X-MS-TrafficTypeDiagnostic: BYAPR01MB5205:|BYAPR01MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB52059FC6D1822AE20C7B59F4F1CD0@BYAPR01MB5205.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03569407CC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB5494.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(376002)(396003)(136003)(39840400004)(366004)(346002)(6512007)(7416002)(107886003)(16526019)(6486002)(26005)(81166006)(4326008)(8936002)(2616005)(6666004)(186003)(956004)(8676002)(81156014)(316002)(66476007)(52116002)(6506007)(66946007)(66556008)(86362001)(478600001)(5660300002)(110136005)(2906002)(4744005)(921003)(1121003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2UGQQO9tdZgVTpDI3pnDWHvr9GXmz0lrHP2cEWmbZzWnvVlin+QDrYagowTjDSKk4jZvBg8DSq1S3blvPlFl+DhMy3OnBZM3zkXUAb3AcStMOVgKizkp9EL92DnbVRbbO60/Wb3U8RmH1N4Wx0W8wXcdIpEyFlmRJ7AsZQoMtcvIIp9eXzWfXmtGF5Xe9yRJ3EwrprTCoTt5Vt6TtYwZ5VRPRsHwUuwKhUUNj5TerddoUnvzLCUcimifhzE3nQ7aLIzBiX7bE/JdRfDDtt23jozVERKoNVEaY18swcyubErtB38/FwgTPaQ04vI/hyupAm5M65L0goN/ZsbHYfplH+sU/4GxoEC5M42u5WTwNX8Cu6f4hgXHOxPx1UkQ7bLEuWee18KgR9Vh5p7qaCpom06+5LoQ68EAeeLxaUlYWR5GKYeyKgKljEnBHZVNr95+iQRr6D0X/ZZdQ//5RqjFMmZcUdn+Z634m5R+5wZ1p/TKDDhfiqp3GXIVuZrK2KO
X-MS-Exchange-AntiSpam-MessageData: +mcBdxjrnsxe73T0GZC5fYKu/MYEPNLXY4wTcxk8fL790XAZnkXbrzWOSB6QiWN4kBDq8NDFFzLUgCb2q5Lj+f/BVa5TovymSitRUW37w0iPpuugF7lPxIbJQ4hhXF4tj38WRMIhlhldbPvN1uDxdg==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0326da-4ae9-4278-69d2-08d7d346428d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2020 18:31:41.7547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrxO3JmCHEWoXgyfsh9QePBds01N/TOnOhu48rvs8bFP2Ctwl7XD79D3BFG+J7rdwofJI1Pv2TT6pu4ou5pBQph5QjRz2/vQHAuoJL4LWvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5205
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, lho@amperecomputing.com,
 mmorana@amperecomputing.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove CONFIG_NODES_SPAN_OTHER_NODES as it's enabled
by default with NUMA.

Signed-off-by: Hoan Tran <Hoan@os.amperecomputing.com>
---
 arch/sparc/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index eb24cb1..6fc615e 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -292,15 +292,6 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
-# Some NUMA nodes have memory ranges that span
-# other nodes.  Even though a pfn is valid and
-# between a node's start and end pfns, it may not
-# reside on that node.  See memmap_init_zone()
-# for details.
-config NODES_SPAN_OTHER_NODES
-	def_bool y
-	depends on NEED_MULTIPLE_NODES
-
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y if SPARC64
 	select SPARSEMEM_VMEMMAP_ENABLE
-- 
1.8.3.1

