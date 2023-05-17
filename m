Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C17069E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLvDY3hcpz3f4G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=B8zkdnJh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=B8zkdnJh;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLvCf0gCrz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:31:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1684330250; i=deller@gmx.de;
	bh=jl4C0MMPzYSaMUj9hAZGlpM80aH2nFqt4Ef84LdBQHU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B8zkdnJh8TEqBvr2ggI8hJMudjsgVR9esE3lR+L2qrVTl/TLrGPEwznrBVOkGqgno
	 V2qcJK5A78gCcOeM4GkTk+eeS7p2ORy+kY/3IUwxKRPm2CR61MY2/ENLjeFZd2cwUC
	 LR1+YVlRcAGw5fPVbZ/yTXVz3aT2AJoZDEIU9CIb4KtCQp8UbLH9+Zf5keghD1+Als
	 al03yPlbamWXfvwv4RtER7NHdYcIiBOFUFUCUuxNB866NqVi0uOoDIkbiS6iNRw11m
	 dopfAvETWs3BpxUWHNw6ejF/pX4gONiAIcYs3rYphGpHW2s+PgdhPeMQtSHcM0O1lQ
	 E+xLwiP7oKjLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.155.177]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1q5JO33V30-008Lcm; Wed, 17
 May 2023 15:30:49 +0200
Message-ID: <d0bcd040-ff28-8100-7d76-a220eff683ae@gmx.de>
Date: Wed, 17 May 2023 15:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] procfs: consolidate arch_report_meminfo declaration
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, viro@zeniv.linux.org.uk,
 brauner@kernel.org
References: <20230516195834.551901-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230516195834.551901-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XI8jR6Tu9jxuR4NlHIxOt95wL+0B7/tEq/uItfC9gstKz1YmnZo
 8XzRze9wG3KkmbrW7ZAtJoRMeA4yK52BrtQMR+2OOAcg4ZV8DUBADG0OHWYRx4zVgdL/Rx8
 CGZGaPsKFeZxLBWKoQmXZIBe7UNGOiQfQwoA9dZvg5A+0KykMX1LaqQwYw9IzjsjlWoR6cb
 ScxvZAaqMhS2O9jW8O7tw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z/z+c4N1abQ=;3AyBWTU9XVO0NnCEtwtXUGjSRiE
 3UoPZgZAtM0OU9nJpQO6DudgqsnLH2f+mAKfyZ8DbvOSAfeHBEqLZvD0FZJMyJT49ttdQFUTq
 TgJV7+wpRyVdF3wtqGJvmhhCUwz0KxKKH79sTPkwKAQKYLNn80kbK3Mc33+CXLTanTF6eWcnN
 XuensTqwADwnOj4te+7lqJQWmQFcCHPRucVMEAouiCxGtxZ3BrZl/AI1Yuddkw3qUaPpuGGvq
 o7J1/TVvK3Lnngwm78HJQrHevPn34gs8azuCr5tuGAWj9dHyXOdxCbLYV/1eopC3pBdvBxwwk
 zuQ7WK+//06lsh/AVZvq2Q10bstieTzhleGhM5m3tbmSDoiEqOLL/tZYCRWO3pcnTeK/JMEg+
 M5+PZUFxdsJGtleNR08Rrj60zONWgNVBG7WTHTt5xNPq0mWNdHqj5n4dt6jSqI3ogBLH2SUMf
 dJ5Nb4yHAqTq7Eoi3KoyVEw8kim4Pk1OEl+cQkpGa/lNXvOZDSXQwwNif5UmZ1iCGtWj7Tz9/
 +6Anb8tRNxhgQyjjDgjoq+RoyI9RImUD5hVDmJcsaqx9p5DOVSR83atcVyAw+QlR9OYWojyFP
 BP9Q2MS/g/W1GnMqFa61AgxP0ySeuvJ/pVKMM0Z2d1fhe/GPxrVKc9mOztALxSPCrmQT86f3d
 O3xWxy1mYErqWtIB7S5QO3eE95O8KIz/N55sz2NsJsuuOUvc8Of14YDZ01+ZRsCWDnsRybC4c
 a0ypZJtxIb9bvEr3NgD86/Kr96K83Cmkri5D59EEjuOW9njO609fH79RDUYNBWM2nR/e7Tcit
 CBj2vG+AJkXuNzwtYlh5hyBwUKH2P3SUX3hYpsBlxyzY7MzJlqW9bq1ur/D1UIeC34xBgiW7Q
 U4r9pbGW7maXJ8aNYbp9Y9wqho7mcIeykTLz2Y1J1dTyxHiW8rWRJtrf3aC/OLBT3PrQ2bQnU
 r9u8OfZZ2tWm9LoOCHQn9YHZpps=
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/16/23 21:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arch_report_meminfo() function is provided by four architectures,
> with a __weak fallback in procfs itself. On architectures that don't
> have a custom version, the __weak version causes a warning because
> of the missing prototype.
>
> Remove the architecture specific prototypes and instead add one
> in linux/proc_fs.h.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/parisc/include/asm/pgtable.h    | 3 ---

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge


>   arch/powerpc/include/asm/pgtable.h   | 3 ---
>   arch/s390/include/asm/pgtable.h      | 3 ---
>   arch/s390/mm/pageattr.c              | 1 +
>   arch/x86/include/asm/pgtable.h       | 1 +
>   arch/x86/include/asm/pgtable_types.h | 3 ---
>   arch/x86/mm/pat/set_memory.c         | 1 +
>   include/linux/proc_fs.h              | 2 ++
>   8 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm=
/pgtable.h
> index e715df5385d6..5656395c95ee 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -472,9 +472,6 @@ static inline void ptep_set_wrprotect(struct mm_stru=
ct *mm, unsigned long addr,
>
>   #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))
>
> -struct seq_file;
> -extern void arch_report_meminfo(struct seq_file *m);
> -
>   #endif /* !__ASSEMBLY__ */
>
>
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/a=
sm/pgtable.h
> index 9972626ddaf6..6a88bfdaa69b 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -165,9 +165,6 @@ static inline bool is_ioremap_addr(const void *x)
>
>   	return addr >=3D IOREMAP_BASE && addr < IOREMAP_END;
>   }
> -
> -struct seq_file;
> -void arch_report_meminfo(struct seq_file *m);
>   #endif /* CONFIG_PPC64 */
>
>   #endif /* __ASSEMBLY__ */
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgt=
able.h
> index 6822a11c2c8a..c55f3c3365af 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -42,9 +42,6 @@ static inline void update_page_count(int level, long c=
ount)
>   		atomic_long_add(count, &direct_pages_count[level]);
>   }
>
> -struct seq_file;
> -void arch_report_meminfo(struct seq_file *m);
> -
>   /*
>    * The S390 doesn't have any external MMU info: the kernel page
>    * tables contain all the necessary information.
> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
> index 5ba3bd8a7b12..ca5a418c58a8 100644
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@ -4,6 +4,7 @@
>    * Author(s): Jan Glauber <jang@linux.vnet.ibm.com>
>    */
>   #include <linux/hugetlb.h>
> +#include <linux/proc_fs.h>
>   #include <linux/vmalloc.h>
>   #include <linux/mm.h>
>   #include <asm/cacheflush.h>
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtab=
le.h
> index 15ae4d6ba476..5700bb337987 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -27,6 +27,7 @@
>   extern pgd_t early_top_pgt[PTRS_PER_PGD];
>   bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
>
> +struct seq_file;
>   void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
>   void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struc=
t *mm,
>   				   bool user);
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm=
/pgtable_types.h
> index 447d4bee25c4..ba3e2554799a 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -513,9 +513,6 @@ extern void native_pagetable_init(void);
>   #define native_pagetable_init        paging_init
>   #endif
>
> -struct seq_file;
> -extern void arch_report_meminfo(struct seq_file *m);
> -
>   enum pg_level {
>   	PG_LEVEL_NONE,
>   	PG_LEVEL_4K,
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 7159cf787613..d1515756e369 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -9,6 +9,7 @@
>   #include <linux/mm.h>
>   #include <linux/interrupt.h>
>   #include <linux/seq_file.h>
> +#include <linux/proc_fs.h>
>   #include <linux/debugfs.h>
>   #include <linux/pfn.h>
>   #include <linux/percpu.h>
> diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
> index 0260f5ea98fe..e981ef830252 100644
> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@ -158,6 +158,8 @@ int proc_pid_arch_status(struct seq_file *m, struct =
pid_namespace *ns,
>   			struct pid *pid, struct task_struct *task);
>   #endif /* CONFIG_PROC_PID_ARCH_STATUS */
>
> +extern void arch_report_meminfo(struct seq_file *m);
> +
>   #else /* CONFIG_PROC_FS */
>
>   static inline void proc_root_init(void)

