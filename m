Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1582D91B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 13:53:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qkSTBs3V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDBrw0T4Xz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 23:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qkSTBs3V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.174; helo=out-174.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 485 seconds by postgrey-1.37 at boromir; Mon, 15 Jan 2024 23:52:33 AEDT
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDBr16YfJz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 23:52:33 +1100 (AEDT)
Date: Mon, 15 Jan 2024 13:44:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705322660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MwtEWLAXam/IycH3fliQdB9hc+Fa+3tIJSxCSLpGklg=;
	b=qkSTBs3VJnpyVeSfr53o+AUoEBfoa5dlIRd+6kIoAVDl8WIuSCQd77yD7dHnO6r3aksh+g
	OtddvsEWRILNOTNVjzpmeGn50EtxIftBx+29mCVpTVmGAxMBvvQQJrm1s9MV2LwKdIhhk5
	XxQ2ie+A3NvnwIF2Tfp5s7zyl1rQIV8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Shaoqin Huang <shahuang@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v1 01/18] Makefile: Define __ASSEMBLY__
 for assembly files
Message-ID: <20240115-0c41f7d4aa09b7b82613faa8@orel>
References: <20231130090722.2897974-1-shahuang@redhat.com>
 <20231130090722.2897974-2-shahuang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130090722.2897974-2-shahuang@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nikos Nikoleris <nikos.nikoleris@arm.com>, Eric Auger <eric.auger@redhat.com>, Nadav Amit <namit@vmware.com>, kvmarm@lists.linux.dev, Alexandru Elisei <alexandru.elisei@arm.com>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 30, 2023 at 04:07:03AM -0500, Shaoqin Huang wrote:
> From: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> There are 25 header files today (found with grep -r "#ifndef __ASSEMBLY__)
> with functionality relies on the __ASSEMBLY__ prepocessor constant being
> correctly defined to work correctly. So far, kvm-unit-tests has relied on
> the assembly files to define the constant before including any header
> files which depend on it.
> 
> Let's make sure that nobody gets this wrong and define it as a compiler
> constant when compiling assembly files. __ASSEMBLY__ is now defined for all
> .S files, even those that didn't set it explicitely before.
> 
> Reviewed-by: Nikos Nikoleris <nikos.nikoleris@arm.com>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  Makefile           | 5 ++++-
>  arm/cstart.S       | 1 -
>  arm/cstart64.S     | 1 -
>  powerpc/cstart64.S | 1 -
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 602910dd..27ed14e6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -92,6 +92,9 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
>  
>  autodepend-flags = -MMD -MP -MF $(dir $*).$(notdir $*).d
>  
> +AFLAGS  = $(CFLAGS)
> +AFLAGS += -D__ASSEMBLY__
> +
>  LDFLAGS += -nostdlib $(no_pie) -z noexecstack
>  
>  $(libcflat): $(cflatobjs)
> @@ -113,7 +116,7 @@ directories:
>  	@mkdir -p $(OBJDIRS)
>  
>  %.o: %.S
> -	$(CC) $(CFLAGS) -c -nostdlib -o $@ $<
> +	$(CC) $(AFLAGS) -c -nostdlib -o $@ $<

I think we can drop the two hunks above from this patch and just rely on
the compiler to add __ASSEMBLY__ for us when compiling assembly files.

Thanks,
drew

>  
>  -include */.*.d */*/.*.d
>  
> diff --git a/arm/cstart.S b/arm/cstart.S
> index 3dd71ed9..b24ecabc 100644
> --- a/arm/cstart.S
> +++ b/arm/cstart.S
> @@ -5,7 +5,6 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
> -#define __ASSEMBLY__
>  #include <auxinfo.h>
>  #include <asm/assembler.h>
>  #include <asm/thread_info.h>
> diff --git a/arm/cstart64.S b/arm/cstart64.S
> index bc2be45a..a8ad6dc8 100644
> --- a/arm/cstart64.S
> +++ b/arm/cstart64.S
> @@ -5,7 +5,6 @@
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2.
>   */
> -#define __ASSEMBLY__
>  #include <auxinfo.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/assembler.h>
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index 34e39341..fa32ef24 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -5,7 +5,6 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
> -#define __ASSEMBLY__
>  #include <asm/hcall.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/rtas.h>
> -- 
> 2.40.1
> 
