Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9E4D986E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 11:10:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHq0P2vnfz30N0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 21:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHq006xtLz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 21:09:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHpzw3hG5z9sSq;
 Tue, 15 Mar 2022 11:09:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGMcKsXpEFIz; Tue, 15 Mar 2022 11:09:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHpzv42Qhz9sSp;
 Tue, 15 Mar 2022 11:09:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 77E4E8B763;
 Tue, 15 Mar 2022 11:09:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pG6GkzyZ-p5f; Tue, 15 Mar 2022 11:09:47 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E06898B774;
 Tue, 15 Mar 2022 11:09:46 +0100 (CET)
Message-ID: <c30b26fa-0495-89aa-c504-6fee09f86c56@csgroup.eu>
Date: Tue, 15 Mar 2022 11:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH linux-next] macintosh: fix warning comparing pointer to 0
Content-Language: fr-FR
To: jing yangyang <cgel.zte@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <b12b200502312957065a12f8d78e8d250c244d21.1629193159.git.jing.yangyang@zte.com.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b12b200502312957065a12f8d78e8d250c244d21.1629193159.git.jing.yangyang@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jing yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/08/2021 à 04:34, jing yangyang a écrit :
> Fix the following coccicheck warning:
> 
> ./drivers/macintosh/windfarm_pm91.c:152:12-13:WARNING comparing pointer to 0
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address 
mismatch: 'From: jing yangyang <cgel.zte@gmail.com>' != 'Signed-off-by: 
jing yangyang <jing.yangyang@zte.com.cn>'

Please resend.

Thanks
Christophe


> ---
>   drivers/macintosh/windfarm_pm91.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
> index 3f346af..568f8a2 100644
> --- a/drivers/macintosh/windfarm_pm91.c
> +++ b/drivers/macintosh/windfarm_pm91.c
> @@ -149,7 +149,7 @@ static void wf_smu_create_cpu_fans(void)
>   
>   	/* First, locate the PID params in SMU SBD */
>   	hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
> -	if (hdr == 0) {
> +	if (!hdr) {
>   		printk(KERN_WARNING "windfarm: CPU PID fan config not found "
>   		       "max fan speed\n");
>   		goto fail;
