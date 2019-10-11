Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C56D3933
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 08:11:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qHdJ62NfzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 17:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qHY80bgPzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 17:07:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="HvKltrRD"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46qHY63Gpnz9sP6;
 Fri, 11 Oct 2019 17:07:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1570774042;
 bh=CGrv8OfatmaqzsbsLV1xNnERqaf4o4GrCu4bs7978qQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HvKltrRDVPfIZYBNIbi2OENm8rIjOadC6OLZVdTVAIOYyWtY4TdaUin0uGs+pZl5r
 bRbKF615iL7xUyUHVWntmfr5ql+6BsRm8oNkAYoF9eKnQOntCXEWoMARco+DSWMMnP
 T3olJDWP1OcNRTHcAb2Rcz+X9liJrKJYx3yMHKglhFV5gpwDSMOzBo+eRrlE0PU67R
 f8iFuspmJmAE0aTpt49euDl+i1TNcuIBfTeEUlVgnv8OXzwIF2rHrdvLMnUcffApvc
 CdQ+ymgRSY/Oe3lPsYB7axn1ixf9Mtb6qe7vp9wm3VqMIOmr/MHXf5knAHnS1fAwv/
 QpCcwU5b9SxGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 03/29] powerpc: Rename PT_LOAD identifier "kernel" to
 "text"
In-Reply-To: <20191011000609.29728-4-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-4-keescook@chromium.org>
Date: Fri, 11 Oct 2019 17:07:21 +1100
Message-ID: <875zkvx1ba.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> In preparation for moving NOTES into RO_DATA, rename the linker script
> internal identifier for the PT_LOAD Program Header from "kernel" to
> "text" to match other architectures.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index a3c8492b2b19..e184a63aa5b0 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -18,7 +18,7 @@
>  ENTRY(_stext)
>  
>  PHDRS {
> -	kernel PT_LOAD FLAGS(7); /* RWX */
> +	text PT_LOAD FLAGS(7); /* RWX */
>  	note PT_NOTE FLAGS(0);
>  }
>  
> @@ -63,7 +63,7 @@ SECTIONS
>  #else /* !CONFIG_PPC64 */
>  		HEAD_TEXT
>  #endif
> -	} :kernel
> +	} :text
>  
>  	__head_end = .;
>  
> @@ -112,7 +112,7 @@ SECTIONS
>  		__got2_end = .;
>  #endif /* CONFIG_PPC32 */
>  
> -	} :kernel
> +	} :text
>  
>  	. = ALIGN(ETEXT_ALIGN_SIZE);
>  	_etext = .;
> @@ -163,9 +163,9 @@ SECTIONS
>  #endif
>  	EXCEPTION_TABLE(0)
>  
> -	NOTES :kernel :note
> +	NOTES :text :note
>  	/* Restore program header away from PT_NOTE. */
> -	.dummy : { *(.dummy) } :kernel
> +	.dummy : { *(.dummy) } :text
>  
>  /*
>   * Init sections discarded at runtime
> @@ -180,7 +180,7 @@ SECTIONS
>  #ifdef CONFIG_PPC64
>  		*(.tramp.ftrace.init);
>  #endif
> -	} :kernel
> +	} :text
>  
>  	/* .exit.text is discarded at runtime, not link time,
>  	 * to deal with references from __bug_table
> -- 
> 2.17.1
