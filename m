Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38929FAAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:40:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlNt6Lv3zDqfc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TF50cCMN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvx1k0pzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:21 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11p3R133809
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VuWDZQOfluDr/HQMcX54PA2Aa8q7HTrQ2phsMzoQZy4=;
 b=TF50cCMN/4f0a7jXbJrK3VcuI868iz260gNoXrCu93rb+4RYl8ZFYDVkXkI6f+njp1Nl
 +Q5MOkQyvxvgkcAYHtPL+KGLDM87H0tbnpw5w7gZ7C41Tsgsr+VKj2ass0JeLz62HAkx
 a8N5+yQh9ZI62uCn90BIWsNWEZNAHITg8m8Ee6Q3pbxQXoweuRn36Q87GG4ypNJFeFAk
 Xj3xPGQOVfC6VQQI8BCr44LLkhE4o7IP3P0bM1nBoS7V0kyJeVh+bRMqHXys7so8sFPP
 gjVcCoPQTTKETKTnu7ZWj/zedXLE37zaYLRfqapUU3ikyykemvaYt9q5a6wajQKHfztj FQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34g6syb7bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:19 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1IERS001827
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 34fy75maqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1I9sX46465322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E005C7805C;
 Fri, 30 Oct 2020 01:18:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E4A78060;
 Fri, 30 Oct 2020 01:18:16 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/29] powerpc/pseries/mobility: extract VASI session polling
 logic
Date: Thu, 29 Oct 2020 20:17:48 -0500
Message-Id: <20201030011805.1224603-13-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 suspectscore=1
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The behavior of rtas_ibm_suspend_me_unsafe() is to return -EAGAIN to
the caller until the specified VASI suspend session state makes the
transition from H_VASI_ENABLED to H_VASI_SUSPENDING. In the interest
of separating concerns to prepare for a new implementation of the
join/suspend sequence, extract VASI session polling logic into a
couple of local functions. Waiting for the session state to reach
H_VASI_SUSPENDING before calling rtas_ibm_suspend_me_unsafe() ensures
that we will never get an EAGAIN result necessitating a retry. No
user-visible change in behavior is intended.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 76 +++++++++++++++++++++--
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index dc6abf164db7..1b8ae221b98a 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -345,6 +345,73 @@ void post_mobility_fixup(void)
 	return;
 }
 
+static int poll_vasi_state(u64 handle, unsigned long *res)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long hvrc;
+	int ret;
+
+	hvrc = plpar_hcall(H_VASI_STATE, retbuf, handle);
+	switch (hvrc) {
+	case H_SUCCESS:
+		ret = 0;
+		*res = retbuf[0];
+		break;
+	case H_PARAMETER:
+		ret = -EINVAL;
+		break;
+	case H_FUNCTION:
+		ret = -EOPNOTSUPP;
+		break;
+	case H_HARDWARE:
+	default:
+		pr_err("unexpected H_VASI_STATE result %ld\n", hvrc);
+		ret = -EIO;
+		break;
+	}
+	return ret;
+}
+
+static int wait_for_vasi_session_suspending(u64 handle)
+{
+	unsigned long state;
+	bool keep_polling;
+	int ret;
+
+	/*
+	 * Wait for transition from H_VASI_ENABLED to
+	 * H_VASI_SUSPENDING. Treat anything else as an error.
+	 */
+	do {
+		keep_polling = false;
+		ret = poll_vasi_state(handle, &state);
+		if (ret != 0)
+			break;
+
+		switch (state) {
+		case H_VASI_SUSPENDING:
+			break;
+		case H_VASI_ENABLED:
+			keep_polling = true;
+			ssleep(1);
+			break;
+		default:
+			pr_err("unexpected H_VASI_STATE result %lu\n", state);
+			ret = -EIO;
+			break;
+		}
+	} while (keep_polling);
+
+	/*
+	 * Proceed even if H_VASI_STATE is unavailable. If H_JOIN or
+	 * ibm,suspend-me are also unimplemented, we'll recover then.
+	 */
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
+
+	return ret;
+}
+
 static ssize_t migration_store(struct class *class,
 			       struct class_attribute *attr, const char *buf,
 			       size_t count)
@@ -356,12 +423,11 @@ static ssize_t migration_store(struct class *class,
 	if (rc)
 		return rc;
 
-	do {
-		rc = rtas_ibm_suspend_me_unsafe(streamid);
-		if (rc == -EAGAIN)
-			ssleep(1);
-	} while (rc == -EAGAIN);
+	rc = wait_for_vasi_session_suspending(streamid);
+	if (rc)
+		return rc;
 
+	rc = rtas_ibm_suspend_me_unsafe(streamid);
 	if (rc)
 		return rc;
 
-- 
2.25.4

