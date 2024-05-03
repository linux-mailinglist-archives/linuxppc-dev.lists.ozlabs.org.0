Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BB8BB7DE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWRGf1lnhz3vjZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 09:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exordes.com (client-ip=92.204.81.249; helo=sxb1plsmtpa01-16.prod.sxb1.secureserver.net; envelope-from=dai.lu@exordes.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 987 seconds by postgrey-1.37 at boromir; Fri, 03 May 2024 22:01:49 AEST
Received: from sxb1plsmtpa01-16.prod.sxb1.secureserver.net (sxb1plsmtpa01-16.prod.sxb1.secureserver.net [92.204.81.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW8Y96Fb9z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 22:01:49 +1000 (AEST)
Received: from exordes.com ([87.92.66.153])
	by :SMTPAUTH: with ESMTPSA
	id 2rJYsBkACnpx02rJbsRacx; Fri, 03 May 2024 04:43:00 -0700
X-CMAE-Analysis: v=2.4 cv=P7HxhTAu c=1 sm=1 tr=0 ts=6634cdc5
 a=13ZijDARommhillvnyM9pA==:117 a=13ZijDARommhillvnyM9pA==:17 a=eCYXQZmkAAAA:8
 a=yasIzMgEaC0_WTIPdd8A:9 a=77AlN4CNbnqoG63BkLSu:22
X-SECURESERVER-ACCT: dai.lu@exordes.com
From: Lu Dai <dai.lu@exordes.com>
To: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] tty: hvc: hvc_opal: eliminate uses of of_node_put()
Date: Fri,  3 May 2024 14:43:30 +0300
Message-Id: <20240503114330.221764-1-dai.lu@exordes.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGFLoAN7m+wK5DQwW5rMwK7zWeDspUOif9J3EvUOXg5V/16O/NGMl1iQkVENAVe5aTQiL7KS/A/fbUS994+hSiJW+OmWqAV/m9+WeYpNkcYrLJHA5qLC
 sHd66kpLKgdCO8eVVQIYsSFmvgWklhZ+TChh+61taxAUleY5YSRIaoKkPW7nqKKbytBsXQJXnVheHEPmBKyhNN/RglwE9qFL7DASNxF5fFOmoPEDpnXylQOs
 0WinVufDb9e2mx96aowrVT+IBwu4oaRozz4FGIW2BrR2yzxYiVs/DUpprBSJ9fBOcfidcqlVnEvAmCSyOChbKdkIRxoEsDrt7Fhr+wzHU4BKgPQxAO/YfA3I
 pmEKEdz++gJHDroru0UckXBWoGQ+HQRnjRSNsrNwsAJhR/zp+vG4+TEil+5q5EyepdfBUNurXcwQ9xrOAsHEnJpXiOY1xsmfSYZdd6/T+evrWZ4+dZ7j2RqB
 DTyp47hI6L2TwN696onBajOhZpzQZ9qJ60aeAUmTqGyZHqfXWK0lsyv+/I0LRJ2KLIVmhCDNWS2WXrdBkMRx0dEWbXeyaxmywQRcKRFidjPwdRMNHl9r7SQ8
 +V4=
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
Cc: shuah@kernel.org, javier.carrasco.cruz@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Lu Dai <dai.lu@exordes.com>, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make use of the __free() cleanup handler to automatically free nodes
when they get out of scope.

Removes the need for a 'goto' as an effect.

Signed-off-by: Lu Dai <dai.lu@exordes.com>
---
 drivers/tty/hvc/hvc_opal.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 095c33ad10f8..67e90fa993a3 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -327,14 +327,14 @@ static void udbg_init_opal_common(void)
 
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
+		struct device_node *opal __free(device_node), *np;
 
 		/* Current OPAL takeover doesn't provide the stdout
 		 * path, so we hard wire it
@@ -356,7 +356,6 @@ void __init hvc_opal_init_early(void)
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

