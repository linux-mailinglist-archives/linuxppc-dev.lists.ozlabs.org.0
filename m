Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6731E195485
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:55:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pcfK3XBdzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:55:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pcc958YfzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 20:53:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SvKGr6ff; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48pcc94bPCz9sSH; Fri, 27 Mar 2020 20:53:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48pcc93v4dz9sSM; Fri, 27 Mar 2020 20:53:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585302793;
 bh=5AActQ/kCGdpnvXw7uxEsr9DcrSOl9MyxSOgktcNbgE=;
 h=From:To:Cc:Subject:Date:From;
 b=SvKGr6ff0jTmE2YZrfDVforTRGJaLf3Y9AQYLQJE7MPuQFSBpRe3DHLaL6HwuTOcO
 tGEOmwy0c514DG5DOQyXh08zpZOvadgS8DUpABjVBIceuGXpXOfl0Q1n3SI8CFx58o
 q9h/4z67pl8tkn4kMFf7knyzPpVa4GJl15LeCk0dbal6BeA72OoETeJyISAsBONhCo
 lUypuy+8+D8kWxUZa/q8LphyDMUIA3GyXKuu3vf7u5C7hT01cotCpKUrdNYXo89ulV
 lDWbMcMZgPtDmeRloA9F68h5WLcVSWIUSSDmtGlKp7e133xs6PAKbRt7B8GoF2E6F7
 yp1K2W5wYzEoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix try-run when source tree is not
 writable
Date: Fri, 27 Mar 2020 20:53:19 +1100
Message-Id: <20200327095319.2347641-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: harish@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We added a usage of try-run to pmu/ebb/Makefile to detect if the
toolchain supported the -no-pie option.

This fails if we build out-of-tree and the source tree is not
writable, as try-run tries to write its temporary files to the current
directory. That leads to the -no-pie option being silently dropped,
which leads to broken executables with some toolchains.

If we remove the redirect to /dev/null in try-run, we see the error:

  make[3]: Entering directory '/linux/tools/testing/selftests/powerpc/pmu/ebb'
  /usr/bin/ld: cannot open output file .54.tmp: Read-only file system
  collect2: error: ld returned 1 exit status
  make[3]: Nothing to be done for 'all'.

And looking with strace we see it's trying to use a file that's in the
source tree:

  lstat("/linux/tools/testing/selftests/powerpc/pmu/ebb/.54.tmp", 0x7ffffc0f83c8)

We can fix it by setting TMPOUT to point to the $(OUTPUT) directory,
and we can verify with strace it's now trying to write to the output
directory:

  lstat("/output/kselftest/powerpc/pmu/ebb/.54.tmp", 0x7fffd1bf6bf8)

And also see that the -no-pie option is now correctly detected.

Fixes: 0695f8bca93e ("selftests/powerpc: Handle Makefile for unrecognized option")
Cc: stable@vger.kernel.org # v5.5+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/pmu/ebb/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
index 417306353e07..ca35dd8848b0 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
@@ -7,6 +7,7 @@ include ../../../../../../scripts/Kbuild.include
 # The EBB handler is 64-bit code and everything links against it
 CFLAGS += -m64
 
+TMPOUT = $(OUTPUT)/
 # Toolchains may build PIE by default which breaks the assembly
 no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
         $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)

base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
prerequisite-patch-id: e460261e180666bfb63bcd0cc554874d73c3b71f
prerequisite-patch-id: 67db368cfdf8d3aefd78f140420281f9b4b53e07
prerequisite-patch-id: cf5d957a366998b4a3ce70a79b6e969eb98fca7d
prerequisite-patch-id: 3ace935c6ae425ad635eb38f906e790c3c9bf41f
-- 
2.25.1

