Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EA61F298
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5VTq2gKXz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:12:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eFqn82vo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eFqn82vo;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5VSv6gL6z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:11:25 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id 130so10412579pfu.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSezs+3A2UldWadIF4Wqf5rdwUtgAB6O0AVEGpwP4bU=;
        b=eFqn82vohSJnCYEnX7t+KONfUzdwQwOMNaA6i7wAcCN0KcyzoEZTXD56LiEER0pv3V
         qcIlOVGDAaXs9qSO9Kiqo9AYboSPuQLRjRe4FbSqJuPmF/icE1CXHrkgxDKKQifDDYEl
         dr+UF2Yk1+Nnf1mrw8o7nESqI7HQDhWPsdOONivWupe6d4aUkzGKzpJd31FvfRtvuNzS
         9IWiGriHMQVI/4f/rFyM+/yayCem6im9Lu/r9XEBlm7Fpk0gCqI8KZqwYkSAaRchioCx
         stlumuHKMxHZj3JNl7r988r1/O5BcgU1dJaqphcWtGdVRMrixXUwNce6ax9zNfSEi2Nh
         u4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bSezs+3A2UldWadIF4Wqf5rdwUtgAB6O0AVEGpwP4bU=;
        b=F8sUQt6CblBbPSgeNYdeCbIM3JWjFjSlPp8CJC5uj/i1ANYIEbYLcJ84ibHpJlQM3C
         bTH9D9LL/o4EWKg2qBTwWHiS8OCRsi6Yw5LUJdk2HFUggeh9/WXtFpmD2lpvaOa12MMv
         sMa5RGET4leYHbXVMI7LF1tlcSe3rjkbJTB2u7Xg7az45g5cHLgR3YIXb/vJZ7GjyXe0
         EuYR6k3cFTDOjzy60xpDdbPyRYt37/gUJ7RxQJfUHsZ6R0yFMNZ+HTnT1SoVe/aZT1fe
         OrI+ctSiNKCffYEDGc2ktB/1zmdxlO1CEoylpVauJ8FzZO3r4+a0E9Sgh/r1RNNqRAOL
         H/cA==
X-Gm-Message-State: ACrzQf1RRj5EChY8ZyG+b2U+t1jvvlIDfGZLFLDOwTmw+IaW4CpIaWaB
	GV0yoDf/4zDmLvrcqrWzgYI=
X-Google-Smtp-Source: AMsMyM6Mk/ZP3tcF6H/6SZTHGzYLFZ3n+l+XztSuXQMocylV0y8TQ40FNP1gdemC4s3sh/rvPlKiYA==
X-Received: by 2002:aa7:9010:0:b0:562:ebc8:6195 with SMTP id m16-20020aa79010000000b00562ebc86195mr814198pfo.38.1667823083085;
        Mon, 07 Nov 2022 04:11:23 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id b14-20020a63d30e000000b00470537b9b0asm3613098pgg.51.2022.11.07.04.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:11:22 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:11:17 +1000
Message-Id: <CO61XSIISI9G.PHZVHP50ZWUU@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Laurent Dufour" <ldufour@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc: export the CPU node count
X-Mailer: aerc 0.11.0
References: <20221028160034.44400-1-ldufour@linux.ibm.com>
 <20221028160034.44400-2-ldufour@linux.ibm.com>
In-Reply-To: <20221028160034.44400-2-ldufour@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Oct 29, 2022 at 2:00 AM AEST, Laurent Dufour wrote:
> At boot time, the FDT is parsed to compute the number of CPUs.
> In addition count the number of CPU nodes and export it.
>
> This is useful when building the FDT for a kexeced kernel since we need t=
o
> take in account the CPU node added since the boot time during CPU hotplug
> operations.

It would be nice if it just realloced memory in this case, but that
looks like a bigger change.

But these patches look okay to me, if you can solve the compile bug.

Thanks,
Nick

>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec_ranges.h | 2 ++
>  arch/powerpc/kernel/prom.c              | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/inclu=
de/asm/kexec_ranges.h
> index f83866a19e87..bf35d00ddd09 100644
> --- a/arch/powerpc/include/asm/kexec_ranges.h
> +++ b/arch/powerpc/include/asm/kexec_ranges.h
> @@ -22,4 +22,6 @@ int add_rtas_mem_range(struct crash_mem **mem_ranges);
>  int add_opal_mem_range(struct crash_mem **mem_ranges);
>  int add_reserved_mem_ranges(struct crash_mem **mem_ranges);
> =20
> +extern unsigned int boot_cpu_node_count;
> +
>  #endif /* _ASM_POWERPC_KEXEC_RANGES_H */
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 1eed87d954ba..d326148fd5a4 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -56,6 +56,7 @@
>  #include <asm/drmem.h>
>  #include <asm/ultravisor.h>
>  #include <asm/prom.h>
> +#include <asm/kexec_ranges.h>
> =20
>  #include <mm/mmu_decl.h>
> =20
> @@ -72,6 +73,7 @@ int __initdata iommu_is_off;
>  int __initdata iommu_force_on;
>  unsigned long tce_alloc_start, tce_alloc_end;
>  u64 ppc64_rma_size;
> +unsigned int boot_cpu_node_count __ro_after_init;
>  #endif
>  static phys_addr_t first_memblock_size;
>  static int __initdata boot_cpu_count;
> @@ -335,6 +337,8 @@ static int __init early_init_dt_scan_cpus(unsigned lo=
ng node,
>  	if (type =3D=3D NULL || strcmp(type, "cpu") !=3D 0)
>  		return 0;
> =20
> +	boot_cpu_node_count++;
> +
>  	/* Get physical cpuid */
>  	intserv =3D of_get_flat_dt_prop(node, "ibm,ppc-interrupt-server#s", &le=
n);
>  	if (!intserv)
> --=20
> 2.38.1

