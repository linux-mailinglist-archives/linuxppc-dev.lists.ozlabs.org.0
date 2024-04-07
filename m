Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2A89B33A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 19:11:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rFdEJm1w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCJft54wBz3vYR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 03:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rFdEJm1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCJfB217Dz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 03:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=kg2S3x2yOJGis3rtc5Z5MAarSwFcmW75wBMPuHRwNRU=; b=rFdEJm1w7fEqh962Bb5YCtbpYQ
	7EZX3w0V6D/8wIkzUXe0VjWbhOcBi4xACUsn1BDEO0S220fsvHf0SmP8muNEEVbwHFRcoSQi1Ttcj
	s1zVYyJubBuXiyIg6uTrzpr5Lh3OU1UriRcxnews21M/54XzmK88lUR6ToWYQfQD/wB0vKoHjTFDg
	TdtP8n7aHQk+ce33PGZ4xe1jTa655xdbo3KjRcq2GkeLXA3AzftPu2hFMFfh/jWeU9neERej81Dzl
	8LSS0rqByp9EcDX18Q+m3rl+rj8P9VEP2SWzL5SaH0BE0MQ5PJicRFFInxUVf3v7LHKzG3lM1HdH0
	AWhOaj9Q==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtW2w-0000000D7D3-01EW;
	Sun, 07 Apr 2024 17:11:10 +0000
Message-ID: <3c5ca52f-8144-4214-a6e3-35d9139fa6a7@infradead.org>
Date: Sun, 7 Apr 2024 10:11:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 3/3] powerpc/rtas: Add kernel-doc comments to
 smp_startup_cpu()
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
 <20240407063952.36270-3-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240407063952.36270-3-yang.lee@linux.alibaba.com>
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



On 4/6/24 11:39 PM, Yang Li wrote:
> This commit adds kernel-doc style comments with complete parameter
> descriptions for the function smp_startup_cpu().
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/platforms/cell/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
> index 30394c6f8894..bdb7adde798d 100644
> --- a/arch/powerpc/platforms/cell/smp.c
> +++ b/arch/powerpc/platforms/cell/smp.c
> @@ -55,6 +55,8 @@ static cpumask_t of_spin_map;
>  /**
>   * smp_startup_cpu() - start the given cpu
>   *
> + * @lcpu: Logical CPU ID of the CPU to be started.

Does this work with the blank line between the function and parameter?
(i.e., no kernel-doc warnings?)

Usually it's done without the extra line.
Otherwise the additional line for @lcpu: looks good to me.

Thanks.

> + *
>   * At boot time, there is nothing to do for primary threads which were
>   * started from Open Firmware.  For anything else, call RTAS with the
>   * appropriate start location.

-- 
#Randy
