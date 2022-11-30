Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF2363E1E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 21:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMrP05JD4z3cGm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAz+w9HC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAz+w9HC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMrK12qWbz3bXG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 07:24:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUJmjHO023681;
	Wed, 30 Nov 2022 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KrYnveB3F7AMJZT1G/mARxgnu1ORcUWgMJN69w3bDGg=;
 b=sAz+w9HCL6DQFEFeZLqnk70tHg3eYhlrGcdI96vTGalK9NhL00+rz4CfljbK2lDbh0eE
 rQ9Z7nwzJ6mB2hyz8Rib8gLUWYBfCP71d+idkcm6ou1VbWaUcYlaBX6RfzAb7tfBgmAI
 hNv6k+4T4kYD7akbKn+yRBBLexpd+QZKEzduemb0+0ibDGWz+UIH8FoHP76VkRVTn+J1
 cXw7WlTpjB+Dhwj3dY2AU4s/ZUamHnGCOnFl1j3M/V0kc373K1kOvkL1O9z1yt6iXh1k
 Sxsa9CHgkd26dzItNnp2k0/fkWn2gTHSj0QSSu2i+EseP5c75OjH/dJSICVj1tZWxnPP aw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6dnp8tms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUKK5XX019854;
	Wed, 30 Nov 2022 20:24:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com with ESMTP id 3m3ae9wqmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:02 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AUKO1xk38666542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Nov 2022 20:24:01 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD52B58059;
	Wed, 30 Nov 2022 20:24:01 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DBE458058;
	Wed, 30 Nov 2022 20:24:00 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Nov 2022 20:24:00 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v5 0/3] generic and PowerPC SED Opal keystore
Date: Wed, 30 Nov 2022 14:23:55 -0600
Message-Id: <20221130202358.18034-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T1lAll5lfCjKFXthkRJbODLuh9EXdAEQ
X-Proofpoint-ORIG-GUID: T1lAll5lfCjKFXthkRJbODLuh9EXdAEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=950 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211300141
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Changelog v5:
        - added check for key length based on review comment by
	  "Elliott, Robert (Servers)" <elliott@hpe.com>

Changelog v4:
        - scope reduced to cover just SED Opal keys
        - base SED Opal keystore is now in SED block driver
        - removed use of enum to indicate type
        - refactored common code into common function that read and
          write use
        - removed cast to void
        - added use of SED Opal keystore functions to SED block driver

Generic functions have been defined for accessing SED Opal keys.
The generic functions are defined as weak so that they may be superseded
by keystore specific versions.

PowerPC/pseries versions of these functions provide read/write access
to SED Opal keys in the PLPKS keystore.

The SED block driver has been modified to read the SED Opal
keystore to populate a key in the SED Opal keyring. Changes to the
SED Opal key will be written to the SED Opal keystore.


Greg Joyce (3):
  block: sed-opal: SED Opal keystore
  powerpc/pseries: PLPKS SED Opal keystore support
  block: sed-opal: keystore access for SED Opal keys

 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 129 ++++++++++++++++++
 block/Makefile                                |   2 +-
 block/sed-opal-key.c                          |  23 ++++
 block/sed-opal.c                              |  18 ++-
 include/linux/sed-opal-key.h                  |  15 ++
 6 files changed, 185 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
 create mode 100644 block/sed-opal-key.c
 create mode 100644 include/linux/sed-opal-key.h

-- 
gjoyce@linux.vnet.ibm.com

