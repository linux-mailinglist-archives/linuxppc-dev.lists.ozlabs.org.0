Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F886AEA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:02:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m6Bp7Imm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCf007K0z3dXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m6Bp7Imm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 910 seconds by postgrey-1.37 at boromir; Wed, 28 Feb 2024 23:01:50 AEDT
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCdB0rl4z3cH4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:01:46 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:01:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709121683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cAhfOZzzV795zNV/l+orcHsw+Rajd2KabiCK5LjHC6U=;
	b=m6Bp7ImmtEOAPAaPq1QK2BT0pA6Kwr8DADKq+fxL7F1AiVBmTU4DeKxQa6+plByhzZjfnX
	M76yDJuKBXe43fxbQsygE0xWGLLS4NnzQqqvIpKzSVdhJmlT0NIQ5PxaX8fTWCGTN8Equ3
	f4whZKNYfWbyuVrgp+a0pXaPx2uHX1A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 23/32] powerpc: Add MMU support
Message-ID: <20240228-af96de74f45c3fca418b8928@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-24-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-24-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:12:09PM +1000, Nicholas Piggin wrote:
> Add support for radix MMU, 4kB and 64kB pages.
> 
> This also adds MMU interrupt test cases, and runs the interrupts
> test entirely with MMU enabled if it is available (aside from
> machine check tests).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  configure                     |  39 +++--
>  lib/powerpc/asm/hcall.h       |   6 +
>  lib/powerpc/asm/processor.h   |   1 +
>  lib/powerpc/asm/reg.h         |   3 +
>  lib/powerpc/asm/smp.h         |   2 +
>  lib/powerpc/processor.c       |   9 ++
>  lib/powerpc/setup.c           |   4 +
>  lib/ppc64/asm/mmu.h           |  11 ++
>  lib/ppc64/asm/page.h          |  67 ++++++++-
>  lib/ppc64/asm/pgtable-hwdef.h |  67 +++++++++
>  lib/ppc64/asm/pgtable.h       | 126 ++++++++++++++++
>  lib/ppc64/mmu.c               | 273 ++++++++++++++++++++++++++++++++++
>  lib/ppc64/opal-calls.S        |   4 +-
>  powerpc/Makefile.common       |   2 +
>  powerpc/Makefile.ppc64        |   1 +
>  powerpc/interrupts.c          |  96 ++++++++++--
>  16 files changed, 684 insertions(+), 27 deletions(-)
>  create mode 100644 lib/ppc64/asm/mmu.h
>  create mode 100644 lib/ppc64/asm/pgtable-hwdef.h
>  create mode 100644 lib/ppc64/asm/pgtable.h
>  create mode 100644 lib/ppc64/mmu.c
> 
> diff --git a/configure b/configure
> index 05e6702ea..6907ccbbb 100755
> --- a/configure
> +++ b/configure
> @@ -222,29 +222,35 @@ fi
>  if [ -z "$page_size" ]; then
>      if [ "$efi" = 'y' ] && [ "$arch" = "arm64" ]; then
>          page_size="4096"
> -    elif [ "$arch" = "arm64" ]; then
> +    elif [ "$arch" = "arm64" ] || [ "$arch" = "ppc64" ]; then
>          page_size="65536"
>      elif [ "$arch" = "arm" ]; then
>          page_size="4096"
>      fi
>  else
> -    if [ "$arch" != "arm64" ]; then
> -        echo "--page-size is not supported for $arch"
> -        usage
> -    fi
> -
>      if [ "${page_size: -1}" = "K" ] || [ "${page_size: -1}" = "k" ]; then
>          page_size=$(( ${page_size%?} * 1024 ))
>      fi
> -    if [ "$page_size" != "4096" ] && [ "$page_size" != "16384" ] &&
> -           [ "$page_size" != "65536" ]; then
> -        echo "arm64 doesn't support page size of $page_size"
> +
> +    if [ "$arch" = "arm64" ]; then
> +        if [ "$page_size" != "4096" ] && [ "$page_size" != "16384" ] &&
> +               [ "$page_size" != "65536" ]; then
> +            echo "arm64 doesn't support page size of $page_size"
> +            usage
> +        fi
> +        if [ "$efi" = 'y' ] && [ "$page_size" != "4096" ]; then
> +            echo "efi must use 4K pages"
> +            exit 1
> +        fi
> +    elif [ "$arch" = "ppc64" ]; then
> +        if [ "$page_size" != "4096" ] && [ "$page_size" != "65536" ]; then
> +            echo "ppc64 doesn't support page size of $page_size"
> +            usage
> +        fi
> +    else
> +        echo "--page-size is not supported for $arch"
>          usage
>      fi
> -    if [ "$efi" = 'y' ] && [ "$page_size" != "4096" ]; then
> -        echo "efi must use 4K pages"
> -        exit 1
> -    fi
>  fi
>  
>  [ -z "$processor" ] && processor="$arch"
> @@ -444,6 +450,13 @@ cat <<EOF >> lib/config.h
>  
>  #define CONFIG_UART_EARLY_BASE ${arm_uart_early_addr}
>  #define CONFIG_ERRATA_FORCE ${errata_force}
> +
> +EOF
> +fi
> +
> +if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] || [ "$arch" = "ppc64" ]; then
> +cat <<EOF >> lib/config.h
> +
>  #define CONFIG_PAGE_SIZE _AC(${page_size}, UL)
>  
>  EOF

Ack for the configure changes.

Thanks,
drew
