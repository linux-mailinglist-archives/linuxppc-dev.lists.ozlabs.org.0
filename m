Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985D5EDE85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 16:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcz4q0kqmz3c99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 00:14:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qSzEA7zz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qSzEA7zz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcz476RjDz3bhy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 00:13:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43E9161E91;
	Wed, 28 Sep 2022 14:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C94DC433C1;
	Wed, 28 Sep 2022 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664374402;
	bh=DnDj6xo2uXE9wXOwp1tWVhvS3P4pfwaANrNc0vZzYlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSzEA7zzNiYIIlvk6hPoMYO5gQY8+ZbwthLj1NZSL3TYRB3k/EFB1ajt7KRUR2LV1
	 1/oOeOKqfPHQpI6AufmjLstwmCnr7gOCnGydt5BAcnVAFAR2olzouUUZ8Kp4L7tLcz
	 mDBgjUPS3iBiil3Z42YDxyG6fRh7EOKBN8vTkZF0ynoU5mf9Z/m8RJsAdeR8rQI9va
	 brro43iU3u+8uopH7jA26UOtYW09rafxasrL6cyg5x/CMiepK37fv74BFfvNIVJYbj
	 NMp0a3wQ0+lyqH5+ShGeQt6FtxQAjFNovswirJ6yHV9arZBSVUv466eNI40xwSGDta
	 Isddzz+om8OIQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 03044405F0; Wed, 28 Sep 2022 11:13:20 -0300 (-03)
Date: Wed, 28 Sep 2022 11:13:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Update is_ignored_symbol function in
 vmlinux-kallsyms test
Message-ID: <YzRWfxsvfeK38CZN@kernel.org>
References: <20220928045218.37322-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928045218.37322-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Sep 28, 2022 at 10:22:18AM +0530, Athira Rajeev escreveu:
> The testcase “vmlinux-kallsyms.c” fails in powerpc.
> 
> 	vmlinux symtab matches kallsyms: FAILED!

Thanks, applied.

- Arnaldo

 
> This test look at the symbols in the vmlinux DSO
> and check if we find all of them in the kallsyms dso.
> But from the powerpc logs , observed that the failure
> happens for:
> 	ERR : 0xc0000000000fe9c8: .Lmfspr_table not on kallsyms
> 	ERR : 0xc0000000001009c8: .Lmtspr_table not on kallsyms
> 
> These are labels ( with .L) in the source code and
> has to be ignored. Reference code with .Lmtspr_table:
> arch/powerpc/xmon/spr_access.S
> 
> The testcases invokes is_ignored_symbol() function to
> ignore hidden symbols in the dso like local symbols. This
> function is adapted from is_ignored_symbol() kernel
> function in code: scripts/kallsyms.c . The kernel
> function got some updates which is not reflected in
> the testcase function and the new updates also handles
> ignoring "labels".
> 
> Below is the changes that went in the kernel function.
> 
> 	 /* Symbol names that begin with the following are ignored.*/
> 	 static const char * const ignored_prefixes[] = {
> 	 		"$",			/* local symbols for ARM, MIPS, etc. */
> 	-		".LASANPC",		/* s390 kasan local symbols */
> 	+		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
> 	 		"__crc_",		/* modversions */
> 	 		"__efistub_",		/* arm64 EFI stub namespace */
> 	-		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
> 	+		"__kvm_nvhe_$",		/* arm64 local symbols in non-VHE KVM namespace */
> 	+		"__kvm_nvhe_.L",	/* arm64 local symbols in non-VHE KVM namespace */
> 	 		"__AArch64ADRPThunk_",	/* arm64 lld */
> 	 		"__ARMV5PILongThunk_",	/* arm lld */
> 	 		"__ARMV7PILongThunk_",
> 
> This change is part of below commits and will handle the
> symbols with “.L”
> 
> commit d4c858643263 ("kallsyms: ignore all local labels prefixed
> by '.L'")
> commit 6ccf9cb557bd ("KVM: arm64: Symbolize the nVHE HYP addresses")
> 
> Update the testcase function to include the new
> changes.
> 
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/vmlinux-kallsyms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/tests/vmlinux-kallsyms.c b/tools/perf/tests/vmlinux-kallsyms.c
> index 4fd8d703ff19..8ab035b55875 100644
> --- a/tools/perf/tests/vmlinux-kallsyms.c
> +++ b/tools/perf/tests/vmlinux-kallsyms.c
> @@ -43,10 +43,11 @@ static bool is_ignored_symbol(const char *name, char type)
>  	/* Symbol names that begin with the following are ignored.*/
>  	static const char * const ignored_prefixes[] = {
>  		"$",			/* local symbols for ARM, MIPS, etc. */
> -		".LASANPC",		/* s390 kasan local symbols */
> +		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
>  		"__crc_",		/* modversions */
>  		"__efistub_",		/* arm64 EFI stub namespace */
> -		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
> +		"__kvm_nvhe_$",		/* arm64 local symbols in non-VHE KVM namespace */
> +		"__kvm_nvhe_.L",	/* arm64 local symbols in non-VHE KVM namespace */
>  		"__AArch64ADRPThunk_",	/* arm64 lld */
>  		"__ARMV5PILongThunk_",	/* arm lld */
>  		"__ARMV7PILongThunk_",
> -- 
> 2.31.1

-- 

- Arnaldo
