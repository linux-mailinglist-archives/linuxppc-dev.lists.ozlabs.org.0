Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310D74AA3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 07:11:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IaKNl2un;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy1j86twBz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 15:11:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IaKNl2un;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy1hD6RgMz3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 15:11:08 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qy1hC3WPmz4wxR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 15:11:07 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Qy1hC3Qdqz4wxn; Fri,  7 Jul 2023 15:11:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IaKNl2un;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Qy1hB57NZz4wxR
	for <linuxppc-dev@ozlabs.org>; Fri,  7 Jul 2023 15:11:06 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3674vR26008082
	for <linuxppc-dev@ozlabs.org>; Fri, 7 Jul 2023 05:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=igWDorhFtR5yCejGOtkGkkkLZ3oM7cHHYpcgy28f9sc=;
 b=IaKNl2un0cWU3ABwSOHYyje5hDz4ITgkUxBVqJ4mfyiv+h0qKTydoEr317KRujrZd8yI
 fqT/yjBYFA1Z3QkgWXlKNBS04sSovm3c0RTZ57KRdcyQbGSdEqaq4Md7eJc3UxtpZlMR
 hRpsBQgjfDmBvMUE0eZD6z+D2Fa1AMfk7Xdvrw1zfprTRCGUAMWIvkZjNRpdAgqzp/22
 6j/EJ+VLI7GXU1VpBuyCH1Khy2Li2JMzstiK8qvZx195PqwuLeTqKJyB+u4UAV6FUx6z
 ezNQ72DY4pwx+Ldo/VSbmbhGbrHKKdcpSqV83J3kIRKT/eGfov/NM2Hvda7lPnRmKcxU vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpc4k0aun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Fri, 07 Jul 2023 05:11:03 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36750JCw015535
	for <linuxppc-dev@ozlabs.org>; Fri, 7 Jul 2023 05:11:03 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpc4k0aua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 05:11:03 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3673hAgA022116;
	Fri, 7 Jul 2023 05:11:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4tsjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 05:11:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3675Avr942074672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 05:10:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9D262004B;
	Fri,  7 Jul 2023 05:10:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2774C20043;
	Fri,  7 Jul 2023 05:10:57 +0000 (GMT)
Received: from [192.168.0.66] (unknown [9.179.23.238])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 05:10:56 +0000 (GMT)
Subject: [PATCH v2] powernv/opal-prd: Silence memcpy() run-time false positive
 warnings
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 07 Jul 2023 10:40:56 +0530
Message-ID: <168870663097.1448934.17365533203887616941.stgit@jupiter>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X7kWJqwJn5W6ZIkI5jtemDijAmFrAQnw
X-Proofpoint-ORIG-GUID: yZDili30LG6xnsu9ZFU9rXuIkJefIdE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=878 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307070046
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

opal_prd_msg_notifier extracts the opal prd message size from the message
header and uses it for allocating opal_prd_msg_queue_item that includes
the correct message size to be copied. However, while running under
CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:

[ 6458.234352] memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
[ 6458.234390] WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
[...]
[ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 [opal_prd]
[ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd]
[ 6458.234736] Call Trace:
[ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
[ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] notifier_call_chain+0xc0/0x1b0
[ 6458.234774] [c0000002acb23d00] [c00000000019ceac] atomic_notifier_call_chain+0x2c/0x40
[ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] opal_message_notify+0xf4/0x2c0
[...]

Split the copy to avoid false positive run-time warning.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Change from v1:
- Rework the memcpy to copy message header and rest of the message
  separately without adding flex array.
---
 arch/powerpc/platforms/powernv/opal-prd.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 113bdb151f687..a068cbc4d43c0 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -352,7 +352,9 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
 	if (!item)
 		return -ENOMEM;
 
-	memcpy(&item->msg, msg->params, msg_size);
+	item->msg = *hdr;
+	hdr++;
+	memcpy((char *)&item->msg + sizeof(*hdr), hdr, msg_size - sizeof(*hdr));
 
 	spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
 	list_add_tail(&item->list, &opal_prd_msg_queue);


