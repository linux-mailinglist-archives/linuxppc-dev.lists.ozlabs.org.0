Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E52496797
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:51:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgY406dVnz3cS3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aT12FF1C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aT12FF1C; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgY324Z1Qz3cTw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 08:50:38 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LLI65h016223; 
 Fri, 21 Jan 2022 21:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3rauII0/OlHs5wFvum9mxnYM6/6F62zzpN6WAcxw5JM=;
 b=aT12FF1CFiIRZnfRIXHlzQM9IqnN8CoBe5HvA8tknnoUum3SJkcKwmdAwC1lZxYh9T2c
 FezadKyoiWCcdbGVVZqE0KiNoFQa0h9vQRMe6SXeULxYuZtbjKiWrVhy6r+5QYqWR7ON
 99CcZAnu7f/1V+gNcO0VuRk8KleSLvfU2wtzVn4nPXbBNXryzDL3zCYSJ27NgmFqPlEu
 BsZcz1UKNmCcmQ5k1kuitAPxHzXexDBXqhFdTEBYzVG2E7dm1PkNj0t1+aZ63RyLR9Oz
 8gvrqfAUJwCIyrzqJVpu4vaUI8xWQ27FvTLZYYezP+BXgnJKlRMcoaw64MKnqVDjUVZ/ RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr4me0dx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:50:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LLaGT3023700;
 Fri, 21 Jan 2022 21:50:32 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr4me0dwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:50:32 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LLg4OK008816;
 Fri, 21 Jan 2022 21:50:31 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3dqj2bgsnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:50:31 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LLoSeF6620008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 21:50:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13132112064;
 Fri, 21 Jan 2022 21:50:28 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CAEE112062;
 Fri, 21 Jan 2022 21:50:26 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 21:50:26 +0000 (GMT)
Message-ID: <4bd97bc01910fec56a6d5ba7cb86cd3e95442f1a.camel@linux.ibm.com>
Subject: [RFC PATCH 3/3] powerpc/pseries/vas: Disable window open during
 migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Fri, 21 Jan 2022 13:50:24 -0800
In-Reply-To: <cb790b1d369457eb124ad9daa4b4833fa12e0832.camel@linux.ibm.com>
References: <cb790b1d369457eb124ad9daa4b4833fa12e0832.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tBTGlv1py9-RdwcHWqRLFk23qmjWUp1c
X-Proofpoint-ORIG-GUID: UDhooadmqF427rmEzsHUYkIUe0v-jMdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210136
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
 arch/powerpc/platforms/pseries/vas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 7087528e4246..e407767a9cb8 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,7 @@ static bool copypaste_feat;
 
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
@@ -796,6 +800,7 @@ int vas_reconfig_capabilties(u8 type)
 		return -ENOMEM;
 
 	mutex_lock(&vas_pseries_mutex);
+
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
 				      (u64)virt_to_phys(hv_caps));
 	if (rc)
@@ -894,6 +899,11 @@ static int vas_migrate_windows(bool suspend)
 
 	mutex_lock(&vas_pseries_mutex);
 
+	if (suspend)
+		migration_in_progress = true;
+	else
+		migration_in_progress = false;
+
 	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
 		vcaps = &vascaps[i];
 		caps = &vcaps->caps;
-- 
2.27.0


