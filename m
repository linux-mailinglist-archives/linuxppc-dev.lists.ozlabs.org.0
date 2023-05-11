Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7396FEA21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 05:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGxz42Ttrz3fPn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 13:22:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NJNN2mxn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGxy94DpGz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 13:21:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NJNN2mxn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QGxy40qx8z4x2c;
	Thu, 11 May 2023 13:21:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683775292;
	bh=9VphvYDUUTpJa6Y51rDbdnX2+VZhjxsrx/SPIlypOzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NJNN2mxnfu/5QYe7146XafzWTY72GFa0FBjWrl2NLrxKyugO0NAVfnvefKNqSd6pa
	 yQzeAxhIemK5n1/e0B8WFeiOUkigosZGcXEkcK8l8kQ1qQNk/OQ+4+PdoZoVutNUq9
	 mFkl2ewnLvfRjTL9efoWJN5c14AkgYpUrfyPElVTvbpr1OCax+7l8CPQkZUET5fBE4
	 F488/tp145G5ISsXEhhYnOw7qJ/ZbGXVDqj45X75FmW0Ifq6CcdC0EH4JPwMlatPi1
	 COCqhjngty6kkF+aWLnfOykGPX2ig66VE9Wvld7fRyrnldUEGBEihtrS6EaG3QRXWi
	 7BQRutfI41uWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v13 3/3] selftests: Add selftests for cachestat
In-Reply-To: <20230503013608.2431726-4-nphamcs@gmail.com>
References: <20230503013608.2431726-1-nphamcs@gmail.com>
 <20230503013608.2431726-4-nphamcs@gmail.com>
Date: Thu, 11 May 2023 13:21:28 +1000
Message-ID: <877ctfa6yv.fsf@mail.lhotse>
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
Cc: linux-api@vger.kernel.org, bfoster@redhat.com, kernel-team@meta.com, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nhat Pham <nphamcs@gmail.com> writes:
> Test cachestat on a newly created file, /dev/ files, and /proc/ files.
> Also test on a shmem file (which can also be tested with huge pages
> since tmpfs supports huge pages).
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
...
> diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
> new file mode 100644
> index 000000000000..c3823b809c25
> --- /dev/null
> +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +
> +#include <stdio.h>
> +#include <stdbool.h>
> +#include <linux/kernel.h>
> +#include <linux/mman.h>
> +#include <sys/mman.h>
> +#include <sys/shm.h>
> +#include <sys/syscall.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +
> +#include "../kselftest.h"
> +
> +static const char * const dev_files[] = {
> +	"/dev/zero", "/dev/null", "/dev/urandom",
> +	"/proc/version", "/proc"
> +};
> +static const int cachestat_nr = 451;
> +
> +void print_cachestat(struct cachestat *cs)
> +{
> +	ksft_print_msg(
> +	"Using cachestat: Cached: %lu, Dirty: %lu, Writeback: %lu, Evicted: %lu, Recently Evicted: %lu\n",
> +	cs->nr_cache, cs->nr_dirty, cs->nr_writeback,
> +	cs->nr_evicted, cs->nr_recently_evicted);
> +}
> +
> +bool write_exactly(int fd, size_t filesize)
> +{
> +	char data[filesize];

On kernels with 64K pages (powerpc at least), this tries to allocate
64MB on the stack which segfaults.

Allocating data with malloc avoids the problem and allows the test to
pass.

Looks like this commit is still in mm-unstable, so maybe Andrew can
squash the incremental diff below in, if it looks OK to you. The diff is
a bit big because I unindented the body of the function.

cheers


diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index 9be2262e5c17..54d09b820ed4 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -31,48 +31,59 @@ void print_cachestat(struct cachestat *cs)
 
 bool write_exactly(int fd, size_t filesize)
 {
-	char data[filesize];
-	bool ret = true;
 	int random_fd = open("/dev/urandom", O_RDONLY);
+	char *cursor, *data;
+	int remained;
+	bool ret;
 
 	if (random_fd < 0) {
 		ksft_print_msg("Unable to access urandom.\n");
 		ret = false;
 		goto out;
-	} else {
-		int remained = filesize;
-		char *cursor = data;
+	}
 
-		while (remained) {
-			ssize_t read_len = read(random_fd, cursor, remained);
+	data = malloc(filesize);
+	if (!data) {
+		ksft_print_msg("Unable to allocate data.\n");
+		ret = false;
+		goto close_random_fd;
+	}
 
-			if (read_len <= 0) {
-				ksft_print_msg("Unable to read from urandom.\n");
-				ret = false;
-				goto close_random_fd;
-			}
+	remained = filesize;
+	cursor = data;
 
-			remained -= read_len;
-			cursor += read_len;
+	while (remained) {
+		ssize_t read_len = read(random_fd, cursor, remained);
+
+		if (read_len <= 0) {
+			ksft_print_msg("Unable to read from urandom.\n");
+			ret = false;
+			goto out_free_data;
 		}
 
-		/* write random data to fd */
-		remained = filesize;
-		cursor = data;
-		while (remained) {
-			ssize_t write_len = write(fd, cursor, remained);
+		remained -= read_len;
+		cursor += read_len;
+	}
 
-			if (write_len <= 0) {
-				ksft_print_msg("Unable write random data to file.\n");
-				ret = false;
-				goto close_random_fd;
-			}
+	/* write random data to fd */
+	remained = filesize;
+	cursor = data;
+	while (remained) {
+		ssize_t write_len = write(fd, cursor, remained);
 
-			remained -= write_len;
-			cursor += write_len;
+		if (write_len <= 0) {
+			ksft_print_msg("Unable write random data to file.\n");
+			ret = false;
+			goto out_free_data;
 		}
+
+		remained -= write_len;
+		cursor += write_len;
 	}
 
+	ret = true;
+out_free_data:
+	free(data);
 close_random_fd:
 	close(random_fd);
 out:

