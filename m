Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E854F30FDA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 21:03:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWqHl1TWjzDx0r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 07:03:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=live.com (client-ip=40.92.253.59;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mayanksuman@live.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=qMyK/Gv4; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253059.outbound.protection.outlook.com [40.92.253.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWmxC70nkzDwtg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 05:17:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSFx0bS2/wX1SHWBnUE8Jpi13vIpN9Gf+/AAt7mJx8HAuHhrWgQ2K3aDmGRwC0x3IJ0CZteIzqQAFJxUkPeFStpWSHn3BbgIUCNCy1oI/XEkhijeZvWiwR81Bc/xPA0/MObXzJQqZTcO1wq6SN9OMprb94Zp+be/X/Nwu54JF1/cg8uyMJz5WkBqSGN3F8VLdlsh9wEeKWTE2tz1oc+s+LP847wWHyOIzi/UGFntDxF3JH0tlvsIjD2570oi6HzV0ywYu6aNibykefkxskmw6eGocXBlqYwVE75HDassm0v6YxEixbbt7IMDBX5Y89zYJghS4ENiGqYr89wNJz+7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlYsMWXWF+KXz/FIg6j2qXaxFe4kC57zApJSPPxG0aY=;
 b=Z76Sgzua+wiqh6iLbR2Y5sXCASHIDz/+Pib6YUi2WiI5rqZ4j5U9Fp3l6DFj5MvoDm2+y4maQm6HReGr3t+rQN9fT+10+e9GvV3/aXzHioxfWbEEMHj+NAgeK+w9dQEZ29XaW5ZuSJpo/4bEtol3isgCCettChRbEBu+GUrBp8Bo+IvQ/hk9xBAGhcFYpoxUakkUCDWabs9+8l8KGsRuiH3G0WpcW1P6pALqsO5UH7yW40b7Qm+W+OUCtFNEzsYgJEdftULlqPpaq1RG73890IiUmNQvMkrvPfXd8N64hPw7kMSnZT2F+JN1Ol5mP1Mzr+2VMo8zPOZqO4UiHPIH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlYsMWXWF+KXz/FIg6j2qXaxFe4kC57zApJSPPxG0aY=;
 b=qMyK/Gv4KINHcUm+q4LmzqZ3vN63wNWoGbBG6MGnxHiJB/C1CQpSUb82PpapqRu7zXcL9b8hBKrbMxFq2rJkQlEwBJKJfdi9j4iLYK0R7WM87IJYk10E4tXABI/uqG/jS0xTdYUKo40QGu+EQaB4m6mjzYMJj88tWBTSuB2OTNt2xFTPC87FcmCPRyNCAIwP6vrc8GLSWYdBx9J35aGzFARhYOL3JLqPdW0g524gtfFsPxmIUMyfrzjUkX94eTWpy6DkD2IrgCPdJsVQ7xSBtOCNTwgMwtK9fBja0nzVdg0RxiLGTd8bN8Ii35pDadvT+YjdYvnTq3/XXrUthMIOtA==
Received: from HK2APC01FT048.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::47) by
 HK2APC01HT153.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::468)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 4 Feb
 2021 18:17:27 +0000
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::53) by HK2APC01FT048.mail.protection.outlook.com
 (2a01:111:e400:7ebc::456) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 4 Feb 2021 18:17:27 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8CB2F55384BD21EEA04F41EE72D1D29426A6C1CD0BE3FA5D7FD2BC0CD48A952C;
 UpperCasedChecksum:6054BF7ADE1E1C06637334551DD0E75CA799F85326622B6D661EC613D54CA32C;
 SizeAsReceived:7465; Count:45
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297]) by PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297%3]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 18:17:26 +0000
From: Mayank Suman <mayanksuman@live.com>
To: ruscur@russell.cc, oohall@gmail.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arch:powerpc simple_write_to_buffer return check
Date: Thu,  4 Feb 2021 23:46:19 +0530
Message-ID: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [sz0/pP+HJz3bSQLnDnIBTmKeRFbFDrxn/z2WqLxnna0=]
X-ClientProxiedBy: BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::15) To PS1PR04MB2934.apcprd04.prod.outlook.com
 (2603:1096:803:3e::21)
X-Microsoft-Original-Message-ID: <20210204181618.1123522-1-mayanksuman@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.127.101.171) by
 BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 18:17:23 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6d5bf29e-4fa6-4257-6a65-08d8c9391ffb
X-MS-Exchange-SLBlob-MailProps: NS9Gj58uCj1me8yJ5sSHKRjxNogQRwJMRwHwgD8E8ny6/MSlvU8mjfGRo2I3sVr3jUheImFF/O2JgsRDDZmEi9h707sO0kQCMBc5x1Nh8Z7AentdZW6wC8anZs1IiVfOSWYbkdRViEFSzDrUZ0UvoRCcKEz3xjif6ysVUmX9vz6vanffttQy2XpzWj4h8RH7wy9Wxoiu34o2QIb4VklLTsCUQmD6lSvR3+xGO81LF117/TEtQPvEgszfl6a1Nys8m+18Rw5/Gk4Ggju6Aefs0aY6xOSQUzCuUfko8fGncLaWA2POoy5OYQVLPv+W0+r1PZaYqhwUlJ3Pbqeq2JB/CPS2ZkO+ATLZWutmqLXYAgVBtXTRc15uUHSCp8G5mLZPJyJv3KwucbljuDWjpjb8fUAFa8Qro1utUWeyB8CixYQkciJQo0jWnLqQ2VExswHIt/Po2IPYVpvZ244mdT5SAkvy1lInR0WcSaDbw5/Cb3NXcnd87TZbjA0M0zK/rfGdn3S+pKJt3LiwbiDSZ4GdHruWTAPqML1+d1sgKH1hk0GGgDBbt1WpML/SRlcvoNN+jkkdeM+cueq+tji4okdHfYdY1F0bZEz9DbAnUxqTxGwVcbfmEmLAUKQ90NDAXYj04YJw3h6QbyKzHKxObYEUP/jVVnIcYHM8EJsJjd+CDm0fC+NgKwqvTqsJIarljcx/W0QVOFyBzTj6wDcXIGq+QA==
X-MS-TrafficTypeDiagnostic: HK2APC01HT153:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LkhaMl+kJUsXNgFRds+0P8tkAm4sM1/e/v1re1vVkhQedzVZ6j7zTmuYnN992Duk9XKBzMPBEIzZGpc5S/5s0FbIZVUeCdEZ3arPANBwB7BiFvuKWq8cBDYcmLTwTyJD3k4yOieh7FThP7jgbb7Uh4Xgev/UgWFlH+XMAgjs+LYin4kjx+H+P1wxWNDGqwHIdlHZ+4v9DhQd0R6ZgdjdXF0Kb9GzaeLYklZkT+2sD0Rm+f1idoYgsUbvxKgras58w0BTyXLDhHeJglntMQWz0PIG1I960X/71B83Zg8yAVbQ+2FDh/zAbT0QOfKgvw5l/h/9QmLT1NxFZZ8RrV8mvpnpqnjijcdSFHzg0cgEgdaMUXhZHg0Ew6HruXT6SD+ajKiAJKcgEFYCrclQIC5DA==
X-MS-Exchange-AntiSpam-MessageData: 7wDfaMnfXNQmnZ5Gf3LUs0LvHYWIl3uDVvnRGRDOu4GK9qOvlNyBuCU9Bl1IdtEGBfPVXunj872SmLKyHnRwT5JYuxPOQMq+YuScJAH9KwudcnKgHUMueXDuz+GoXnfYz4bpemIAcs+xtwZTfmPDiA==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5bf29e-4fa6-4257-6a65-08d8c9391ffb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 18:17:26.5199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT153
X-Mailman-Approved-At: Fri, 05 Feb 2021 07:02:38 +1100
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
Cc: Mayank Suman <mayanksuman@live.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Mayank Suman <mayanksuman@live.com>
---
 arch/powerpc/kernel/eeh.c                    | 8 ++++----
 arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 813713c9120c..2dbe1558a71f 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1628,8 +1628,8 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 	char buf[20];
 	int ret;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
-	if (!ret)
+	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
+	if (ret <= 0)
 		return -EFAULT;
 
 	/*
@@ -1696,7 +1696,7 @@ static ssize_t eeh_dev_check_write(struct file *filp,
 
 	memset(buf, 0, sizeof(buf));
 	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
-	if (!ret)
+	if (ret <= 0)
 		return -EFAULT;
 
 	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
@@ -1836,7 +1836,7 @@ static ssize_t eeh_dev_break_write(struct file *filp,
 
 	memset(buf, 0, sizeof(buf));
 	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
-	if (!ret)
+	if (ret <= 0)
 		return -EFAULT;
 
 	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 89e22c460ebf..36ed2b8f7375 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -76,8 +76,8 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 		return -ENXIO;
 
 	/* Copy over argument buffer */
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
-	if (!ret)
+	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
+	if (ret <= 0)
 		return -EFAULT;
 
 	/* Retrieve parameters */
-- 
2.30.0

