Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BF3F5E63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 14:49:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv87N4xH6z2yV4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 22:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iPkOuMY2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iPkOuMY2; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv86h5h4Pz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 22:48:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gv86Y0n5Dz9sW8;
 Tue, 24 Aug 2021 22:48:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629809301;
 bh=NExqkuTHd0k6NpHo96VYURFCcgje+xKujpFjugDRlHA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iPkOuMY2LPbLVcOe0buCmZdbj62dNYbqge4aXZIpkm2u+Hl9Mew/nV2r9PZYGra1J
 ZcEcy9gCmRwmO5Dr2fuMs3Q36WW8LxQ49J3nf2PaV6MQDe6ZaYNruc8av5Ww1kWfB4
 u6/FiBvSMdCYG8eyQxV0nYQ+nAIwR9Eph+raDRKv5P8V6G9a/+7EUg1yljVr1uD3PY
 9YPXY+HdhdD9ozxc1UwHph+FKj3zlHPMSM1mTw8W108L5F8ZbeiEfci57VDU5Z521o
 f5iPohomn3tsSxm2eZDhNXme/Fkr49LawSANAsgrWUZGJDcucxO7kwxbVooNyGXkm3
 l+ru1k9x4wqRg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add test for real address
 error handling
In-Reply-To: <20210805092025.272871-2-ganeshgr@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <20210805092025.272871-2-ganeshgr@linux.ibm.com>
Date: Tue, 24 Aug 2021 22:48:17 +1000
Message-ID: <87a6l7c8ku.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> Add test for real address or control memory address access
> error handling, using NX-GZIP engine.
>
> The error is injected by accessing the control memory address
> using illegal instruction, on successful handling the process
> attempting to access control memory address using illegal
> instruction receives SIGBUS.
...

> diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
> new file mode 100755
> index 000000000000..3633cdc651a1
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +if [[ ! -w /dev/crypto/nx-gzip ]]; then
> +	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
> +	exit 0
> +fi
> +
> +timeout 5 ./inject-ra-err
> +
> +# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
> +if [ $? -ne 135 ]; then
> +	echo "FAILED: Real address or Control memory access error not handled"
> +	exit $?
> +fi
> +
> +echo "OK: Real address or Control memory access error is handled"
> +exit 0

I don't think we really need the shell script, we should be able to do
all that in the C code.

Can you try this?

cheers

diff --git a/tools/testing/selftests/powerpc/mce/Makefile b/tools/testing/selftests/powerpc/mce/Makefile
new file mode 100644
index 000000000000..2424513982d9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/Makefile
@@ -0,0 +1,7 @@
+#SPDX-License-Identifier: GPL-2.0-or-later
+
+TEST_GEN_PROGS := inject-ra-err
+
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): ../harness.c
diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
new file mode 100644
index 000000000000..ba0f9c28f786
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "vas-api.h"
+#include "utils.h"
+
+static bool faulted;
+
+static void sigbus_handler(int n, siginfo_t *info, void *ctxt_v)
+{
+	ucontext_t *ctxt = (ucontext_t *)ctxt_v;
+	struct pt_regs *regs = ctxt->uc_mcontext.regs;
+
+	faulted = true;
+	regs->nip += 4;
+}
+
+static int test_ra_error(void)
+{
+	struct vas_tx_win_open_attr attr;
+	int fd, *paste_addr;
+	char *devname = "/dev/crypto/nx-gzip";
+	struct sigaction act = {
+		.sa_sigaction = sigbus_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	memset(&attr, 0, sizeof(attr));
+	attr.version = 1;
+	attr.vas_id = 0;
+
+	SKIP_IF(!access(devname, F_OK));
+
+	fd = open(devname, O_RDWR);
+	FAIL_IF(fd < 0);
+	FAIL_IF(ioctl(fd, VAS_TX_WIN_OPEN, &attr) < 0);
+	FAIL_IF(sigaction(SIGBUS, &act, NULL) != 0);
+
+	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
+
+	/* The following assignment triggers exception */
+	mb();
+	*paste_addr = 1;
+	mb();
+
+	FAIL_IF(!faulted);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_ra_error, "inject-ra-err");
+}
