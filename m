Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E38BB81B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWRYX0YNcz88MV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 09:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exordes.com (client-ip=188.121.53.79; helo=sxb1plsmtpa01-08.prod.sxb1.secureserver.net; envelope-from=dai.lu@exordes.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 989 seconds by postgrey-1.37 at boromir; Sat, 04 May 2024 00:10:29 AEST
Received: from sxb1plsmtpa01-08.prod.sxb1.secureserver.net (sxb1plsmtpa01-08.prod.sxb1.secureserver.net [188.121.53.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWCPd1SgPz3dKp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 00:10:28 +1000 (AEST)
Received: from exordes.com ([87.92.66.153])
	by :SMTPAUTH: with ESMTPSA
	id 2tK2scLjMxHuR2tK4sVIBL; Fri, 03 May 2024 06:51:38 -0700
X-CMAE-Analysis: v=2.4 cv=cvxQkE4i c=1 sm=1 tr=0 ts=6634ebea
 a=13ZijDARommhillvnyM9pA==:117 a=13ZijDARommhillvnyM9pA==:17 a=eCYXQZmkAAAA:8
 a=uR_b-lsrg1CRw0mhrfkA:9 a=77AlN4CNbnqoG63BkLSu:22
X-SECURESERVER-ACCT: dai.lu@exordes.com
From: Lu Dai <dai.lu@exordes.com>
To: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH V2] tty: hvc: hvc_opal: eliminate uses of of_node_put()
Date: Fri,  3 May 2024 16:52:15 +0300
Message-Id: <20240503135215.252635-1-dai.lu@exordes.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfK2SJXHeQgzrLA0xsB+HjKB3cxOwZkyFDlpkZ84PVaqsyCTvL/FxZ0QPWHjEOQVWn2g7LFf8Y1sq0Te1o5VFqyt1HwcJcjs4d7qSc9L9LkLzL84OVPC3
 R3wVQKH2DMNIRl/PcfXEfC2fVHQEWtVgWax+8p8AvBieqvfs06lv5qJgSmgBhF4L0o9dmXyfB2TEq5gYV5J9LmslArOLg2caADAnqmk4YwrN+ZG6Uo/u1Hki
 N0Sh58JOo9lh/c9kig/nXnuGFy5K8Booorzo0OLIMQppxlEmIMxOUE9Cn0jLsnNL9eKwOEgZpIkl/SbY/mbeQefS6o1Q6afx/VIdqA5x1ZtR2pEdBJmnlhei
 u1DCKkHGmP9zDD872aSfeOQlmuWgehboPXxmPblkGmdIB/tCWNrW62kb0N/LFGRvGpO0RCwe4W9U4Sjazhe9lRohC70zG2V+uet/SFJOyiDqEuX5ArHiVYiL
 5itZKd5GZnpdmi/NxfkU+4Te9p3P073L2unWzktYpiuwr/UzkyYU0kPxm/rcGZywpreg1whLxXnjs8VYihOorzHmxPh+g+uNtOGL4nrOLAACp4mf5mJ9pXIz
 M/NdkrwoKVZEe7nMGQLFbPfgZNJrWXXtgzSyoileU3hDgA==
X-Mailman-Approved-At: Sat, 04 May 2024 09:04:52 +1000
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
Cc: shuah@kernel.org, javier.carrasco.cruz@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Lu Dai <dai.lu@exordes.com>, julia.lawall@inria.fr, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make use of the __free() cleanup handler to automatically free nodes
when they get out of scope.

Remove the need for a 'goto' as an effect.

Signed-off-by: Lu Dai <dai.lu@exordes.com>
---
Changes since v1:
Move the assignment of 'opal' to its declaration
Seperate the declaration of 'np'

 drivers/tty/hvc/hvc_opal.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 095c33ad10f8..c17e8343ea60 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -327,19 +327,18 @@ static void udbg_init_opal_common(void)
 
 void __init hvc_opal_init_early(void)
 {
-	struct device_node *stdout_node = of_node_get(of_stdout);
+	struct device_node *stdout_node __free(device_node) = of_node_get(of_stdout);
 	const __be32 *termno;
 	const struct hv_ops *ops;
 	u32 index;
 
 	/* If the console wasn't in /chosen, try /ibm,opal */
 	if (!stdout_node) {
-		struct device_node *opal, *np;
-
 		/* Current OPAL takeover doesn't provide the stdout
 		 * path, so we hard wire it
 		 */
-		opal = of_find_node_by_path("/ibm,opal/consoles");
+		struct device_node *opal __free(device_node) =
+			of_find_node_by_path("/ibm,opal/consoles");
 		if (opal) {
 			pr_devel("hvc_opal: Found consoles in new location\n");
 		} else {
@@ -350,13 +349,13 @@ void __init hvc_opal_init_early(void)
 		}
 		if (!opal)
 			return;
+		struct device_node *np;
 		for_each_child_of_node(opal, np) {
 			if (of_node_name_eq(np, "serial")) {
 				stdout_node = np;
 				break;
 			}
 		}
-		of_node_put(opal);
 	}
 	if (!stdout_node)
 		return;
@@ -382,13 +381,11 @@ void __init hvc_opal_init_early(void)
 		hvsilib_establish(&hvc_opal_boot_priv.hvsi);
 		pr_devel("hvc_opal: Found HVSI console\n");
 	} else
-		goto out;
+		return;
 	hvc_opal_boot_termno = index;
 	udbg_init_opal_common();
 	add_preferred_console("hvc", index, NULL);
 	hvc_instantiate(index, index, ops);
-out:
-	of_node_put(stdout_node);
 }
 
 #ifdef CONFIG_PPC_EARLY_DEBUG_OPAL_RAW
-- 
2.39.2

