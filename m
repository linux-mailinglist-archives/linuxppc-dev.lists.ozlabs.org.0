Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55A9544B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:23:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CF2H6GXBzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDqx0hP5zDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:14:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2Cb5L003804; Mon, 19 Aug 2019 22:13:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug669385k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7K2DwS5007073;
 Mon, 19 Aug 2019 22:13:58 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug6693859-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:58 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7K2AHav011394;
 Tue, 20 Aug 2019 02:13:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2ue976h5hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 02:13:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2DuBX32244066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:13:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496ECC6059;
 Tue, 20 Aug 2019 02:13:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15BE3C605A;
 Tue, 20 Aug 2019 02:13:53 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:13:52 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/16] powerpc: Add support for adding an ESM blob to the
 zImage wrapper
Date: Mon, 19 Aug 2019 23:13:13 -0300
Message-Id: <20190820021326.6884-4-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820021326.6884-1-bauerman@linux.ibm.com>
References: <20190820021326.6884-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

For secure VMs, the signing tool will create a ticket called the "ESM blob"
for the Enter Secure Mode ultravisor call with the signatures of the kernel
and initrd among other things.

This adds support to the wrapper script for adding that blob via the "-e"
option to the zImage.pseries.

It also adds code to the zImage wrapper itself to retrieve and if necessary
relocate the blob, and pass its address to Linux via the device-tree, to be
later consumed by prom_init.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
[ bauerman: Minor adjustments to some comments. ]
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/boot/main.c       | 41 ++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/ops.h        |  2 ++
 arch/powerpc/boot/wrapper      | 24 +++++++++++++++++---
 arch/powerpc/boot/zImage.lds.S |  8 +++++++
 4 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index 102cc546444d..a9d209135975 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -146,6 +146,46 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
 	return (struct addr_range){(void *)initrd_addr, initrd_size};
 }
 
+#ifdef __powerpc64__
+static void prep_esm_blob(struct addr_range vmlinux, void *chosen)
+{
+	unsigned long esm_blob_addr, esm_blob_size;
+
+	/* Do we have an ESM (Enter Secure Mode) blob? */
+	if (_esm_blob_end <= _esm_blob_start)
+		return;
+
+	printf("Attached ESM blob at 0x%p-0x%p\n\r",
+	       _esm_blob_start, _esm_blob_end);
+	esm_blob_addr = (unsigned long)_esm_blob_start;
+	esm_blob_size = _esm_blob_end - _esm_blob_start;
+
+	/*
+	 * If the ESM blob is too low it will be clobbered when the
+	 * kernel relocates to its final location.  In this case,
+	 * allocate a safer place and move it.
+	 */
+	if (esm_blob_addr < vmlinux.size) {
+		void *old_addr = (void *)esm_blob_addr;
+
+		printf("Allocating 0x%lx bytes for esm_blob ...\n\r",
+		       esm_blob_size);
+		esm_blob_addr = (unsigned long)malloc(esm_blob_size);
+		if (!esm_blob_addr)
+			fatal("Can't allocate memory for ESM blob !\n\r");
+		printf("Relocating ESM blob 0x%lx <- 0x%p (0x%lx bytes)\n\r",
+		       esm_blob_addr, old_addr, esm_blob_size);
+		memmove((void *)esm_blob_addr, old_addr, esm_blob_size);
+	}
+
+	/* Tell the kernel ESM blob address via device tree. */
+	setprop_val(chosen, "linux,esm-blob-start", (u32)(esm_blob_addr));
+	setprop_val(chosen, "linux,esm-blob-end", (u32)(esm_blob_addr + esm_blob_size));
+}
+#else
+static inline void prep_esm_blob(struct addr_range vmlinux, void *chosen) { }
+#endif
+
 /* A buffer that may be edited by tools operating on a zImage binary so as to
  * edit the command line passed to vmlinux (by setting /chosen/bootargs).
  * The buffer is put in it's own section so that tools may locate it easier.
@@ -214,6 +254,7 @@ void start(void)
 	vmlinux = prep_kernel();
 	initrd = prep_initrd(vmlinux, chosen,
 			     loader_info.initrd_addr, loader_info.initrd_size);
+	prep_esm_blob(vmlinux, chosen);
 	prep_cmdline(chosen);
 
 	printf("Finalizing device tree...");
diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index cd043726ed88..e0606766480f 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -251,6 +251,8 @@ extern char _initrd_start[];
 extern char _initrd_end[];
 extern char _dtb_start[];
 extern char _dtb_end[];
+extern char _esm_blob_start[];
+extern char _esm_blob_end[];
 
 static inline __attribute__((const))
 int __ilog2_u32(u32 n)
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 5148ac271f28..ed6266367bc0 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -13,6 +13,7 @@
 # -i initrd	specify initrd file
 # -d devtree	specify device-tree blob
 # -s tree.dts	specify device-tree source file (needs dtc installed)
+# -e esm_blob   specify ESM blob for secure images
 # -c		cache $kernel.strip.gz (use if present & newer, else make)
 # -C prefix	specify command prefix for cross-building tools
 #		(strip, objcopy, ld)
@@ -37,6 +38,7 @@ platform=of
 initrd=
 dtb=
 dts=
+esm_blob=
 cacheit=
 binary=
 compression=.gz
@@ -60,9 +62,9 @@ tmpdir=.
 
 usage() {
     echo 'Usage: wrapper [-o output] [-p platform] [-i initrd]' >&2
-    echo '       [-d devtree] [-s tree.dts] [-c] [-C cross-prefix]' >&2
-    echo '       [-D datadir] [-W workingdir] [-Z (gz|xz|none)]' >&2
-    echo '       [--no-compression] [vmlinux]' >&2
+    echo '       [-d devtree] [-s tree.dts] [-e esm_blob]' >&2
+    echo '       [-c] [-C cross-prefix] [-D datadir] [-W workingdir]' >&2
+    echo '       [-Z (gz|xz|none)] [--no-compression] [vmlinux]' >&2
     exit 1
 }
 
@@ -105,6 +107,11 @@ while [ "$#" -gt 0 ]; do
 	[ "$#" -gt 0 ] || usage
 	dtb="$1"
 	;;
+    -e)
+	shift
+	[ "$#" -gt 0 ] || usage
+	esm_blob="$1"
+	;;
     -s)
 	shift
 	[ "$#" -gt 0 ] || usage
@@ -218,9 +225,16 @@ objflags=-S
 tmp=$tmpdir/zImage.$$.o
 ksection=.kernel:vmlinux.strip
 isection=.kernel:initrd
+esection=.kernel:esm_blob
 link_address='0x400000'
 make_space=y
 
+
+if [ -n "$esm_blob" -a "$platform" != "pseries" ]; then
+    echo "ESM blob not support on non-pseries platforms" >&2
+    exit 1
+fi
+
 case "$platform" in
 of)
     platformo="$object/of.o $object/epapr.o"
@@ -477,6 +491,10 @@ if [ -n "$dtb" ]; then
     fi
 fi
 
+if [ -n "$esm_blob" ]; then
+    addsec $tmp "$esm_blob" $esection
+fi
+
 if [ "$platform" != "miboot" ]; then
     if [ -n "$link_address" ] ; then
         text_start="-Ttext $link_address"
diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index 4ac1e36edfe7..a21f3a76e06f 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -68,6 +68,14 @@ SECTIONS
     _initrd_end =  .;
   }
 
+  . = ALIGN(4096);
+  .kernel:esm_blob :
+  {
+    _esm_blob_start =  .;
+    *(.kernel:esm_blob)
+    _esm_blob_end =  .;
+  }
+
 #ifdef CONFIG_PPC64_BOOT_WRAPPER
   . = ALIGN(256);
   .got :
