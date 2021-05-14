Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34045381352
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 23:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhhrq0D9Sz3bs1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aJ6K8YKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aJ6K8YKT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhhrL05kCz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 07:44:33 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ELXvO3030567; Fri, 14 May 2021 17:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2TjVzacE10ZLv/wIdwoaT8zoV5nLGXPmwgF92Z7UQ4E=;
 b=aJ6K8YKTiYz5JENG65tU5OYxN+EB8WlSII9k2pPSJG7lSQR1rpAWCu6Pd6uGT8zQMVF9
 Ptu0zC0SnVzAfbbivV6iGbXmFC9DaOi4UukjncpDoDn+Z/9/Pz763NwHKgQySadpSy11
 Lx5DJ/MoBBOJfDiRsBwYY0lFn6U2zOFRRRjyqmewnqK0YmSkMFkIy6dF9aOaFVxllxVa
 hlAveH9qfWR96UFl3mmGI4F6IjW5irE6FnRjMmynfd5dXpFd6KthjAgkLq8DdPhdlPDx
 OwnY2n7VS8316hO5f4HS//TTz//EjgfMzxpG/MjKCC338CzIzljg+C7255I0ak4Uar+f kw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38hxynb8a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 17:44:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14ELiNaP001405;
 Fri, 14 May 2021 21:44:23 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 38hc75y0mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 21:44:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14ELiNma26607876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 21:44:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34A87AE05F;
 Fri, 14 May 2021 21:44:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C42AE05C;
 Fri, 14 May 2021 21:44:22 +0000 (GMT)
Received: from localhost (unknown [9.211.51.49])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 May 2021 21:44:22 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/udbg_hvc: retry putc on -EAGAIN
Date: Fri, 14 May 2021 16:44:22 -0500
Message-Id: <20210514214422.3019105-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4hEbkGUgVweJqzQJp6yWv37D0NrPnima
X-Proofpoint-ORIG-GUID: 4hEbkGUgVweJqzQJp6yWv37D0NrPnima
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-14_10:2021-05-12,
 2021-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140169
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
Cc: jirislaby@kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hvterm_raw_put_chars() calls hvc_put_chars(), which may return -EAGAIN
when the underlying hcall returns a "busy" status, but udbg_hvc_putc()
doesn't handle this. When using xmon on a PowerVM guest, this can
result in incomplete or garbled output when printing relatively large
amounts of data quickly, such as when dumping the kernel log buffer.

Call again on -EAGAIN.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 drivers/tty/hvc/hvc_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_vio.c b/drivers/tty/hvc/hvc_vio.c
index 798f27f40cc2..76d2a7038095 100644
--- a/drivers/tty/hvc/hvc_vio.c
+++ b/drivers/tty/hvc/hvc_vio.c
@@ -249,7 +249,7 @@ static void udbg_hvc_putc(char c)
 			count = hvterm_hvsi_put_chars(0, &c, 1);
 			break;
 		}
-	} while(count == 0);
+	} while(count == 0 || count == -EAGAIN);
 }
 
 static int udbg_hvc_getc_poll(void)
-- 
2.30.2

