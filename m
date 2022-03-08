Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E54D1824
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:43:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZkq3hTTz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:43:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZkM2Vrwz2xBP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:43:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KCZkC5HhLz9sSV;
 Tue,  8 Mar 2022 13:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgeW9xfmRpr1; Tue,  8 Mar 2022 13:43:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KCZkC4WH7z9sSR;
 Tue,  8 Mar 2022 13:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BAE98B779;
 Tue,  8 Mar 2022 13:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ay1nmVgEpnG8; Tue,  8 Mar 2022 13:43:15 +0100 (CET)
Received: from [192.168.202.9] (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8BBF8B763;
 Tue,  8 Mar 2022 13:43:14 +0100 (CET)
Message-ID: <227e1408-4be3-9793-c604-d26875d0a586@csgroup.eu>
Date: Tue, 8 Mar 2022 13:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] powerpc/ps3: Remove a couple of unneeded semicolons
Content-Language: fr-FR
To: Zhen Lei <thunder.leizhen@huawei.com>, Geoff Levand
 <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508095150.2942-1-thunder.leizhen@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210508095150.2942-1-thunder.leizhen@huawei.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/05/2021 à 11:51, Zhen Lei a écrit :
> The semicolon immediately following '}' is unneeded.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

A more recent version of your patch are available at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/01647102607ce9640c9f27786d976109a3c4ea7e.1629197153.git.jing.yangyang@zte.com.cn/


> ---
>   arch/powerpc/platforms/ps3/system-bus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
> index b431f41c6cb53ab..5c739267ddd2174 100644
> --- a/arch/powerpc/platforms/ps3/system-bus.c
> +++ b/arch/powerpc/platforms/ps3/system-bus.c
> @@ -603,7 +603,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
>   	default:
>   		/* not happned */
>   		BUG();
> -	};
> +	}
>   	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
>   			     &bus_addr, iopte_flag);
>   
> @@ -762,7 +762,7 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
>   		break;
>   	default:
>   		BUG();
> -	};
> +	}
>   
>   	dev->core.of_node = NULL;
>   	set_dev_node(&dev->core, 0);
