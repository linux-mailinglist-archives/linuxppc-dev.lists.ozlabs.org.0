Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6534C1135
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:24:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3YbZ1bfwz3cWm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 22:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=AuIKpYr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:febc::722;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=guozhengkui@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=AuIKpYr0; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0722.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::722])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3SyJ2tbpz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:55:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXZ0RTTZrieUB+SzdOUI7bK7EzWBQI6LLl6JNbX/RXtOr4rz+BW2wKSXzvt7ghfv8du964z/i4bQU+0gwv4f85YlRvALz5FQGgWxGY1PAbgFKAebC4XgNBRRSLt5DkrW62zf7c6g405rzowJek+Kb5xcHGRoG+6tDk7S21uiEfMo7a7UPltCbj8LTbhXKx+5QCfgc3z9JOGaUczbHmqOJt6JLz3hjp+fiPPe6vL1Fujp0UzZVsrsW/5LAAKKGtwKB/2tO8YbLQrv4H5nJD8jAjtWyrP6VwKWXkqcWr7bEVusbpMvBCHCsapIQBjiUCzUtZ8YA5Sud1wPyBnD8rX56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koO6CWe2PYIzdbOlW1L7EyNIx7lbaAFzkaGpPat6UW0=;
 b=khYYmEfsU50aZaCZ+S55MXCdIWVC5O9KWZB2ZcNNSRJrDOzPu6hwmHnjXxXCnBVzMAC/SpLhEERBUfbgWfUuOs0fvZ29U8194Ei0R227lty9Cw9wLK4xJT/PF69aayjKXbbtocVZrjlc8SxMp4aQ92ls23FSw5zd/zWx7a8p9lBM4bSim7Sjw8l6It/m4NZkFAHF8kRgzlYNlKCDsNo7ZK1RI6gHk6XQDnEGJPXwHIORt2pMBwnj/vBQSOzYi9ZtBaxNxw7NKgHL99WJMJVT+jYOpkj90pPsh43ABJYYJC0IEPtjK126Q8KdVYkaBaKNdYmofR4cutJqDZ0/WtAXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koO6CWe2PYIzdbOlW1L7EyNIx7lbaAFzkaGpPat6UW0=;
 b=AuIKpYr0Rw4y6Su0DyzI9mXfiHyLhz5bCaNi21t+AmcgfiyBAiGw9VZHGStg1QoU4dDPBeDWAFUbYhYn5V4vx2n10qpC1vdJlMlfPxD9gSCfQHcHUtKHC3lu8gh63cAKw3u0nCFAACX/7jYnixGOCocpbI57TGEb7IgpReCIdFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SG2PR06MB3872.apcprd06.prod.outlook.com (2603:1096:4:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 07:55:12 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::f097:dde5:9bd0:8beb]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::f097:dde5:9bd0:8beb%5]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 07:55:12 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Guo Zhengkui <guozhengkui@vivo.com>, Russell Currey <ruscur@russell.cc>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc/module_64: fix array_size.cocci warning
Date: Wed, 23 Feb 2022 15:54:23 +0800
Message-Id: <20220223075426.20939-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ea48a0e-6531-4803-f251-08d9f6a1d109
X-MS-TrafficTypeDiagnostic: SG2PR06MB3872:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB3872AD9F666BFE2988E6E5BBC73C9@SG2PR06MB3872.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ja4z3NeDmzbgU8Jm9VC/Lai2Tb7JJQmqVdanj5Hn5L/8wH9Ly35lFX6GhOl68UosO7gnna9fMuiBjAKsADPIBn3YMofHk3tZK8PoUHFPmq/UIdtGtvvraOui8y43CUdpwUAanYoFITAYNXWMtQSesrQ1Csg0qvoXjyNQD5+0OY0s99fLbdwCJzP+cO489HFXyBiAlypzuiShxLX3HGThQ4GGBvIp5fFswNM0aqIqZ3jaCEe0iP3ngSc0tqdko1QXP5u9iVzKE1QX3TOTnDg9bXiMy/omjou8RnlcVctvZhzCILtn+5xd8F8bHjwQEM8eZKBIcYHOyabqI4ELxsvHupWvF9dITzCaRWhgAyxce6J0j8HHJMXPMK0x3JqSumWQ5wb1Xlvz+Qjzrfid6YC5rMHyyTbMmZ3WFu/cIL9HguChvd//4QYVdXlaKbxmqA2Ym5xxWTsBqOBRnPRF0NKlpQckcx5+p/mg2qp95j0tIeQhqjcyf4sSLRx0u7YekgGXk1F/TEQ7FCT535KfEZhFsuUeE3lSVULXPSRVG7ZmIe5yMRlOhg2x2g3U1QpE6pQ00qKIPkk1AdguusM0i0h34HXTF6RD93KT4NvMt8R8jqisHEgLZxONh9kqXb+zmZTT/zgPB6XEmhuN3YiT1O7HysvBM9ZWzMzTPcg459kUU5krwcd8ySXEgwt0zSChF72XFNWrK8JF/YKooEgY6F1JnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(508600001)(1076003)(83380400001)(186003)(2616005)(38350700002)(26005)(2906002)(36756003)(107886003)(38100700002)(110136005)(6486002)(86362001)(4326008)(52116002)(5660300002)(66556008)(66476007)(6506007)(66946007)(316002)(6512007)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ks6Cz0+CfU9P12y6lxLHTIvX7o0hlOnslTZsN3iYXcGaO+VwhvkHClUVZ0Zs?=
 =?us-ascii?Q?Pc58gAaIyCvaThAsOEVtHWkt8jZQKC+buInEdf8dFH7wELtRKVZtJWEUR3SJ?=
 =?us-ascii?Q?Qd4JI51EbFzvOTj0KTAzgO0CHhFal1HK3f74V0zuhf8/ZJ4SzmDPnQuybFjJ?=
 =?us-ascii?Q?9pwTHZn2NLjHgZi4p6f8E/4oScCJ02PvH8cRQ0RUSlq/PpMDZeLD64ztSt21?=
 =?us-ascii?Q?z3hf23Z2YHyHATnt1c4Ny7IMDn838eEyGM78daM2dumH2QXI2GJB20CfRg6J?=
 =?us-ascii?Q?GvEECBqxeuyWn6iFGLHwqgVvjKt+phfto0Q98TXg+ruBy3O5eUOdu8EUhYDP?=
 =?us-ascii?Q?SXMMc/lwM+OC7j91o443iDJmP2/ahwYsPerA0GVixkAYYsFWPSbtcfDb7bxH?=
 =?us-ascii?Q?Q+IV8513gQ1I9L8Q90SUI8tEa1QXJOHigv17PKKnCsIeWxS97f4FPonkkKij?=
 =?us-ascii?Q?QLyz4ykuMp0bjBRqqJ9z2HjKrzA2Tbj8dnUqgmnVL2U7OeBnd27Hh1lZA8jW?=
 =?us-ascii?Q?+zIA+jbWfuOmjC9D3a40m0gPAR57yau3U2Sl/UeRWhv5QOV5Jbzt3O6ZGQ2Y?=
 =?us-ascii?Q?+Qmai7yLJ40KUfWIiO/uRfFYJbEAOtOKVMx12SF5lpNxKow2b5wMQCXMP/Jp?=
 =?us-ascii?Q?yKhYb3UW3fsC9CF/bVV9TEZxNUmDEZHrTjw5ngHp1KhZPuAVAcT9Hu5otIMD?=
 =?us-ascii?Q?rlviSOK5GsitIOJJN96LdlRFJbiSok+BLZe09O41bwTy1f2KyCjkeKK6T3iR?=
 =?us-ascii?Q?FDdZJ6ZSywl7Fpuhz+oNyj/wHn9COqILNv7LEcKDZQe7QWi131awpno9ONPP?=
 =?us-ascii?Q?0nKBzVzYxzh6RtZiOO31fMgVDQXRs8q2ZSG52rrM+qRK7UVgXMRhAmT+oWBY?=
 =?us-ascii?Q?6FwkPRJ9My+MxM/e3l9dLD9gaQJeu4L2HhgVuSNk0J7sxImczHI3gFy0wHCO?=
 =?us-ascii?Q?DuW445T0iAdDL8hfUWjvn8LmGK+LYoMmcZ/ZgH3Wg0i3+yzeM1PTnQ9uJtWC?=
 =?us-ascii?Q?3ipfHtwLmFsG78N3X2WA8JxR2h5TNu0PIbSnGJpBHK6douWgYZsoVQ1r2uK/?=
 =?us-ascii?Q?P9dRcFAOQ318Dg2m0Akb25/3TBzGlK6C+pJapVKSGnP6rFMrGv0g1QDeJCTE?=
 =?us-ascii?Q?jLOM+6T3RK05gOTv5haMNvmMLBNESt6r7UjuAsBlUpDbP0N+DOwTUFfYJ9Ty?=
 =?us-ascii?Q?0X6OTRsUfQdKQGtXr+2aNUWLLFH1LDIgYAFGXw8pSASC2Zc0U3P6NMtryv9w?=
 =?us-ascii?Q?QwfgEftp/xouTEzb/5EOCkj7n9YDjpVXM4Mr+fR2Ko+WLyxS93hD5h2jX7B5?=
 =?us-ascii?Q?7tePi/sLNcfdGSuqXjdUBkHuLkrmf0HF13ua23kqV+V03v7PgO9xtgix3PlJ?=
 =?us-ascii?Q?6fxF0skdmArNwFUTJm5oIf1Dwl/4FryzXV69fPk1C5VrGM5zIcfkfKzhyDiZ?=
 =?us-ascii?Q?qViYSeP/SyxRP6y+L2eLe0fSXBGA+NVgT598qtqviklhmUdWllBoawCXhN2h?=
 =?us-ascii?Q?7UMSFi7tFBDfrKd5xe9d2BNutS/muGh9cO2lZhI54jPwPqKFmFDtnXojZmb6?=
 =?us-ascii?Q?MiJW9mRqCtOB4+hjhuwIPZR7t20CU4Bs8AnovvVxRv9ueXx7R/9W5dYS1gNV?=
 =?us-ascii?Q?4K44LScSY/UJx+gVbqex+fI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea48a0e-6531-4803-f251-08d9f6a1d109
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:55:12.2205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3/KjqVE1elXotnyiZbM0at18klwVVqPOJgU8jHNi6dJZhS4Bs4sLxsqMmYG9YQDsi6i3M1B8bvQPn2RQmpTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3872
X-Mailman-Approved-At: Wed, 23 Feb 2022 22:23:29 +1100
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix following coccicheck warning:
./arch/powerpc/kernel/module_64.c:432:40-41: WARNING: Use ARRAY_SIZE.

ARRAY_SIZE(arr) is a macro provided by the kernel. It makes sure that arr
is an array, so it's safer than sizeof(arr) / sizeof(arr[0]) and more
standard.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 arch/powerpc/kernel/module_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 6a45e6ddbe58..94d14cf99bca 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -14,6 +14,7 @@
 #include <linux/ftrace.h>
 #include <linux/bug.h>
 #include <linux/uaccess.h>
+#include <linux/kernel.h>
 #include <asm/module.h>
 #include <asm/firmware.h>
 #include <asm/code-patching.h>
@@ -429,7 +430,7 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	if (is_mprofile_ftrace_call(name))
 		return create_ftrace_stub(entry, addr, me);
 
-	for (i = 0; i < sizeof(ppc64_stub_insns) / sizeof(u32); i++) {
+	for (i = 0; i < ARRAY_SIZE(ppc64_stub_insns); i++) {
 		if (patch_instruction(&entry->jump[i],
 				      ppc_inst(ppc64_stub_insns[i])))
 			return 0;
-- 
2.20.1

