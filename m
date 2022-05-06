Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90351E1A8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 00:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw5Jb0yrcz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8d3OOqM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c8d3OOqM; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw5J02KmFz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 08:45:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E7B7616FE;
 Fri,  6 May 2022 22:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0507C385A9;
 Fri,  6 May 2022 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651877131;
 bh=ftQi9qulEY2Jbu8EVZNt2L7N4exOH1BNtakTytErLyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8d3OOqMGXj57v4mi+9T4R02tGJd+aIpFoPUq1lqiKNoidczMWLbMRGQHKRaqxEDb
 3iar4mxH9WpOaj+4EFGsZFgsrMl4Nv28WRylquof1j76ehM95x7wvKGXEzugGX0aUU
 o7cFkxS9vIYv/2cBM5QeE32yx9Lec7fw/pJvbdkna+mYV15ezSV487sy6eTtQbqVVp
 mpya6rWs3lYSY0H2tJaoWp4dV4mrxtsDMH6POX7AhX5ivnT/Mc5eYCQNQkhPk30Vvi
 AGBNyp4l9x8+gUIW6Q2Iz1L+Ds6Db3DRBK+xMurkRKps68aO5G1dO6DiVKnTJTxTYp
 JmZdd9U6zUszA==
Date: Fri, 6 May 2022 15:45:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 00/15] kbuild: yet another series of cleanups
 (modpost, LTO, MODULE_REL_CRCS)
Message-ID: <YnWlCH2tfr5YMb1/@dev-arch.thelio-3990X>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

On Thu, May 05, 2022 at 04:22:29PM +0900, Masahiro Yamada wrote:
> 
> This is the third batch of cleanups in this development cycle.
> 
> Major changes in v3:
> 
>  - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.
> 
> Major changes in v2:
> 
>  - V1 did not work with CONFIG_MODULE_REL_CRCS.
>    I fixed this for v2.
> 
>  - Reflect some review comments in v1
> 
>  - Refactor the code more
> 
>  - Avoid too long argument error
> 
> 
> Masahiro Yamada (15):
>   modpost: mitigate false-negatives for static EXPORT_SYMBOL checks
>   modpost: change the license of EXPORT_SYMBOL to bool type
>   modpost: merge add_{intree_flag,retpoline,staging_flag} to add_header
>   modpost: move *.mod.c generation to write_mod_c_files()
>   kbuild: generate a list of objects in vmlinux
>   kbuild: record symbol versions in *.cmd files
>   modpost: extract symbol versions from *.cmd files
>   kbuild: link symbol CRCs at final link, removing
>     CONFIG_MODULE_REL_CRCS
>   kbuild: stop merging *.symversions
>   genksyms: adjust the output format to modpost
>   kbuild: do not create *.prelink.o for Clang LTO or IBT
>   modpost: simplify the ->is_static initialization
>   modpost: use hlist for hash table implementation
>   kbuild: make built-in.a rule robust against too long argument error
>   kbuild: make *.mod rule robust against too long argument error

I merged this series into mainline and tested an Arch Linux
x86_64 configuration and Fedora aarch64 configuration with ThinLTO and
saw no new warnings or issues. Modules loaded just fine in QEMU for Arch
Linux and I did not notice any boot issues or warnings.

Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
