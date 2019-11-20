Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193A1046C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 23:56:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JJ3001CVzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:56:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JJ140k9szDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 09:54:45 +1100 (AEDT)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iXVPd-00028t-QK; Wed, 20 Nov 2019 19:13:14 +0000
Message-ID: <fdcb510863c801f1f64448e558ee0f8ed20db418.camel@codethink.co.uk>
Subject: Re: [Y2038] [PATCH 3/8] powerpc: fix vdso32 for ppc64le
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 20 Nov 2019 19:13:12 +0000
In-Reply-To: <20191108203435.112759-4-arnd@arndb.de>
References: <20191108203435.112759-1-arnd@arndb.de>
 <20191108203435.112759-4-arnd@arndb.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-08 at 21:34 +0100, Arnd Bergmann wrote:
> On little-endian 32-bit application running on 64-bit kernels,
> the current vdso would read the wrong half of the xtime seconds
> field. Change it to return the lower half like it does on
> big-endian.

ppc64le doesn't have 32-bit compat so this is only theoretical.

Ben.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/kernel/vdso32/gettimeofday.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index becd9f8767ed..4327665ad86f 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -13,7 +13,7 @@
>  #include <asm/unistd.h>
>  
>  /* Offset for the low 32-bit part of a field of long type */
> -#ifdef CONFIG_PPC64
> +#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
>  #define LOPART	4
>  #define TSPEC_TV_SEC	TSPC64_TV_SEC+LOPART
>  #else
-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

