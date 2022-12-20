Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375D651B6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 08:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbnxc68xCz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 18:19:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuET60LV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuET60LV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbnvf73Fbz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 18:17:18 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK7Bkgu028451;
	Tue, 20 Dec 2022 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kbTmRHlVKhoVfdi1S+EGnZNGPJ1TxNXM4kGIH6gdpeY=;
 b=PuET60LVgswRw2OUn2m90UNzBQZPMT4ZFK/jycHu4R+zO+hoWZ8wUzWk1Z6Y112L69vj
 FQgRYIK6lnWWiEVN2zndoQ6eU69rkq7lKapsEe0aMcXWq5DoSTM9fFrG95tmGDdaLg0A
 h/s2sWMXJg8ZfDYxPl15LIWdWRxfAvNu17B+ttYPBM37r+1F296Z2ZxwJChJLknwU/cC
 mePiebAtWm12huVyRR88r8M3oNTV2naOJ8ylSkHqvPoUslUN9hQ1utuSYFkjggHRNXca
 bn5ukwSgAGe6kXNyj0ta3UyPcblDJXYbXEKfddQenrdGD55YTXYBpPmpfks7HEgSkfSV hA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk8en0559-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 07:17:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJLc7Lv018987;
	Tue, 20 Dec 2022 07:17:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mh6ywkkfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 07:17:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BK7HAEj20775212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Dec 2022 07:17:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E87920049;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C7F620043;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 36ACC604A7;
	Tue, 20 Dec 2022 18:17:07 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/pseries: Fix handling of PLPKS object flushing timeout
Date: Tue, 20 Dec 2022 18:16:23 +1100
Message-Id: <20221220071626.1426786-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220071626.1426786-1-ajd@linux.ibm.com>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yx8GV4OMAfI7KIv8Gxk8Z0_crV3IPViO
X-Proofpoint-ORIG-GUID: yx8GV4OMAfI7KIv8Gxk8Z0_crV3IPViO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200058
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

plpks_confirm_object_flushed() uses the H_PKS_CONFIRM_OBJECT_FLUSHED hcall
to check whether changes to an object in the Platform KeyStore have been
flushed to non-volatile storage.

The hcall returns two output values, the return code and the flush status.
plpks_confirm_object_flushed() polls the hcall until either the flush
status has updated, the return code is an error, or a timeout has been
exceeded.

While we're still polling, the hcall is returning H_SUCCESS (0) as the
return code. In the timeout case, this means that upon exiting the polling
loop, rc is 0, and therefore 0 is returned to the user.

Handle the timeout case separately and return ETIMEDOUT if triggered.

Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Reported-by: Benjamin Gray <bgray@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 4edd1585e245..cb93062e8223 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -248,6 +248,7 @@ static int plpks_confirm_object_flushed(struct label *label,
 					struct plpks_auth *auth)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
+	bool timed_out = true;
 	u64 timeout = 0;
 	u8 status;
 	int rc;
@@ -259,20 +260,26 @@ static int plpks_confirm_object_flushed(struct label *label,
 
 		status = retbuf[0];
 		if (rc) {
+			timed_out = false;
 			if (rc == H_NOT_FOUND && status == 1)
 				rc = 0;
 			break;
 		}
 
-		if (!rc && status == 1)
+		if (!rc && status == 1) {
+			timed_out = false;
 			break;
+		}
 
 		usleep_range(PKS_FLUSH_SLEEP,
 			     PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_RANGE);
 		timeout = timeout + PKS_FLUSH_SLEEP;
 	} while (timeout < PKS_FLUSH_MAX_TIMEOUT);
 
-	rc = pseries_status_to_err(rc);
+	if (timed_out)
+		rc = -ETIMEDOUT;
+	else
+		rc = pseries_status_to_err(rc);
 
 	return rc;
 }
-- 
2.38.1

