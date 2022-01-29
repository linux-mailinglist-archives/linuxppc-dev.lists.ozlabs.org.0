Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C64A2AF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlxQ46WQVz3cjr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 12:22:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bf8ilw9o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bf8ilw9o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlxPB5gdzz3cV7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 12:21:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20T18sap001534; 
 Sat, 29 Jan 2022 01:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1+iU765nlk0UaTA8H3Of3s7VH2GlxY2p5Ms/zBiYi+Y=;
 b=Bf8ilw9oBu0QKY1p9bAjyGajmfwbfzWlICNFVcLgTWcF5gctWUSq03rdCZE8lEaHL/AO
 cvadfzNUa5NtYXS4tk5PA+kPisnYw0RYl7SLyQyLC+LXllN22UVRm10wZMMRWagZoJkM
 +1Mq81+js2yaS3tQCs6PF+MQi+Ch1BPK7QhlQ21vjRqP8Zqk0mS8qV4/Aj1DfSV/TVHN
 2wRLkc3QHa86LkSgIAgtgKEpr7k93S1au6uHKUbZcIdWSGKKQVnmGIhsAYbZZEN55Hx3
 C/cxPCT/IR/cPjCWIAnkdPujPbK82BgRGOK8Oy62sxlbvcWhnXgBEinfaiRuJndyVR2K 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvkce0ycr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:21:29 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20T1LTMp004711;
 Sat, 29 Jan 2022 01:21:29 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvkce0yck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:21:29 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20T1HGvO023611;
 Sat, 29 Jan 2022 01:21:28 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3dt1xcee56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:21:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20T1LNjY36372744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jan 2022 01:21:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D33D9112063;
 Sat, 29 Jan 2022 01:21:23 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 205B1112061;
 Sat, 29 Jan 2022 01:21:22 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jan 2022 01:21:21 +0000 (GMT)
Message-ID: <a4249a70dc328045c39a31555209cce9c7a03adb.camel@linux.ibm.com>
Subject: [PATCH 3/3] powerpc/pseries/vas: Disable window open during migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Fri, 28 Jan 2022 17:21:20 -0800
In-Reply-To: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
References: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yn4tpBXsjLbyiM18a5Spu4X-T3FNkaWy
X-Proofpoint-GUID: NADz34swTIMM2xQ2ufO_-Tc69Wk2eRxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=849 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201290003
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
index b53e3fe02971..63316c401abb 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -29,6 +29,7 @@ static bool copypaste_feat;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
 static DEFINE_MUTEX(vas_pseries_mutex);
+static bool migration_in_progress;
 
 static long hcall_return_busy_check(long rc)
 {
@@ -355,8 +356,11 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
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
@@ -893,6 +897,11 @@ int vas_migration_handler(int action)
 
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


