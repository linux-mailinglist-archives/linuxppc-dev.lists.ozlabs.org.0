Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF1F123E9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 23:11:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w7GV6SmJzDqPP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 07:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gwalbon@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w7Dp4L4szDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 07:09:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42L6fox053946
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 17:09:21 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s83p7jt6b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 17:09:20 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <gwalbon@linux.vnet.ibm.com>;
 Thu, 2 May 2019 22:09:20 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 22:09:15 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42L9E1U13172758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 21:09:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D711DAC05E;
 Thu,  2 May 2019 21:09:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A79A8AC05B;
 Thu,  2 May 2019 21:09:14 +0000 (GMT)
Received: from localhost (unknown [9.86.229.253])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 May 2019 21:09:14 +0000 (GMT)
From: Gustavo Walbon <gwalbon@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Fix wrong message when RFI Flush is disable
Date: Thu,  2 May 2019 18:09:07 -0300
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050221-0052-0000-0000-000003B73498
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011037; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197667; UDB=6.00628187; IPR=6.00978522; 
 MB=3.00026704; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-02 21:09:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050221-0053-0000-0000-000060BA5F91
Message-Id: <20190502210907.42375-1-gwalbon@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020132
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
Cc: mikey@neuling.org, maurosr@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, diana.craciun@nxp.com, paulus@samba.org, leitao@debian.org,
 msuchanek@suse.de, gwalbon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>

The issue was showing "Mitigation" message via sysfs whatever the state of
"RFI Flush", but it should show "Vulnerable" when it is disabled.

If you have "L1D private" feature enabled and not "RFI Flush" you are
vulnerable to meltdown attacks.

"RFI Flush" is the key feature to mitigate the meltdown whatever the
"L1D private" state.

SEC_FTR_L1D_THREAD_PRIV is a feature for Power9 only.

So the message should be as the truth table shows.
CPU | L1D private | RFI Flush |                   sysfs               |
----| ----------- | --------- | ------------------------------------- |
 P9 |    False    |   False   | Vulnerable
 P9 |    False    |   True    | Mitigation: RFI Flush
 P9 |    True     |   False   | Vulnerable: L1D private per thread
 P9 |    True     |   True    | Mitigation: RFI Flush, L1D private per
    |             |           | thread
 P8 |    False    |   False   | Vulnerable
 P8 |    False    |   True    | Mitigation: RFI Flush

Output before this fix:
 # cat /sys/devices/system/cpu/vulnerabilities/meltdown
 Mitigation: RFI Flush, L1D private per thread
 # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
 # cat /sys/devices/system/cpu/vulnerabilities/meltdown
 Mitigation: L1D private per thread

Output after fix:
 # cat /sys/devices/system/cpu/vulnerabilities/meltdown
 Mitigation: RFI Flush, L1D private per thread
 # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
 # cat /sys/devices/system/cpu/vulnerabilities/meltdown
 Vulnerable: L1D private per thread

Link: https://github.com/linuxppc/issues/issues/243

Signed-off-by: Gustavo L. F. Walbon <gwalbon@linux.ibm.com>
Signed-off-by: Mauro S. M. Rodrigues <maurosr@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/security.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index b33bafb8fcea..e08b81ef43b8 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -130,26 +130,22 @@ ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, cha
 
 	thread_priv = security_ftr_enabled(SEC_FTR_L1D_THREAD_PRIV);
 
-	if (rfi_flush || thread_priv) {
+	if (rfi_flush) {
 		struct seq_buf s;
 		seq_buf_init(&s, buf, PAGE_SIZE - 1);
 
-		seq_buf_printf(&s, "Mitigation: ");
-
-		if (rfi_flush)
-			seq_buf_printf(&s, "RFI Flush");
-
-		if (rfi_flush && thread_priv)
-			seq_buf_printf(&s, ", ");
-
+		seq_buf_printf(&s, "Mitigation: RFI Flush");
 		if (thread_priv)
-			seq_buf_printf(&s, "L1D private per thread");
+			seq_buf_printf(&s, ", L1D private per thread");
 
 		seq_buf_printf(&s, "\n");
 
 		return s.len;
 	}
 
+	if (thread_priv)
+		return sprintf(buf, "Vulnerable: L1D private per thread\n");
+
 	if (!security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) &&
 	    !security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR))
 		return sprintf(buf, "Not affected\n");
-- 
2.19.1

