Return-Path: <linuxppc-dev+bounces-2911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B029BEC6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk55q0kQtz30Ns;
	Thu,  7 Nov 2024 00:05:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730898303;
	cv=none; b=XGMjAqzWIE9IjIH87dn5IF9FslwNL9E+eqh1Tf0tYHQvvGDOYByOKpithICiKrof9UXPET2fz+HyDPLHerVgSw57nLAS4ZLh/FXrU8JLIilfl/7sq3HhKTKuLiRysMEAG7AWvvRxDkUa+hEIgAOl7DZDgkn5Sa6YQn+LeJLU53EmNbC9Rapw+yUrZwgbu6hFD1n0Ak3JZNIIL50pfbffTu2PhKr20+cPbivkW4U75pBCCeHvojBGVrU/5jyp3s4GhepsCh4XOTaC3yT5j9Lq6CVKeWhhK6PjpLAL6PJ4jCSrhOmTsRrPG81NtHEoab7x2C6HTZFIc6A+D8UvmVYHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730898303; c=relaxed/relaxed;
	bh=WfU8i/z+2ZqvHHntsfTG/VnP0MHf+Z8XIKjhNPJ5fWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHt78IT3eJWEmLAItMUYx5V71LGNM0vdCi4/cO3RDaXY/DXSPfI4vxw4AnAaTKd2tdzSxYGTx4nyzwAEFZMhYWFTQ3Kq17VgAJHGbJ4lW9+TKiUGwrXAM5WrHR2PGk9cXextNPdBYRQpdgurN8FiRX951jlFtTR7FhwX4QJvlmi5eNWzNRQROsfSIsXTVJFoETiUI5arLEFVZXIfOmdtVp8RVyX1Nw+2+eT+6GJtz6uPf0hlJzsnOlC9BeVWGhOOlUqrYMEGxT3l5sWp6Z59dxmXtIU1PFGCdGmCv6KgYgjNBH/DGw2LrrR3VVKjyHSsPJY8cvzmOl/vOUz2ncsdOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iWVeUSPc; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iWVeUSPc;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk55p25JGz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:05:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730898299;
	bh=WfU8i/z+2ZqvHHntsfTG/VnP0MHf+Z8XIKjhNPJ5fWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWVeUSPcHVe9oorAhYOt8dSN9TztcXYRACyYt3LwYLcH+4Pdl0eK9IC9iUWpZnoRV
	 WQlr2umv/GZntTiD91nbsgKzL5/Qzv6Qy4fQDIe6c+O9nEGmyNiHOjV0gF2DNuKlTY
	 eBFC4AQux0Hc04NQWNdxbad0loOnTc8aFpI28rr+yTbathxda62hwVD75SuI1tEMXY
	 1DrrbXxsoCjNMiQXaJ1W9HcadUTq8ZwutrK0dmq+jpKVvRQPJD086OnB78p5V/18E2
	 feqtbrEdVXkzWxHdSidN5SZKtHNFBqUkpftzIhZQWWzd8IaYSws1iqpPw5dF8wqbXV
	 BdZWj3It4zkLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk55l5jxnz4xPQ;
	Thu,  7 Nov 2024 00:04:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kselftest@vger.kernel.org>
Subject: [PATCH 2/5] selftests/powerpc: Give all tests 2 minutes timeout
Date: Thu,  7 Nov 2024 00:04:50 +1100
Message-ID: <20241106130453.1741013-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106130453.1741013-1-mpe@ellerman.id.au>
References: <20241106130453.1741013-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Each of the powerpc selftests runs with a timeout of 2 minutes by
default (see tools/testing/selftests/powerpc/harness.c).

But when tests are run with run_kselftest.sh it uses a timeout of 45
seconds, meaning some tests run OK standalone but fail when run with the
test runner.

So tell run_kselftest.sh to give each test 130 seconds, that should
allow the tests to complete, or be killed by the powerpc test harness
after 2 minutes. If for some reason the harness fails, or for the few
tests that don't use the harness, the 130 second timeout should catch
them if they get stuck.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/alignment/settings       | 1 +
 tools/testing/selftests/powerpc/cache_shape/settings     | 1 +
 tools/testing/selftests/powerpc/copyloops/settings       | 1 +
 tools/testing/selftests/powerpc/dexcr/settings           | 1 +
 tools/testing/selftests/powerpc/dscr/settings            | 1 +
 tools/testing/selftests/powerpc/lib/settings             | 1 +
 tools/testing/selftests/powerpc/math/settings            | 1 +
 tools/testing/selftests/powerpc/mce/settings             | 1 +
 tools/testing/selftests/powerpc/mm/settings              | 1 +
 tools/testing/selftests/powerpc/nx-gzip/settings         | 1 +
 tools/testing/selftests/powerpc/papr_attributes/settings | 1 +
 tools/testing/selftests/powerpc/papr_sysparm/settings    | 1 +
 tools/testing/selftests/powerpc/papr_vpd/settings        | 1 +
 tools/testing/selftests/powerpc/pmu/settings             | 1 +
 tools/testing/selftests/powerpc/primitives/settings      | 1 +
 tools/testing/selftests/powerpc/ptrace/settings          | 1 +
 tools/testing/selftests/powerpc/scripts/settings         | 1 +
 tools/testing/selftests/powerpc/security/settings        | 1 +
 tools/testing/selftests/powerpc/stringloops/settings     | 1 +
 tools/testing/selftests/powerpc/switch_endian/settings   | 1 +
 tools/testing/selftests/powerpc/syscalls/settings        | 1 +
 tools/testing/selftests/powerpc/vphn/settings            | 1 +
 22 files changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/alignment/settings
 create mode 100644 tools/testing/selftests/powerpc/cache_shape/settings
 create mode 100644 tools/testing/selftests/powerpc/copyloops/settings
 create mode 100644 tools/testing/selftests/powerpc/dexcr/settings
 create mode 100644 tools/testing/selftests/powerpc/dscr/settings
 create mode 100644 tools/testing/selftests/powerpc/lib/settings
 create mode 100644 tools/testing/selftests/powerpc/math/settings
 create mode 100644 tools/testing/selftests/powerpc/mce/settings
 create mode 100644 tools/testing/selftests/powerpc/mm/settings
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_sysparm/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_vpd/settings
 create mode 100644 tools/testing/selftests/powerpc/pmu/settings
 create mode 100644 tools/testing/selftests/powerpc/primitives/settings
 create mode 100644 tools/testing/selftests/powerpc/ptrace/settings
 create mode 100644 tools/testing/selftests/powerpc/scripts/settings
 create mode 100644 tools/testing/selftests/powerpc/security/settings
 create mode 100644 tools/testing/selftests/powerpc/stringloops/settings
 create mode 100644 tools/testing/selftests/powerpc/switch_endian/settings
 create mode 100644 tools/testing/selftests/powerpc/syscalls/settings
 create mode 100644 tools/testing/selftests/powerpc/vphn/settings

diff --git a/tools/testing/selftests/powerpc/alignment/settings b/tools/testing/selftests/powerpc/alignment/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/alignment/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/cache_shape/settings b/tools/testing/selftests/powerpc/cache_shape/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/cache_shape/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/copyloops/settings b/tools/testing/selftests/powerpc/copyloops/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/copyloops/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/dexcr/settings b/tools/testing/selftests/powerpc/dexcr/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/dscr/settings b/tools/testing/selftests/powerpc/dscr/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dscr/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/lib/settings b/tools/testing/selftests/powerpc/lib/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/lib/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/math/settings b/tools/testing/selftests/powerpc/math/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/math/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/mce/settings b/tools/testing/selftests/powerpc/mce/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/mm/settings b/tools/testing/selftests/powerpc/mm/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/nx-gzip/settings b/tools/testing/selftests/powerpc/nx-gzip/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/papr_attributes/settings b/tools/testing/selftests/powerpc/papr_attributes/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_attributes/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/papr_sysparm/settings b/tools/testing/selftests/powerpc/papr_sysparm/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/papr_vpd/settings b/tools/testing/selftests/powerpc/papr_vpd/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_vpd/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/pmu/settings b/tools/testing/selftests/powerpc/pmu/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/primitives/settings b/tools/testing/selftests/powerpc/primitives/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/ptrace/settings b/tools/testing/selftests/powerpc/ptrace/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/ptrace/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/scripts/settings b/tools/testing/selftests/powerpc/scripts/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/scripts/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/security/settings b/tools/testing/selftests/powerpc/security/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/stringloops/settings b/tools/testing/selftests/powerpc/stringloops/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/stringloops/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/switch_endian/settings b/tools/testing/selftests/powerpc/switch_endian/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/switch_endian/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/syscalls/settings b/tools/testing/selftests/powerpc/syscalls/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/syscalls/settings
@@ -0,0 +1 @@
+timeout=130
diff --git a/tools/testing/selftests/powerpc/vphn/settings b/tools/testing/selftests/powerpc/vphn/settings
new file mode 100644
index 000000000000..2e8566183318
--- /dev/null
+++ b/tools/testing/selftests/powerpc/vphn/settings
@@ -0,0 +1 @@
+timeout=130
-- 
2.47.0


