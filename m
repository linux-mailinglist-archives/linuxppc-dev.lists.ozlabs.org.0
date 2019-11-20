Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4101046CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 00:00:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JJ7d71cLzDqw6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 10:00:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codethink.co.uk (client-ip=176.9.8.82;
 helo=imap1.codethink.co.uk; envelope-from=ben.hutchings@codethink.co.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=codethink.co.uk
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JJ1C2MD9zDqs6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 09:54:55 +1100 (AEDT)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iXYgs-0006FE-Oe; Wed, 20 Nov 2019 22:43:14 +0000
Message-ID: <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 20 Nov 2019 22:43:13 +0000
In-Reply-To: <20191108210824.1534248-7-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
Organization: Codethink Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
[...]
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -15,10 +15,8 @@
>  /* Offset for the low 32-bit part of a field of long type */
>  #if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
>  #define LOPART	4
> -#define TSPEC_TV_SEC	TSPC64_TV_SEC+LOPART
>  #else
>  #define LOPART	0
> -#define TSPEC_TV_SEC	TSPC32_TV_SEC
>  #endif
>  
>  	.text
> @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>  	bl	__get_datapage@local
>  	mr	r9, r3			/* datapage ptr in r9 */
>  
> -	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
> +	lwz	r3,STAMP_XTIME_SEC+LOWPART(r9)

"LOWPART" should be "LOPART".

>  
>  	cmplwi	r11,0			/* check if t is NULL */
>  	beq	2f
> @@ -268,7 +266,7 @@ __do_get_tspec:
>  	 * as a 32.32 fixed-point number in r3 and r4.
>  	 * Load & add the xtime stamp.
>  	 */
> -	lwz	r5,STAMP_XTIME+TSPEC_TV_SEC(r9)
> +	lwz	r5,STAMP_XTIME_SEC+LOWPART(r9)

Same here.

>  	lwz	r6,STAMP_SEC_FRAC(r9)
>  	addc	r4,r4,r6
>  	adde	r3,r3,r5
[...]

-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

