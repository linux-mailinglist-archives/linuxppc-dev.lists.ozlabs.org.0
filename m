Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5E184650
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:59:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f44K43XDzDqPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 22:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f4241qpwzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 22:57:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OEHtrMr2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48f4231Ywkz9sNg;
 Fri, 13 Mar 2020 22:57:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584100651;
 bh=CEjgtFwuHMrQoR4b9z3huM7fu5Z4F6jMMTqNACc1cIo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OEHtrMr2+f9ZGSvpiD7gwHwbhJih9NT/xK/hOxj7YnfqVllRzYHtWkM96gIMkSNIU
 xit1UP6Z2M2G41hOxIdpaii+xLHPl/Io4xJkBh77s+IMT2PhwuJ25zUKbBpaPldLhx
 +i9PESwYL8b7qGTymdtDTh5N6GFGNWtsozIeK46XYdr8xJyizWmNS+L3yDPqMLovlm
 /J3tEEj7vc7YxxtOwntrZxsVAtaXmp6hTopy+IK3xzrjNU0u8kEsxOGPY2KubL1Re9
 NPPMSKy/VUGDzk0GfttSMclKZ7ldA5sXNBnLLeO1N8GukyG0SmDZmnR/BDT+a+QTeU
 7Cqz8Mjyhjc6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/prom_init: Pass the "os-term" message to
 hypervisor
In-Reply-To: <20200312074404.87293-1-aik@ozlabs.ru>
References: <20200312074404.87293-1-aik@ozlabs.ru>
Date: Fri, 13 Mar 2020 22:57:26 +1100
Message-ID: <874kusxyah.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> The "os-term" RTAS calls has one argument with a message address of
> OS termination cause. rtas_os_term() already passes it but the recently
> added prom_init's version of that missed it; it also does not fill args
> correctly.
>
> This passes the message address and initializes the number of arguments.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

I added:

Fixes: 6a9c930bd775 ("powerpc/prom_init: Add the ESM call to prom_init")

cheers


> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 577345382b23..673f13b87db1 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1773,6 +1773,9 @@ static void __init prom_rtas_os_term(char *str)
>  	if (token == 0)
>  		prom_panic("Could not get token for ibm,os-term\n");
>  	os_term_args.token = cpu_to_be32(token);
> +	os_term_args.nargs = cpu_to_be32(1);
> +	os_term_args.nret = cpu_to_be32(1);
> +	os_term_args.args[0] = cpu_to_be32(__pa(str));
>  	prom_rtas_hcall((uint64_t)&os_term_args);
>  }
>  #endif /* CONFIG_PPC_SVM */
> -- 
> 2.17.1
