Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F24D6A053B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 10:51:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMpFL1ZRyz3cXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:51:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pxNV593L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pxNV593L;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMpDP4tpxz3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 20:50:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9238BB818F9;
	Thu, 23 Feb 2023 09:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D17C433EF;
	Thu, 23 Feb 2023 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677145824;
	bh=6+RS3vKNtOBH6Iix7VuTmtdw51WghGYeiUtoXdjfsao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxNV593LF5ua2oXpyWhWw1CF8jqDWKRzFCBzYfUwdPB1+9vcs6TD9K2SlZipxjpQB
	 kV9faWEzrhPUEdIgV4eq1gA6XRO9nQrFwQ5KdKWOiyXk8WAIxeNisp8BiVE0gT9p4h
	 n5hwQSUaA3nqHXumhYz3HIspsumEAftd2BDgXNvU=
Date: Thu, 23 Feb 2023 10:50:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Subject: Re: [PATCH 5.4 v2 1/6] x86, vmlinux.lds: Add RUNTIME_DISCARD_EXIT to
 generic DISCARDS
Message-ID: <Y/c23lnfn42s5uCC@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-4-v2-0-a56d1e0f5e98@oracle.com>
 <20230210-tsaeger-upstream-linux-stable-5-4-v2-1-a56d1e0f5e98@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-stable-5-4-v2-1-a56d1e0f5e98@oracle.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>, Naresh Kamboju <naresh.kamboju@linaro.org>, Borislav Petkov <bp@suse.de>, linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "H.J. Lu" <hjl.tools@gmail.com>, Nathan Chancellor <nathan@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 10, 2023 at 01:20:22PM -0700, Tom Saeger wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> commit 84d5f77fc2ee4e010c2c037750e32f06e55224b0 upstream.
> 
> In the x86 kernel, .exit.text and .exit.data sections are discarded at
> runtime, not by the linker. Add RUNTIME_DISCARD_EXIT to generic DISCARDS
> and define it in the x86 kernel linker script to keep them.
> 
> The sections are added before the DISCARD directive so document here
> only the situation explicitly as this change doesn't have any effect on
> the generated kernel. Also, other architectures like ARM64 will use it
> too so generalize the approach with the RUNTIME_DISCARD_EXIT define.
> 
>  [ bp: Massage and extend commit message. ]
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Link: https://lkml.kernel.org/r/20200326193021.255002-1-hjl.tools@gmail.com
> Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
> ---
>  arch/x86/kernel/vmlinux.lds.S     |  1 +
>  include/asm-generic/vmlinux.lds.h | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 1afe211d7a7c..0ae3cd9a25ea 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -21,6 +21,7 @@
>  #define LOAD_OFFSET __START_KERNEL_map
>  #endif
>  
> +#define RUNTIME_DISCARD_EXIT
>  #include <asm-generic/vmlinux.lds.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/thread_info.h>

Does this backport look correct from a style point-of-view?

Hint, extra blank line needed after the define, like what is done in the
original...

thanks,

greg k-h
