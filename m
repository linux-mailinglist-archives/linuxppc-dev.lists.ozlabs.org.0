Return-Path: <linuxppc-dev+bounces-5242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F78A10CF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:04:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXb7n19hzz30hl;
	Wed, 15 Jan 2025 04:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874245;
	cv=none; b=go4A1PY8vkLj42J6KDa4ccqsAOq8SZ9f2GzpUhq3BeKsgmFQySJwtpSyW/ED1JNPLmiSWMBeyN5HXT3xkT7t7KWwKiLDfO+SapFYhWxQipFyYhrdiDjC5f3FZNlVZfkU7rsx/lTL9i6dhdznx1CprQkYeMdZRQZ2Tfimc1Zy/3zQcRNtvS5bBuo1GLWN2ZoiBtY0L1tI6V51gowrleLl7wtLfqwPmtANY/MiG8Hne/DKgEMs3O83p/Y9JIrBBsTlk7gDSdGmMy+E+rmQazoU5GVLMA80P/m1N0yLO5gh3XQxXEz05jwvPNnRxqog88v1CFeDzQ7SdnyKb/BAYUfVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874245; c=relaxed/relaxed;
	bh=aub98uw/3Y/wUFCKLOslucV5zIBBdqXKYGkZ4uUeTew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToEgjmwSCLQavwqeuujm5lEXwrcp8h/65NheEqhl27tX9qmKdOJ4g9pDKeSKEk5eHsA9doL+E9xH93jKhHrBowLIgAESCTc/5dH65XGnjXV8rB/apRpsOqILn5MzKyO/06/g6W9cAm2Q14v4A+Tc+fMr83NuwoipA6YNemYETz82Y55+HfMpLOo2aCpR74YDN3lRY3DcxGn6YrGYuRIdZe7tfyKXaebjySvJdtaTj6uz9I3c8NxAOYqSA7twy1J6oL1DJCO0ydqQoIm1yYRgNmvOQIlbfH3sNe1ANwLBlZmrnpLo7dAljxH5Tz0Ho2T7+b1uhtKPNpRz+/T0TJQPKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXb7k6d3Nz30hL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:04:01 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33DF012FC;
	Tue, 14 Jan 2025 09:03:57 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 610723F673;
	Tue, 14 Jan 2025 09:03:25 -0800 (PST)
Date: Tue, 14 Jan 2025 17:03:20 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <Z4aY2AKSaxKDY5Hq@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
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
In-Reply-To: <20250113-0fe04c6089726d1d06a254ec@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Mon, Jan 13, 2025 at 04:01:58PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:44PM +0000, Alexandru Elisei wrote:
> > $arch, on arm64, defaults to 'aarch64', and later in the script is replaced
> > by 'arm64'. Intentional or not, document that the name 'aarch64' is also
> > supported when configuring for the arm64 architecture. This has been the
> > case since the initial commit that added support for the arm64
> > architecture, commit 39ac3f8494be ("arm64: initial drop").
> > 
> > The help text for --arch changes from*:
> > 
> >    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
> >                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > 
> > to:
> > 
> >     --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
> >                            arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > 
> > *Worth pointing out that the default architecture is 'aarch64', even though
> > the rest of the help text doesn't have it as one of the supported
> > architectures.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 86cf1da36467..5b0a2d7f39c0 100755
> > --- a/configure
> > +++ b/configure
> > @@ -47,7 +47,7 @@ usage() {
> >  
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> > -	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > +	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >  	    --processor=PROCESSOR  processor to compile for ($arch)
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> > -- 
> > 2.47.1
> >
> 
> I'd prefer to support --arch=aarch64, but then always refer to it as only
> arm64 everywhere else. We need to support arch=aarch64 since that's what
> 'uname -m' returns, but I don't think we need to change the help text for
> it. If we don't want to trust our users to figure out arm64==aarch64,

I sincerely dislike the fact that in the help text the default architecture on
arm64 is not among the list of supported architectures.

> then we can do something like
> 
> @@ -216,12 +197,12 @@ while [[ $optno -le $argc ]]; do
>             werror=
>             ;;
>         --help)
> -           usage
> +           do_help=1
>             ;;
>         *)
>             echo "Unknown option '$opt'"
>             echo
> -           usage
> +           do_help=1
>             ;;
>      esac
>  done
> 
> And then only do
> 
>  if [ $do_help ]; then
>     usage
>  fi
> 
> after $arch and other variables have had a chance to be converted.

That still doesn't work if displaying the help text on an arm64 board:
$arch=aarch64 if compiling natively, because that's what uname -m prints, and
$arch gets converted to 'arm64' later in the script. We could move the
conversion before calling usage, but at that point I wonder if it wouldn't be
better to never set $arch to 'aarch64' in the first place.

If you don't want to modify the help text to say that aarch64 is supported, even
though it's displayed as the default architecture on arm64, we could modify
$arch to never be set to 'aarch64', i.e:

diff --git a/configure b/configure
index 86cf1da36467..1362b68dd68b 100755
--- a/configure
+++ b/configure
@@ -15,8 +15,8 @@ objdump=objdump
 readelf=readelf
 ar=ar
 addr2line=addr2line
-arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
-host=$arch
+host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
+arch=$(echo $host | sed -e 's/aarch64/arm64/')
 cross_prefix=
 endian=""
 pretty_print_stacks=yes

and keep the conversion from aarch64 to arm64 where it is, and still keep it
undocumented, just in case someone is using that.

($host still needs to be aarch64, because that's the name of the qemu
executable).

Thanks,
Alex

