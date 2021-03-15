Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3882333BF79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 16:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzfzy5v3Hz30CK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 02:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S1L0JIba;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S1L0JIba; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzfzW2Drbz2yYp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 02:12:22 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id q9so2448259qvm.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SsWC72cATsneQ9JENKvjqCvrC5G6MPviehAjVUfTUcs=;
 b=S1L0JIba5tqegutWX+xhiDA+NEJDxD6E90598hAsy+bnBHCSRTBdslb3DIW3Vttpgk
 /xDHqEOGB26vZunxVx06Lt2/xUAI/WG7tjdJ8iCDfXCRF0NZMY8kfzzlmzYgLi38r1Qi
 6rgEtM531qLUM6zTER84F3y/1g1cKV4Ui3AMOyfdXQ9IDi9zQj8AYf1qLTK4tq3Bugdx
 hioKR7C/VSfIGmKTU6O4Xtcl9CvO3hREIOERY/F8oABKFajXs5t6nxDbzQA8jHveepNq
 Lb3ofxwnelZpcipvR1e2YUZtYiJH9Gh7gHn7d7AicQzok0xaI9toRIY1MWOj/zuRMBjA
 LBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SsWC72cATsneQ9JENKvjqCvrC5G6MPviehAjVUfTUcs=;
 b=lOUB5FVVbPgFB23FnYw8uw/6zVKycHcm5Sr7gMr328ctwVA7Z2MPAIq8Q76spr0v3P
 8ujwKMb0WsLjOoV2s8P+BTp8Ybipcep9j+lituhNtBaKr2MEIDPHl013TkUN4E31SPeg
 e7to5K9p5hyFEsHeT0/vJys/3gSNLRa5ER8evn3QFFfQ+pddUy8olcN8epIvbBTZmqq/
 i0byjXxWcE9gutgeDXEf1/B06w2zwbXFHzKRzKmZpB3yjeHyF/mvBikOlt/3DEObprZE
 5jYiIMqFD8Q+1Ex3GTrEl/xYcc+nHkMt63jZZGxZXBDuUCOoI1CmotE9jQH7JMT+cTmK
 EPMg==
X-Gm-Message-State: AOAM533fYmCpgZIor8hxUf7QerKvMvp8kXz1X0MptGfO3gtlbnSVQ76C
 mV86z5f/3M/v/Dkiuy5dIBc=
X-Google-Smtp-Source: ABdhPJxaBwYrNo+cRRGlwmIWYusSQpr7ufUllC89Ms50RVwD+YSoLj0BrNarhOR2ndL0C/6DPegVEA==
X-Received: by 2002:ad4:44ef:: with SMTP id p15mr25513188qvt.25.1615821127086; 
 Mon, 15 Mar 2021 08:12:07 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j30sm11261143qtv.90.2021.03.15.08.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 08:12:06 -0700 (PDT)
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210312143154.3181109-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <bd0c948c-64f8-cf64-6d30-b9167b6a7629@gmail.com>
Date: Mon, 15 Mar 2021 12:12:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312143154.3181109-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/21 11:31 AM, Cédric Le Goater wrote:
> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
> available to userspace") introduce a cpu_to_chip_id() routine for the
> PowerNV platform using the "ibm,chip-id" property to query the chip id
> of a CPU. But PAPR does not specify such a property and the node id
> query is broken.
> 
> Use cpu_to_node() instead which guarantees to have a correct value on
> all platforms, PowerNV an pSeries.

It is worth mentioning that that this patch will change how
topology_physical_package_id() represents in a QEMU guest. Right now, ibm,chip-id
in QEMU is matching the socket-id. After this patch, topology_physical_package_id()
will now match the NUMA id of the CPU.



Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/include/asm/topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 3beeb030cd78..887c42a4e43d 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>   #ifdef CONFIG_PPC64
>   #include <asm/smp.h>
>   
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
>   
>   #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>   #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))
> 
