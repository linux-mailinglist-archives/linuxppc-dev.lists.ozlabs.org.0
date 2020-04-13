Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC61A69AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 18:18:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491DLB1TJWzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 02:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rzinsly@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491CxQ6jzNzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 01:59:54 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03DFqSYT112712; Mon, 13 Apr 2020 11:59:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30cu3x85mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 11:59:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03DFuVIb018547;
 Mon, 13 Apr 2020 15:59:44 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 30b5h6nsfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 15:59:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03DFxgi123790038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 15:59:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA8F2BE051;
 Mon, 13 Apr 2020 15:59:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38575BE04F;
 Mon, 13 Apr 2020 15:59:42 +0000 (GMT)
Received: from localhost (unknown [9.85.151.130])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 13 Apr 2020 15:59:41 +0000 (GMT)
From: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
Subject: [PATCH V3 3/5] selftests/powerpc: Add NX-GZIP engine compress testcase
Date: Mon, 13 Apr 2020 12:59:14 -0300
Message-Id: <20200413155916.16900-4-rzinsly@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200413155916.16900-1-rzinsly@linux.ibm.com>
References: <20200413155916.16900-1-rzinsly@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_07:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130116
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

Add a compression testcase for the powerpc NX-GZIP engine.

Signed-off-by: Bulent Abali <abali@us.ibm.com>
Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
---
 .../selftests/powerpc/nx-gzip/Makefile        |  21 +
 .../selftests/powerpc/nx-gzip/gzfht_test.c    | 432 ++++++++++++++++++
 .../selftests/powerpc/nx-gzip/gzip_vas.c      | 316 +++++++++++++
 3 files changed, 769 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/Makefile
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c

diff --git a/tools/testing/selftests/powerpc/nx-gzip/Makefile b/tools/testing/selftests/powerpc/nx-gzip/Makefile
new file mode 100644
index 000000000000..ab903f63bbbd
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/Makefile
@@ -0,0 +1,21 @@
+CC = gcc
+CFLAGS = -O3
+INC = ./inc
+SRC = gzfht_test.c
+OBJ = $(SRC:.c=.o)
+TESTS = gzfht_test
+EXTRA_SOURCES = gzip_vas.c
+
+all:	$(TESTS)
+
+$(OBJ): %.o: %.c
+	$(CC) $(CFLAGS) -I$(INC) -c $<
+
+$(TESTS): $(OBJ)
+	$(CC) $(CFLAGS) -I$(INC) -o $@ $@.o $(EXTRA_SOURCES)
+
+run_tests: $(TESTS)
+	./gzfht_test gzip_vas.c
+
+clean:
+	rm -f $(TESTS) *.o *~ *.gz
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
new file mode 100644
index 000000000000..e60f743e2c6b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -0,0 +1,432 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* P9 gzip sample code for demonstrating the P9 NX hardware interface.
+ * Not intended for productive uses or for performance or compression
+ * ratio measurements.  For simplicity of demonstration, this sample
+ * code compresses in to fixed Huffman blocks only (Deflate btype=1)
+ * and has very simple memory management.  Dynamic Huffman blocks
+ * (Deflate btype=2) are more involved as detailed in the user guide.
+ * Note also that /dev/crypto/gzip, VAS and skiboot support are
+ * required.
+ *
+ * Copyright 2020 IBM Corp.
+ *
+ * https://github.com/libnxz/power-gzip for zlib api and other utils
+ *
+ * Author: Bulent Abali <abali@us.ibm.com>
+ *
+ * Definitions of acronyms used here. See
+ * P9 NX Gzip Accelerator User's Manual for details:
+ * https://github.com/libnxz/power-gzip/blob/develop/doc/power_nx_gzip_um.pdf
+ *
+ * adler/crc: 32 bit checksums appended to stream tail
+ * ce:       completion extension
+ * cpb:      coprocessor parameter block (metadata)
+ * crb:      coprocessor request block (command)
+ * csb:      coprocessor status block (status)
+ * dht:      dynamic huffman table
+ * dde:      data descriptor element (address, length)
+ * ddl:      list of ddes
+ * dh/fh:    dynamic and fixed huffman types
+ * fc:       coprocessor function code
+ * histlen:  history/dictionary length
+ * history:  sliding window of up to 32KB of data
+ * lzcount:  Deflate LZ symbol counts
+ * rembytecnt: remaining byte count
+ * sfbt:     source final block type; last block's type during decomp
+ * spbc:     source processed byte count
+ * subc:     source unprocessed bit count
+ * tebc:     target ending bit count; valid bits in the last byte
+ * tpbc:     target processed byte count
+ * vas:      virtual accelerator switch; the user mode interface
+ */
+
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/fcntl.h>
+#include <sys/mman.h>
+#include <endian.h>
+#include <bits/endian.h>
+#include <sys/ioctl.h>
+#include <assert.h>
+#include <errno.h>
+#include <signal.h>
+#include "nxu.h"
+#include "nx.h"
+
+int nx_dbg;
+FILE *nx_gzip_log;
+
+#define NX_MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
+#define FNAME_MAX 1024
+#define FEXT ".nx.gz"
+
+/*
+ * LZ counts returned in the user supplied nx_gzip_crb_cpb_t structure.
+ */
+static int compress_fht_sample(char *src, uint32_t srclen, char *dst,
+				uint32_t dstlen, int with_count,
+				struct nx_gzip_crb_cpb_t *cmdp, void *handle)
+{
+	int cc;
+	uint32_t fc;
+
+	assert(!!cmdp);
+
+	put32(cmdp->crb, gzip_fc, 0);  /* clear */
+	fc = (with_count) ? GZIP_FC_COMPRESS_RESUME_FHT_COUNT :
+			    GZIP_FC_COMPRESS_RESUME_FHT;
+	putnn(cmdp->crb, gzip_fc, fc);
+	putnn(cmdp->cpb, in_histlen, 0); /* resuming with no history */
+	memset((void *) &cmdp->crb.csb, 0, sizeof(cmdp->crb.csb));
+
+	/* Section 6.6 programming notes; spbc may be in two different
+	 * places depending on FC.
+	 */
+	if (!with_count)
+		put32(cmdp->cpb, out_spbc_comp, 0);
+	else
+		put32(cmdp->cpb, out_spbc_comp_with_count, 0);
+
+	/* Figure 6-3 6-4; CSB location */
+	put64(cmdp->crb, csb_address, 0);
+	put64(cmdp->crb, csb_address,
+	      (uint64_t) &cmdp->crb.csb & csb_address_mask);
+
+	/* Source direct dde (scatter-gather list) */
+	clear_dde(cmdp->crb.source_dde);
+	putnn(cmdp->crb.source_dde, dde_count, 0);
+	put32(cmdp->crb.source_dde, ddebc, srclen);
+	put64(cmdp->crb.source_dde, ddead, (uint64_t) src);
+
+	/* Target direct dde (scatter-gather list) */
+	clear_dde(cmdp->crb.target_dde);
+	putnn(cmdp->crb.target_dde, dde_count, 0);
+	put32(cmdp->crb.target_dde, ddebc, dstlen);
+	put64(cmdp->crb.target_dde, ddead, (uint64_t) dst);
+
+	/* Submit the crb, the job descriptor, to the accelerator */
+	return nxu_submit_job(cmdp, handle);
+}
+
+/*
+ * Prepares a blank no filename no timestamp gzip header and returns
+ * the number of bytes written to buf.
+ * Gzip specification at https://tools.ietf.org/html/rfc1952
+ */
+int gzip_header_blank(char *buf)
+{
+	int i = 0;
+
+	buf[i++] = 0x1f; /* ID1 */
+	buf[i++] = 0x8b; /* ID2 */
+	buf[i++] = 0x08; /* CM  */
+	buf[i++] = 0x00; /* FLG */
+	buf[i++] = 0x00; /* MTIME */
+	buf[i++] = 0x00; /* MTIME */
+	buf[i++] = 0x00; /* MTIME */
+	buf[i++] = 0x00; /* MTIME */
+	buf[i++] = 0x04; /* XFL 4=fastest */
+	buf[i++] = 0x03; /* OS UNIX */
+
+	return i;
+}
+
+/* Caller must free the allocated buffer return nonzero on error. */
+int read_alloc_input_file(char *fname, char **buf, size_t *bufsize)
+{
+	struct stat statbuf;
+	FILE *fp;
+	char *p;
+	size_t num_bytes;
+
+	if (stat(fname, &statbuf)) {
+		perror(fname);
+		return(-1);
+	}
+	fp = fopen(fname, "r");
+	if (fp == NULL) {
+		perror(fname);
+		return(-1);
+	}
+	assert(NULL != (p = (char *) malloc(statbuf.st_size)));
+	num_bytes = fread(p, 1, statbuf.st_size, fp);
+	if (ferror(fp) || (num_bytes != statbuf.st_size)) {
+		perror(fname);
+		return(-1);
+	}
+	*buf = p;
+	*bufsize = num_bytes;
+	return 0;
+}
+
+/* Returns nonzero on error */
+int write_output_file(char *fname, char *buf, size_t bufsize)
+{
+	FILE *fp;
+	size_t num_bytes;
+
+	fp = fopen(fname, "w");
+	if (fp == NULL) {
+		perror(fname);
+		return(-1);
+	}
+	num_bytes = fwrite(buf, 1, bufsize, fp);
+	if (ferror(fp) || (num_bytes != bufsize)) {
+		perror(fname);
+		return(-1);
+	}
+	fclose(fp);
+	return 0;
+}
+
+/*
+ * Z_SYNC_FLUSH as described in zlib.h.
+ * Returns number of appended bytes
+ */
+int append_sync_flush(char *buf, int tebc, int final)
+{
+	uint64_t flush;
+	int shift = (tebc & 0x7);
+
+	if (tebc > 0) {
+		/* Last byte is partially full */
+		buf = buf - 1;
+		*buf = *buf & (unsigned char) ((1<<tebc)-1);
+	} else
+		*buf = 0;
+	flush = ((0x1ULL & final) << shift) | *buf;
+	shift = shift + 3; /* BFINAL and BTYPE written */
+	shift = (shift <= 8) ? 8 : 16;
+	flush |= (0xFFFF0000ULL) << shift; /* Zero length block */
+	shift = shift + 32;
+	while (shift > 0) {
+		*buf++ = (unsigned char) (flush & 0xffULL);
+		flush = flush >> 8;
+		shift = shift - 8;
+	}
+	return(((tebc > 5) || (tebc == 0)) ? 5 : 4);
+}
+
+/*
+ * Final deflate block bit.  This call assumes the block
+ * beginning is byte aligned.
+ */
+static void set_bfinal(void *buf, int bfinal)
+{
+	char *b = buf;
+
+	if (bfinal)
+		*b = *b | (unsigned char) 0x01;
+	else
+		*b = *b & (unsigned char) 0xfe;
+}
+
+int compress_file(int argc, char **argv, void *handle)
+{
+	char *inbuf, *outbuf, *srcbuf, *dstbuf;
+	char outname[FNAME_MAX];
+	uint32_t srclen, dstlen;
+	uint32_t flushlen, chunk;
+	size_t inlen, outlen, dsttotlen, srctotlen;
+	uint32_t crc, spbc, tpbc, tebc;
+	int lzcounts = 0;
+	int cc;
+	int num_hdr_bytes;
+	struct nx_gzip_crb_cpb_t *cmdp;
+	uint32_t pagelen = 65536;
+	int fault_tries = NX_MAX_FAULTS;
+
+	cmdp = (void *)(uintptr_t)
+		aligned_alloc(sizeof(struct nx_gzip_crb_cpb_t),
+			      sizeof(struct nx_gzip_crb_cpb_t));
+
+	if (argc != 2) {
+		fprintf(stderr, "usage: %s <fname>\n", argv[0]);
+		exit(-1);
+	}
+	if (read_alloc_input_file(argv[1], &inbuf, &inlen))
+		exit(-1);
+	fprintf(stderr, "file %s read, %ld bytes\n", argv[1], inlen);
+
+	/* Generous output buffer for header/trailer */
+	outlen = 2 * inlen + 1024;
+
+	assert(NULL != (outbuf = (char *)malloc(outlen)));
+	nxu_touch_pages(outbuf, outlen, pagelen, 1);
+
+	/* Compress piecemeal in smallish chunks */
+	chunk = 1<<22;
+
+	/* Write the gzip header to the stream */
+	num_hdr_bytes = gzip_header_blank(outbuf);
+	dstbuf    = outbuf + num_hdr_bytes;
+	outlen    = outlen - num_hdr_bytes;
+	dsttotlen = num_hdr_bytes;
+
+	srcbuf    = inbuf;
+	srctotlen = 0;
+
+	/* Init the CRB, the coprocessor request block */
+	memset(&cmdp->crb, 0, sizeof(cmdp->crb));
+
+	/* Initial gzip crc32 */
+	put32(cmdp->cpb, in_crc, 0);
+
+	while (inlen > 0) {
+
+		/* Submit chunk size source data per job */
+		srclen = NX_MIN(chunk, inlen);
+		/* Supply large target in case data expands */
+		dstlen = NX_MIN(2*srclen, outlen);
+
+		/* Page faults are handled by the user code */
+
+		/* Fault-in pages; an improved code wouldn't touch so
+		 * many pages but would try to estimate the
+		 * compression ratio and adjust both the src and dst
+		 * touch amounts.
+		 */
+		nxu_touch_pages(cmdp, sizeof(struct nx_gzip_crb_cpb_t), pagelen,
+				1);
+		nxu_touch_pages(srcbuf, srclen, pagelen, 0);
+		nxu_touch_pages(dstbuf, dstlen, pagelen, 1);
+
+		cc = compress_fht_sample(
+			srcbuf, srclen,
+			dstbuf, dstlen,
+			lzcounts, cmdp, handle);
+
+		if (cc != ERR_NX_OK && cc != ERR_NX_TPBC_GT_SPBC &&
+		    cc != ERR_NX_TRANSLATION) {
+			fprintf(stderr, "nx error: cc= %d\n", cc);
+			exit(-1);
+		}
+
+		/* Page faults are handled by the user code */
+		if (cc == ERR_NX_TRANSLATION) {
+			NXPRT(fprintf(stderr, "page fault: cc= %d, ", cc));
+			NXPRT(fprintf(stderr, "try= %d, fsa= %08llx\n",
+				  fault_tries,
+				  (unsigned long long) cmdp->crb.csb.fsaddr));
+			fault_tries--;
+			if (fault_tries > 0) {
+				continue;
+			} else {
+				fprintf(stderr, "error: cannot progress; ");
+				fprintf(stderr, "too many faults\n");
+				exit(-1);
+			};
+		}
+
+		fault_tries = NX_MAX_FAULTS; /* Reset for the next chunk */
+
+		inlen     = inlen - srclen;
+		srcbuf    = srcbuf + srclen;
+		srctotlen = srctotlen + srclen;
+
+		/* Two possible locations for spbc depending on the function
+		 * code.
+		 */
+		spbc = (!lzcounts) ? get32(cmdp->cpb, out_spbc_comp) :
+			get32(cmdp->cpb, out_spbc_comp_with_count);
+		assert(spbc == srclen);
+
+		/* Target byte count */
+		tpbc = get32(cmdp->crb.csb, tpbc);
+		/* Target ending bit count */
+		tebc = getnn(cmdp->cpb, out_tebc);
+		NXPRT(fprintf(stderr, "compressed chunk %d ", spbc));
+		NXPRT(fprintf(stderr, "to %d bytes, tebc= %d\n", tpbc, tebc));
+
+		if (inlen > 0) { /* More chunks to go */
+			set_bfinal(dstbuf, 0);
+			dstbuf    = dstbuf + tpbc;
+			dsttotlen = dsttotlen + tpbc;
+			outlen    = outlen - tpbc;
+			/* Round up to the next byte with a flush
+			 * block; do not set the BFINAqL bit.
+			 */
+			flushlen  = append_sync_flush(dstbuf, tebc, 0);
+			dsttotlen = dsttotlen + flushlen;
+			outlen    = outlen - flushlen;
+			dstbuf    = dstbuf + flushlen;
+			NXPRT(fprintf(stderr, "added sync_flush %d bytes\n",
+					flushlen));
+		} else {  /* Done */
+			/* Set the BFINAL bit of the last block per Deflate
+			 * specification.
+			 */
+			set_bfinal(dstbuf, 1);
+			dstbuf    = dstbuf + tpbc;
+			dsttotlen = dsttotlen + tpbc;
+			outlen    = outlen - tpbc;
+		}
+
+		/* Resuming crc32 for the next chunk */
+		crc = get32(cmdp->cpb, out_crc);
+		put32(cmdp->cpb, in_crc, crc);
+		crc = be32toh(crc);
+	}
+
+	/* Append crc32 and ISIZE to the end */
+	memcpy(dstbuf, &crc, 4);
+	memcpy(dstbuf+4, &srctotlen, 4);
+	dsttotlen = dsttotlen + 8;
+	outlen    = outlen - 8;
+
+	assert(FNAME_MAX > (strlen(argv[1]) + strlen(FEXT)));
+	strcpy(outname, argv[1]);
+	strcat(outname, FEXT);
+	if (write_output_file(outname, outbuf, dsttotlen)) {
+		fprintf(stderr, "write error: %s\n", outname);
+		exit(-1);
+	}
+
+	fprintf(stderr, "compressed %ld to %ld bytes total, ", srctotlen,
+		dsttotlen);
+	fprintf(stderr, "crc32 checksum = %08x\n", crc);
+
+	if (inbuf != NULL)
+		free(inbuf);
+
+	if (outbuf != NULL)
+		free(outbuf);
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int rc;
+	struct sigaction act;
+	void *handle;
+
+	nx_dbg = 0;
+	nx_gzip_log = NULL;
+	act.sa_handler = 0;
+	act.sa_sigaction = nxu_sigsegv_handler;
+	act.sa_flags = SA_SIGINFO;
+	act.sa_restorer = 0;
+	sigemptyset(&act.sa_mask);
+	sigaction(SIGSEGV, &act, NULL);
+
+	handle = nx_function_begin(NX_FUNC_COMP_GZIP, 0);
+	if (!handle) {
+		fprintf(stderr, "Unable to init NX, errno %d\n", errno);
+		exit(-1);
+	}
+
+	rc = compress_file(argc, argv, handle);
+
+	nx_function_end(handle);
+
+	return rc;
+}
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c b/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c
new file mode 100644
index 000000000000..e96b073ca2e5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Copyright 2020 IBM Corp.
+ *
+ * Author: Bulent Abali <abali@us.ibm.com>
+ *
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/fcntl.h>
+#include <sys/mman.h>
+#include <endian.h>
+#include <bits/endian.h>
+#include <sys/ioctl.h>
+#include <assert.h>
+#include <errno.h>
+#include <signal.h>
+#include "nx-gzip.h"
+#include "nx.h"
+#include "copy-paste.h"
+#include "nxu.h"
+#include "nx_dbg.h"
+#include <sys/platform/ppc.h>
+
+#define barrier()
+#define hwsync()    ({ asm volatile("sync" ::: "memory"); })
+
+#ifndef NX_NO_CPU_PRI
+#define cpu_pri_default()  ({ asm volatile ("or 2, 2, 2"); })
+#define cpu_pri_low()      ({ asm volatile ("or 31, 31, 31"); })
+#else
+#define cpu_pri_default()
+#define cpu_pri_low()
+#endif
+
+void *nx_fault_storage_address;
+
+struct nx_handle {
+	int fd;
+	int function;
+	void *paste_addr;
+};
+
+static int open_device_nodes(char *devname, int pri, struct nx_handle *handle)
+{
+	int rc, fd;
+	void *addr;
+	struct vas_gzip_setup_attr txattr;
+
+	fd = open(devname, O_RDWR);
+	if (fd < 0) {
+		fprintf(stderr, " open device name %s\n", devname);
+		return -errno;
+	}
+
+	memset(&txattr, 0, sizeof(txattr));
+	txattr.version = 1;
+	txattr.vas_id = pri;
+	rc = ioctl(fd, VAS_GZIP_TX_WIN_OPEN, (unsigned long)&txattr);
+	if (rc < 0) {
+		fprintf(stderr, "ioctl() n %d, error %d\n", rc, errno);
+		rc = -errno;
+		goto out;
+	}
+
+	addr = mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0ULL);
+	if (addr == MAP_FAILED) {
+		fprintf(stderr, "mmap() failed, errno %d\n", errno);
+		rc = -errno;
+		goto out;
+	}
+	handle->fd = fd;
+	handle->paste_addr = (void *)((char *)addr + 0x400);
+
+	rc = 0;
+out:
+	close(fd);
+	return rc;
+}
+
+void *nx_function_begin(int function, int pri)
+{
+	int rc;
+	char *devname = "/dev/crypto/nx-gzip";
+	struct nx_handle *nxhandle;
+
+	if (function != NX_FUNC_COMP_GZIP) {
+		errno = EINVAL;
+		fprintf(stderr, " NX_FUNC_COMP_GZIP not found\n");
+		return NULL;
+	}
+
+
+	nxhandle = malloc(sizeof(*nxhandle));
+	if (!nxhandle) {
+		errno = ENOMEM;
+		fprintf(stderr, " No memory\n");
+		return NULL;
+	}
+
+	nxhandle->function = function;
+	rc = open_device_nodes(devname, pri, nxhandle);
+	if (rc < 0) {
+		errno = -rc;
+		fprintf(stderr, " open_device_nodes failed\n");
+		return NULL;
+	}
+
+	return nxhandle;
+}
+
+int nx_function_end(void *handle)
+{
+	int rc = 0;
+	struct nx_handle *nxhandle = handle;
+
+	rc = munmap(nxhandle->paste_addr - 0x400, 4096);
+	if (rc < 0) {
+		fprintf(stderr, "munmap() failed, errno %d\n", errno);
+		return rc;
+	}
+	close(nxhandle->fd);
+	free(nxhandle);
+
+	return rc;
+}
+
+static int nx_wait_for_csb(struct nx_gzip_crb_cpb_t *cmdp)
+{
+	long poll = 0;
+	uint64_t t;
+
+	/* Save power and let other threads use the h/w. top may show
+	 * 100% but only because OS doesn't know we slowed the this
+	 * h/w thread while polling. We're letting other threads have
+	 * higher throughput on the core.
+	 */
+	cpu_pri_low();
+
+#define CSB_MAX_POLL 200000000UL
+#define USLEEP_TH     300000UL
+
+	t = __ppc_get_timebase();
+
+	while (getnn(cmdp->crb.csb, csb_v) == 0) {
+		++poll;
+		hwsync();
+
+		cpu_pri_low();
+
+		/* usleep(0) takes around 29000 ticks ~60 us.
+		 * 300000 is spinning for about 600 us then
+		 * start sleeping.
+		 */
+		if ((__ppc_get_timebase() - t) > USLEEP_TH) {
+			cpu_pri_default();
+			usleep(1);
+		}
+
+		if (poll > CSB_MAX_POLL)
+			break;
+
+		/* Fault address from signal handler */
+		if (nx_fault_storage_address) {
+			cpu_pri_default();
+			return -EAGAIN;
+		}
+
+	}
+
+	cpu_pri_default();
+
+	/* hw has updated csb and output buffer */
+	hwsync();
+
+	/* Check CSB flags. */
+	if (getnn(cmdp->crb.csb, csb_v) == 0) {
+		fprintf(stderr, "CSB still not valid after %d polls.\n",
+			(int) poll);
+		prt_err("CSB still not valid after %d polls, giving up.\n",
+			(int) poll);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int nxu_run_job(struct nx_gzip_crb_cpb_t *cmdp, void *handle)
+{
+	int i, ret, retries;
+	struct nx_handle *nxhandle = handle;
+
+	assert(handle != NULL);
+	i = 0;
+	retries = 5000;
+	while (i++ < retries) {
+		hwsync();
+		vas_copy(&cmdp->crb, 0);
+		ret = vas_paste(nxhandle->paste_addr, 0);
+		hwsync();
+
+		NXPRT(fprintf(stderr, "Paste attempt %d/%d returns 0x%x\n",
+				i, retries, ret));
+
+		if ((ret == 2) || (ret == 3)) {
+
+			ret = nx_wait_for_csb(cmdp);
+			if (!ret) {
+				goto out;
+			} else if (ret == -EAGAIN) {
+				long x;
+
+				prt_err("Touching address %p, 0x%lx\n",
+					 nx_fault_storage_address,
+					 *(long *) nx_fault_storage_address);
+				x = *(long *) nx_fault_storage_address;
+				*(long *) nx_fault_storage_address = x;
+				nx_fault_storage_address = 0;
+				continue;
+			} else {
+				prt_err("wait_for_csb() returns %d\n", ret);
+				break;
+			}
+		} else {
+			if (i < 10) {
+				/* spin for few ticks */
+#define SPIN_TH 500UL
+				uint64_t fail_spin;
+
+				fail_spin = __ppc_get_timebase();
+				while ((__ppc_get_timebase() - fail_spin) <
+					 SPIN_TH)
+					;
+			} else {
+				/* sleep */
+				unsigned int pr = 0;
+
+				if (pr++ % 100 == 0) {
+					prt_err("Paste attempt %d/", i);
+					prt_err("%d, failed pid= %d\n", retries,
+						getpid());
+				}
+				usleep(1);
+			}
+			continue;
+		}
+	}
+
+out:
+	cpu_pri_default();
+
+	return ret;
+}
+
+int nxu_submit_job(struct nx_gzip_crb_cpb_t *cmdp, void *handle)
+{
+	int cc;
+
+	cc = nxu_run_job(cmdp, handle);
+
+	if (!cc)
+		cc = getnn(cmdp->crb.csb, csb_cc);      /* CC Table 6-8 */
+
+	return cc;
+}
+
+
+void nxu_sigsegv_handler(int sig, siginfo_t *info, void *ctx)
+{
+	fprintf(stderr, "%d: Got signal %d si_code %d, si_addr %p\n", getpid(),
+		sig, info->si_code, info->si_addr);
+
+	nx_fault_storage_address = info->si_addr;
+}
+
+/*
+ * Fault in pages prior to NX job submission.  wr=1 may be required to
+ * touch writeable pages.  System zero pages do not fault-in the page as
+ * intended.  Typically set wr=1 for NX target pages and set wr=0 for NX
+ * source pages.
+ */
+int nxu_touch_pages(void *buf, long buf_len, long page_len, int wr)
+{
+	char *begin = buf;
+	char *end = (char *) buf + buf_len - 1;
+	volatile char t;
+
+	assert(buf_len >= 0 && !!buf);
+
+	NXPRT(fprintf(stderr, "touch %p %p len 0x%lx wr=%d\n", buf,
+			(buf + buf_len), buf_len, wr));
+
+	if (buf_len <= 0 || buf == NULL)
+		return -1;
+
+	do {
+		t = *begin;
+		if (wr)
+			*begin = t;
+		begin = begin + page_len;
+	} while (begin < end);
+
+	/* When buf_sz is small or buf tail is in another page */
+	t = *end;
+	if (wr)
+		*end = t;
+
+	return 0;
+}
+
-- 
2.21.0

