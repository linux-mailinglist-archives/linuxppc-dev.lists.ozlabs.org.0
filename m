Return-Path: <linuxppc-dev+bounces-5156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 836ADA0BB49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:11:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWwhY40c7z30W4;
	Tue, 14 Jan 2025 02:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736781101;
	cv=none; b=jX0xkWOU1ddG/sgGkwpzhMw6FQ5OX1699CECXzItLRztr/FvI/qLxF1v06qmoqEhxOGFEFNseoLRPOwZ6NLuGAXRsigY0MBdZV+t2JuC8itDD6yTfU7gc+Qmm7cZ0JnOH1ppdt6nhjdwDCOCj+XyFJejJf/Kj+kVr6iIWJ8AuKXuV0Vw6kBNIhZBb/UKKmDz3IXpwqKCcizaKK6G1msBvXANiTp7ehLjz4/QH98WANRWn+uKocUOQA54TxhqCcEvrBYB4mJ2Y0iNJa0t1zQRV6HP9gp/roiBZHMAeK0KQ1NIzHZXpuppY8Gp50a1zQvfsK0xTpq2T7M5eI7N/EIumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736781101; c=relaxed/relaxed;
	bh=xLwBznsIvWChVrWyQ/Y1KottiOWCI/F91TbjA2wc0AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKnYI0y8u2kPADRlb4aSt0EY3m/GD88SMBTigkMVu+ejMW3+Yg3Dy/FtOOjBKrWQ9028u3w92ThF+iHFeBZ7xeg+Uh4BdYS3JZF162TMAiJI8MA7WMnHxlOnrDe6G+YElqCG7VgoyMmoq3xviGTLytB3XFQWkUJB3a7upwoe/IIPM5p8TdkCMSC5/xxYTxBGOHT5xptMqZm3Ucqxlqx2uKEYmX7F3a4usz5fDn+In4GOEgP8q+BTzZNi1NDb5TtMI8vEzKxTAcyFxgAWP3rGzPlpDUseZauYaaW1K026/e+0KSfJdfavNixG/sjAjYstbkmomeG+NfdbRm/f7RnzJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 540 seconds by postgrey-1.37 at boromir; Tue, 14 Jan 2025 02:11:33 AEDT
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWwhP5mhpz30TP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:11:33 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:11:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736781068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLwBznsIvWChVrWyQ/Y1KottiOWCI/F91TbjA2wc0AA=;
	b=a2aSCgBuFAUHHZ2qluxkDCW1r86/Jn2YuYdQd1tk+HuQfMVxRj6nw2X0GwNzCVRZStipgo
	X3/zlLiG44z1iH1iU39ygCG6LXbI/5HFyRI8oWtDfGRHRlV6dUWYp7H2CUmGS9UvyPoFFX
	JHNYyxBmVcqUwbNF9KwURzWYO1EG/gs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <20250113-45b57478be2241a35ffa1b67@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 01:58:45PM +0000, Alexandru Elisei wrote:
> The help text for the --processor option displays the architecture name as
> the default processor type. But the default for arm is cortex-a15, and for
> arm64 is cortex-a57. Teach configure to display the correct default
> processor type for these two architectures.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index 5b0a2d7f39c0..138840c3f76d 100755
> --- a/configure
> +++ b/configure
> @@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
>      exit 1
>  fi
>  
> +function get_default_processor()
> +{
> +    local arch="$1"
> +
> +    case "$arch" in
> +    "arm")
> +        default_processor="cortex-a15"
> +        ;;
> +    "arm64" | "aarch64")
> +        default_processor="cortex-a57"
> +        ;;
> +    *)
> +        default_processor=$arch
> +    esac
> +
> +    echo "$default_processor"
> +}
> +
>  srcdir=$(cd "$(dirname "$0")"; pwd)
>  prefix=/usr/local
>  cc=gcc
> @@ -33,6 +51,7 @@ page_size=
>  earlycon=
>  efi=
>  efi_direct=
> +default_processor=$(get_default_processor $arch)
>  
>  # Enable -Werror by default for git repositories only (i.e. developer builds)
>  if [ -e "$srcdir"/.git ]; then
> @@ -48,7 +67,7 @@ usage() {
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> -	    --processor=PROCESSOR  processor to compile for ($arch)
> +	    --processor=PROCESSOR  processor to compile for ($default_processor)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> @@ -283,13 +302,8 @@ else
>      fi
>  fi
>  
> -[ -z "$processor" ] && processor="$arch"
> -
> -if [ "$processor" = "arm64" ]; then
> -    processor="cortex-a57"
> -elif [ "$processor" = "arm" ]; then
> -    processor="cortex-a15"
> -fi
> +# $arch will have changed when cross-compiling.
> +[ -z "$processor" ] && processor=$(get_default_processor $arch)

The fact that $arch and $processor are wrong until they've had a chance to
be converted might be another reason for the $do_help idea. But it'll
always be fragile since another change that does some sort of conversion
could end up getting added after the '[ $do_help ] && usage' someday.

Thanks,
drew

>  
>  if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>      testdir=x86
> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

