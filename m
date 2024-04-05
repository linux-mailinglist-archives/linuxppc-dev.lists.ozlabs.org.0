Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B5899EAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 15:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=to1pdbBV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB0Bz1yZRz3vY1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 00:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=to1pdbBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::aa; helo=out-170.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [IPv6:2001:41d0:1004:224b::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB0BF6z62z3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 00:45:57 +1100 (AEDT)
Date: Fri, 5 Apr 2024 15:45:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712324729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4RFDfJ7+IIu/IqKGXhFsFLXS8k2AzT/NEimt9VnkMQ=;
	b=to1pdbBV8dK2yU5zVpKempfOFm/Fsjfb+cw/HsUr3hfwZjiG3sNmZcqoMC+7WTVXq0P2Gg
	V9cZzwS7D9vU9P/igbCt5i1xqa7yXWKJVKMvLwKj+N1bkLZ6eiPghwgsxhC5oaGebqMkQ9
	5d5A7HhDebwBukyBdL4QtErbnSR2uFE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v8 13/35] doc: start documentation
 directory with unittests.cfg doc
Message-ID: <20240405-c177544d7b41fbfa047420a6@orel>
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-14-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405083539.374995-14-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 05, 2024 at 06:35:14PM +1000, Nicholas Piggin wrote:
> Consolidate unittests.cfg documentation in one place.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/unittests.cfg     | 26 ++-----------
>  docs/unittests.txt    | 89 +++++++++++++++++++++++++++++++++++++++++++
>  powerpc/unittests.cfg | 25 ++----------
>  riscv/unittests.cfg   | 26 ++-----------
>  s390x/unittests.cfg   | 18 ++-------
>  x86/unittests.cfg     | 26 ++-----------
>  6 files changed, 107 insertions(+), 103 deletions(-)
>  create mode 100644 docs/unittests.txt

This is really nice. I only found one thing, which I point out below.

> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index fe601cbb1..54cedea28 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -1,28 +1,10 @@
>  ##############################################################################
>  # unittest configuration
>  #
> -# [unittest_name]
> -# file = <name>.flat		# Name of the flat file to be used.
> -# smp  = <num>			# Number of processors the VM will use
> -#				# during this test. Use $MAX_SMP to use
> -#				# the maximum the host supports. Defaults
> -#				# to one.
> -# extra_params = -append <params...>	# Additional parameters used.
> -# arch = arm|arm64			# Select one if the test case is
> -#					# specific to only one.
> -# groups = <group_name1> <group_name2> ...	# Used to identify test cases
> -#						# with run_tests -g ...
> -#						# Specify group_name=nodefault
> -#						# to have test not run by
> -#						# default
> -# accel = kvm|tcg		# Optionally specify if test must run with
> -#				# kvm or tcg. If not specified, then kvm will
> -#				# be used when available.
> -# timeout = <duration>		# Optionally specify a timeout.
> -# check = <path>=<value> # check a file for a particular value before running
> -#                        # a test. The check line can contain multiple files
> -#                        # to check separated by a space but each check
> -#                        # parameter needs to be of the form <path>=<value>
> +# arm specifics:
> +#
> +# file = <name>.flat            # arm uses .flat files
> +# arch = arm|arm64
>  ##############################################################################
>  
>  #
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> new file mode 100644
> index 000000000..53e02077c
> --- /dev/null
> +++ b/docs/unittests.txt
> @@ -0,0 +1,89 @@
> +unittests
> +*********
> +
> +run_tests.sh is driven by the <arch>/unittests.cfg file. That file defines
> +test cases by specifying an executable (target image) under the <arch>/
> +directory, and how to run it. This way, for example, a single file can
> +provide multiple test cases by being run with different host configurations
> +and/or different parameters passed to it.
> +
> +Detailed output from run_tests.sh unit tests are stored in files under
> +the logs/ directory.
> +
> +unittests.cfg format
> +====================
> +
> +# is the comment symbol, all following contents of the line is ignored.
> +
> +Each unit test is defined as with a [unit-test-name] line, followed by

s/ as//

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew
