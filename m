Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02214426869
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 13:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQld66TFrz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 22:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ecgb6jGX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQlcR42fRz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 22:01:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ecgb6jGX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQlcH5cyHz4xbV;
 Fri,  8 Oct 2021 22:01:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633690887;
 bh=B4qzHAigKKJHhzM+dPDATq6BWHA36ShynfcFOX354Uw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ecgb6jGX08YbAx5B1reNn4h/kU3Gen7kievibOO69w+92xKGfimzG9blAbi2wPVuT
 bzRQvpw1Gsq6L5OISVmfgRGEMrtpfffTD3SxPCSAMjCA7BaSe9z1Uwt8UhxvwagCXt
 RG8jZ9yVbHmz/oZlWgdyytG8dpN+zilnWPdwvHzOrKK+z9cUFtnbh9EiaF6DvYThDq
 y+nA3s2Jr7OnqG1H9G2arDaiYJ9T+Ocn4v009hMVegWkEyhfV3tBa+fnPnVWJ1bKT9
 NTxKKbhG9DIb5b2JYg+QufFs7CUHZN2G28KnkHe3XTX54qxanjx0qe1ihehNmLNt3p
 OX9W1GxfbYAzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
In-Reply-To: <20211006164332.1981454-8-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-8-robh@kernel.org>
Date: Fri, 08 Oct 2021 22:01:15 +1100
Message-ID: <8735pbok5g.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-sh@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> Replace open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/smp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 9cc7d3dbf439..d96b0e361a73 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1313,18 +1313,13 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  int cpu_to_core_id(int cpu)
>  {
>  	struct device_node *np;
> -	const __be32 *reg;
>  	int id = -1;
>  
>  	np = of_get_cpu_node(cpu, NULL);
>  	if (!np)
>  		goto out;
>  
> -	reg = of_get_property(np, "reg", NULL);
> -	if (!reg)
> -		goto out;
> -
> -	id = be32_to_cpup(reg);
> +	id = of_get_cpu_hwid(np, 0);
>  out:
>  	of_node_put(np);
>  	return id;

This looks OK to me.

All the systems I can find have a /cpus/#address-cells of 1, so the
change to use of_n_addr_cells() in of_get_cpu_hwid() should be fine.

I booted it on a bunch of systems with no issues.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
