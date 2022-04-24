Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24A50D0BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 11:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmMsj1Mc3z3bfc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 19:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=qH6mRFjt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::71d;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=qH6mRFjt; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmMrw4qhNz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 19:13:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CozK8/clPWLMZaIO4/yTfVZ6kHScPFURN43Th1AK1Zqob+OCfPWKAdgZwy2z+KNJl4SZ9PazrfS7cNd3A2d5FLfMtVeoMU3K8A5s1JaB0iVtq9UrB6LKp1zdPKzy8EIDwJ5NKgsF8BOUiS+H1pTf8mobE1hlnoJAdIJKJN5TT7bf2hvhPd78EM137IUYzTh7fWw4ELBjM7zIVGEVIBf9gjYYFD37xNGBrBBPd54aH/RZBkkOtdfAfNe4HOFc+od4ZAAtfv5HhEip/J3zt52alCPocShKQVjF7L2BC2EbVyD9JWCa2YtVDLhnm9YfZm8N56bIik60BAuY0P/VzlSNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0Jw6wQ09v954f85rh5ejKqdnLDRcsl6IUiWxOMyIts=;
 b=UXIgsBI13mw+JmEzSzW845vxhVHbAETr4YiLfClCPsCr6zDTjbrWmeayaCGpDfM3rUpUh/3K4LK2y6UIt6l7KI4h/gdfQOnvjAJmc9GRKTXNZiAgJoCOB3553G93vr7MZrDWI6tj3JSInzXVJTRppsUSek4GxBBKdC9jXhA3s8aLu9/w10qIzJnN3YTVpNX7dgTqd6kDrhmzouPr2UdqfRKoJOJy1MTPgGNnHwv8aO7ISV4FQGb12Xe/guOEKCCPVrz69RacIXQc4p+1P6blZWSUh5c6C/EP0F+qsvrCxsZsLtds+FRcHD6cof3B59KjSPyt+u3cS4kWGjtM7ogF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Jw6wQ09v954f85rh5ejKqdnLDRcsl6IUiWxOMyIts=;
 b=qH6mRFjtXq8NETcNM42rPGdG8eAWpNj47JPAlk3mZ9YhNvDtGss2iRoL+q9iM4Cf1U5/WNRRe3pD2uNqktuyMcrhMzWwfbn14KjRNk9zdDTiblZxQH8iy9kcBEgVYoXvc6Qa8+vhzgT6OPIIrXufzeY4DO7XXgGCEMrGZHaim1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 KL1PR0601MB3921.apcprd06.prod.outlook.com (2603:1096:820:2d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Sun, 24 Apr
 2022 09:13:28 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.019; Sun, 24 Apr 2022
 09:13:28 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, David Sterba <dsterba@suse.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alex Elder <elder@linaro.org>,
 Wan Jiabing <wanjiabing@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] tty: hvcs: simplify if-if to if-else
Date: Sun, 24 Apr 2022 17:13:08 +0800
Message-Id: <20220424091310.98780-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:202:2::24) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b45571a-fe88-4776-a003-08da25d2b1d9
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3921:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3921F88776D4B9068A1EC688ABF99@KL1PR0601MB3921.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Th1+j0woqa7QHpYr/MDOLHBYzMX8MeSJvJ8wFdXEFhPjfo139LXtJmBIXdE014cX6/Wg7oE4DA7lQ4xoAO0tGTTFG9Y8soLqRLV0NKywf2CsQZcMuWjDdMGfbPiNvxq0EBuJb1NQZoQ0jl/OWQB6bEoc7QZyqteZR/nhS5hugGj3E4Q19od+qJMJIedLp1PlGOA2GwXOCvgIgjblEJH7efvSHbP+yPRxqphz3S+3+UiaO1DS4U8F0/MWcDa4eqktET1yx7zbG5hQxU4JgxPDKKB7KXB+eDEs9Eyak068t8cyTaL2mQxZlduWZibVek+9JUZJLKjk7Cd2iYy9I5pA6GzkFdUyBsqC8iFpPf5khE7fA6hAss2r7pcGVeE7xnUY78xUHGI/RhCU/3UWctRmugEcZSYLQOnc7Cjh2kn3264P+pbquXejGtgLwAnd8iBAlmN4EUrSCQzSJKEK4FarG68VFslUl6Q52mj5Xt+HxkEc5SW8ueT6KaKJo7EBxJ3Ibjypt758uuWimbTTooab5MjBV8SbMJ1J16O8lEHEgUu/Rm5e6yCdkSmTQsA0a7sIhYgvRAeuLi0Ycq3aXIS/UwvLC0YtUHGiCyOT0OUItnamfx3b41LbsY0c44Opjk0IYIA+LnLIIdluCbhR2iM80hcvE069h3/GN9ue7D2dz5uKUEuwCe9LcUCX2sH73sSh8/XfHtqH0uDuFQRsD4/dWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66476007)(66556008)(8676002)(4326008)(38100700002)(316002)(83380400001)(508600001)(86362001)(26005)(6512007)(6506007)(52116002)(6666004)(186003)(110136005)(1076003)(6486002)(2616005)(8936002)(2906002)(4744005)(36756003)(38350700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVhzxgKhvm0aJ9Cz+dQYT5sR5dOshgIF3lUk0vCOiDd5g3S9TdZrlSy+kDw7?=
 =?us-ascii?Q?mzDk0pmNbxHzLXLd+u/8ausYnmjl3B7yhvUdnDfHiv7U+bcGkYvrXg1d+Ln3?=
 =?us-ascii?Q?mqm0sEezs2A+j5KMZZJP/FG4r/CKxEePb+j/2K4Ju2tIj50j041D2lqWZkUR?=
 =?us-ascii?Q?8qbSYTLSgxbGFK9eTBBFitjusg6JqheQgN6zGLUMutvibr4y14HkfjSUJPbo?=
 =?us-ascii?Q?HONGJdoISCnQ8GL5SeOyqxpJj7a1lXreu13cHwWNhhSgVxfjC02AZ41u9cJi?=
 =?us-ascii?Q?nQ9ns4X5cvsnBymKBrhnmjQB4lvyGveloqZtjZqLf79MR54fmbYOprLmlKdq?=
 =?us-ascii?Q?HvDg/Yn2YXEGBMa9tlogZaSVhWV9P69y+rLLHPCpJZGdh/F2ENGss3duDMaI?=
 =?us-ascii?Q?7Q7JrOpUDn5czIZ7AlpO86CcfLHlJbnzCJSgL9tberGjuzxHQQvZQUVG0Z3C?=
 =?us-ascii?Q?Igodc7o+H/GENxnFHHa42wcclrPCwhF2G/gJU7x4mNptCz++PQquZPN51Y7f?=
 =?us-ascii?Q?FHLO6e65vasGHnZgJVWoIx4K98nKxXHy2PKtMyrw6KLG7GJd1aM/gI0Beunu?=
 =?us-ascii?Q?O5M1u9AQ2B+kAEBnGhw1O8z7oAG4FsX1WCGC7H3Mo4oY9QYdwn5/jpj9WdrY?=
 =?us-ascii?Q?tMGeZB1HGlbiJSXHrIjNMy4L/GW2/jXx+oyvMEa4YQRa6WeE/i+nf/bjHTa3?=
 =?us-ascii?Q?r8cRx5XxzLCMU1OYlpAMC7L5/yePlPEs6j5YcqmWp873iYE1DEUg2snT9tgH?=
 =?us-ascii?Q?QByxOfX8mtYeT/KGuLUP1QFwqNs18SLm6e46CAJrsN396B7ccONoYceFkYg1?=
 =?us-ascii?Q?v307Alp8ywhBT+83uz2MM3AYp+fkTcU5Eak7Vh9+V1I9Bd5hA5A+efSkF9dc?=
 =?us-ascii?Q?aDVecWS+c2FcIzrgxJIuev3mBd1DHQ+rhPAtor3KCPtDA2o1taSfRbKREUyC?=
 =?us-ascii?Q?X4aqoIHSpGoFxYe8h0mGjd0ATv7k5C/ixbD84/wBsBG7cEimosKWXhlXUnFw?=
 =?us-ascii?Q?r6WmgXppPSV+lIafotf4OXJSbCe3fxmCZvtuCJhLYxSZnNA5RDpb2CZZrXob?=
 =?us-ascii?Q?PLM7EIxaOpGiQcNuO2gMRmdu0RwrrvfUjVAe3IHJ2p9IKgiEZ1PfapFJUsMB?=
 =?us-ascii?Q?ZOkmgQnyQ4qdb+0aZtt3R7ZWewl3+agqAZ5OMgg/xJURDRgXkgHRghECEogE?=
 =?us-ascii?Q?JgLHKmBxfpK3EEw+cbVJQbX05s57Ft34HQ/btMTWtnJL5Ri1dwSt4GRapo63?=
 =?us-ascii?Q?SD9Lj6CS78djaLBqjd57NpKBp/3rHTP4a/5Eac9uFApGdNkzVo4MSkgzLJy3?=
 =?us-ascii?Q?BfcDY3OObDS0mt6VOeVLTbZl778+RvkNbk9lcZrvw++yFtYRJ2A1d/ZBkpzk?=
 =?us-ascii?Q?39knbuNdUWuUvXxB8GjQT5bROd3ORryqE05/FXJNPn28UFjF1LlJc5VtTCH3?=
 =?us-ascii?Q?/c4HGw8fCprPMDtFZkYg8SkXqr8j8erkFHOGDhUAlG7dWV9IWxpKIoccenW9?=
 =?us-ascii?Q?RDaaOLaaySfhQsW13iFPVYC9AeGE+U1E7Nerleo7ka8R8zNW6vK/Nd2mdh2J?=
 =?us-ascii?Q?LvItA9D34n8WUDepuEPfgHTlOUs6YtEq6PSzII8VBdCufrJ2pYrHta98lhzN?=
 =?us-ascii?Q?t7Ty+l+67/hGYfLNj7+lHWIh3CEwCjaokC8UfAt9PquqZtXa8yyrqo1Sg3sa?=
 =?us-ascii?Q?+Gxmsj7ct3lYtXkJU7uzgtpjB1IhFN6QYaPVN6TW9nGpNxzRRwG6N/W1KqC8?=
 =?us-ascii?Q?B9c1GoFRDQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b45571a-fe88-4776-a003-08da25d2b1d9
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 09:13:28.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt/pZT/I9XKe/I5I46Mpt5+YFq/aOOBz6ij25LfyEucl93ZEllbw5yc2T6UpPatLmODjtFvafUuENtDH2xHfBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3921
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use if and else instead of if(A) and if (!A) and fix a coding style.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/tty/hvc/hvcs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 245da1dfd818..9b7e8246a464 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -581,10 +581,9 @@ static int hvcs_io(struct hvcs_struct *hvcsd)
 
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 	/* This is synch -- FIXME :js: it is not! */
-	if(got)
+	if (got)
 		tty_flip_buffer_push(&hvcsd->port);
-
-	if (!got) {
+	else {
 		/* Do this _after_ the flip_buffer_push */
 		spin_lock_irqsave(&hvcsd->lock, flags);
 		vio_enable_interrupts(hvcsd->vdev);
-- 
2.35.1

