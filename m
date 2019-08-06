Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123482B00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 07:31:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462jtJ16sfzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 15:31:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 462jhg2Jp3zDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 15:23:15 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x765LvQJ048041
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Aug 2019 01:23:12 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u71cev18d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 01:23:12 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 6 Aug 2019 06:23:11 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 6 Aug 2019 06:23:07 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x765N64a53150114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Aug 2019 05:23:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02593112062;
 Tue,  6 Aug 2019 05:23:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3619112061;
 Tue,  6 Aug 2019 05:23:03 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.207.254])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Aug 2019 05:23:03 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 03/16] powerpc: Add support for adding an ESM blob to
 the zImage wrapper
Date: Tue,  6 Aug 2019 02:22:24 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190806052237.12525-1-bauerman@linux.ibm.com>
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080605-0060-0000-0000-0000036975F1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011558; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01242749; UDB=6.00655527; IPR=6.01024213; 
 MB=3.00028061; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-06 05:23:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080605-0061-0000-0000-00004A71CA37
Message-Id: <20190806052237.12525-4-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060063
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

