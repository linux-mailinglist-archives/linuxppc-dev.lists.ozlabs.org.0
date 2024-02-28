Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9E86AEE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:14:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z+8S+MDU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCvg71srz3dfr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z+8S+MDU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [IPv6:2001:41d0:203:375::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCtw1dvKz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:13:41 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:13:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709122398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR50j86RG5cQYNNRp/+Ji4l/DSPp86os+YPmfEu0IUs=;
	b=Z+8S+MDUFS5eRip8luF6o/sVVysujF1vQUxixW5uw6PnzqbjLu7TDTEyJ3Ta94J2zZZMdy
	oeaUBjVzbN7UX/K+TwWcuFFlXHdUXssATgy3QYTYyoDWXWWlUNIFVTcqB1O+RlT3s+8MUp
	JQ6IBI3akGmoqbwUcYQ7ysH8XUYqWFE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 30/32] configure: Make arch_libdir a
 first-class entity
Message-ID: <20240228-e9507071ef0c14477ba703ae@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-31-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226101218.1472843-31-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, Nico =?utf-8?B?QsO2aHI=?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, Eric Auger <eric.auger@redhat.com>, Joel Stanley <joel@jms.id.au>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:12:16PM +1000, Nicholas Piggin wrote:
> arch_libdir was brought in to improve the heuristic determination of
> the lib/ directory based on arch and testdir names, but it did not
> entirely clean that mess up.
> 
> Remove the arch_libdir->arch->testdir heuristic and just require
> everybody sets arch_libdir correctly. Fail if the lib/arch or
> lib/arch/asm directories can not be found.
> 
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Janosch Frank <frankja@linux.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Nico Böhr <nrb@linux.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Cc: kvm-riscv@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  Makefile  |  2 +-
>  configure | 18 +++++++++++++-----
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4f35fffc6..4e0f54543 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -10,7 +10,7 @@ include config.mak
>  VPATH = $(SRCDIR)
>  
>  libdirs-get = $(shell [ -d "lib/$(1)" ] && echo "lib/$(1) lib/$(1)/asm")
> -ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR)) $(call libdirs-get,$(TEST_DIR))
> +ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR))
>  OBJDIRS := $(ARCH_LIBDIRS)
>  
>  DESTDIR := $(PREFIX)/share/kvm-unit-tests/
> diff --git a/configure b/configure
> index ae522c556..8c0e3506f 100755
> --- a/configure
> +++ b/configure
> @@ -199,7 +199,6 @@ fi
>  arch_name=$arch
>  [ "$arch" = "aarch64" ] && arch="arm64"
>  [ "$arch_name" = "arm64" ] && arch_name="aarch64"
> -arch_libdir=$arch
>  
>  if [ "$arch" = "riscv" ]; then
>      echo "riscv32 or riscv64 must be specified"
> @@ -264,8 +263,10 @@ fi
>  
>  if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>      testdir=x86
> +    arch_libdir=x86
>  elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>      testdir=arm
> +    arch_libdir=$arch
>      if [ "$target" = "qemu" ]; then
>          arm_uart_early_addr=0x09000000
>      elif [ "$target" = "kvmtool" ]; then
> @@ -314,6 +315,7 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>      fi
>  elif [ "$arch" = "ppc64" ]; then
>      testdir=powerpc
> +    arch_libdir=ppc64
>      firmware="$testdir/boot_rom.bin"
>      if [ "$endian" != "little" ] && [ "$endian" != "big" ]; then
>          echo "You must provide endianness (big or little)!"
> @@ -324,6 +326,7 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      arch_libdir=riscv
>  elif [ "$arch" = "s390x" ]; then
>      testdir=s390x
> +    arch_libdir=s390x

Probably could have left the arch_libdir=$arch above and only added the
ppc64 line, but either way.

>  else
>      echo "arch $arch is not supported!"
>      arch=
> @@ -333,6 +336,10 @@ if [ ! -d "$srcdir/$testdir" ]; then
>      echo "$srcdir/$testdir does not exist!"
>      exit 1
>  fi
> +if [ ! -d "$srcdir/lib/$arch_libdir" ]; then
> +    echo "$srcdir/lib/$arch_libdir does not exist!"
> +    exit 1
> +fi
>  
>  if [ "$efi" = "y" ] && [ -f "$srcdir/$testdir/efi/run" ]; then
>      ln -fs "$srcdir/$testdir/efi/run" $testdir-run
> @@ -395,10 +402,11 @@ fi
>  # link lib/asm for the architecture
>  rm -f lib/asm
>  asm="asm-generic"
> -if [ -d "$srcdir/lib/$arch/asm" ]; then
> -	asm="$srcdir/lib/$arch/asm"
> -elif [ -d "$srcdir/lib/$testdir/asm" ]; then
> -	asm="$srcdir/lib/$testdir/asm"
> +if [ -d "$srcdir/lib/$arch_libdir/asm" ]; then
> +    asm="$srcdir/lib/$arch_libdir/asm"
> +else
> +    echo "$srcdir/lib/$arch_libdir/asm does not exist"
> +    exit 1
>  fi
>  mkdir -p lib
>  ln -sf "$asm" lib/asm
> -- 
> 2.42.0
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew
