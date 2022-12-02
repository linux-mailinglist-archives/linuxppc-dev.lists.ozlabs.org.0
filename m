Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0D640578
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 12:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNqpz1gc7z3bbX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 22:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q8lIMESf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNqp027QMz3bNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 22:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q8lIMESf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNqp00nknz4x2c;
	Fri,  2 Dec 2022 22:04:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669979064;
	bh=dPGUWdiET8VZ8KvCbL64c02UhsXFltcWaVcuoyS4+yo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q8lIMESf5gq7qNWMJa8GQxVZR200aGM9plf5zaedjn243ZRSNQGtul6+HTGiK5byk
	 dgTtBdH7G/EEo0kUv0Tbn05k7c4kpWfTbGYHlzROeSDwFnyag9uRybs7WZWg2K1wmZ
	 Mpca5dCPW2AvfqMhLX801tf2Y/T6RrEph2LcmcGheesB1/hHdcAWVwralXwU2VT8/U
	 9ZUaa/DlIzC+UjnyfiUkNjOM5nDRKmw5MsgdUYSGg5Zqns4oFops9iIXTz34ODVFqL
	 7o5dLG5FXrxxw+BBuhc6dWWYQefbY4WeY9TmzN2dJ9If82Kdoj0SvgnQJLTdNMhc0J
	 2Ihr0KhgeFA2A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/7] selftests/powerpc: Add generic read/write file util
In-Reply-To: <20221128041948.58339-4-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
 <20221128041948.58339-4-bgray@linux.ibm.com>
Date: Fri, 02 Dec 2022 22:04:20 +1100
Message-ID: <87iliu12yz.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> File read/write is reimplemented in about 5 different ways in the
> various PowerPC selftests. This indicates it should be a common util.
>
> Add a common read_file / write_file implementation and convert users
> to it where (easily) possible.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/dscr/dscr.h   |  36 ++----
>  .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  19 +--
>  .../testing/selftests/powerpc/include/utils.h |   2 +
>  .../selftests/powerpc/nx-gzip/gzfht_test.c    |  49 +++-----
>  tools/testing/selftests/powerpc/pmu/lib.c     |  27 +----
>  .../selftests/powerpc/ptrace/core-pkey.c      |  30 ++---
>  tools/testing/selftests/powerpc/utils.c       | 108 ++++++++++--------
>  7 files changed, 107 insertions(+), 164 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
> index b703714e7d98..9a69d473ffdf 100644
> --- a/tools/testing/selftests/powerpc/dscr/dscr.h
> +++ b/tools/testing/selftests/powerpc/dscr/dscr.h
> @@ -64,48 +64,30 @@ inline void set_dscr_usr(unsigned long val)
>  /* Default DSCR access */
>  unsigned long get_default_dscr(void)
>  {
> -	int fd = -1, ret;
> -	char buf[16];
> +	int err;
> +	char buf[16] = {0};
>  	unsigned long val;
>  
> -	if (fd == -1) {
> -		fd = open(DSCR_DEFAULT, O_RDONLY);
> -		if (fd == -1) {
> -			perror("open() failed");
> -			exit(1);
> -		}
> -	}
> -	memset(buf, 0, sizeof(buf));
> -	lseek(fd, 0, SEEK_SET);
> -	ret = read(fd, buf, sizeof(buf));
> -	if (ret == -1) {
> -		perror("read() failed");
> +	if ((err = read_file(DSCR_DEFAULT, buf, sizeof(buf) - 1, NULL))) {
> +		fprintf(stderr, "get_default_dscr() read failed: %s\n", strerror(err));

I don't particularly like doing the assignment to err in the if.

And checkpatch flags it as an error, which means even if we did like it
we'd be setting ourselves up for a stream of fixup patches :)

So please just do the assignment and the if separately.

cheers
