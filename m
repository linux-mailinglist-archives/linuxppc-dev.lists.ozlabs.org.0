Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC22504C21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 07:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhZjm1h5hz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRRUERDB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jRRUERDB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhZj335nKz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 15:08:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I13Qnv026767; 
 Mon, 18 Apr 2022 05:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=1B9HmxI97eZmALrkLGN8vR22mu6dkzI6rcrbvJVUpZU=;
 b=jRRUERDBMDMVpp3Is1SKjX0fBMP5DY21ybzicOFHS1rlT8I/0PYVQgVmnBTZWzfoMfUr
 0IQBLCZSl6JPTsvjWfJMH0JxHmpkC5o319nSUZZtaY4xFb94n4QsB2+XkMri1JsMZSTx
 55A9JKaILWtiHEe6Vx6qOPOr9MaaEQd9Yy8udkwA99l1M2P/xu/pzChgRo5sRKcTygq5
 pCRbK291+ErZy31r50EIWPYgNp95RJ+UJiOyqD/yupJwmoTv14jtnLzuO+aRWFehx7Ly
 tLJ1XMfGn8/zXPYvD0nZKzdyXh+tHI9Il40E0SALrKkA7PMuB82MLPlxNTt8rrWwdEyf 9A== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7k9ccjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 05:08:38 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I56ln3030023;
 Mon, 18 Apr 2022 05:08:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ffne8ssnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 05:08:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I58XJK39911710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 05:08:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E2D711C04C;
 Mon, 18 Apr 2022 05:08:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E09511C04A;
 Mon, 18 Apr 2022 05:08:32 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 05:08:31 +0000 (GMT)
Subject: [RFC PATCH] ndtest: Make ndtest a module on its own
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 dan.j.williams@intel.com
Date: Mon, 18 Apr 2022 00:08:31 -0500
Message-ID: <165025849452.2974989.6131145460098517848.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YWSwhUvagZgljzKvY77wYBufnpNLGhba
X-Proofpoint-GUID: YWSwhUvagZgljzKvY77wYBufnpNLGhba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_01,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=668 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204180031
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Today ndtest module is compiled as nfit_test.ko depending on
if the CONFIG_ACPI_NFIT defined or not.

It is more advantageous to make ndtest a module on its own
so that the unit tests can be run serially on the same host
without a need for recompilation of sources.

The patch modifies the Kbuild file to take care of that.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 tools/testing/nvdimm/test/Kbuild |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/nvdimm/test/Kbuild b/tools/testing/nvdimm/test/Kbuild
index 197bcb2b7f35..4d4835f73b46 100644
--- a/tools/testing/nvdimm/test/Kbuild
+++ b/tools/testing/nvdimm/test/Kbuild
@@ -2,12 +2,12 @@
 ccflags-y := -I$(srctree)/drivers/nvdimm/
 ccflags-y += -I$(srctree)/drivers/acpi/nfit/
 
-obj-m += nfit_test.o
+obj-m += ndtest.o
 obj-m += nfit_test_iomap.o
 
 ifeq  ($(CONFIG_ACPI_NFIT),m)
+	obj-m += nfit_test.o
 	nfit_test-y := nfit.o
-else
-	nfit_test-y := ndtest.o
 endif
+
 nfit_test_iomap-y := iomap.o


