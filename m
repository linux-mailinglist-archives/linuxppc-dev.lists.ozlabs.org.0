Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10917316A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:55:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TKzb46v1zDqjj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:55:07 +1100 (AEDT)
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
 header.s=mail header.b=ITnazzNh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TKwj5WnxzDrMG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:52:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48TKwd3Xwmz9tycW;
 Fri, 28 Feb 2020 07:52:33 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ITnazzNh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hdB8N4xYqrbW; Fri, 28 Feb 2020 07:52:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48TKwd2GYwz9tycV;
 Fri, 28 Feb 2020 07:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582872753; bh=iqvY8w8mWBSH0zGSJW6dyV+rNHUP0owMHiFxNYYDMdY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ITnazzNhKtdgZvtcDqlc2zFKIR1cv9gq1HQnRbCzFGj2IfRjGzVOS934kr1S8ban1
 mbbcwmF6LCqur7T871gRupBI8NCqxIWbyy4x66/GJ7+zRUWUTUc1rPf17+b91Ss/oa
 7FeCU+9X/MjB70fin7ExXf/QqkwtEo02U6s0pZeQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 263F28B885;
 Fri, 28 Feb 2020 07:52:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MmXm-6F6sl9C; Fri, 28 Feb 2020 07:52:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92E098B768;
 Fri, 28 Feb 2020 07:52:33 +0100 (CET)
Subject: Re: [PATCH 3/3] pseries/scm: buffer pmem's bound addr in dt for kexec
 kernel
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
 <1582869192-9284-3-git-send-email-kernelfans@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2a1906b0-6c53-4ff5-78ea-3254f8224fe4@c-s.fr>
Date: Fri, 28 Feb 2020 07:52:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582869192-9284-3-git-send-email-kernelfans@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 kexec@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/02/2020 à 06:53, Pingfan Liu a écrit :
> At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> if dumping to fsdax, it will take a very long time.
> 
> Take a closer look, during the papr_scm initialization, the only
> configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> ...), which helps to set up the bound address.
> 
> On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
> step can be stepped around to save times.  So the pmem bound address can be
> passed to the 2nd kernel through a dynamic added property "bound-addr" in
> dt node 'ibm,pmemory'.
> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: kexec@lists.infradead.org
> ---
> note: I can not find such a pseries machine, and not finish it yet.
> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 32 +++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index c2ef320..555e746 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -382,7 +382,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>   {
>   	struct device_node *dn = pdev->dev.of_node;
>   	u32 drc_index, metadata_size;
> -	u64 blocks, block_size;
> +	u64 blocks, block_size, bound_addr = 0;
>   	struct papr_scm_priv *p;
>   	const char *uuid_str;
>   	u64 uuid[2];
> @@ -439,17 +439,29 @@ static int papr_scm_probe(struct platform_device *pdev)
>   	p->metadata_size = metadata_size;
>   	p->pdev = pdev;
>   
> -	/* request the hypervisor to bind this region to somewhere in memory */
> -	rc = drc_pmem_bind(p);
> +	of_property_read_u64(dn, "bound-addr", &bound_addr);
> +	if (bound_addr)
> +		p->bound_addr = bound_addr;
> +	else {

All legs of an if/else must have { } when one leg need them, see codying 
style.

> +		struct property *property;
> +		u64 big;
>   
> -	/* If phyp says drc memory still bound then force unbound and retry */
> -	if (rc == H_OVERLAP)
> -		rc = drc_pmem_query_n_bind(p);
> +		/* request the hypervisor to bind this region to somewhere in memory */
> +		rc = drc_pmem_bind(p);
>   
> -	if (rc != H_SUCCESS) {
> -		dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> -		rc = -ENXIO;
> -		goto err;
> +		/* If phyp says drc memory still bound then force unbound and retry */
> +		if (rc == H_OVERLAP)
> +			rc = drc_pmem_query_n_bind(p);
> +
> +		if (rc != H_SUCCESS) {
> +			dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> +			rc = -ENXIO;
> +			goto err;
> +		}
> +		big = cpu_to_be64(p->bound_addr);
> +		property = new_property("bound-addr", sizeof(u64), &big,
> +			NULL);

Why plitting this line in two parts ? You have lines far longer above.
In powerpc we allow lines 90 chars long.

> +		of_add_property(dn, property);
>   	}
>   
>   	/* setup the resource for the newly bound range */
> 

Christophe
