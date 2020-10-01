Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9016A280492
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 19:07:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2KLr6MRGzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 03:07:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.94.40;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=DJHuAXiR; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2KJy09fbzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 03:06:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJEPFheskFjuSCC9kXtw/NGDb155n4KqaPx2+Uh0PRSiw3cNp+UVZkOdXd7ls/FPU1y/XGFfR06J1mSCFOX6Mj/Ved2oMOBjmFB8O75wCt2IGNRjCJfnN84FL/VA8gP7DVVvROOaY3SM9xiZYx1JVMlM8Gd+vhJNZhWaf+BaiwPJHkucCuspgRLn7SdMom988VawiXR5j0g7/WMPliOhpTBbfcqkLYw+K19+Xs8yBd4lVi8yg8UAB1mf0T75zRHYemH83uaqerHDYWbGrc6jYuyFuRM+9QMRlykN5cgG++4A7WW3BNPbEVjj5q5ZuaL6irOGG5I9VXGGiO1OtLvMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17/z3nqeT9R1RBpePT/obQi9DayyCzIi6xeksZXprbI=;
 b=cIJU5XaNqjNYDpWiwdAG8JnCQMLLgrIERHp4EtShGTGMKgA8Gt44PMY4B+h3jhsrcoKLm/3HyWpt9hlSJSxZyyjbe21F3YUqOP1SjCzP4QlJkwrEFaYjr9TrqQ/nh2elqhoWoVDJBAXiN6UzzZnq/r5n4Y404BL+VJ7/CyHa71oyQQgr8vyIB76/vuGJISfMXbnw4fWWpP1I+NfLK009RXYQCFerwqHLKqc9R3VsJ6Hvd4Qe9BTCn7nT1K+cxFYgAF+ORiqqDhDCMovypLi8vJF0lCDmPtJaR5zLUIi3WYOwhrYx622/SjCKAhTt3IafSHrNLd9ALRztZMFxnBfOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.191) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=infinera.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=infinera.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17/z3nqeT9R1RBpePT/obQi9DayyCzIi6xeksZXprbI=;
 b=DJHuAXiR2fTDfxJViKsRcQY9IgMnSjpS+IN9BnE/u//JSOHfM6pijclqRdOJOQcUkBz5xWRPUgeV4myLItYEYmyQncAL09ym67xWqDjk3Udb7KLV7lE+JKpFM8x3sIsZwOp66f85RkpjX9wgn/C+BWDveXlCLB/myeFkl78P/dQ=
Received: from BN6PR08CA0083.namprd08.prod.outlook.com (2603:10b6:404:b6::21)
 by BYAPR10MB2951.namprd10.prod.outlook.com (2603:10b6:a03:84::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Thu, 1 Oct
 2020 17:06:02 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:b6:cafe::9d) by BN6PR08CA0083.outlook.office365.com
 (2603:10b6:404:b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Thu, 1 Oct 2020 17:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.191)
 smtp.mailfrom=infinera.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=pass action=none
 header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.191 as permitted sender) receiver=protection.outlook.com; 
 client-ip=8.4.225.191; helo=owa.infinera.com;
Received: from owa.infinera.com (8.4.225.191) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3433.35 via Frontend Transport; Thu, 1 Oct 2020 17:06:01 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 1 Oct 2020 10:06:00 -0700
Received: from sv-smtp-prod2.infinera.com (10.100.98.82) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Thu, 1 Oct 2020 10:06:00 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by
 sv-smtp-prod2.infinera.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 1 Oct 2020 10:06:00 -0700
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com
 [10.210.71.2])
 by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 9F9522BB17A5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 19:05:59 +0200 (CEST)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
 id 9979FE54C; Thu,  1 Oct 2020 19:05:59 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Send SIGBUS from machine_check
Date: Thu, 1 Oct 2020 19:05:57 +0200
Message-ID: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Oct 2020 17:06:00.0607 (UTC)
 FILETIME=[232FAAF0:01D69815]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c0b8736-2979-4ba2-7992-08d8662c4661
X-MS-TrafficTypeDiagnostic: BYAPR10MB2951:
X-Microsoft-Antispam-PRVS: <BYAPR10MB2951C910AB374CC599404095F4300@BYAPR10MB2951.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nfj8Aw58tgM7eYbCjF6wcKEX6ueuHTH5IaSRxsM8Fgn3Fyo0/u7WG9qIBtNTFxn+eTNs13txiCAbwx5d4KlR0Rx/b136dQBqq1ER2UvgY+1ECwZ3LBSzg3/xJ9qOzkQI2aP84fFyp5WGoxFJ4l4jss+mIXDPweoJmgmzbxwdj2uDyHmW9dYhZo/5g3eea7TplaaOgvzH9fnGd+44GE+CReloZICJQnCH3sBDcx1HwqBEG2ru/fVWVf/DFd6fKqC9xe+LX044Z8cUHCEYveCQrUHR7F3Sb2z5Ib+IWQSt5XB4MAXA9yUxtfUYFqL3gjlX0nV35aVSPwMaWEQFNBK4sGcKjr7M/5wiAqF4Oix4V4oYm5ztLJZOgk14yn9H26qzC26Jxgz0xOHdyrXuoOCPJw==
X-Forefront-Antispam-Report: CIP:8.4.225.191; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:owa.infinera.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(186003)(336012)(86362001)(70586007)(70206006)(82310400003)(36756003)(5660300002)(81166007)(356005)(107886003)(6266002)(8936002)(42186006)(44832011)(82740400003)(478600001)(2616005)(316002)(1076003)(36906005)(426003)(8676002)(2906002)(47076004)(4326008)(6916009)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 17:06:01.6813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0b8736-2979-4ba2-7992-08d8662c4661
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77; Ip=[8.4.225.191];
 Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2951
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Embedded PPC CPU should send SIGBUS to user space when applicable.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 arch/powerpc/kernel/traps.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 0381242920d9..12715d24141c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -621,6 +621,11 @@ int machine_check_e500mc(struct pt_regs *regs)
 		       reason & MCSR_MEA ? "Effective" : "Physical", addr);
 	}
 
+	if ((user_mode(regs))) {
+		_exception(SIGBUS, regs, reason, regs->nip);
+		recoverable = 1;
+	}
+
 silent_out:
 	mtspr(SPRN_MCSR, mcsr);
 	return mfspr(SPRN_MCSR) == 0 && recoverable;
@@ -665,6 +670,10 @@ int machine_check_e500(struct pt_regs *regs)
 	if (reason & MCSR_BUS_RPERR)
 		printk("Bus - Read Parity Error\n");
 
+	if ((user_mode(regs))) {
+		_exception(SIGBUS, regs, reason, regs->nip);
+		return 1;
+	}
 	return 0;
 }
 
@@ -695,6 +704,10 @@ int machine_check_e200(struct pt_regs *regs)
 	if (reason & MCSR_BUS_WRERR)
 		printk("Bus - Write Bus Error on buffered store or cache line push\n");
 
+	if ((user_mode(regs))) {
+		_exception(SIGBUS, regs, reason, regs->nip);
+		return 1;
+	}
 	return 0;
 }
 #elif defined(CONFIG_PPC32)
@@ -731,6 +744,10 @@ int machine_check_generic(struct pt_regs *regs)
 	default:
 		printk("Unknown values in msr\n");
 	}
+	if ((user_mode(regs))) {
+		_exception(SIGBUS, regs, reason, regs->nip);
+		return 1;
+	}
 	return 0;
 }
 #endif /* everything else */
-- 
2.26.2

