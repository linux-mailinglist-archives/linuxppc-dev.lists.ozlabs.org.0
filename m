Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 843ED7E6A63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 13:15:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DK3JO865;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SR1Bj37BSz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 23:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DK3JO865;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SR19p48rtz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 23:15:10 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SR19k3D3dz4xhv; Thu,  9 Nov 2023 23:15:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699532106;
	bh=frGo4fwMk1Wk2Ntdw267jXgq8Z2ET9n3kM79xo0I3mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DK3JO865vYIVHLHyQ5B/Rcnm3ZVgfbX7xdCVC7GLHsrxKES/mvjcHDX5AxsCNidRq
	 3hGUo+z7wYhP8TMVr57RLqK404s0sJ0oujZb+akIVrrFZTRnQP/bh/DTSodHDJoKJG
	 rMz5Yw4AyGN+UyPZE5wE7LUmmWrT+8BA+b8OKODhDne+bimsZRM4hAE/GonVd8Yt1o
	 iZdCNYKEnNBBvfiBQJaF34gKjCSpGMxAl7KY/Xrcz0HUUeA/kIzmM2nVPU1qd6sHQd
	 uOc1YsF6SZQExnAC1RJqYoxFwUSCFmz4K4zqkz/qoQHJqhUIxzi5cDo1M9wSD+AbQw
	 eHJkZI1UZf4Tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SR19k2QKYz4xPQ;
	Thu,  9 Nov 2023 23:15:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
In-Reply-To: <20231029124548.12198-2-sourabhjain@linux.ibm.com>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
Date: Thu, 09 Nov 2023 23:14:58 +1100
Message-ID: <87leb7qg1p.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

This seems like a good change to the design, but I'm confused by
some things, more below ...

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
...
>
> Table 1 below illustrates kernel's ability to collect dump if either the
> first/crashed kernel or the second/fadump kernel does not have the
> changes introduced here. Consider the 'old kernel' as the kernel without
> this patch, and the 'new kernel' as the kernel with this patch included.
>
> +----------+------------------------+------------------------+-------+
> | scenario |  first/crashed kernel  |  second/fadump kernel  |  Dump |
> +----------+------------------------+------------------------+-------+
> |    1     |       old kernel       |        new kernel      |  Yes  |
> +----------+------------------------+------------------------+-------+
> |    2     |       new kernel       |        old kernel      |  No   |
> +----------+------------------------+------------------------+-------+
>
> 			      Table 1
>
> Scenario 1:
> -----------
> Since the magic number of fadump header is updated, the second kernel
> can differentiate the crashed kernel is of type 'new kernel' or
> 'old kernel' and act accordingly. In this scenario, since the crashed
> kernel is of type 'old kernel,' the fadump kernel skips elfcorehdr
> creation and uses the one prepared in the first kernel itself to collect
> the dump.
>
> Scenario 2:
> -----------
> Since 'old kernel' as the fadump kernel is NOT capable of processing
> fadump header with updated magic number from 'new kernel' hence it
> gracefully fails with the below error and dump collection fails in this
> scenario.
>
> [    0.007365] rtas fadump: Crash info header is not valid.
>
> Add a version field to the fadump_crash_info_header structure to avoid
> the need to change its magic number in the future. Adding a version
> field to the fadump header was one of the TODO items listed in
> Documentation/powerpc/firmware-assisted-dump.rst.

This is a good analysis of the issues with different kernel versions,
and seems like an OK trade off, ie. that old kernels can't process dumps
from new kernels.

But do we actually support using different kernel versions for the
crash/dump kernel?

Because AFAICS the fadump_crash_info_header is not safe across kernel
versions, in its current form or with your changes.

> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index 27f9e11eda28..7be3d8894520 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
>  
>  #define FADUMP_CPU_UNKNOWN		(~((u32)0))
>  
> -#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
> +/*
> + * The introduction of new fields in the fadump crash info header has
> + * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
> + * This alteration ensures backward compatibility, enabling the kernel
> + * with the updated fadump crash info to handle kernel dumps from older
> + * kernels.
> + *
> + * To prevent the need for further changes to the magic number in the
> + * event of future modifications to the fadump header, a version field
> + * has been introduced to track the fadump crash info header version.
> + *
> + * Historically, there was no connection between the magic number and
> + * the fadump crash info header version. However, moving forward, the
> + * `FADMPINF` magic number in header will be treated as version 0, while
> + * the `FADMPSIG` magic number in header will include a version field to
> + * determine its version.
> + */
> +#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
> +#define FADUMP_VERSION			1
>  
>  /* fadump crash info structure */
>  struct fadump_crash_info_header {
> @@ -51,6 +69,10 @@ struct fadump_crash_info_header {
> 
struct fadump_crash_info_header {
	u64		magic_number;
	u64		elfcorehdr_addr;

>  	u32		crashing_cpu;
>  	struct pt_regs	regs;
>  	struct cpumask	cpu_mask;
> +	u32		version;
> +	u64		elfcorehdr_size;
> +	u64		vmcoreinfo_raddr;
> +	u64		vmcoreinfo_size;
>  };

The reason I say it's not safe is because pt_regs and especially cpumask
can change size depending on the kernel configuration.

pt_regs probably doesn't change size in practice for common kernel
configurations, but some of the fields are under #ifdef.

cpumask on the other hand is directly controlled by CONFIG_NR_CPUS. So
if the first and second kernel have a different value for NR_CPUS they
will disagree on the size of the struct.

That has presumably worked OK so far because folks tend to use the same, or
similar kernels for the first/second kernel. And also the cpumask is the
last element of the struct, so a disagreement about it size doesn't
affect the location of other fields.

However with your new design the version field will move based on the
cpumask size, which will potentially break detection of the version by
the second kernel.

At least that's how it looks to me, I don't see any checks anywhere that
will save us, or did I miss something?

cheers
