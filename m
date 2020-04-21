Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 987E51B1EA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:12:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495tWc4cSXzDqy1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:12:12 +1000 (AEST)
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
 header.s=mail header.b=nkL3NQWO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495tTd62DJzDqvd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 16:10:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495tTV27w4z9txQ7;
 Tue, 21 Apr 2020 08:10:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nkL3NQWO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JE2n1vFojx5q; Tue, 21 Apr 2020 08:10:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495tTV15n6z9txQ6;
 Tue, 21 Apr 2020 08:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587449422; bh=dx8xw7/BWB07JqMcnUQVSvb2E372hVoCaVnJPkV7Xwk=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=nkL3NQWOOSzUZpwRtD7ZUiTN119za4/nExzJWBcyA3ppcNFJ95I4aTBev7YrIn0Pv
 GyyXKTpKkKTgmKAYShZ0y3Hzsi+l4ZvwUt3qC1fJzg7jqUJzGGI1LxJc+B0Y8oyal5
 uInsMFtXD8BQcFTnM5OmKTa6hliWeKgGxpbePrMQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F5998B778;
 Tue, 21 Apr 2020 08:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RtxIr4pUM_vY; Tue, 21 Apr 2020 08:10:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC63A8B774;
 Tue, 21 Apr 2020 08:10:22 +0200 (CEST)
Subject: Re: [PATCH v7 7/7] [NOT TO BE MERGED] Export sysrq_mask
To: Michael Ellerman <mpe@ellerman.id.au>, Russell Currey <ruscur@russell.cc>
References: <cover.1587401492.git.christophe.leroy@c-s.fr>
 <f6397e32f9ac69cc8ddd1d566cc385165ced21c8.1587401492.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e0921561-f73f-8bc4-ac9c-2ec31d485568@c-s.fr>
Date: Tue, 21 Apr 2020 08:10:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f6397e32f9ac69cc8ddd1d566cc385165ced21c8.1587401492.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Le 20/04/2020 à 18:56, Christophe Leroy a écrit :
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   drivers/tty/sysrq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 5e0d0813da55..a0760bcd7a97 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -74,6 +74,7 @@ int sysrq_mask(void)
>   		return 1;
>   	return sysrq_enabled;
>   }
> +EXPORT_SYMBOL_GPL(sysrq_mask);

I don't understand, why does snowpatch still reports it can't test the 
patch once whereas this patch fixes the upstream build ?

Christophe



>   
>   /*
>    * A value of 1 means 'all', other nonzero values are an op mask:
> 
