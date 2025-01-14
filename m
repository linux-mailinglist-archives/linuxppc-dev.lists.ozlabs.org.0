Return-Path: <linuxppc-dev+bounces-5254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C281DA10D76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbW93mc9z3bbS;
	Wed, 15 Jan 2025 04:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736875253;
	cv=none; b=kjBBB+T9SMPYNO6CEhSUtNfeMbIThvl++EPho9LxcXUHpIes2EPjSvY4rV6Jt555l2yv3zDMwhwwSn+D8fr15p4tEanp8Bn6st7nRrcbuvT7JP1eWtwEAc+J2RV3ohjRh1qyFb4trmrARlZQSuDkGA//je8WSRkpAdY+fgdK2Xan6AXOyx/0jCm8dHJylivFNvg8vqeLiiHUW72A9tu4p9MferyytaRSukuOLkNbcZoK6J5WKcpqrdsMxeaQV6c2XR1zCJPi1wsJPd0kFTB/gKoc9L5uQ/+qjd2be/C8bk5/FjpEuSVtkmkoMC8AwJ6q0fHwYvGFOVj8dSVB6wPzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736875253; c=relaxed/relaxed;
	bh=3u6i7dTXIC6UC3EBVjZ7WTNkP6tZoNyQPuuLU0pnVAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwB2UVXFhWbOext8N1sMyAiikbHwcDx1QDMXnRWNGyHSxBWEvWRXncGJqNZgsNNjjukfypNMz6GWSMUUCkNV/ojX4JeULIkSQpQYcem8NwUlciUWnf+a+itLrBDcawakhv3ikRqSl3nCfYB4c+aYOmQxayiH/+7enh7I4WUb2Ru+zjPEh6ktUnBaLMXGG5QOB+tfUdd+RT6np485g38IOcVqGtozRb8ZbxQ9/cCH8PBvzd6NcNU+V2JYp86ZNVRhWkzBcJn+5kqjT2d28GI/iiIUqNeygtm2R3Wi+4iuJDksjoyZNWPoCztcqNWX6SCeoXObZF+uslGdQ+cSS1Kzww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbW7584Vz3bbR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:20:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5EA12FC;
	Tue, 14 Jan 2025 09:20:48 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6240D3F673;
	Tue, 14 Jan 2025 09:20:17 -0800 (PST)
Date: Tue, 14 Jan 2025 17:20:13 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for
 --processor=max
Message-ID: <Z4aczXTAVxxkuOhA@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-5-alexandru.elisei@arm.com>
 <20250113-8711bc93ade1e8c83dfe3582@orel>
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
In-Reply-To: <20250113-8711bc93ade1e8c83dfe3582@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Mon, Jan 13, 2025 at 04:21:45PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:47PM +0000, Alexandru Elisei wrote:
> > For arm64, newer architecture features are supported only on newer CPUs.
> > Instead of expecting the user to know which CPU model supports which
> > feature when using the TCG accelerator for qemu, let's make it easier and
> > add support for the --processor 'max' value.
> > 
> > The --processor value is passed to the compiler's -mcpu argument and to
> > qemu's -cpu argument. 'max' is a special value that only qemu understands -
> > it means that all CPU features that qemu implements are supported by the
> > guest CPU, and passing it to the compiler causes a build error. So omit the
> > -mcpu argument when $PROCESSOR=max.
> > 
> > This affects only the TCG accelerator; when using KVM or HVF,
> > kvm-unit-tests sets the cpu model to 'host'.
> > 
> > Note that using --processor=max with a 32 bit compiler will cause a build
> > error: the CPU model that the compiler defaults to when the -mcpu argument
> > is missing lacks support for some of the instructions that kvm-unit-tests
> > uses. The solution in the case is to specify a CPU model for the compiler
> > using --cflags:
> > 
> >   ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>
> > 
> > This patch doesn't introduce a regression for arm when --processor=max is
> > used, it's only the error that changes: from an unknown processor type to
> > using instructions that are not available on the processor.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/Makefile.common | 2 ++
> >  configure           | 5 ++++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arm/Makefile.common b/arm/Makefile.common
> > index a5d97bcf477a..b757250dc9ae 100644
> > --- a/arm/Makefile.common
> > +++ b/arm/Makefile.common
> > @@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
> >  # stack.o relies on frame pointers.
> >  KEEP_FRAME_POINTER := y
> >  
> > +ifneq ($(PROCESSOR),max)
> >  CFLAGS += -mcpu=$(PROCESSOR)
> > +endif
> >  CFLAGS += -std=gnu99
> >  CFLAGS += -ffreestanding
> >  CFLAGS += -O2
> > diff --git a/configure b/configure
> > index 138840c3f76d..46964d36a7d8 100755
> > --- a/configure
> > +++ b/configure
> > @@ -67,7 +67,10 @@ usage() {
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > -	    --processor=PROCESSOR  processor to compile for ($default_processor)
> > +	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
> > +	                           value 'max' is special and it will be passed directly to
> > +	                           qemu, bypassing the compiler. In this case, --cflags can be
> > +	                           used to compile for a specific processor.
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > -- 
> > 2.47.1
> >
> 
> I don't think we want to overload processor this way. While mcpu and QEMU
> could both understand the same cpu names, then it was mostly fine
> (although it probably shouldn't have been overloaded before either). Now
> that we want one name for compiling and another for running, then I think
> we need another configure parameter, something like --qemu-cpu.

I agree, that's a better approach than overloading --processor. I'll try that
for the next iteration.

Thanks,
Alex

