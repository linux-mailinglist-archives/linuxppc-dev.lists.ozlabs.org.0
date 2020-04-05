Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97919EB26
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 14:14:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wCKM0RR4zDqZD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 22:14:47 +1000 (AEST)
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
 header.s=mail header.b=m9mQvPo4; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wCH64JVgzDq9p
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 22:12:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wCGx6Qbbz9vDCS;
 Sun,  5 Apr 2020 14:12:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=m9mQvPo4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BU4CdYy38176; Sun,  5 Apr 2020 14:12:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wCGx4WMXz9vDCR;
 Sun,  5 Apr 2020 14:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586088761; bh=dks+FmlcH1P0YzNPFG6XPDO+hAdcRqA2bwD1oWlUYLk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m9mQvPo4A9GDs7TwKbqCH2m5UFG2NLc/d7/M4So9D/O8vSy0xbYaXSfXXnOdjXq0E
 /C4P8egghAKNalNY8rHYJzt6PxtT2MsVaI1I/Y913IwMMqzQAg9ADOWz49E/tEulm4
 BtByQADIpjrQie/1nkjs+GuEQAkxtmzh6+1zUpIE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C82EB8B774;
 Sun,  5 Apr 2020 14:12:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NHXes6cY9x8N; Sun,  5 Apr 2020 14:12:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE0298B764;
 Sun,  5 Apr 2020 14:12:43 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Qiujun Huang <hqjagain@gmail.com>, benh@kernel.crashing.org,
 paulus@samba.org, mpe@ellerman.id.au, tglx@linutronix.de
References: <20200405103059.30769-1-hqjagain@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <46e9dd45-c590-36c3-a60e-55750cde8935@c-s.fr>
Date: Sun, 5 Apr 2020 14:12:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405103059.30769-1-hqjagain@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/04/2020 à 12:30, Qiujun Huang a écrit :
> Here needs a NULL check.
> 
> Issue found by coccinelle.
> 
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>   arch/powerpc/platforms/powernv/opal.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 2b3dfd0b6cdd..5b98c98817aa 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -808,9 +808,12 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
>   
>   	rc = of_property_read_u64_array(np, prop_name, &vals[0], 2);
>   	if (rc)
> -		goto out;
> +		return rc;

Nice you changed that too.

Then there is no need the initialise attr and name to NULL in their 
declaration, as they won't be used before they are assigned.

>   
>   	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		return -ENOMEM;
> +
>   	name = kstrdup(export_name, GFP_KERNEL);
>   	if (!name) {
>   		rc = -ENOMEM;
> 

Christophe
