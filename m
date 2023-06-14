Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114872F25F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgpbT2Jq9z30g0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 12:02:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=thunder.leizhen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 179 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 11:22:47 AEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgnjM4VpBz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 11:22:44 +1000 (AEST)
Received: from dggpemm500006.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Qgng45C3bzLmks;
	Wed, 14 Jun 2023 09:20:48 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 09:22:36 +0800
Subject: Re: [PATCH v1 05/21] arm64/kexec: refactor for kernel/Kconfig.kexec
To: Eric DeVolder <eric.devolder@oracle.com>, <linux@armlinux.org.uk>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<geert@linux-m68k.org>, <tsbogend@alpha.franken.de>,
	<James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-ia64@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sh@vger.kernel.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-6-eric.devolder@oracle.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <29427d7c-7d81-9bda-0067-d17b51952cb4@huawei.com>
Date: Wed, 14 Jun 2023 09:22:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20230612172805.681179-6-eric.devolder@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 14 Jun 2023 12:02:20 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/6/13 1:27, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/arm64/Kconfig | 61 ++++++++--------------------------------------
>  1 file changed, 10 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 343e1e1cae10..33552476a877 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1433,60 +1433,19 @@ config PARAVIRT_TIME_ACCOUNTING
>  
>  	  If in doubt, say N here.
>  
> -config KEXEC
> -	depends on PM_SLEEP_SMP
> -	select KEXEC_CORE
> -	bool "kexec system call"
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.   And like a reboot
> -	  you can start any kernel with it, not just Linux.
> -
> -config KEXEC_FILE
> -	bool "kexec file based system call"
> -	select KEXEC_CORE
> -	select HAVE_IMA_KEXEC if IMA
> -	help
> -	  This is new version of kexec system call. This system call is
> -	  file based and takes file descriptors as system call argument
> -	  for kernel and initramfs as opposed to list of segments as
> -	  accepted by previous system call.
> -
> -config KEXEC_SIG
> -	bool "Verify kernel signature during kexec_file_load() syscall"
> -	depends on KEXEC_FILE
> -	help
> -	  Select this option to verify a signature with loaded kernel
> -	  image. If configured, any attempt of loading a image without
> -	  valid signature will fail.
> -
> -	  In addition to that option, you need to enable signature
> -	  verification for the corresponding kernel image type being
> -	  loaded in order for this to work.
> +config ARCH_HAS_KEXEC
> +	def_bool PM_SLEEP_SMP
>  
> -config KEXEC_IMAGE_VERIFY_SIG
> -	bool "Enable Image signature verification support"
> -	default y
> -	depends on KEXEC_SIG
> -	depends on EFI && SIGNED_PE_FILE_VERIFICATION
> -	help
> -	  Enable Image signature verification support.

I don't see an alternative to this option. It's used in
arch/arm64/kernel/kexec_image.c:135

> -
> -comment "Support for PE file signature verification disabled"
> -	depends on KEXEC_SIG
> -	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
> +config ARCH_HAS_KEXEC_FILE
> +	def_bool y
>  
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec.
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool y
> +	depends on KEXEC_FILE
> +	select HAVE_IMA_KEXEC if IMA
>  
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_HAS_CRASH_DUMP
> +	def_bool y
>  
>  config TRANS_TABLE
>  	def_bool y
> 

-- 
Regards,
  Zhen Lei
