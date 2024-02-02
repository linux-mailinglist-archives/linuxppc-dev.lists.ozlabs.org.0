Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9B846C68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 10:41:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=evlI9VZA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR9l24p1kz3cmr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 20:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=evlI9VZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 541 seconds by postgrey-1.37 at boromir; Fri, 02 Feb 2024 20:40:36 AEDT
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR9kD4bD5z3c9c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 20:40:36 +1100 (AEDT)
Date: Fri, 2 Feb 2024 10:30:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706866258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e8g883f/GpUsUxGkhvVc+5AX3DgxX1o9yUjsrVR4F4=;
	b=evlI9VZAjia1/iXtCwCa9/DqNWD9130t2bEW3OBdtmPolS+c/WyvLG1i31fNKC8seNfn6s
	TVQCaiV0EeroRK+hyrW72UM8yCCWZm+UrdBAsYWSX7AYWDAVQzyZs7GoPCIaTocIqRmHIb
	HTcMmiXLzE0aXwhiC049O7+9Dzj3d5g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 1/9] (arm|powerpc|s390x): Makefile: Fix
 .aux.o generation
Message-ID: <20240202-2f93f59553cec386791f7629@orel>
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202065740.68643-2-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 02, 2024 at 04:57:32PM +1000, Nicholas Piggin wrote:
> Using all prerequisites for the source file results in the build
> dying on the second time around with:
> 
> gcc: fatal error: cannot specify ‘-o’ with ‘-c’, ‘-S’ or ‘-E’ with multiple files
> 
> This is due to auxinfo.h becoming a prerequisite after the first
> build recorded the dependency.
> 
> Use the first prerequisite for this recipe.
> 
> Fixes: f2372f2d49135 ("(arm|powerpc|s390x): Makefile: add `%.aux.o` target")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/Makefile.common     | 2 +-
>  powerpc/Makefile.common | 2 +-
>  s390x/Makefile          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 54cb4a63..c2ee568c 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -71,7 +71,7 @@ FLATLIBS = $(libcflat) $(LIBFDT_archive) $(libeabi)
>  
>  ifeq ($(CONFIG_EFI),y)
>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> -	$(CC) $(CFLAGS) -c -o $@ $^ \
> +	$(CC) $(CFLAGS) -c -o $@ $< \
>  		-DPROGNAME=\"$(@:.aux.o=.efi)\" -DAUXFLAGS=$(AUXFLAGS)

There are two instances of the %.aux.o target in arm/Makefile.common. We
need to fix both. We can actually pull the target out of the two arms of
the CONFIG_EFI if-else, though, by changing the .efi/.flat to .$(exe).

Thanks,
drew

>  
>  %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
> diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
> index 483ff648..eb88398d 100644
> --- a/powerpc/Makefile.common
> +++ b/powerpc/Makefile.common
> @@ -48,7 +48,7 @@ cflatobjs += lib/powerpc/smp.o
>  OBJDIRS += lib/powerpc
>  
>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> -	$(CC) $(CFLAGS) -c -o $@ $^ -DPROGNAME=\"$(@:.aux.o=.elf)\"
> +	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
>  
>  FLATLIBS = $(libcflat) $(LIBFDT_archive)
>  %.elf: CFLAGS += $(arch_CFLAGS)
> diff --git a/s390x/Makefile b/s390x/Makefile
> index e64521e0..b72f7578 100644
> --- a/s390x/Makefile
> +++ b/s390x/Makefile
> @@ -177,7 +177,7 @@ lds-autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d -MT $@
>  	$(CPP) $(lds-autodepend-flags) $(CPPFLAGS) -P -C -o $@ $<
>  
>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> -	$(CC) $(CFLAGS) -c -o $@ $^ -DPROGNAME=\"$(@:.aux.o=.elf)\"
> +	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
>  
>  .SECONDEXPANSION:
>  %.elf: $(FLATLIBS) $(asmlib) $(SRCDIR)/s390x/flat.lds $$(snippets-obj) $$(snippet-hdr-obj) %.o %.aux.o
> -- 
> 2.42.0
> 
