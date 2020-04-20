Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D91B180F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 23:09:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495fT833T7zDqVl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 07:09:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rzinsly@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495fBQ6d3QzDqwJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:56:30 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KKXFA6110886; Mon, 20 Apr 2020 16:56:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmu9s531-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 16:56:18 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KKtDGw012262;
 Mon, 20 Apr 2020 20:56:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 30fs66gt8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 20:56:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KKu9UE49480158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 20:56:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4A1AAC059;
 Mon, 20 Apr 2020 20:56:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CE47AC05B;
 Mon, 20 Apr 2020 20:56:09 +0000 (GMT)
Received: from localhost (unknown [9.85.196.70])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 20:56:09 +0000 (GMT)
From: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
Subject: [PATCH V4 5/5] selftests/powerpc: Add README for GZIP engine tests
Date: Mon, 20 Apr 2020 17:55:38 -0300
Message-Id: <20200420205538.25181-6-rzinsly@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200420205538.25181-1-rzinsly@linux.ibm.com>
References: <20200420205538.25181-1-rzinsly@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_08:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200162
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Include a README file with the instructions to use the
testcases at selftests/powerpc/nx-gzip.

Signed-off-by: Bulent Abali <abali@us.ibm.com>
Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
---
 .../powerpc/nx-gzip/99-nx-gzip.rules          |  1 +
 .../testing/selftests/powerpc/nx-gzip/README  | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/README

diff --git a/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules b/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
new file mode 100644
index 000000000000..5a7118495cb3
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="nxgzip", KERNEL=="nx-gzip", MODE="0666"
diff --git a/tools/testing/selftests/powerpc/nx-gzip/README b/tools/testing/selftests/powerpc/nx-gzip/README
new file mode 100644
index 000000000000..9809dbaa1905
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/README
@@ -0,0 +1,45 @@
+Test the nx-gzip function:
+=========================
+
+Verify that following device exists:
+  /dev/crypto/nx-gzip
+If you get a permission error run as sudo or set the device permissions:
+   sudo chmod go+rw /dev/crypto/nx-gzip
+However, chmod may not survive across boots. You may create a udev file such
+as:
+   /etc/udev/rules.d/99-nx-gzip.rules
+
+
+To manually build and run:
+$ gcc -O3 -I./include -o gzfht_test gzfht_test.c gzip_vas.c
+$ gcc -O3 -I./include -o gunz_test gunz_test.c gzip_vas.c
+
+
+Compress any file using Fixed Huffman mode. Output will have a .nx.gz suffix:
+$ ./gzfht_test gzip_vas.c
+file gzip_vas.c read, 6413 bytes
+compressed 6413 to 3124 bytes total, crc32 checksum = abd15e8a
+
+
+Uncompress the previous output. Output will have a .nx.gunzip suffix:
+./gunz_test gzip_vas.c.nx.gz
+gzHeader FLG 0
+00 00 00 00 04 03
+gzHeader MTIME, XFL, OS ignored
+computed checksum abd15e8a isize 0000190d
+stored   checksum abd15e8a isize 0000190d
+decomp is complete: fclose
+
+
+Compare two files:
+$ sha1sum gzip_vas.c.nx.gz.nx.gunzip gzip_vas.c
+bf43e3c0c3651f5f22b6f9784cd9b1eeab4120b6  gzip_vas.c.nx.gz.nx.gunzip
+bf43e3c0c3651f5f22b6f9784cd9b1eeab4120b6  gzip_vas.c
+
+
+Note that the code here are intended for testing the nx-gzip hardware function.
+They are not intended for demonstrating performance or compression ratio.
+By being simplistic these selftests expect to allocate the entire set of source
+and target pages in the memory so it needs enough memory to work.
+For more information and source code consider using:
+https://github.com/libnxz/power-gzip
-- 
2.21.0

