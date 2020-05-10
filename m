Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A911CCE83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 00:17:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Kz296CYRzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 08:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=hall.aurel32.net (client-ip=2001:bc8:30d7:100::1;
 helo=hall.aurel32.net; envelope-from=aurelien@aurel32.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256
 header.s=202004.hall header.b=qp2gTY/i; 
 dkim-atps=neutral
Received: from hall.aurel32.net (hall.aurel32.net [IPv6:2001:bc8:30d7:100::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kz0N14JvzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 08:15:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=QKrWCglmHIrEA/5Wh30xZ0GDeAJVKrUmaLXkngIVFqs=; b=qp2gTY/iNJC4C/0ds+1pG5wvqE
 eA53LGYAFSOmxYJErvvhm17yNKHzYGTzmRyIpn3TwRhzZ+86TAgYB5YTzkG2YsR0EZaZvul8ctnpP
 dhzsKADwzMi07dghTVKouwrozJ/2CcEjtmNreXA6IXGnM43hV4d9CRVrkVurBHE8eiJL38CO1JFoq
 sdpJXEt3RkUzy/ZSVTVSGFYgcp6zx+BVddWxECY+fNYZ8gEkkyedv/rPlkih1mG5wXDj98r5QPTdv
 vvgtHgd9zByjW0hugh5SUjkdFwcpVdbyWY3iRssr0JdSNAkgfWTzOWa+B48bMAsaxVTIL0qbc+sCY
 35i/lE8w==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jXuE3-0003Ep-8w; Mon, 11 May 2020 00:15:11 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.93)
 (envelope-from <aurelien@aurel32.net>)
 id 1jXuE2-003yoD-Ej; Mon, 11 May 2020 00:15:10 +0200
Date: Mon, 11 May 2020 00:15:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH fixes] powerpc/vdso32: Fallback on getres syscall when
 clock is unknown
Message-ID: <20200510221510.GA948665@aurel32.net>
Mail-Followup-To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <7316a9e2c0c2517923eb4b0411c4a08d15e675a4.1589017281.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7316a9e2c0c2517923eb4b0411c4a08d15e675a4.1589017281.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.13.2 (2019-12-18)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2020-05-09 09:42, Christophe Leroy wrote:
> There are other clocks than the standard ones, for instance
> per process clocks. Therefore, being above the last standard clock
> doesn't mean it is a bad clock. So, fallback to syscall instead
> of returning -EINVAL inconditionaly.
> 
> Fixes: e33ffc956b08 ("powerpc/vdso32: implement clock_getres entirely")
> Cc: stable@vger.kernel.org
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/vdso32/gettimeofday.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index a3951567118a..e7f8f9f1b3f4 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -218,11 +218,11 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>  	blr
>  
>  	/*
> -	 * invalid clock
> +	 * syscall fallback
>  	 */
>  99:
> -	li	r3, EINVAL
> -	crset	so
> +	li	r0,__NR_clock_getres
> +	sc
>  	blr
>    .cfi_endproc
>  V_FUNCTION_END(__kernel_clock_getres)

Thanks a lot for the fast answer. I have just tested this patch and I
confirm it fixes the issue.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
