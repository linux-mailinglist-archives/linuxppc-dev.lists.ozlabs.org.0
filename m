Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2465EB21
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 13:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nnmcx5sptz3c7M
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 23:54:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g71kuVDg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g71kuVDg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nnmc23t5Gz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 23:53:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A22F619BA;
	Thu,  5 Jan 2023 12:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3C7C433D2;
	Thu,  5 Jan 2023 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672923198;
	bh=VujAjppGrk2JW5m7MoxBtVdY6jxQWPUUBXxD5lb2bF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g71kuVDgBmjey+uN7ku3+6GFxEp/7s+bySOKBV4eWkXRRzrjhvtQUnGEk9g3jARrY
	 J3VeqjXgpP2hcxLrxW7rpIW1TQlUsVP++hJ/lmDaY0X18WcWvjFsl81/IDlkBr0JUG
	 J3J8PUTFtaJb9ms+sQl5/HIkK9uQx7ijyJLf3TtRFZvtGu5E8dlwZSl3OLjkK4FFJb
	 ElgeGiUHdjnGBo8vMftab2ojd6/i0ImmD7jy5Q/sDWPZg3kvlu+SMpLgAE6DGhrNQz
	 q79Mq3Px105yJEYKacBPbivphJJYLsVvEioxgk/a1zbizOmbSpiO1zBZXEkeeG2kPP
	 OUmgjRbYy4TpA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 12FAE40468; Thu,  5 Jan 2023 09:53:16 -0300 (-03)
Date: Thu, 5 Jan 2023 09:53:16 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix bpf-script-test-prologue test compile
 issue with clang
Message-ID: <Y7bIPIVx9Y7agt7L@kernel.org>
References: <20230105120436.92051-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105120436.92051-1-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Jan 05, 2023 at 05:34:36PM +0530, Athira Rajeev escreveu:
> While running perf test for bpf, observed that "BPF prologue
> generation" test case fails to compile with clang. Logs below
> from powerpc:
> 
> <stdin>:33:2: error: use of undeclared identifier 'fmode_t'
>         fmode_t f_mode = (fmode_t)_f_mode;
>         ^
> <stdin>:37:6: error: use of undeclared identifier 'f_mode'; did you mean '_f_mode'?
>         if (f_mode & FMODE_WRITE)
>             ^~~~~~
>             _f_mode
> <stdin>:30:60: note: '_f_mode' declared here
> int bpf_func__null_lseek(void *ctx, int err, unsigned long _f_mode,
>                                                            ^
> 2 errors generated.

Thanks for fixing this, I noticed the problem but didn't got around to
investigate it.

Tested and applied.

- Arnaldo
 
> The test code tests/bpf-script-test-prologue.c uses fmode_t.
> And the error above is for "fmode_t" which is defined in
> include/linux/types.h as part of kernel build directory:
> "/lib/modules/<kernel_version>/build" that comes from
> kernel devel [ soft link to /usr/src/<kernel_version> ].
> Clang picks this header file from "-working-directory" build
> option that specifies this build folder.
> 
> But the 'commit 14e4b9f4289a ("perf trace: Raw augmented
> syscalls fix libbpf 1.0+ compatibility")', changed the
> include directory to use: "/usr/include".  Post this change,
> types.h from /usr/include/ is getting picked upwhich doesn’t
> contain definition of "fmode_t" and hence fails to compile.
> 
> Compilation command before this commit:
> /usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=72 -DLINUX_VERSION_CODE=0x50e00 -xc  -I/root/lib/perf/include/bpf -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h  -Wno-unused-value -Wno-pointer-sign -working-directory /lib/modules/<ver>/build -c - -target bpf  -g -O2 -o -
> 
> Compilation command after this commit:
> /usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=72 -DLINUX_VERSION_CODE=0x50e00 -xc  -I/usr/include/ -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h  -Wno-unused-value -Wno-pointer-sign -working-directory /lib/modules/<ver>/build -c - -target bpf  -g -O2 -o -
> 
> The difference is addition of -I/usr/include/  in the first line
> which is causing the error. Fix this by adding typedef for "fmode_t"
> in the testcase to solve the compile issue.
> 
> Fixes: 14e4b9f4289a ("perf trace: Raw augmented syscalls fix libbpf 1.0+ compatibility")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/bpf-script-test-prologue.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/tests/bpf-script-test-prologue.c b/tools/perf/tests/bpf-script-test-prologue.c
> index bd83d364cf30..91778b5c6125 100644
> --- a/tools/perf/tests/bpf-script-test-prologue.c
> +++ b/tools/perf/tests/bpf-script-test-prologue.c
> @@ -20,6 +20,8 @@
>  # undef if
>  #endif
>  
> +typedef unsigned int __bitwise fmode_t;
> +
>  #define FMODE_READ		0x1
>  #define FMODE_WRITE		0x2
>  
> -- 
> 2.31.1

-- 

- Arnaldo
