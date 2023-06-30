Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86861743CA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 15:23:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UJNJ5HvO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qswxb3HRXz3byH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 23:23:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UJNJ5HvO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qswcx40Bmz30h7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 23:09:04 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UCvYeb016458;
	Fri, 30 Jun 2023 13:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=FN5rqn/S21W/5bITOEzjFOkTwNe8qQWXAAfpvfDkQwg=;
 b=UJNJ5HvOCH3ioidpoyHaAYNX6R7hWNSBpLoG0wUffy5RnAhXHl86PbBvjDO6nKQ8USPi
 7sEXar1TkaNkmcJFphUybz6q6Tb4yxl6SQ/ZqNRH66WVQInysN81SF7fQAQUxOBDszhV
 3b8fRe2gCQIaza7qcDM7mCKwuC6Ilk9aNPGUJxMUw2n8gCQMYiSIO+tnObSPGBU121h5
 ObdAJVNEwAu8GE+11sjrvnwTnAQvi/lRj6vqNWPq1mVeKVoGfrKDv0hlj8okmsgyo6sj
 CZCipRtOJftBTKfcr2t7oYyiWPzb0tjUBJtcpOmD7Kcx/2Zrl+GVqvSu1uoCgmOa264S bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhygwgdcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:08:13 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35UCwN5D019695;
	Fri, 30 Jun 2023 13:08:03 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhygwgcwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:08:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35U3RosU004120;
	Fri, 30 Jun 2023 13:07:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rdr4545n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:07:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35UD7mYr35848862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jun 2023 13:07:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D1C420040;
	Fri, 30 Jun 2023 13:07:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20F4620049;
	Fri, 30 Jun 2023 13:07:46 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 30 Jun 2023 13:07:46 +0000 (GMT)
Date: Fri, 30 Jun 2023 15:07:44 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v3 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJ7ToGgYAq33bwYI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-13-eric.devolder@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626161332.183214-13-eric.devolder@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SRv3tQadK_BLStPKVFehsvtKgdD5bfpY
X-Proofpoint-ORIG-GUID: SMYiBxc5troNBtSiC2kzVXEEuROkenwR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300111
X-Mailman-Approved-At: Fri, 30 Jun 2023 23:22:47 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m
 68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 26, 2023 at 12:13:31PM -0400, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> NOTE: The original Kconfig has a KEXEC_SIG which depends on
> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
> dependency (using the strategy outlined in this series, and other
> techniques) results in 'error: recursive dependency detected'
> on CRYPTO.
> 
> Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
> dependency was introduced with [git commit below] and in fact was not
> necessary, since s390 did/does not use mod_check_sig() anyway.
> 
>  commit c8424e776b09 ("MODSIGN: Export module signature definitions")
> 
> MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
> SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
> MODULE_SIG_FORMAT does not hurt."
> 
> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
> from KEXEC_SIG. Still results in equivalent .config files for s390.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
>  1 file changed, 19 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 6dab9c1be508..58dc124433ca 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -243,6 +243,25 @@ config PGTABLE_LEVELS
>  
>  source "kernel/livepatch/Kconfig"
>  
> +config ARCH_DEFAULT_KEXEC
> +	def_bool y
> +
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool y
> +
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
> +
> +config ARCH_HAS_KEXEC_PURGATORY
> +	def_bool KEXEC_FILE
> +
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
> +	help
> +	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
> +	  This option also enables s390 zfcpdump.
> +	  See also <file:Documentation/s390/zfcpdump.rst>
> +
>  menu "Processor type and features"
>  
>  config HAVE_MARCH_Z10_FEATURES
> @@ -481,36 +500,6 @@ config SCHED_TOPOLOGY
>  
>  source "kernel/Kconfig.hz"
>  
> -config KEXEC
> -	def_bool y
> -	select KEXEC_CORE
> -
> -config KEXEC_FILE
> -	bool "kexec file based system call"
> -	select KEXEC_CORE
> -	depends on CRYPTO
> -	depends on CRYPTO_SHA256
> -	depends on CRYPTO_SHA256_S390
> -	help
> -	  Enable the kexec file based system call. In contrast to the normal
> -	  kexec system call this system call takes file descriptors for the
> -	  kernel and initramfs as arguments.
> -
> -config ARCH_HAS_KEXEC_PURGATORY
> -	def_bool y
> -	depends on KEXEC_FILE
> -
> -config KEXEC_SIG
> -	bool "Verify kernel signature during kexec_file_load() syscall"
> -	depends on KEXEC_FILE && MODULE_SIG_FORMAT
> -	help
> -	  This option makes kernel signature verification mandatory for
> -	  the kexec_file_load() syscall.
> -
> -	  In addition to that option, you need to enable signature
> -	  verification for the corresponding kernel image type being
> -	  loaded in order for this to work.
> -
>  config KERNEL_NOBP
>  	def_bool n
>  	prompt "Enable modified branch prediction for the kernel by default"
> @@ -732,22 +721,6 @@ config VFIO_AP
>  
>  endmenu
>  
> -menu "Dump support"
> -
> -config CRASH_DUMP
> -	bool "kernel crash dumps"
> -	select KEXEC
> -	help
> -	  Generate crash dump after being started by kexec.
> -	  Crash dump kernels are loaded in the main kernel with kexec-tools
> -	  into a specially reserved region and then later executed after
> -	  a crash by kdump/kexec.
> -	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
> -	  This option also enables s390 zfcpdump.
> -	  See also <file:Documentation/s390/zfcpdump.rst>
> -
> -endmenu
> -
>  config CCW
>  	def_bool y

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
