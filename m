Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23D7C8F3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 23:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aXumTPL9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6ft40t4Zz3vZS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 08:34:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aXumTPL9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6fqF3ztsz30hj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 08:32:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DCDF621EC;
	Fri, 13 Oct 2023 21:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 548FDC433A9;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697232741;
	bh=e+Ii4Jz/e0lFXLWb9J9vPCarPuvwq3VipikHD1zpxyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aXumTPL9cMu+XKLWHJHOUxM2r2jvUJoiLgZ02v/6racKpFGymCUcqKj2Ah6z/gXN6
	 noh211Qr27ESHxo5DIswYsVMSkiYilEkksmjZf2gv2bQgpydF75lO+Oy/obQ7r8TS9
	 7ygFQH1vpTzUHiLjhj6V6V9d2A03TtJfw/X5wfawte+Aczl5ud1rdm7A5tK4BZR9LF
	 9tSPUtXU4Q7im1u3gl7QQYUygZNLCo4vE6rK8AyzPQZBIUR0IF7dqZ/faYKMGSa5NZ
	 W09EfGJ1yITiupde4QMzkmzfSAF9d4KCZPO5t6INtmPHvf2+ZZQjFeKeZIs7Sg3qiV
	 OuwZ9zkmyhhZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F95CDB483;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 13 Oct 2023 16:32:13 -0500
Subject: [PATCH v2 6/7] powerpc/selftests: add test for papr-vpd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231013-papr-sys_rtas-vs-lockdown-v2-6-ead01ce01722@linux.ibm.com>
References:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
In-Reply-To:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697232739; l=10584;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=NHTAOdQW5erScDgaHK7f5w7DhHSgpFw0i389SEeShsg=;
 b=AuLYjTdVxuPpUs5ILkcgiZBnN5erYlzdIMHk3jdnE9JoWhTokXWtnspALInFHMJwzKNYC9twL
 QRmms/kMSqTDQx9Oa31Lv4K3i54PHFBeld1VNoN2C/uOjcGH9QIu9Fd
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add selftests for /dev/papr-vpd, exercising the common expected use
cases:

* Retrieve all VPD by passing an empty location code.
* Retrieve the "system VPD" by passing a location code derived from DT
  root node properties, as done by the vpdupdate command.

The tests also verify that certain intended properties of the driver
hold:

* Passing an unterminated location code to PAPR_VPD_CREATE_HANDLE gets
  EINVAL.
* Passing a NULL location code pointer to PAPR_VPD_CREATE_HANDLE gets
  EFAULT.
* Closing the device node without first issuing a
  PAPR_VPD_CREATE_HANDLE command to it succeeds.
* Releasing a handle without first consuming any data from it
  succeeds.
* Re-reading the contents of a handle returns the same data as the
  first time.

Some minimal validation of the returned data is performed.

The tests are skipped on systems where the papr-vpd driver does not
initialize, making this useful only on PowerVM LPARs at this point.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile           |   1 +
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 352 +++++++++++++++++++++
 4 files changed, 366 insertions(+)

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 49f2ad1793fd..7de972612786 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -32,6 +32,7 @@ SUB_DIRS = alignment		\
 	   vphn         \
 	   math		\
 	   papr_attributes	\
+	   papr_vpd		\
 	   ptrace	\
 	   security	\
 	   mce
diff --git a/tools/testing/selftests/powerpc/papr_vpd/.gitignore b/tools/testing/selftests/powerpc/papr_vpd/.gitignore
new file mode 100644
index 000000000000..49285031a656
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_vpd/.gitignore
@@ -0,0 +1 @@
+/papr_vpd
diff --git a/tools/testing/selftests/powerpc/papr_vpd/Makefile b/tools/testing/selftests/powerpc/papr_vpd/Makefile
new file mode 100644
index 000000000000..06b719703bfd
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_vpd/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+noarg:
+	$(MAKE) -C ../
+
+TEST_GEN_PROGS := papr_vpd
+
+top_srcdir = ../../../../..
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
+
+$(OUTPUT)/papr_vpd: CFLAGS += $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
new file mode 100644
index 000000000000..98cbb9109ee6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <asm/papr-vpd.h>
+
+#include "utils.h"
+
+#define DEVPATH "/dev/papr-vpd"
+
+static int dev_papr_vpd_open_close(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int dev_papr_vpd_get_handle_all(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	struct papr_location_code lc = { .str = "", };
+	off_t size;
+	int fd;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(errno != 0);
+	FAIL_IF(fd < 0);
+
+	FAIL_IF(close(devfd) != 0);
+
+	size = lseek(fd, 0, SEEK_END);
+	FAIL_IF(size <= 0);
+
+	void *buf = malloc((size_t)size);
+	FAIL_IF(!buf);
+
+	ssize_t consumed = pread(fd, buf, size, 0);
+	FAIL_IF(consumed != size);
+
+	/* Ensure EOF */
+	FAIL_IF(read(fd, buf, size) != 0);
+	FAIL_IF(close(fd));
+
+	/* Verify that the buffer looks like VPD */
+	static const char needle[] = "System VPD";
+	FAIL_IF(!memmem(buf, size, needle, strlen(needle)));
+
+	return 0;
+}
+
+static int dev_papr_vpd_get_handle_byte_at_a_time(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	struct papr_location_code lc = { .str = "", };
+	int fd;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(errno != 0);
+	FAIL_IF(fd < 0);
+
+	FAIL_IF(close(devfd) != 0);
+
+	size_t consumed = 0;
+	while (1) {
+		ssize_t res;
+		char c;
+
+		errno = 0;
+		res = read(fd, &c, sizeof(c));
+		FAIL_IF(res > sizeof(c));
+		FAIL_IF(res < 0);
+		FAIL_IF(errno != 0);
+		consumed += res;
+		if (res == 0)
+			break;
+	}
+
+	FAIL_IF(consumed != lseek(fd, 0, SEEK_END));
+
+	FAIL_IF(close(fd));
+
+	return 0;
+}
+
+
+static int dev_papr_vpd_unterm_loc_code(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	struct papr_location_code lc = {};
+	int fd;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	/*
+	 * Place a non-null byte in every element of loc_code; the
+	 * driver should reject this input.
+	 */
+	memset(lc.str, 'x', ARRAY_SIZE(lc.str));
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(fd != -1);
+	FAIL_IF(errno != EINVAL);
+
+	FAIL_IF(close(devfd) != 0);
+	return 0;
+}
+
+static int dev_papr_vpd_null_handle(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	int rc;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	rc = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, NULL);
+	FAIL_IF(rc != -1);
+	FAIL_IF(errno != EFAULT);
+
+	FAIL_IF(close(devfd) != 0);
+	return 0;
+}
+
+static int papr_vpd_close_handle_without_reading(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	struct papr_location_code lc;
+	int fd;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(errno != 0);
+	FAIL_IF(fd < 0);
+
+	/* close the handle without reading it */
+	FAIL_IF(close(fd) != 0);
+
+	FAIL_IF(close(devfd) != 0);
+	return 0;
+}
+
+static int papr_vpd_reread(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+	struct papr_location_code lc = { .str = "", };
+	int fd;
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(errno != 0);
+	FAIL_IF(fd < 0);
+
+	FAIL_IF(close(devfd) != 0);
+
+	const off_t size = lseek(fd, 0, SEEK_END);
+	FAIL_IF(size <= 0);
+
+	char *bufs[2];
+
+	for (size_t i = 0; i < ARRAY_SIZE(bufs); ++i) {
+		bufs[i] = malloc(size);
+		FAIL_IF(!bufs[i]);
+		ssize_t consumed = pread(fd, bufs[i], size, 0);
+		FAIL_IF(consumed != size);
+	}
+
+	FAIL_IF(memcmp(bufs[0], bufs[1], size));
+
+	FAIL_IF(close(fd) != 0);
+
+	return 0;
+}
+
+static int get_system_loc_code(struct papr_location_code *lc)
+{
+	static const char system_id_path[] = "/sys/firmware/devicetree/base/system-id";
+	static const char model_path[] = "/sys/firmware/devicetree/base/model";
+	char *system_id;
+	char *model;
+	int err = -1;
+
+	if (read_file_alloc(model_path, &model, NULL))
+		return err;
+
+	if (read_file_alloc(system_id_path, &system_id, NULL))
+		goto free_model;
+
+	char *mtm;
+	int sscanf_ret = sscanf(model, "IBM,%ms", &mtm);
+	if (sscanf_ret != 1)
+		goto free_system_id;
+
+	char *plant_and_seq;
+	if (sscanf(system_id, "IBM,%*c%*c%ms", &plant_and_seq) != 1)
+		goto free_mtm;
+	/*
+	 * Replace - with . to build location code.
+	 */
+	char *sep = strchr(mtm, '-');
+	if (!sep)
+		goto free_mtm;
+	else
+		*sep = '.';
+
+	snprintf(lc->str, sizeof(lc->str),
+		 "U%s.%s", mtm, plant_and_seq);
+	err = 0;
+
+	free(plant_and_seq);
+free_mtm:
+	free(mtm);
+free_system_id:
+	free(system_id);
+free_model:
+	free(model);
+	return err;
+}
+
+static int papr_vpd_system_loc_code(void)
+{
+	struct papr_location_code lc;
+	const int devfd = open(DEVPATH, O_RDONLY);
+	off_t size;
+	int fd;
+
+	SKIP_IF_MSG(get_system_loc_code(&lc),
+		    "Cannot determine system location code");
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	errno = 0;
+	fd = ioctl(devfd, PAPR_VPD_IOC_CREATE_HANDLE, &lc);
+	FAIL_IF(errno != 0);
+	FAIL_IF(fd < 0);
+
+	FAIL_IF(close(devfd) != 0);
+
+	size = lseek(fd, 0, SEEK_END);
+	FAIL_IF(size <= 0);
+
+	void *buf = malloc((size_t)size);
+	FAIL_IF(!buf);
+
+	ssize_t consumed = pread(fd, buf, size, 0);
+	FAIL_IF(consumed != size);
+
+	/* Ensure EOF */
+	FAIL_IF(read(fd, buf, size) != 0);
+	FAIL_IF(close(fd));
+
+	/* Verify that the buffer looks like VPD */
+	static const char needle[] = "System VPD";
+	FAIL_IF(!memmem(buf, size, needle, strlen(needle)));
+
+	return 0;
+}
+
+struct vpd_test {
+	int (*function)(void);
+	const char *description;
+};
+
+static const struct vpd_test vpd_tests[] = {
+	{
+		.function = dev_papr_vpd_open_close,
+		.description = "open/close " DEVPATH,
+	},
+	{
+		.function = dev_papr_vpd_unterm_loc_code,
+		.description = "ensure EINVAL on unterminated location code",
+	},
+	{
+		.function = dev_papr_vpd_null_handle,
+		.description = "ensure EFAULT on bad handle addr",
+	},
+	{
+		.function = dev_papr_vpd_get_handle_all,
+		.description = "get handle for all VPD"
+	},
+	{
+		.function = papr_vpd_close_handle_without_reading,
+		.description = "close handle without consuming VPD"
+	},
+	{
+		.function = dev_papr_vpd_get_handle_byte_at_a_time,
+		.description = "read all VPD one byte at a time"
+	},
+	{
+		.function = papr_vpd_reread,
+		.description = "ensure re-read yields same results"
+	},
+	{
+		.function = papr_vpd_system_loc_code,
+		.description = "get handle for system VPD"
+	},
+};
+
+int main(void)
+{
+	size_t fails = 0;
+
+	for (size_t i = 0; i < ARRAY_SIZE(vpd_tests); ++i) {
+		const struct vpd_test *t = &vpd_tests[i];
+
+		if (test_harness(t->function, t->description))
+			++fails;
+	}
+
+	return fails == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
+}

-- 
2.41.0

