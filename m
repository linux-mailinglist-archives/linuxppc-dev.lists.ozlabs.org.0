Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF073601B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:24:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQnz0z9rz30f9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:24:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 238 seconds by postgrey-1.37 at boromir; Tue, 20 Jun 2023 04:26:56 AEST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlJBm1MtXz301r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 04:26:56 +1000 (AEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qBJVV-000Ryh-FD; Mon, 19 Jun 2023 20:21:41 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qBJVV-000OlA-36; Mon, 19 Jun 2023 20:21:41 +0200
Message-ID: <5c66d9a869e24e795ae242598935eddfea095730.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk, 
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
 geert@linux-m68k.org, tsbogend@alpha.franken.de, 
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 ysato@users.sourceforge.jp,  dalias@libc.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de,  dave.hansen@linux.intel.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
Date: Mon, 19 Jun 2023 20:21:38 +0200
In-Reply-To: <20230619145801.1064716-14-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
	 <20230619145801.1064716-14-eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Eric!

On Mon, 2023-06-19 at 10:58 -0400, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>=20
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/sh/Kconfig | 46 ++++++++--------------------------------------
>  1 file changed, 8 insertions(+), 38 deletions(-)
>=20
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9652d367fc37..d52e0beed7e9 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -546,44 +546,14 @@ menu "Kernel features"
> =20
>  source "kernel/Kconfig.hz"
> =20
> -config KEXEC
> -	bool "kexec system call (EXPERIMENTAL)"
> -	depends on MMU
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.  And like a reboot
> -	  you can start any kernel with it, not just Linux.
> -
> -	  The name comes from the similarity to the exec system call.
> -
> -	  It is an ongoing process to be certain the hardware in a machine
> -	  is properly shutdown, so do not be surprised if this code does not
> -	  initially work for you.  As of this writing the exact hardware
> -	  interface is strongly in flux, so no good recommendation can be
> -	  made.
> -
> -config CRASH_DUMP
> -	bool "kernel crash dumps (EXPERIMENTAL)"
> -	depends on BROKEN_ON_SMP
> -	help
> -	  Generate crash dump after being started by kexec.
> -	  This should be normally only set in special crash dump kernels
> -	  which are loaded in the main kernel with kexec-tools into
> -	  a specially reserved region and then later executed after
> -	  a crash by kdump/kexec. The crash dump kernel must be compiled
> -	  to a memory address not used by the main kernel using
> -	  PHYSICAL_START.
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> -
> -config KEXEC_JUMP
> -	bool "kexec jump (EXPERIMENTAL)"
> -	depends on KEXEC && HIBERNATION
> -	help
> -	  Jump between original kernel and kexeced kernel and invoke
> -	  code via KEXEC
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool MMU
> +
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool BROKEN_ON_SMP
> +
> +config ARCH_SUPPORTS_KEXEC_JUMP
> +	def_bool y
> =20
>  config PHYSICAL_START
>  	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_D=
UMP)

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
