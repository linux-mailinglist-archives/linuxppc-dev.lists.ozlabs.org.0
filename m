Return-Path: <linuxppc-dev+bounces-5252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D0A10D5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbRz4Bjjz2yl1;
	Wed, 15 Jan 2025 04:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736875087;
	cv=none; b=ScjEpPkD9b2uzLEF+T35k02zMbQ7acJfk1z9SWPzqI4v26fLscOgNaw65ctp8/sV1KrXX8tuCbKS8rP1RGosYGQs79IgOJQ1jeSFCpTLWovEzB03/EXOr+KQn1wtCBloi0ZS0ZJD6slAhCU+xtHKz4cj4x9paIs3O+K2ID67If8Sh0IdDFra51IEgekHzbT1ks7qD3/BNMhEqONeXkSi6dAgVYkI0MEeXtGhaTUjmGalt6qIRKehB0LhKrD/3YDqz1srSX5aOCn63MHE/ijI/kJxIASevJUKeBF9+f8L3hCvEMJ4uECf+Ju1D24IWBqH+WKg5a3IrDcIy8ciCk7dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736875087; c=relaxed/relaxed;
	bh=x1mWxUkcdZa6EgnRgOiTKx/eQOhn3QGxIFtlwSkzowM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDP76NRgbbIZ1F7r4wLqTEN13tF8NrQJuYchjsVB1smMOaLtkzVFaesXXhI23hgYHshSbIO5I+2xONb6dWXFP59xT0ecur/HK63BwjFHu/QMHjRe6N9fZ6p4RR5TLX6EHn0G2E89gYrBCVK1XzNRGGCU2CNjQOdSGWJ45yNGa5YfpJ9Wo5MwUkgvvlCdeDwOelPM7fQhYAyGFHezx8enklrQ6tq7ti8PLpFrzikeUOUdkXxzkN7GvtJL1K9wAOJGgSVLrb5YnHD71217tB4aLWtyOx263isfXQUOR+JRvB4vG01ywz/S7/uBGuH7rQHTqNxukFBobfRnUnaWOQufTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbRy3CYlz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:18:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D06512FC;
	Tue, 14 Jan 2025 09:18:03 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8E03F673;
	Tue, 14 Jan 2025 09:17:31 -0800 (PST)
Date: Tue, 14 Jan 2025 17:17:28 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <Z4acKHEn/dE0yLM2@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
 <20250113-45b57478be2241a35ffa1b67@orel>
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
In-Reply-To: <20250113-45b57478be2241a35ffa1b67@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Mon, Jan 13, 2025 at 04:11:06PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:45PM +0000, Alexandru Elisei wrote:
> > The help text for the --processor option displays the architecture name as
> > the default processor type. But the default for arm is cortex-a15, and for
> > arm64 is cortex-a57. Teach configure to display the correct default
> > processor type for these two architectures.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 30 ++++++++++++++++++++++--------
> >  1 file changed, 22 insertions(+), 8 deletions(-)
> > 
> > diff --git a/configure b/configure
> > index 5b0a2d7f39c0..138840c3f76d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
> >      exit 1
> >  fi
> >  
> > +function get_default_processor()
> > +{
> > +    local arch="$1"
> > +
> > +    case "$arch" in
> > +    "arm")
> > +        default_processor="cortex-a15"
> > +        ;;
> > +    "arm64" | "aarch64")
> > +        default_processor="cortex-a57"
> > +        ;;
> > +    *)
> > +        default_processor=$arch
> > +    esac
> > +
> > +    echo "$default_processor"
> > +}
> > +
> >  srcdir=$(cd "$(dirname "$0")"; pwd)
> >  prefix=/usr/local
> >  cc=gcc
> > @@ -33,6 +51,7 @@ page_size=
> >  earlycon=
> >  efi=
> >  efi_direct=
> > +default_processor=$(get_default_processor $arch)
> >  
> >  # Enable -Werror by default for git repositories only (i.e. developer builds)
> >  if [ -e "$srcdir"/.git ]; then
> > @@ -48,7 +67,7 @@ usage() {
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > -	    --processor=PROCESSOR  processor to compile for ($arch)
> > +	    --processor=PROCESSOR  processor to compile for ($default_processor)
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > @@ -283,13 +302,8 @@ else
> >      fi
> >  fi
> >  
> > -[ -z "$processor" ] && processor="$arch"
> > -
> > -if [ "$processor" = "arm64" ]; then
> > -    processor="cortex-a57"
> > -elif [ "$processor" = "arm" ]; then
> > -    processor="cortex-a15"
> > -fi
> > +# $arch will have changed when cross-compiling.
> > +[ -z "$processor" ] && processor=$(get_default_processor $arch)
> 
> The fact that $arch and $processor are wrong until they've had a chance to

$processor is never wrong. $processor is unset until either the user sets it
with --processor, or until this line. This patch introduces $default_processor
only for the purpose of having an accurate help text, it doesn't change when and
how $processor is assigned.

> be converted might be another reason for the $do_help idea. But it'll
> always be fragile since another change that does some sort of conversion
> could end up getting added after the '[ $do_help ] && usage' someday.

configure needs to distinguish between:

1. The user not having specified --processor when doing ./configure.
2. The user having set --processor.

If 1, then kvm-unit-tests can use the default $processor value for $arch,
which could have also been specified by the user.

If 2, then kvm-unit-tests should not touch $processor because that's what the
user wants.

Do you see something wrong with that reasoning?

Also, I don't understand why you say it's fragile, since configure doesn't
touch $processor until this point (and unless the user sets it, of course).

Thanks,
Alex

