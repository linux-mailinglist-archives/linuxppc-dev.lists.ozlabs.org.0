Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B073E2E97AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 15:53:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8dtH1l4TzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 01:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dPw3vSNzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:32:36 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104E3A1j054909; Mon, 4 Jan 2021 09:32:16 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35v3eyjtuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:32:15 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EWEr8003406;
 Mon, 4 Jan 2021 14:32:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 35tgf7s0s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 104EW7Kl30998852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF39D52057;
 Mon,  4 Jan 2021 14:32:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7D8415204E;
 Mon,  4 Jan 2021 14:32:10 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C2FC1220073;
 Mon,  4 Jan 2021 15:32:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/23] powerpc/pseries/ras: Remove unused variable 'status'
Date: Mon,  4 Jan 2021 15:31:45 +0100
Message-Id: <20210104143206.695198-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=797 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The last use of 'status' was removed in 2012. Remove the variable to
fix this W=3D1 compile error.

../arch/powerpc/platforms/pseries/ras.c: In function =E2=80=98ras_epow_in=
terrupt=E2=80=99:
../arch/powerpc/platforms/pseries/ras.c:318:6: error: variable =E2=80=98s=
tatus=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
  318 |  int status;
      |      ^~~~~~

Fixes: 55fc0c561742 ("powerpc/pseries: Parse and handle EPOW interrupts")
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/ras.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platform=
s/pseries/ras.c
index 149cec2212e6..bcb614ffce6a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -315,12 +315,10 @@ static irqreturn_t ras_hotplug_interrupt(int irq, v=
oid *dev_id)
 /* Handle environmental and power warning (EPOW) interrupts. */
 static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
 {
-	int status;
 	int state;
 	int critical;
=20
-	status =3D rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
-				      &state);
+	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX, &state);
=20
 	if (state > 3)
 		critical =3D 1;		/* Time Critical */
@@ -329,12 +327,9 @@ static irqreturn_t ras_epow_interrupt(int irq, void =
*dev_id)
=20
 	spin_lock(&ras_log_buf_lock);
=20
-	status =3D rtas_call(ras_check_exception_token, 6, 1, NULL,
-			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
-			   virq_to_hw(irq),
-			   RTAS_EPOW_WARNING,
-			   critical, __pa(&ras_log_buf),
-				rtas_get_error_log_max());
+	rtas_call(ras_check_exception_token, 6, 1, NULL, RTAS_VECTOR_EXTERNAL_I=
NTERRUPT,
+		  virq_to_hw(irq), RTAS_EPOW_WARNING, critical, __pa(&ras_log_buf),
+		  rtas_get_error_log_max());
=20
 	log_error(ras_log_buf, ERR_TYPE_RTAS_LOG, 0);
=20
--=20
2.26.2

