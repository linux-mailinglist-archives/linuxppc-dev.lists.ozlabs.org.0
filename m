Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D14B302D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 15:28:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WVYh0Lp1zF4mq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 23:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WVSG0RxlzF59g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46WVSF3Hbzz8tWS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46WVSF2tGmz9sP4; Sun, 15 Sep 2019 23:23:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46WVSD4gj9z9sPZ
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 23:23:23 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8FDMauj161766
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u127cdy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:19 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Sun, 15 Sep 2019 14:23:17 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 15 Sep 2019 14:23:16 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8FDNF4t56950890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Sep 2019 13:23:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FF20A405C;
 Sun, 15 Sep 2019 13:23:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4FCA405F;
 Sun, 15 Sep 2019 13:23:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.54.91])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 15 Sep 2019 13:23:13 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/4] reorganize and add FADump sysfs files
Date: Sun, 15 Sep 2019 18:53:06 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19091513-4275-0000-0000-00000366642A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091513-4276-0000-0000-00003878C3F5
Message-Id: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150147
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, the FADump sysfs files are present inside /sys/kernel directory.
But as the number of FADump sysfs file increases it is not a good idea to
push all of them in /sys/kernel directory. It is better to have separate
directory to keep all the FADump sysfs files.

The patch series reorganizes the FADump sysfs files and avail all the
existing FADump sysfs files present inside /sys/kernel into a new directory
named fadump. Currently, all the FADump sysfs files are replicated into a
new directory to maintain the backward compatibility and will eventually get
removed in future. In addition to this a new FADump sys interface is added
to get the amount of memory reserved by FADump for saving the crash dump.

The series applies on top of:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-September/196871.html

Sourabh Jain (4):
  powerpc/fadump: replicate /sys/kernel/fadump_* sysfs into
    /sys/kernel/fadump/
  Documentation/ABI: add ABI documentation for /sys/kernel/fadump_*
  Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
  powerpc/fadump: sysfs for fadump memory reservation

 .../ABI/obsolete/sysfs-kernel-fadump_enabled  | 10 ++++
 .../obsolete/sysfs-kernel-fadump_registered   | 11 +++++
 .../obsolete/sysfs-kernel-fadump_release_mem  | 11 +++++
 .../sysfs-kernel-fadump_release_opalcore      | 10 ++++
 Documentation/ABI/testing/sysfs-kernel-fadump | 48 +++++++++++++++++++
 .../powerpc/firmware-assisted-dump.rst        | 14 ++++++
 arch/powerpc/kernel/fadump.c                  | 43 +++++++++++++++++
 arch/powerpc/platforms/powernv/opal-core.c    |  7 +++
 8 files changed, 154 insertions(+)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

-- 
2.17.2

