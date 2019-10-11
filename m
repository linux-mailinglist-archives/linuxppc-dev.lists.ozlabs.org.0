Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289ED3926
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 08:08:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qHZw36FxzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 17:08:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qHXq2WfjzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 17:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="dJGgqoI+"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46qHXn5rSDz9sNx;
 Fri, 11 Oct 2019 17:07:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1570774027;
 bh=AJrLeG6G9D8YUo7VDIU/jBSRhH8l/uKAxqlBUz1bi84=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dJGgqoI+58ENDSNA0Me5eZnopdP/yD4mODpp5k3HE+c/wOPskcBr1ocDmTL7v4ekU
 qjpHBvYLd4OnsEYrUyo3+CrUrK6UrJQlf/73ilPLERyQb2ZKVsa3Vbj8yDLn8t5QwR
 KPMr4dG//WxDYq8YUXXc/we22B51riMsIi4n1yiTtnV2tv23x5ROvBQXoYwEWQcb9v
 athHfQX1DHgA/DvDMnQCT7h/mUmWgqly/W1MF+6MYlmVdd8DoSuzFTqO2XC+DgfWz8
 z+MmLdL0VASvJOdHd+7UjOrkIAhgbUBfEZAwteAWvEXsHOdUsxtJgtEUJ/+F3yOuf0
 PLDabEaYhHJNw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 02/29] powerpc: Remove PT_NOTE workaround
In-Reply-To: <20191011000609.29728-3-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-3-keescook@chromium.org>
Date: Fri, 11 Oct 2019 17:07:04 +1100
Message-ID: <878sprx1br.fsf@mpe.ellerman.id.au>
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
Cc: linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Joel Stanley <joel@jms.id.au>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> In preparation for moving NOTES into RO_DATA, remove the PT_NOTE
> workaround since the kernel requires at least gcc 4.6 now.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

For the archives, Joel tried a similar patch a while back which caused
some problems, see:

  https://lore.kernel.org/linuxppc-dev/20190321003253.22100-1-joel@jms.id.au/

and a v2:

  https://lore.kernel.org/linuxppc-dev/20190329064453.12761-1-joel@jms.id.au/

This is similar to his v2. The only outstanding comment on his v2 was
from Segher:
  (And I do not know if there are any tools that expect the notes in a phdr,
  or even specifically the second phdr).

But this patch solves that by not changing the note.

cheers

> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 81e672654789..a3c8492b2b19 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -20,20 +20,6 @@ ENTRY(_stext)
>  PHDRS {
>  	kernel PT_LOAD FLAGS(7); /* RWX */
>  	note PT_NOTE FLAGS(0);
> -	dummy PT_NOTE FLAGS(0);
> -
> -	/* binutils < 2.18 has a bug that makes it misbehave when taking an
> -	   ELF file with all segments at load address 0 as input.  This
> -	   happens when running "strip" on vmlinux, because of the AT() magic
> -	   in this linker script.  People using GCC >= 4.2 won't run into
> -	   this problem, because the "build-id" support will put some data
> -	   into the "notes" segment (at a non-zero load address).
> -
> -	   To work around this, we force some data into both the "dummy"
> -	   segment and the kernel segment, so the dummy segment will get a
> -	   non-zero load address.  It's not enough to always create the
> -	   "notes" segment, since if nothing gets assigned to it, its load
> -	   address will be zero.  */
>  }
>  
>  #ifdef CONFIG_PPC64
> @@ -178,14 +164,8 @@ SECTIONS
>  	EXCEPTION_TABLE(0)
>  
>  	NOTES :kernel :note
> -
> -	/* The dummy segment contents for the bug workaround mentioned above
> -	   near PHDRS.  */
> -	.dummy : AT(ADDR(.dummy) - LOAD_OFFSET) {
> -		LONG(0)
> -		LONG(0)
> -		LONG(0)
> -	} :kernel :dummy
> +	/* Restore program header away from PT_NOTE. */
> +	.dummy : { *(.dummy) } :kernel
>  
>  /*
>   * Init sections discarded at runtime
> -- 
> 2.17.1
