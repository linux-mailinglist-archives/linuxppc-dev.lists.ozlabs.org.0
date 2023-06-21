Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054B738EF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:39:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QN/q8bhM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXMq6HBMz3c4T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QN/q8bhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmBFJ1R9Dz30Nm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 15:02:11 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L4eTwW029028;
	Wed, 21 Jun 2023 05:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=kKqaLyNJce361zibCoiA0gBnI6xOEyoycLhuJOf/Gs0=;
 b=QN/q8bhMangxR7YTXy17HLyVi6/G1O7RNdNZBb/bGnXShwTIrm3uq7g7V0v/E0gGS6oC
 ipI27Nxw7pzEr3aNT2HsXYuzE6icYzB1rc+7R55wU63rcAOKuhXA7cN+ly8V2XEOMBue
 sJaQ29GB8j/TuOdaXepdQte42inmADlTGFtXg6+GhUY3KPRIndINHhrQNTUWfbBbJRvP
 QYtfDqVgSlHEWMjV33/fRx8HSJ0eLM+wj75ExrcizEX21KJXyyOhXqPRa1y3juKnYN5t
 r9QwprUvf32vp14SNunpN4zkiyVUulSSmUOWse6qzimyjbTlhUsXr0vjEVhXN/bk9g7p hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbskk1177-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:00:42 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L4g54N001282;
	Wed, 21 Jun 2023 05:00:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbskk114e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:00:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35KMdnEw011075;
	Wed, 21 Jun 2023 05:00:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f52hx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:00:36 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L50Xkp51511760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 05:00:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52AF520040;
	Wed, 21 Jun 2023 05:00:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E24BF20043;
	Wed, 21 Jun 2023 05:00:28 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.35.125])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 21 Jun 2023 05:00:28 +0000 (GMT)
Date: Wed, 21 Jun 2023 07:00:27 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric DeVolder <eric.devolder@oracle.com>, Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-13-eric.devolder@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619145801.1064716-13-eric.devolder@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3XxZUnG0tiAtapczX7p05vIqAJoPa-f-
X-Proofpoint-GUID: I-zaEuvbTS6JyBDC0PeGxtax3HbIXcwx
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_03,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210039
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 19, 2023 at 10:58:00AM -0400, Eric DeVolder wrote:

Hi Eric,

> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> NOTE: The original Kconfig has a KEXEC_SIG which depends on
> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
> dependency (using the strategy outlined in this series, and other
> techniques) results in 'error: recursive dependency detected'
> on CRYPTO. This occurs due to any path through KEXEC_SIG
> attempting to select CRYPTO is ultimately dependent upon CRYPTO:
> 
>  CRYPTO
>   <- ARCH_SUPPORTS_KEXEC_FILE
>      <- KEXEC_FILE
>         <- KEXEC_SIG
> 
> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
> for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
> configured-in as the use of KEXEC_SIG is in step with the use of
> SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.

No, it is actually the other way around.
Could you please provide the correct explanation?

AFAICT the MODULE_SIG_FORMAT dependency was introduced with commit
c8424e776b09 ("MODSIGN: Export module signature definitions") and
in fact was not necessary, since s390 did/does not use mod_check_sig()
anyway. So the SYSTEM_DATA_VERIFICATION could have left intact.

However, the original SYSTEM_DATA_VERIFICATION seems sane and I do
not understand why other architectures do not have it also? May be
Mimi Zohar (putting on CC) could explain that?

It looks like such dependency actually exists in implicit form
(which you picked from x86):

	In addition to this option, you need to enable signature
	verification for the corresponding kernel image type being
	loaded in order for this to work.

Does it mean that if an architecture did not enable the signature
verification type explicitly the linker could fail - both before
and after you series?

Thanks!

> Not ideal, but results in equivalent .config files for s390.
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
>  
> -- 
> 2.31.1
> 
