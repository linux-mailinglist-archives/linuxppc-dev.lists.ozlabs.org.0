Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45C50F1E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 09:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnY3J4fKwz2yph
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 17:11:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=pi2Wz4C0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feae::724;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=pi2Wz4C0; dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnY2X6YSkz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 17:11:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8iV42Pmg9r5PRH+WrPJDbtOc/nofreJjzEIdzYdJO1QSWcTjCPs6/Cdv48IclXsOJbroWVIS5msYfctUNjPOpQRxFM6s0Oop817SKjW9ZQejWLltfYRFKs7oZre8LQFLgVGcr5Asq7DxlSNBeoVOqi0vpOONZtyGfKvJ3tn6Fj1LOOwWlpmOIhRmWARR+wq+Wm1rwdNZ3e+meo63dUyrsz/s7umvVPYD0nfSLtaBfkNAIci6vvR7pBIWhSWFcpQtaDaCMjdp4i/NdrHRFLlYnzxAB2T1zLUkaMoVZQ2PmzDgVTcDEYKkDnPXF4+15zyxcyQ/YS1QDt72XdUhhGm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp65PRQE267iMfi7EDA01FxloPtoP5FBLM9GC4orIUs=;
 b=P9nZzZWARu9d/+Ane7p1G5HRol1TQiscdvoT/DoMwizZmPSr4h+P3xHolq6AGvHHlXpkQ+YFURCCgM0+5JSC64JksBP1suoTcO6+ocraaB2VIJTSn506f60RdrFheBUv1443nmgtmq7mFn3C3JjxR3iK1k/9FBLLaexaaadAGOU5ykjEKzKh67NjeYL7+WoNftAD+oPf/xu02QssGNkduu9x9P34VI4G7UhlMSHcHzsx9bwLN/fm61mMq2PeHSmczYx2th07ZsZVyMNlHANsOEpjGaC3N4eqv2IIJDunGMHu2txtDdugF35bZsJ29HfdoHge8f83w+6HgeozJB+18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp65PRQE267iMfi7EDA01FxloPtoP5FBLM9GC4orIUs=;
 b=pi2Wz4C0FkRTtQVu7nA5JSW2i9QrjMeC55u61b9Ksx65kHYbkTXUfOW8VXDE6PB7WGFJkxzGUgzQMsrnjWG2VP1zIkCBv4pWuPQFvPv6VIdAh8AookyKdedb1ldW4TVDGA7QOfzxxYvb5d4Qwe874jYLl9QB2GTuYrL9gWOV7fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PS2PR06MB3477.apcprd06.prod.outlook.com (2603:1096:300:6b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Tue, 26 Apr 2022 07:10:52 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:10:52 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] tty/hvc_opal: simplify if-if to if-else
Date: Tue, 26 Apr 2022 15:10:41 +0800
Message-Id: <20220426071041.168282-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0193.apcprd02.prod.outlook.com
 (2603:1096:201:21::29) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e7db3e-70d2-4021-a09b-08da2753e5cf
X-MS-TrafficTypeDiagnostic: PS2PR06MB3477:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB347746B94AD620192426C0ACABFB9@PS2PR06MB3477.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCqt8K5P7yDW1CFUhGTfskPVaRvp7DzCN3Um9PsSJk3ZmeSkrpKg75yNvceBqJj9YpaUZZkRFAEKyAO+EJKHtyGazs2A2D5phoVKgUHzGEMIVS6o1jpf/gW6TTTRKrfap3yPbJcVHHXK/6DbCdjV8nxupn1AsQIwIszSAQ4DER5XTpA52yOD3r1D2HZnLkUkQeZR6hX3CLpSpKEf67p9h/NtmRqo0fzoosxyLxzsOl3cYOTAgxzpA5I2TU30MDzHJnceGPju6wqG9nsltBUHyrYUqAuT9nx/y6juTzV2l8R2YYnqpDgQ6b8T+bOLkub90jh1+gPzXeCPjSufmjp+MiKbQlJGm7PITha9R6n75YL3MdfuVVUELELc3BuVlqVgicszFOAjWUoQHdAnBW2yPQhU6jnkDjPZFT5SgSdl3JiikiBPXMHsOmyJn0Lb2KiWDhgYjRvZRRe/JHZ/YFEsrmPRIFC6zj1JBPTnxxubLic+5i6N+GZtKMR4h0UQ9348ZBIBKk1cyUpmlAIAcvfraxespNjUakfw8a7oE/i5nR8JNLxFHaE8doztDj1BkX5gzoPFegPU/kT8J771EcN8vis4Gf8pQ+q7MGwReRiDtuRVfsQADHP8uL7GsIsuuLx1C0wy1zjDDHjH6eX1+I5Oe2kNrnZwEjfiQCMgX8asGc+C2hSxz32SNXLoLLWJjABxFI6uezw5cx1XIe3mBd/VuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(316002)(36756003)(8936002)(66476007)(8676002)(1076003)(66556008)(110136005)(107886003)(186003)(5660300002)(6512007)(4744005)(38100700002)(38350700002)(86362001)(4326008)(2616005)(6486002)(2906002)(83380400001)(26005)(6506007)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLRtUaZcJrGLTm8Ap0R3tOk7NUwPHzirXi/o/RrSra2sQncIF78PQd+I1Vdx?=
 =?us-ascii?Q?ibFa1wDCN5oMyLAcJOt5qP33MHZrY4zv7RggpicSCe3SI5a5VY6OzjJoWV1K?=
 =?us-ascii?Q?D/a6jh3yo9PrpIppVMshYwP8JtH9/8DN0itais4nqeksp2yKDAmipvuuSg31?=
 =?us-ascii?Q?kmgrg3Fho3vHmxq3f5rbWH7sWletNcfVGSV7c/sVSa2HJ9qzYQwpyN2tucS2?=
 =?us-ascii?Q?ool5aeGTWwRkPyaFAPeesBxESZ/ICOpxxlbz/LZzWlyDiW6nHK8QqBcGSV6A?=
 =?us-ascii?Q?YAjyy4NysyrP/ANi11H0RsMLQd5MKhDIlGjdYHnnwqRsKQPQOY1VN2z1nEqf?=
 =?us-ascii?Q?oFCOLFf11csQnxLOhSXwRRD1auWWWN31kg8/P4VpX0zX15BPwHtJaShNcn3x?=
 =?us-ascii?Q?1kiIuKWkPTxxg9HnfC7BGypOKG1mzr8LJJYVNSiA85pVQAyBcSjZTDvmTPkT?=
 =?us-ascii?Q?bGKi/MHrFnilxZmNkKtQRFWbm4cs+WyiKQGAX6QkyYJfO6ZsM33xbbDSF4ao?=
 =?us-ascii?Q?CH26bUSQH2ivLFOMJoKBcis09hYwhVvYMLqI9JRxqEP0mWDE54z8NYNg+8w9?=
 =?us-ascii?Q?7hsTwXDR1Xa51JKrxnmV4je36X7SvE6yhJtMlcJhWFRv77k43AqGYT3P8SXW?=
 =?us-ascii?Q?W1jJ8hRmkMDaW6pEuhY2fk+OKJJgKT+8HVpMzf6BhJR2GQI9L/OZt7qhGRLN?=
 =?us-ascii?Q?Bkfcl1jb/lEQdlpzKyn6I4by97ek3LncJtXqPBt1svs0g1O3JH8Z0BiNSyFH?=
 =?us-ascii?Q?otoYi+XFdwPSAKuEhhOAiSNjLdL/EdCH421+tL+FncTS+Fw0HyJWLlfiNMpN?=
 =?us-ascii?Q?Enf+1+N/hZOahcChO6xOgF6lpYH1LDtHijmbsFsH+B8UKkML49jiTcPDPd/Z?=
 =?us-ascii?Q?6dl0BdJsGwxY1d1npHH/MjB17yhmTGeQl/bCQUuNCThNnmdYVAPhf2+EIGtJ?=
 =?us-ascii?Q?GT12NExCdtb3oKkBe7AmqAA5GnyUL9tN3+chG9yqXFBACvRzd9WvlQcE9FTN?=
 =?us-ascii?Q?61S8BGjxxZAoRezUTvdy1lAZPfOQNngSSYbSEOscTaUMuJyStlf916eIuDWP?=
 =?us-ascii?Q?qHFGL9mFM8IVbNYdXZERqjHdgyBVBa3zpYzzzYJNF9rudk6231/A7JfspOIa?=
 =?us-ascii?Q?pnglhw3uXIcX31Asz2pheWIiB6HQLqxnZqv7sYII1ZFzg6WAdbjXxTyESDdd?=
 =?us-ascii?Q?Ul2rd7hmQprnrwEstxtbAlacSgCROh2FeHkjeG4o97BcpfRYqtYvNY6oxmr6?=
 =?us-ascii?Q?yCzF9fqbbgREudolbAPyE6tEm1Rs0Bj+mYs3WSHpExMefir/DRPkpDf/bxAz?=
 =?us-ascii?Q?orBWTEyZ7Ezdtde2tnpl+VNr9bS2hTes4qhTTQyvA25UyY/ULdU+mwiF60Ot?=
 =?us-ascii?Q?NezeMj3h76OTnpsfZZpY65hnvni04v8j9bpxTGtNr3LBVPvPyuRYaVTe7sTV?=
 =?us-ascii?Q?9blWNfIQe2vFvR3uFpsoGJ0pZPej38ZQPmw8XIF2stsP3QXZR8YJ7rXGk9Nq?=
 =?us-ascii?Q?clhC2JwLn1TwzisbN7O89ax1Dj9MssP8JPDVXecFjw1pWmafBZ5J2QZ69BYK?=
 =?us-ascii?Q?LPTNCPG2DPflUfkqILg9LpUKobNhFSSz1Zdt9F1r1vd1kzSuIZDyFhraNuvq?=
 =?us-ascii?Q?s+EY+PA77RovpHUt9NYrmAf1Ow7tpHt6ZcbEzQ3LopmS7paoHu7ira7gIgQp?=
 =?us-ascii?Q?j0m/xHc/p7iAfpSIJ1coWWz9ke1/7nZw6EEX98gUSnORrZThR1QaTVGMpXwW?=
 =?us-ascii?Q?M7Yp0+3f0g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e7db3e-70d2-4021-a09b-08da2753e5cf
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:10:52.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3UOW26yKt4xKIE0RZU1aRUbIc/u9Ffe2X5lH/EiRKmPjuqdBmyBq+MljTKJY569NjBwHIk3E8mdDToEdOi6VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3477
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use if and else instead of if(A) and if (!A).

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Change log:
v2:
- add braces to the if block.
---
 drivers/tty/hvc/hvc_opal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 84776bc641e6..794c7b18aa06 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -342,9 +342,9 @@ void __init hvc_opal_init_early(void)
 		 * path, so we hard wire it
 		 */
 		opal = of_find_node_by_path("/ibm,opal/consoles");
-		if (opal)
+		if (opal) {
 			pr_devel("hvc_opal: Found consoles in new location\n");
-		if (!opal) {
+		} else {
 			opal = of_find_node_by_path("/ibm,opal");
 			if (opal)
 				pr_devel("hvc_opal: "
-- 
2.35.1

