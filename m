Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63B89C7FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 17:17:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FicLUnoP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCt4Y24Xpz3vbY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 01:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FicLUnoP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCt3b5Y8Kz3vYC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 01:16:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mJAYc4PEvQcHsUZpWS27vPz5UG+6bl7Nu9InpRTebiI=; b=FicLUnoPwsHFvFaQuaBpfUoF/D
	2ZVa0wO4WJYCmwys6xw0Xva0fpdoYVGXiuqjEk0i5Bf/ztXkXzyV5pCpejCyUJV1kZWHMI9rseYFT
	rk+a/dACJXOf+zwevGx60mlwoIsjlVxEIYlh0s15Fe58xo3HADLw4b/tM3zUTCCxyXhjNbwpHdEUf
	oe9W2aR8hy6qhOrc+j3xo0JiBgoJxh11tpJCvPzNJo3mR3hFz27GZOFVU69fGc7mLrauZio+xWCod
	SMQmoyiGz2UDFtCC4wVwRReDBT8ZMxlrWbwM63QW4nU6FCsuDmOSbXLukg+cXBMNhLhERbxkGh3VR
	8tnXZTfw==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqjd-0000000G03s-014q;
	Mon, 08 Apr 2024 15:16:39 +0000
Message-ID: <8f0a4271-2957-4b4a-a63c-184062194075@infradead.org>
Date: Mon, 8 Apr 2024 08:16:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 3/3 v2] powerpc/rtas: Add kernel-doc comments to
 smp_startup_cpu()
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
 <20240408053109.96360-2-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240408053109.96360-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/7/24 10:31 PM, Yang Li wrote:
> This commit adds kernel-doc style comments with complete parameter
> descriptions for the function smp_startup_cpu().
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/powerpc/platforms/cell/smp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
> index 30394c6f8894..fee638fd8970 100644
> --- a/arch/powerpc/platforms/cell/smp.c
> +++ b/arch/powerpc/platforms/cell/smp.c
> @@ -54,6 +54,7 @@ static cpumask_t of_spin_map;
>  
>  /**
>   * smp_startup_cpu() - start the given cpu
> + * @lcpu: Logical CPU ID of the CPU to be started.
>   *
>   * At boot time, there is nothing to do for primary threads which were
>   * started from Open Firmware.  For anything else, call RTAS with the

-- 
#Randy
