Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D642FBDC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:35:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKwls1YtdzDr3Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 04:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKwjr2j2xzDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 04:33:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DKwjf69LSz9v6K4;
 Tue, 19 Jan 2021 18:33:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mB7-tkk37xPd; Tue, 19 Jan 2021 18:33:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DKwjf5H2tz9v6K3;
 Tue, 19 Jan 2021 18:33:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 654328B7DE;
 Tue, 19 Jan 2021 18:33:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sag3JxnQsqAg; Tue, 19 Jan 2021 18:33:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DAD18B7C7;
 Tue, 19 Jan 2021 18:33:27 +0100 (CET)
Subject: Re: [PATCH v6 04/49] soc: fsl: qe: introduce qe_io{read,write}*
 wrappers
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <20191128145554.1297-5-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a80b9c70-f9f2-0f76-15d0-d7a1c926f485@csgroup.eu>
Date: Tue, 19 Jan 2021 18:33:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20191128145554.1297-5-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rasmus,

Le 28/11/2019 à 15:55, Rasmus Villemoes a écrit :
> The QUICC engine drivers use the powerpc-specific out_be32() etc. In
> order to allow those drivers to build for other architectures, those
> must be replaced by iowrite32be(). However, on powerpc, out_be32() is
> a simple inline function while iowrite32be() is out-of-line. So in
> order not to introduce a performance regression on powerpc when making
> the drivers work on other architectures, introduce qe_io* helpers.
> 
> Also define the qe_{clr,set,clrset}bits* helpers in terms of these new
> macros.

Since commit https://github.com/linuxppc/linux/commit/894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e 
ioread/iowrite wrappers are also inlined on PPC32, so this commit can now be reverted.

Christophe

> 
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   include/soc/fsl/qe/qe.h | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index a1aa4eb28f0c..9cac04c692fd 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -241,21 +241,37 @@ static inline int qe_alive_during_sleep(void)
>   #define qe_muram_offset cpm_muram_offset
>   #define qe_muram_dma cpm_muram_dma
>   
> -#define qe_setbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) |  (_v), (_addr))
> -#define qe_clrbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) & ~(_v), (_addr))
> +#ifdef CONFIG_PPC32
> +#define qe_iowrite8(val, addr)     out_8(addr, val)
> +#define qe_iowrite16be(val, addr)  out_be16(addr, val)
> +#define qe_iowrite32be(val, addr)  out_be32(addr, val)
> +#define qe_ioread8(addr)           in_8(addr)
> +#define qe_ioread16be(addr)        in_be16(addr)
> +#define qe_ioread32be(addr)        in_be32(addr)
> +#else
> +#define qe_iowrite8(val, addr)     iowrite8(val, addr)
> +#define qe_iowrite16be(val, addr)  iowrite16be(val, addr)
> +#define qe_iowrite32be(val, addr)  iowrite32be(val, addr)
> +#define qe_ioread8(addr)           ioread8(addr)
> +#define qe_ioread16be(addr)        ioread16be(addr)
> +#define qe_ioread32be(addr)        ioread32be(addr)
> +#endif
> +
> +#define qe_setbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr) |  (_v), (_addr))
> +#define qe_clrbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr) & ~(_v), (_addr))
>   
> -#define qe_setbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) |  (_v), (_addr))
> -#define qe_clrbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) & ~(_v), (_addr))
> +#define qe_setbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr) |  (_v), (_addr))
> +#define qe_clrbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr) & ~(_v), (_addr))
>   
> -#define qe_setbits_8(_addr, _v) iowrite8(ioread8(_addr) |  (_v), (_addr))
> -#define qe_clrbits_8(_addr, _v) iowrite8(ioread8(_addr) & ~(_v), (_addr))
> +#define qe_setbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) |  (_v), (_addr))
> +#define qe_clrbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) & ~(_v), (_addr))
>   
>   #define qe_clrsetbits_be32(addr, clear, set) \
> -	iowrite32be((ioread32be(addr) & ~(clear)) | (set), (addr))
> +	qe_iowrite32be((qe_ioread32be(addr) & ~(clear)) | (set), (addr))
>   #define qe_clrsetbits_be16(addr, clear, set) \
> -	iowrite16be((ioread16be(addr) & ~(clear)) | (set), (addr))
> +	qe_iowrite16be((qe_ioread16be(addr) & ~(clear)) | (set), (addr))
>   #define qe_clrsetbits_8(addr, clear, set) \
> -	iowrite8((ioread8(addr) & ~(clear)) | (set), (addr))
> +	qe_iowrite8((qe_ioread8(addr) & ~(clear)) | (set), (addr))
>   
>   /* Structure that defines QE firmware binary files.
>    *
> 
