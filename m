Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958E856D73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 20:15:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KcGlo1nP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbPsF3zQrz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 06:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KcGlo1nP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.181; helo=out-181.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbPqq1XTDz3dlY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 06:13:56 +1100 (AEDT)
Date: Thu, 15 Feb 2024 20:13:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708024415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sM3XuJbo/imwLbmrYIvBwXd4yxReBWwfCSoEs0rupM=;
	b=KcGlo1nPfVAJTNCWIozLp9o1WacJwy2+q4qL5TI39E572kA1yum8gibQzOeDIt4S3m0L9K
	AO16faP/P32D3nwchObpTbH95lbSluFZjkM2ognP472qS0mPc7gwiKBVMSnHUmTSpYm+GK
	D4NiqzXqoZAJv1AF4Z0mYzOs94ox/lo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [kvm-unit-tests PATCH v1 01/18] Makefile: Define __ASSEMBLY__
 for assembly files
Message-ID: <20240215-8527d5fd0c830d5d8d07f668@orel>
References: <20231130090722.2897974-1-shahuang@redhat.com>
 <20231130090722.2897974-2-shahuang@redhat.com>
 <20240115-0c41f7d4aa09b7b82613faa8@orel>
 <Zc42ZJYMFpXpM4mD@raptor>
 <20240215-f2a2e3798b1f64923417df00@orel>
 <Zc5G0Uu1QxJ1Qt36@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc5G0Uu1QxJ1Qt36@raptor>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, Eric Auger <eric.auger@redhat.com>, Nadav Amit <namit@vmware.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 05:16:01PM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Thu, Feb 15, 2024 at 05:32:22PM +0100, Andrew Jones wrote:
> > On Thu, Feb 15, 2024 at 04:05:56PM +0000, Alexandru Elisei wrote:
> > > Hi Drew,
> > > 
> > > On Mon, Jan 15, 2024 at 01:44:17PM +0100, Andrew Jones wrote:
> > > > On Thu, Nov 30, 2023 at 04:07:03AM -0500, Shaoqin Huang wrote:
> > > > > From: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > > 
> > > > > There are 25 header files today (found with grep -r "#ifndef __ASSEMBLY__)
> > > > > with functionality relies on the __ASSEMBLY__ prepocessor constant being
> > > > > correctly defined to work correctly. So far, kvm-unit-tests has relied on
> > > > > the assembly files to define the constant before including any header
> > > > > files which depend on it.
> > > > > 
> > > > > Let's make sure that nobody gets this wrong and define it as a compiler
> > > > > constant when compiling assembly files. __ASSEMBLY__ is now defined for all
> > > > > .S files, even those that didn't set it explicitely before.
> > > > > 
> > > > > Reviewed-by: Nikos Nikoleris <nikos.nikoleris@arm.com>
> > > > > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > > Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> > > > > ---
> > > > >  Makefile           | 5 ++++-
> > > > >  arm/cstart.S       | 1 -
> > > > >  arm/cstart64.S     | 1 -
> > > > >  powerpc/cstart64.S | 1 -
> > > > >  4 files changed, 4 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/Makefile b/Makefile
> > > > > index 602910dd..27ed14e6 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -92,6 +92,9 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
> > > > >  
> > > > >  autodepend-flags = -MMD -MP -MF $(dir $*).$(notdir $*).d
> > > > >  
> > > > > +AFLAGS  = $(CFLAGS)
> > > > > +AFLAGS += -D__ASSEMBLY__
> > > > > +
> > > > >  LDFLAGS += -nostdlib $(no_pie) -z noexecstack
> > > > >  
> > > > >  $(libcflat): $(cflatobjs)
> > > > > @@ -113,7 +116,7 @@ directories:
> > > > >  	@mkdir -p $(OBJDIRS)
> > > > >  
> > > > >  %.o: %.S
> > > > > -	$(CC) $(CFLAGS) -c -nostdlib -o $@ $<
> > > > > +	$(CC) $(AFLAGS) -c -nostdlib -o $@ $<
> > > > 
> > > > I think we can drop the two hunks above from this patch and just rely on
> > > > the compiler to add __ASSEMBLY__ for us when compiling assembly files.
> > > 
> > > I think the precompiler adds __ASSEMBLER__, not __ASSEMBLY__ [1]. Am I
> > > missing something?
> > > 
> > > [1] https://gcc.gnu.org/onlinedocs/cpp/macros/predefined-macros.html#c.__ASSEMBLER__
> > 
> > You're right. I'm not opposed to changing all the __ASSEMBLY__ references
> > to __ASSEMBLER__. I'll try to do that at some point unless you beat me to
> > it.
> 
> Actually, I quite prefer the Linux style of using __ASSEMBLY__ instead of
> __ASSEMBLER__, because it makes reusing Linux files easier. That, and the
> habit formed by staring at Linux assembly files.

Those are good arguments and also saves the churn. OK, let's keep this
patch and __ASSEMBLY__

Thanks,
drew
