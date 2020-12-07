Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA32D1D11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:17:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqd2r4G92zDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:17:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hetlt8yO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV46YQpzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LTLnF106511
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xiBfuvxW3wd+Vp1kmPRLopv800ZjbbrY9vE6NWVlNSU=;
 b=Hetlt8yOAt0E8e7yim53QsPQbvS4EedaNSrfuNSatrgi/vUT6a4En3i/BHUJyS8Wmj04
 +EpPlYXRnyz1NFiG3cqWVlifNuNDMF7HYWlNj7YIstc7k4a7ata/n7+du37Megv6t7E2
 2YL1JV9FHk5KnjyLzM/qaI8JDB3qeDzGH+32IVo5/QLQYxB8TPmf+n7Z0taGhREJJqrU
 pbDNMhq13PNohFN1/lkp1lkIhMSHXeXAcIRWIoPC6Vx7+XJmyO+YytMGFkVBgF23Swh0
 vQfYPsfw6EEMC6UhZvHuo53Ip03pVu1fnyUegSX0vHNxYx6JvUP9ZD4xA5mB7tPNsUik lg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0r6c0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:10 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlxZ5031517
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3581u9fq48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq99k27787618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70762AC060;
 Mon,  7 Dec 2020 21:52:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F4A8AC059;
 Mon,  7 Dec 2020 21:52:09 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/28] powerpc/pseries/mobility: extract VASI session
 polling logic
Date: Mon,  7 Dec 2020 15:51:43 -0600
Message-Id: <20201207215200.1785968-12-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 suspectscore=1 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012070132
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
 arch/powerpc/platforms/pseries/mobility.c | 69 +++++++++++++++++++++--
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 01ac7c03558e..573ed48b43d8 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -345,6 +345,66 @@ void post_mobility_fixup(void)
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
+	int ret;
+
+	/*
+	 * Wait for transition from H_VASI_ENABLED to
+	 * H_VASI_SUSPENDING. Treat anything else as an error.
+	 */
+	while (true) {
+		ret = poll_vasi_state(handle, &state);
+
+		if (ret != 0 || state == H_VASI_SUSPENDING) {
+			break;
+		} else if (state == H_VASI_ENABLED) {
+			ssleep(1);
+		} else {
+			pr_err("unexpected H_VASI_STATE result %lu\n", state);
+			ret = -EIO;
+			break;
+		}
+	}
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
@@ -356,12 +416,11 @@ static ssize_t migration_store(struct class *class,
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
2.28.0

