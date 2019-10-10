Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0FFD2DB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 17:27:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pw1n5HS3zDqKS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="XvDnIWbO"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pvzf2fzTzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 02:25:28 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A630005874FFE54801724.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6300:587:4ffe:5480:1724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DD39A1EC0987;
 Thu, 10 Oct 2019 17:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1570721124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=oFtLtIT92PEjPANVccNt8bv5ZEw6stfT1hPzmyy05AU=;
 b=XvDnIWbOWnxP5VFZO9ko7ahJhTcRm/Xsrm8HgemYJGsHSBOE6Uta44f3AIYcSZ6OfEGl/a
 AEH1A9BDC9JA4n3PgugNym5/q4Nt+C+NeHY9F4IhvYggxoRn7C5NPgZWNAKd44J4GzphzU
 Yg/gusTeVLuPtqp+cJTKXO0tNksVAHs=
Date: Thu, 10 Oct 2019 17:25:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 14/29] vmlinux.lds.h: Allow EXCEPTION_TABLE to live in
 RO_DATA
Message-ID: <20191010152516.GG7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-15-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-15-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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
> -- 

I think you can drop the "DATA" from the names as it is kinda clear
where the exception table lands:

RO_EXCEPTION_TABLE_ALIGN
RO_EXCEPTION_TABLE

The "read-only" part is the important one.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
