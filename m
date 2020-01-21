Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB871436E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 07:00:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481yZ73x0DzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 17:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=WV0dvGFU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481yXT4SjczDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 16:59:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 481yXL64VTz9ty3Y;
 Tue, 21 Jan 2020 06:58:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WV0dvGFU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PHTZgmKWrw3Y; Tue, 21 Jan 2020 06:58:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 481yXL4vJKz9ty3X;
 Tue, 21 Jan 2020 06:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579586338; bh=S4GlmXILbwAbseJ3N4t+VG0i0jAmUowOEGM6twfSvl8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WV0dvGFUSU+rn7UwNLs5jFnXVUnawCjgqjTRPGXZHtb36bii2OPU2yJnCJaHZEbrm
 1/qdndZLfzCLb8rqntTFyMZIMklzT9Y0HpFlWiIYe98STQP7vp4NZX8FBFbzwlvEHy
 fRSLQJSq7lBb0RBy+x4phR5Nox55vLKrUFtdaJG4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D21118B78F;
 Tue, 21 Jan 2020 06:58:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Xg_Kupstu5q6; Tue, 21 Jan 2020 06:58:58 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 21A858B776;
 Tue, 21 Jan 2020 06:58:54 +0100 (CET)
Subject: Re: [PATCH] powerpc/sysdev: fix compile errors
To: wangwenhu <wenhu.pku@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200121053114.89676-1-wenhu.pku@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9d32c935-a193-b339-1950-3443cb022780@c-s.fr>
Date: Tue, 21 Jan 2020 06:58:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121053114.89676-1-wenhu.pku@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: lonehugo@hotmail.com, trivial@kernel.org, wenhu.wang@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/01/2020 à 06:31, wangwenhu a écrit :
> From: wangwenhu <wenhu.wang@vivo.com>
> 
> Include arch/powerpc/include/asm/io.h into fsl_85xx_cache_sram.c to
> fix the implicit declaration compile errors when building Cache-Sram.

It is usually better to include <linux/io.h> instead of <asm/io.h>

Christophe
