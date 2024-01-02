Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED58216F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 05:46:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qEcu/cYM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40gd3ZB7z3cSJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 15:46:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qEcu/cYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40fr20Frz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 254CDCE0B74;
	Tue,  2 Jan 2024 04:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545BDC433C8;
	Tue,  2 Jan 2024 04:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704170770;
	bh=z/Ovj/9iuAiW3FV9O0iwQV3AmD3nZdMqqX+IXPdX+6M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qEcu/cYMKtFWlOoXXZT+BmlNUB0mA7/I+uN6uw+rau8xYRDgSqbuq+QKjiU+KHkCV
	 kQ+f7FColIh/FiO/DQw1QGSrhz7WsHDzwHeEx8UqgvHr0ZUA0DDrehkWSnm87Kv//Z
	 3W1/P2TyJ/8mppMGiW2SW2pf43QYYwdfRhnI0S1FGJ+VvDszagPjyBV/1q9BVqZu32
	 dr3euaSF7780XXvYxyE+/9jYrw5ZNwKlzclpgfCPYBlqQf/Mbvcv7UyAx3KzwdTu0T
	 fmKOiCgJb49paQ66b0CY8l8aumFVXIq5OFQWVsC+Pm14LDPZ+iAA1a2EaFP1YXa+Hv
	 ckvkhr4fl8psw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >=
 nr_cpu_ids
In-Reply-To: <20231229120107.2281153-5-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-5-mpe@ellerman.id.au>
Date: Tue, 02 Jan 2024 10:16:04 +0530
Message-ID: <87cyukny0j.fsf@kernel.org>
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
Cc: Pingfan Liu <kernelfans@gmail.com>, Pingfan Liu <piliu@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

....

>  #ifdef CONFIG_PPC64
>  int boot_cpu_hwid = -1;
> @@ -492,12 +493,26 @@ void __init smp_setup_cpu_maps(void)
>  			avail = !of_property_match_string(dn,
>  					"enable-method", "spin-table");
>  
> -		cpu = assign_threads(cpu, nthreads, avail, intserv);
> +		if (boot_core_hwid >= 0) {
> +			if (cpu == 0) {
> +				pr_info("Skipping CPU node %pOF to allow for boot core.\n", dn);
> +				cpu = nthreads;
> +				continue;
> +			}
>  
> -		if (cpu >= nr_cpu_ids) {
> +			if (be32_to_cpu(intserv[0]) == boot_core_hwid) {
> +				pr_info("Renumbered boot core %pOF to logical 0\n", dn);
> +				assign_threads(0, nthreads, avail, intserv);
> +				of_node_put(dn);
> +				break;
>

I was expecting a 'continue' here. Why 'break' the loop? The condition that
should break the loop should be cpu >= nr_cpu_ids 


> +			}
> +		} else if (cpu >= nr_cpu_ids) {
>  			of_node_put(dn);
>  			break;
>  		}
> +
> +		if (cpu < nr_cpu_ids)
> +			cpu = assign_threads(cpu, nthreads, avail, intserv);
>  	}
>  
>  	/* If no SMT supported, nthreads is forced to 1 */
> -- 
> 2.43.0

-aneesh
