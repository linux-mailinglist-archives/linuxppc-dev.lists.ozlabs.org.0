Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91BC2FA7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 11:07:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jD1n0kxgzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 19:07:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=will@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NiMkUD4E"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jCzp6R9JzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 19:05:58 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A4D8205F4;
 Tue,  1 Oct 2019 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569920756;
 bh=JRJjwuTCLks0eTr+fTI0jHF7WDR7bCyYfOCyezjDUU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NiMkUD4EMfYhkUFgPPXqTXTSigYXcehiFZXr4ob1nkn4XKixJIOt4mWuwY67wbOYS
 lN0AGvUo98AhTsltpUiBCpglj9Jd6heH+2IlkTUxYH/l4z8+PrtKKVnnqbVdR1hNNA
 TdN/lHE0WF4MNGKjk+62gB67mLRgJS+UueJWkATI=
Date: Tue, 1 Oct 2019 10:05:50 +0100
From: Will Deacon <will@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 14/29] vmlinux.lds.h: Allow EXCEPTION_TABLE to live in
 RO_DATA
Message-ID: <20191001090549.xxbqarn36unvowrm@willie-the-truck>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-15-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-15-keescook@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 26, 2019 at 10:55:47AM -0700, Kees Cook wrote:
> Many architectures have an EXCEPTION_TABLE that needs only to be
> read-only. As such, it should live in RO_DATA. This creates a macro to
> identify this case for the architectures that can move EXCEPTION_TABLE
> into RO_DATA.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index d57a28786bb8..35a6cba39d9f 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -69,6 +69,17 @@
>  #define NOTES_HEADERS_RESTORE
>  #endif
>  
> +/*
> + * Some architectures have non-executable read-only exception tables.
> + * They can be added to the RO_DATA segment by specifying their desired
> + * alignment.
> + */
> +#ifdef RO_DATA_EXCEPTION_TABLE_ALIGN
> +#define RO_DATA_EXCEPTION_TABLE	EXCEPTION_TABLE(RO_DATA_EXCEPTION_TABLE_ALIGN)
> +#else
> +#define RO_DATA_EXCEPTION_TABLE
> +#endif
> +
>  /* Align . to a 8 byte boundary equals to maximum function alignment. */
>  #define ALIGN_FUNCTION()  . = ALIGN(8)
>  
> @@ -508,6 +519,7 @@
>  		__stop___modver = .;					\
>  	}								\
>  									\
> +	RO_DATA_EXCEPTION_TABLE						\
>  	NOTES								\
>  									\
>  	. = ALIGN((align));						\

I had to read this one to understand the later arm64 change. It looks
fine to me, so:

Acked-by: Will Deacon <will@kernel.org>

Will
