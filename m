Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E518D322
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:41:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kSgW2BMJzDqFZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:41:43 +1100 (AEDT)
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
 header.s=mail header.b=nxH7z5Xg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kSTn6c2gzF0Qh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:33:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48kSTd6nZVz9v2jx;
 Fri, 20 Mar 2020 16:33:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nxH7z5Xg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Vu0yPU3CSadE; Fri, 20 Mar 2020 16:33:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48kSTd5nC1z9v2RP;
 Fri, 20 Mar 2020 16:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584718389; bh=2kFbXb6MvW+7/algV+3TfWr4b/ISn4UV6IoXPE9Nkcw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=nxH7z5XgNfztOBMaOuaj1boEkP6upyKMsrnbd3PBF/P2Abd6YQwOdePTFsKg0c54U
 vgF9YyuaHpTuIv3Mik8P/U6pdVx6oq4fI/jNqy381xUp7xDftuDaHeA0ZwjIdaBALs
 LpYTRAGk2ISVbfpxW6LoJEfJ0a7zalss5LBzFeq8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DD4C8B858;
 Fri, 20 Mar 2020 16:33:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sfwJAk1CUQqs; Fri, 20 Mar 2020 16:33:11 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 051208B857;
 Fri, 20 Mar 2020 16:33:10 +0100 (CET)
Subject: Re: [PATCH] powerpc/pseries: avoid harmless preempt warning
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320152436.1468651-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6b34ba18-de6b-15c5-1611-fb5c92e065f9@c-s.fr>
Date: Fri, 20 Mar 2020 16:33:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320152436.1468651-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/03/2020 à 16:24, Nicholas Piggin a écrit :
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/lpar.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 3c3da25b445c..e4ed5317f117 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -636,8 +636,16 @@ static const struct proc_ops vcpudispatch_stats_freq_proc_ops = {
>   
>   static int __init vcpudispatch_stats_procfs_init(void)
>   {
> -	if (!lppaca_shared_proc(get_lppaca()))
> +	/*
> +	 * Avoid smp_processor_id while preemptible. All CPUs should have
> +	 * the same value for lppaca_shared_proc.
> +	 */
> +	preempt_disable();
> +	if (!lppaca_shared_proc(get_lppaca())) {
> +		preempt_enable();
>   		return 0;
> +	}
> +	preempt_enable();

Can we avoid the double preempt_enable() with something like:

	preempt_disable();
	is_shared = lppaca_shared_proc(get_lppaca());
	preempt_enable();
	if (!is_shared)
		return 0;


>   
>   	if (!proc_create("powerpc/vcpudispatch_stats", 0600, NULL,
>   					&vcpudispatch_stats_proc_ops))
> 

Christophe
