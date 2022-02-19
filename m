Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F04BCA9A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KvK0N3bz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:30:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AKM4yb+G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AKM4yb+G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Ktc2F2Xz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:29:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JICFw4029391; 
 Sat, 19 Feb 2022 20:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=/vyj/ZkXTv6aQ/N+bW/rGZaiLNLd3oiKvd5G5Iza70A=;
 b=AKM4yb+Gb4S7eJXrufcb8a8jMWU2GYSh4zll4l3fl3w2CijL6sm46nvOqMZIqYIKTzqp
 D55UoGGQcrrSWAqOMeDlK3naHvVjOKbTQYB6fD5Rdc2md/Lv0ISv+h06M2t/jiazZCi3
 s9CD+pBSN0H87rytsSOdla8pHqtAzIlfg0Jkalan8MPbaE2e1k2injnAQrqOQtIoWOSl
 r56LFuWAAWV+AMvHg6K9jXfQjMrBhwqR+BWT+LxzMnRjUQjbscf8FfVFU/ULhshfgta4
 DxJfde2pVSdMDhQbX0DAWYp7a6owf15cCyvflazQE4O949aWXzwQDel0M0tfncR32EW9 Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb55xt3pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:29:54 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JKRwxF013411;
 Sat, 19 Feb 2022 20:29:53 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb55xt3nt-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:29:53 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JK48XQ011572;
 Sat, 19 Feb 2022 20:08:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3ear697p4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:08:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK8IEm36045232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:08:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A0C578068;
 Sat, 19 Feb 2022 20:08:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC7478064;
 Sat, 19 Feb 2022 20:08:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:08:17 +0000 (GMT)
Message-ID: <e89d39b0860eab0b528e454aff5fc465066025a4.camel@linux.ibm.com>
Subject: [PATCH v3 4/4] powerpc/pseries/vas: Disable window open during
 migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:08:15 -0800
In-Reply-To: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nm2orN7R5bKk2T9ZyamH75o_EOBS4B27
X-Proofpoint-GUID: lQyUsae5VlSCQfO1fMBzUa0joFr9QcJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=924
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190130
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The current partition migration implementation does not freeze the
user space and the user space can continue open VAS windows. So
when migration_in_progress flag is enabled, VAS open window
API returns -EBUSY.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index df22827969db..4be80112b05e 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,7 @@ static struct hv_vas_cop_feat_caps hv_cop_caps;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
 static DEFINE_MUTEX(vas_pseries_mutex);
+static bool migration_in_progress;
 
 static long hcall_return_busy_check(long rc)
 {
@@ -356,8 +357,11 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 * same fault IRQ is not freed by the OS before.
 	 */
 	mutex_lock(&vas_pseries_mutex);
-	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
-				   cop_feat_caps->win_type);
+	if (migration_in_progress)
+		rc = -EBUSY;
+	else
+		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+					   cop_feat_caps->win_type);
 	mutex_unlock(&vas_pseries_mutex);
 	if (rc)
 		goto out;
@@ -890,6 +894,11 @@ int vas_migration_handler(int action)
 
 	mutex_lock(&vas_pseries_mutex);
 
+	if (action == VAS_SUSPEND)
+		migration_in_progress = true;
+	else
+		migration_in_progress = false;
+
 	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
 		vcaps = &vascaps[i];
 		caps = &vcaps->caps;
-- 
2.27.0


