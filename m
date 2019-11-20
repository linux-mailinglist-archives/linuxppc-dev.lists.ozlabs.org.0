Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D831046BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 23:53:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JHz91XF7zDqtm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:53:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JHvS4sDZzDqrq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 09:49:55 +1100 (AEDT)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iXYmm-0006Lg-Um; Wed, 20 Nov 2019 22:49:21 +0000
Message-ID: <dd1a30609f05e800550097080c1d1b27065f91ff.camel@codethink.co.uk>
Subject: Re: [Y2038] [PATCH 08/23] y2038: ipc: remove __kernel_time_t
 reference from headers
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org, Ralf Baechle
 <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan
 <jhogan@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,  "David S.
 Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>, x86@kernel.org
Date: Wed, 20 Nov 2019 22:49:19 +0000
In-Reply-To: <20191108210824.1534248-8-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-8-arnd@arndb.de>
Organization: Codethink Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Nov 2019 09:51:16 +1100
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
[...]
> --- a/arch/x86/include/uapi/asm/sembuf.h
> +++ b/arch/x86/include/uapi/asm/sembuf.h
> @@ -21,9 +21,9 @@ struct semid64_ds {
>  	unsigned long	sem_ctime;	/* last change time */
>  	unsigned long	sem_ctime_high;
>  #else
> -	__kernel_time_t	sem_otime;	/* last semop time */
> +	long		sem_otime;	/* last semop time */
>  	__kernel_ulong_t __unused1;
> -	__kernel_time_t	sem_ctime;	/* last change time */
> +	long		sem_ctime;	/* last change time */
>  	__kernel_ulong_t __unused2;
>  #endif
>  	__kernel_ulong_t sem_nsems;	/* no. of semaphores in array */
[...]

We need to use __kernel_long_t here to do the right thing on x32.

Ben.

-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

