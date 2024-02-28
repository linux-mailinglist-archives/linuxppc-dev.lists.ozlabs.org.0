Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7086AECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:09:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QkadKOx2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCnv0Frvz3dXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:09:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QkadKOx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [IPv6:2001:41d0:203:375::bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCn86XMZz2xPV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:08:44 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:08:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709122101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWNPrUUilCiI4A3q8yMqr9KSZvx9P8q/blhjVSX5ACU=;
	b=QkadKOx2gNNgsq2yDwtob8FGSV90oxh/Mm9+dXDQWYRBbhRN2s+9CyfKASe6R0jXjDwhBf
	1CLyRhVsikkRtsk0zsmTjg6RAWAKZmYS2RPYAfdFbNLyhS7AiI8XcUy1a1CdOIJuEBBzzl
	+5wJ7NvO9qRVqytE1pirWcr63P6YX9U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 29/32] configure: Fail on unknown arch
Message-ID: <20240228-d598a1eb6a25935f54aeaa01@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-30-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226101218.1472843-30-npiggin@gmail.com>
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

On Mon, Feb 26, 2024 at 08:12:15PM +1000, Nicholas Piggin wrote:
> configure will accept an unknown arch, and if it is the name of a
> directory in the source tree the command will silently succeed. Make
> it only accept supported arch names.
> 
> Also print the full path of a missing test directory to disambiguate
> the error in out of tree builds.
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
>  configure | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 6907ccbbb..ae522c556 100755
> --- a/configure
> +++ b/configure
> @@ -45,7 +45,8 @@ usage() {
>  	Usage: $0 [options]
>  
>  	Options include:
> -	    --arch=ARCH            architecture to compile for ($arch)
> +	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> +	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>  	    --processor=PROCESSOR  processor to compile for ($arch)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
> @@ -321,11 +322,15 @@ elif [ "$arch" = "ppc64" ]; then
>  elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      testdir=riscv
>      arch_libdir=riscv
> +elif [ "$arch" = "s390x" ]; then
> +    testdir=s390x
>  else
> -    testdir=$arch
> +    echo "arch $arch is not supported!"
> +    arch=
> +    usage
>  fi
>  if [ ! -d "$srcdir/$testdir" ]; then
> -    echo "$testdir does not exist!"
> +    echo "$srcdir/$testdir does not exist!"
>      exit 1
>  fi
>  
> -- 
> 2.42.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
