Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8E695E24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:07:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFhg5gVhz3fQx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=omp.ru (client-ip=90.154.21.10; helo=mx01.omp.ru; envelope-from=s.shtylyov@omp.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 908 seconds by postgrey-1.36 at boromir; Tue, 14 Feb 2023 20:05:51 AEDT
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFg33y6Bz3cMN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:05:49 +1100 (AEDT)
Received: from [192.168.1.103] (31.173.87.80) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 14 Feb
 2023 11:50:23 +0300
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
	<corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
	<linux-arch@vger.kernel.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-11-alexghiti@rivosinc.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
Date: Tue, 14 Feb 2023 11:50:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230214074925.228106-11-alexghiti@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.80]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 02/14/2023 08:31:15
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 175500 [Feb 14 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 504 504 dc137e1f9c062eb6c0671e7d509ab442ae395562
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.80 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.80 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.80
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/14/2023 08:34:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/14/2023 6:26:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/14/23 10:49 AM, Alexandre Ghiti wrote:

> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/sparc/include/asm/setup.h      | 6 +++++-
>  arch/sparc/include/uapi/asm/setup.h | 7 -------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
> index 72205684e51e..d1384ed92547 100644
> --- a/arch/sparc/include/asm/setup.h
> +++ b/arch/sparc/include/asm/setup.h
> @@ -7,7 +7,11 @@
>  
>  #include <linux/interrupt.h>
>  
> -#include <uapi/asm/setup.h>
> +#if defined(__sparc__) && defined(__arch64__)

   Mhm, I don't think these two can be #define'd simulaneously...

> +# define COMMAND_LINE_SIZE 2048
> +#else
> +# define COMMAND_LINE_SIZE 256
> +#endif
>  
>  extern char reboot_command[];
>  
> diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
> index 3c208a4dd464..c3cf1b0d30b3 100644
> --- a/arch/sparc/include/uapi/asm/setup.h
> +++ b/arch/sparc/include/uapi/asm/setup.h
> @@ -6,11 +6,4 @@
>  #ifndef _UAPI_SPARC_SETUP_H
>  #define _UAPI_SPARC_SETUP_H
>  
> -#if defined(__sparc__) && defined(__arch64__)
> -# define COMMAND_LINE_SIZE 2048
> -#else
> -# define COMMAND_LINE_SIZE 256
> -#endif
> -
> -
>  #endif /* _UAPI_SPARC_SETUP_H */

MBR, Sergey
