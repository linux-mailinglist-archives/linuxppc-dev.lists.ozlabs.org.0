Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6153F47AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtRsS0s1Mz2xsV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1200 seconds by postgrey-1.36 at boromir;
 Mon, 23 Aug 2021 19:34:08 AEST
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtRrw55Kjz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:34:07 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 01DE01FED9;
 Mon, 23 Aug 2021 08:56:19 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 23 Aug
 2021 10:56:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0065799e57a-66fe-451c-a3d9-b40df5884a81,
 6C3DA580BFD2A03B9CD9C7EDF86CA127720438B1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH v2] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
References: <dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <753e61fc-aab5-7797-d344-b15e9f4d6d5c@kaod.org>
Date: Mon, 23 Aug 2021 10:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72695990-56d4-485e-b4e1-f8349831bb03
X-Ovh-Tracer-Id: 7112028239204944678
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/23/21 8:49 AM, Christophe Leroy wrote:
> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
> targets") added generic support for AUDIT but that didn't include
> support for bi-arch like powerpc.
> 
> Commit 4b58841149dc ("audit: Add generic compat syscall support")
> added generic support for bi-arch.
> 
> Convert powerpc to that bi-arch generic audit support.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
> v2:
> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
> - Finalised commit description
> ---
>  arch/powerpc/Kconfig                |  5 +-
>  arch/powerpc/include/asm/unistd32.h |  7 +++
>  arch/powerpc/kernel/Makefile        |  3 --
>  arch/powerpc/kernel/audit.c         | 84 -----------------------------
>  arch/powerpc/kernel/compat_audit.c  | 44 ---------------
>  5 files changed, 8 insertions(+), 135 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/unistd32.h
>  delete mode 100644 arch/powerpc/kernel/audit.c
>  delete mode 100644 arch/powerpc/kernel/compat_audit.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 663766fbf505..5472358609d2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -163,6 +163,7 @@ config PPC
>  	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>  	select ARCH_WANT_LD_ORPHAN_WARN
>  	select ARCH_WEAK_RELEASE_ACQUIRE
> +	select AUDIT_ARCH_COMPAT_GENERIC
>  	select BINFMT_ELF
>  	select BUILDTIME_TABLE_SORT
>  	select CLONE_BACKWARDS
> @@ -316,10 +317,6 @@ config GENERIC_TBSYNC
>  	bool
>  	default y if PPC32 && SMP
>  
> -config AUDIT_ARCH
> -	bool
> -	default y
> -
>  config GENERIC_BUG
>  	bool
>  	default y
> diff --git a/arch/powerpc/include/asm/unistd32.h b/arch/powerpc/include/asm/unistd32.h
> new file mode 100644
> index 000000000000..07689897d206
> --- /dev/null
> +++ b/arch/powerpc/include/asm/unistd32.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_POWERPC_UNISTD32_H_
> +#define _ASM_POWERPC_UNISTD32_H_
> +
> +#include <asm/unistd_32.h>
> +
> +#endif /* _ASM_POWERPC_UNISTD32_H_ */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 7be36c1e1db6..825121eba3c2 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -125,9 +125,6 @@ obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
>  				   pci-common.o pci_of_scan.o
>  obj-$(CONFIG_PCI_MSI)		+= msi.o
>  
> -obj-$(CONFIG_AUDIT)		+= audit.o
> -obj64-$(CONFIG_AUDIT)		+= compat_audit.o
> -
>  obj-$(CONFIG_PPC_IO_WORKAROUNDS)	+= io-workarounds.o
>  
>  obj-y				+= trace/
> diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
> deleted file mode 100644
> index a2dddd7f3d09..000000000000
> --- a/arch/powerpc/kernel/audit.c
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/init.h>
> -#include <linux/types.h>
> -#include <linux/audit.h>
> -#include <asm/unistd.h>
> -
> -static unsigned dir_class[] = {
> -#include <asm-generic/audit_dir_write.h>
> -~0U
> -};
> -
> -static unsigned read_class[] = {
> -#include <asm-generic/audit_read.h>
> -~0U
> -};
> -
> -static unsigned write_class[] = {
> -#include <asm-generic/audit_write.h>
> -~0U
> -};
> -
> -static unsigned chattr_class[] = {
> -#include <asm-generic/audit_change_attr.h>
> -~0U
> -};
> -
> -static unsigned signal_class[] = {
> -#include <asm-generic/audit_signal.h>
> -~0U
> -};
> -
> -int audit_classify_arch(int arch)
> -{
> -#ifdef CONFIG_PPC64
> -	if (arch == AUDIT_ARCH_PPC)
> -		return 1;
> -#endif
> -	return 0;
> -}
> -
> -int audit_classify_syscall(int abi, unsigned syscall)
> -{
> -#ifdef CONFIG_PPC64
> -	extern int ppc32_classify_syscall(unsigned);
> -	if (abi == AUDIT_ARCH_PPC)
> -		return ppc32_classify_syscall(syscall);
> -#endif
> -	switch(syscall) {
> -	case __NR_open:
> -		return 2;
> -	case __NR_openat:
> -		return 3;
> -	case __NR_socketcall:
> -		return 4;
> -	case __NR_execve:
> -		return 5;
> -	default:
> -		return 0;
> -	}
> -}
> -
> -static int __init audit_classes_init(void)
> -{
> -#ifdef CONFIG_PPC64
> -	extern __u32 ppc32_dir_class[];
> -	extern __u32 ppc32_write_class[];
> -	extern __u32 ppc32_read_class[];
> -	extern __u32 ppc32_chattr_class[];
> -	extern __u32 ppc32_signal_class[];
> -	audit_register_class(AUDIT_CLASS_WRITE_32, ppc32_write_class);
> -	audit_register_class(AUDIT_CLASS_READ_32, ppc32_read_class);
> -	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ppc32_dir_class);
> -	audit_register_class(AUDIT_CLASS_CHATTR_32, ppc32_chattr_class);
> -	audit_register_class(AUDIT_CLASS_SIGNAL_32, ppc32_signal_class);
> -#endif
> -	audit_register_class(AUDIT_CLASS_WRITE, write_class);
> -	audit_register_class(AUDIT_CLASS_READ, read_class);
> -	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
> -	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
> -	audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
> -	return 0;
> -}
> -
> -__initcall(audit_classes_init);
> diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
> deleted file mode 100644
> index 55c6ccda0a85..000000000000
> --- a/arch/powerpc/kernel/compat_audit.c
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#undef __powerpc64__
> -#include <asm/unistd.h>
> -
> -unsigned ppc32_dir_class[] = {
> -#include <asm-generic/audit_dir_write.h>
> -~0U
> -};
> -
> -unsigned ppc32_chattr_class[] = {
> -#include <asm-generic/audit_change_attr.h>
> -~0U
> -};
> -
> -unsigned ppc32_write_class[] = {
> -#include <asm-generic/audit_write.h>
> -~0U
> -};
> -
> -unsigned ppc32_read_class[] = {
> -#include <asm-generic/audit_read.h>
> -~0U
> -};
> -
> -unsigned ppc32_signal_class[] = {
> -#include <asm-generic/audit_signal.h>
> -~0U
> -};
> -
> -int ppc32_classify_syscall(unsigned syscall)
> -{
> -	switch(syscall) {
> -	case __NR_open:
> -		return 2;
> -	case __NR_openat:
> -		return 3;
> -	case __NR_socketcall:
> -		return 4;
> -	case __NR_execve:
> -		return 5;
> -	default:
> -		return 1;
> -	}
> -}
> 

