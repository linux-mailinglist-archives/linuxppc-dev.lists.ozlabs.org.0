Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A4582256
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 10:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt6l417ytz3c41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 18:44:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGu/c6fH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGu/c6fH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt6kM5pNJz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 18:43:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R727x8013372;
	Wed, 27 Jul 2022 08:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=A1CJGAFle7vD7zBjILYSCQewsL/7lbQnCjueEYBm3Nc=;
 b=QGu/c6fHnOQAk4HTd+0fnwVedD5tVVpoU40HBF5D4PbqO/Seo37qcUf+LKbhB0QO5aRq
 g875x5kR6FGWSLIF5C+IkrVwn5jWnz3hkrNDOCD5SwY23/2N+t0RoivAz3MkfIVqnlDv
 +rRu65XGIjEt6QULVvVdqa/NW3d6vP+GF9wXndG7/KvP1bTVxgJVtjR0L80GwpVclq6I
 fJIXdYKu4V1lN/Q3GkchvWZCmBaiVxZWVAHuVesooy6qPa37axWBoOqVlTUQeYfK79yk
 I2uZ6nVC1M3grfKrGIr73Q2Xuwf0iaEVBJekje4Y6+Om97imi0msTsbxRFL7fVYSqnev AQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk0mab2ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 08:43:20 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26R8ZRLV019488;
	Wed, 27 Jul 2022 08:43:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06fra.de.ibm.com with ESMTP id 3hg98fhqt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 08:43:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26R8hFGu25035262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Jul 2022 08:43:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 953365204E;
	Wed, 27 Jul 2022 08:43:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.70.200])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CB0AD5204F;
	Wed, 27 Jul 2022 08:43:14 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: [linux-next] Build failure kernel/watchdog [powerpc]
Message-Id: <CDBFE023-39B8-4D77-B228-E5335849120F@linux.ibm.com>
Date: Wed, 27 Jul 2022 14:13:13 +0530
To: linuxppc-dev@lists.ozlabs.org, ldufour@linux.ibm.com
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zkHKbZKp2eYLWh9CKt8PQD-kBXPkjKb1
X-Proofpoint-GUID: zkHKbZKp2eYLWh9CKt8PQD-kBXPkjKb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270033
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
Cc: linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux-next (5.19.0-rc8-next-20220726) fails to build on powerpc with =
following error:

kernel/watchdog.c:597:20: error: static declaration of =
'lockup_detector_reconfigure' follows non-static declaration
 static inline void lockup_detector_reconfigure(void)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from kernel/watchdog.c:17:
./include/linux/nmi.h:125:6: note: previous declaration of =
'lockup_detector_reconfigure' was here
 void lockup_detector_reconfigure(void);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

CONFIG_SOFTLOCKUP_DETECTOR is not set in the config. Build is
successful with CONFIG_SOFTLOCKUP_DETECTOR=3Dy

The code in question was changed by  following patch
commit 24a1260705b7c69e7be35cf40ccb1e886bc732cf
    watchdog: export lockup_detector_reconfigure

Thanks
- Sachin

