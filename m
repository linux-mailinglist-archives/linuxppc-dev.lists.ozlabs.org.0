Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED84E1E6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 01:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMFh36pVTz3bWw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 11:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FaiuqVxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FaiuqVxu; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMFgN71jzz2xm1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 11:22:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 965106128D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 00:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E71BC340F8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 00:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647822140;
 bh=sl757+nQ+uoFAxIuw/aW760I9HoJj/9PyrFKOdrvNPc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FaiuqVxuSXdpGRvEpDxoM+RJxM/OiPTeOBHcmxMy4hOU34jzlt7y8hxP1G9mgEEME
 YSYT3z/urqe2Jix0G2SD5g2K8I7xvs5FfETynak3yu1xUVdnnydZ7NhSjGmZEPHOZi
 yn83ZWnN+anRqZEXdP7wNRAW5/RQUJx+++8CxsUhvAtPms7Xtrwe0fJZ3fXJQvbH9R
 UDgziGUYpQlnF2Crqt+yGJ5TAU+smY5s8nVPEorCmdBuD00ycNVS7ye4ugauhVzBrS
 ANHE8JNJsO3F1cVJ+4BqUTMXb90mjqNHqwPgSdg7IY7YT8t3GGikF6Qs7TY3xMQ8IT
 4jbU8GeAkYJuw==
Received: by mail-vk1-f182.google.com with SMTP id 6so4058084vkc.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 17:22:20 -0700 (PDT)
X-Gm-Message-State: AOAM531m+uVMwvPrDVMHSwHjRfTJldX4YV+AnNylWzg8s1qLJJazzIg6
 J/WO0bIwWAarqWap1gHisFtPd46DYw3IfibiPWM=
X-Google-Smtp-Source: ABdhPJwJRuOhAiysCoOvQHwSmmYd801IxVPP+erWrfdv5T2vb3ztD/y1NOJnWVmPMPDyYpcC1/3ppbBpVDzb6NrH1hM=
X-Received: by 2002:a1f:2d6:0:b0:33e:9b64:e07e with SMTP id
 205-20020a1f02d6000000b0033e9b64e07emr5719806vkc.28.1647822139345; Sun, 20
 Mar 2022 17:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220316070317.1864279-1-guoren@kernel.org>
 <20220316070317.1864279-11-guoren@kernel.org>
In-Reply-To: <20220316070317.1864279-11-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Mar 2022 08:22:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSqbS3cUNcxKGoMT2zE3ws+gH6a0EssVEutpypR5YoHCA@mail.gmail.com>
Message-ID: <CAJF2gTSqbS3cUNcxKGoMT2zE3ws+gH6a0EssVEutpypR5YoHCA@mail.gmail.com>
Subject: Re: [PATCH V8 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For this patch, we need to add below to fixup the rv32 call rv64 elf
segment fault.

diff --git a/arch/riscv/include/asm/processor.h
b/arch/riscv/include/asm/processor.h
index 0749924d9e55..21c8072dce17 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -19,7 +19,11 @@
 #define TASK_UNMAPPED_BASE     PAGE_ALIGN(TASK_SIZE / 3)

 #define STACK_TOP              TASK_SIZE
-#define STACK_TOP_MAX          STACK_TOP
+#ifdef CONFIG_64BIT
+#define STACK_TOP_MAX          TASK_SIZE_64
+#else
+#define STACK_TOP_MAX          TASK_SIZE
+#endif
 #define STACK_ALIGN            16

 #ifndef __ASSEMBLY__

On Wed, Mar 16, 2022 at 3:04 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Make TASK_SIZE from const to dynamic detect TIF_32BIT flag
> function. Refer to arm64 to implement DEFAULT_MAP_WINDOW_64 for
> efi-stub.
>
> Limit 32-bit compatible process in 0-2GB virtual address range
> (which is enough for real scenarios), because it could avoid
> address sign extend problem when 32-bit enter 64-bit and ease
> software design.
>
> The standard 32-bit TASK_SIZE is 0x9dc00000:FIXADDR_START, and
> compared to a compatible 32-bit, it increases 476MB for the
> application's virtual address.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/pgtable.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index e3549e50de95..afdc9ece2ba4 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -705,8 +705,17 @@ static inline pmd_t pmdp_establish(struct vm_area_st=
ruct *vma,
>   * 63=E2=80=9348 all equal to bit 47, or else a page-fault exception wil=
l occur."
>   */
>  #ifdef CONFIG_64BIT
> -#define TASK_SIZE      (PGDIR_SIZE * PTRS_PER_PGD / 2)
> -#define TASK_SIZE_MIN  (PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
> +#define TASK_SIZE_64   (PGDIR_SIZE * PTRS_PER_PGD / 2)
> +#define TASK_SIZE_MIN  (PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
> +
> +#ifdef CONFIG_COMPAT
> +#define TASK_SIZE_32   (_AC(0x80000000, UL) - PAGE_SIZE)
> +#define TASK_SIZE      (test_thread_flag(TIF_32BIT) ? \
> +                        TASK_SIZE_32 : TASK_SIZE_64)
> +#else
> +#define TASK_SIZE      TASK_SIZE_64
> +#endif
> +
>  #else
>  #define TASK_SIZE      FIXADDR_START
>  #define TASK_SIZE_MIN  TASK_SIZE
> --
> 2.25.1
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
