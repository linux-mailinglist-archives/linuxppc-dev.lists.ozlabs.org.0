Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0962BD52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 04:35:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CdH412gNzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 12:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CdFT0hhszDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 12:33:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45CdFL2nBkz9s3l;
 Tue, 28 May 2019 12:33:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Brauner <christian@brauner.io>, viro@zeniv.linux.org.uk,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, torvalds@linux-foundation.org, fweimer@redhat.com
Subject: Re: [PATCH v2 2/2] tests: add close_range() tests
In-Reply-To: <20190523154747.15162-3-christian@brauner.io>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-3-christian@brauner.io>
Date: Tue, 28 May 2019 12:33:41 +1000
Message-ID: <8736kzqpdm.fsf@concordia.ellerman.id.au>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, ldv@altlinux.org,
 dhowells@redhat.com, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 Christian Brauner <christian@brauner.io>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 oleg@redhat.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Brauner <christian@brauner.io> writes:
> This adds basic tests for the new close_range() syscall.
> - test that no invalid flags can be passed
> - test that a range of file descriptors is correctly closed
> - test that a range of file descriptors is correctly closed if there there
>   are already closed file descriptors in the range
> - test that max_fd is correctly capped to the current fdtable maximum
>
> Signed-off-by: Christian Brauner <christian@brauner.io>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jann Horn <jannh@google.com>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Dmitry V. Levin <ldv@altlinux.org>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Florian Weimer <fweimer@redhat.com>
> Cc: linux-api@vger.kernel.org
> ---
> v1: unchanged
> v2:
> - Christian Brauner <christian@brauner.io>:
>   - verify that close_range() correctly closes a single file descriptor
> ---
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/core/.gitignore       |   1 +
>  tools/testing/selftests/core/Makefile         |   6 +
>  .../testing/selftests/core/close_range_test.c | 142 ++++++++++++++++++
>  4 files changed, 150 insertions(+)
>  create mode 100644 tools/testing/selftests/core/.gitignore
>  create mode 100644 tools/testing/selftests/core/Makefile
>  create mode 100644 tools/testing/selftests/core/close_range_test.c
>
> diff --git a/tools/testing/selftests/core/.gitignore b/tools/testing/selftests/core/.gitignore
> new file mode 100644
> index 000000000000..6e6712ce5817
> --- /dev/null
> +++ b/tools/testing/selftests/core/.gitignore
> @@ -0,0 +1 @@
> +close_range_test
> diff --git a/tools/testing/selftests/core/Makefile b/tools/testing/selftests/core/Makefile
> new file mode 100644
> index 000000000000..de3ae68aa345
> --- /dev/null
> +++ b/tools/testing/selftests/core/Makefile
> @@ -0,0 +1,6 @@
> +CFLAGS += -g -I../../../../usr/include/ -I../../../../include

Your second -I pulls the unexported kernel headers in, userspace
programs shouldn't include unexported kernel headers.

It breaks the build on powerpc with eg:

  powerpc64le-linux-gnu-gcc -g -I../../../../usr/include/ -I../../../../include    close_range_test.c  -o /output/kselftest/core/close_range_test
  In file included from /usr/powerpc64le-linux-gnu/include/bits/fcntl-linux.h:346,
                   from /usr/powerpc64le-linux-gnu/include/bits/fcntl.h:62,
                   from /usr/powerpc64le-linux-gnu/include/fcntl.h:35,
                   from close_range_test.c:5:
  ../../../../include/linux/falloc.h:13:2: error: unknown type name '__s16'
    __s16  l_type;
    ^~~~~


Did you do that on purpose or just copy it from one of the other
Makefiles? :)

If you're just wanting to get the syscall number when the headers
haven't been exported, I think the best solution is to do eg:

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index d6e6079d3d53..34c6f02f25de 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -14,6 +14,10 @@

 #include "../kselftest.h"

+#ifndef __NR_close_range
+#define __NR_close_range       435
+#endif
+
 static inline int sys_close_range(unsigned int fd, unsigned int max_fd,
                                  unsigned int flags)
 {


cheers
