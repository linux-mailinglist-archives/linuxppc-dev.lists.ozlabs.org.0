Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB71445FA1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 07:14:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlqwD22PLz2yY7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 17:14:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aZppCqTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlqvX11Dbz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 17:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aZppCqTB; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlqvR23wKz4xdM;
 Fri,  5 Nov 2021 17:13:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636092822;
 bh=Akk3WhXsvfpdeVPhfE7p2R9m6g/Ee2L7iXINN1roAwM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aZppCqTBm/BLADJpHbam080p9z5LzrnvaxmqW/JYkzoFn+KWSK/bdz5kERUEMKjGo
 MmVyNccD93tbxX5sginHmkIpJ1DZ0UKGWTXIbyiaNldwM20mAQS+NkFXIHwynf+F5z
 qMQIK9+mdJcCMVCUfmQbWTuBsGWMMIsnMtXScCOPljP6z03akr6JLLY2bo3SD7tcbY
 a3+h4BPpOfH72QKrKdJVbJBfNPIzM5BcOPunl0PdbzhLN+IXvHEQ0SiFnigpessbks
 9gfExohYy5m0Yp1eTUdGpgejMLIbprXrYXoDOwSbQJOudSfACIWy5TNGSLmo7cdVzI
 muzEztovXqMow==
From: Michael Ellerman <mpe@ellerman.id.au>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] powerpc: xmon: remove the duplicated operand of the
 bitwise operator
In-Reply-To: <20211105034011.76008-1-ye.guojin@zte.com.cn>
References: <20211105034011.76008-1-ye.guojin@zte.com.cn>
Date: Fri, 05 Nov 2021 17:13:35 +1100
Message-ID: <87y2636sfk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 paulus@samba.org, ye.guojin@zte.com.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgel.zte@gmail.com writes:
> From: Ye Guojin <ye.guojin@zte.com.cn>
>
> The operands of the bitwise OR operator are duplicated, remove one of
> them.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
> ---
>  arch/powerpc/xmon/ppc-opc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, but this code is copied from binutils, we don't take cleanup
patches to it.

cheers

> diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
> index dfb80810b16c..2cab0ec0d162 100644
> --- a/arch/powerpc/xmon/ppc-opc.c
> +++ b/arch/powerpc/xmon/ppc-opc.c
> @@ -6731,9 +6731,9 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>  {"fre.",	A(63,24,1),   AFRALFRC_MASK, POWER5,	POWER7|PPCVLE,	{FRT, FRB, A_L}},
>  
>  {"fmul",	A(63,25,0),	AFRB_MASK,   PPCCOM,	PPCEFS|PPCVLE,	{FRT, FRA, FRC}},
> -{"fm",		A(63,25,0),	AFRB_MASK,   PWRCOM,	PPCVLE|PPCVLE,	{FRT, FRA, FRC}},
> +{"fm",		A(63, 25, 0),	AFRB_MASK,   PWRCOM,	PPCVLE,	{FRT, FRA, FRC}},
>  {"fmul.",	A(63,25,1),	AFRB_MASK,   PPCCOM,	PPCEFS|PPCVLE,	{FRT, FRA, FRC}},
> -{"fm.",		A(63,25,1),	AFRB_MASK,   PWRCOM,	PPCVLE|PPCVLE,	{FRT, FRA, FRC}},
> +{"fm.",		A(63, 25, 1),	AFRB_MASK,   PWRCOM,	PPCVLE,	{FRT, FRA, FRC}},
>  
>  {"frsqrte",	A(63,26,0),   AFRAFRC_MASK,  POWER7,	PPCVLE,		{FRT, FRB}},
>  {"frsqrte",	A(63,26,0),   AFRALFRC_MASK, PPC,	POWER7|PPCVLE,	{FRT, FRB, A_L}},
> -- 
> 2.25.1
