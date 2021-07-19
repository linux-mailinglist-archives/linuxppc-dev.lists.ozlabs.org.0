Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8A3CCE96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 09:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GStst3sSXz3bbp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 17:35:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2KEEAmw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2KEEAmw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=D2KEEAmw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2KEEAmw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GStsK1MCCz2yNk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 17:34:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626680077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOr/p3ZhI+etOrrN3Zi2nraDobql1IKzoKipTp4TP6E=;
 b=D2KEEAmwS/iZFLRBlC4CQQ2lBgEntXpuy+ql/tf1u1cz/DYh5ts9C7Mrcx12+IFfR7VwK+
 zeWbTX1IId5uw5cXI3TEN8Tdv3XRtS6aEkCaHkG+aVQZX/U7apN4kyEc4CuTB2GlMRpMeu
 shnXW+6bPYml7EF8ZO5iQzDfpuWQNTo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626680077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOr/p3ZhI+etOrrN3Zi2nraDobql1IKzoKipTp4TP6E=;
 b=D2KEEAmwS/iZFLRBlC4CQQ2lBgEntXpuy+ql/tf1u1cz/DYh5ts9C7Mrcx12+IFfR7VwK+
 zeWbTX1IId5uw5cXI3TEN8Tdv3XRtS6aEkCaHkG+aVQZX/U7apN4kyEc4CuTB2GlMRpMeu
 shnXW+6bPYml7EF8ZO5iQzDfpuWQNTo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-nYLXnMC7OdelymroV_q0lw-1; Mon, 19 Jul 2021 03:34:33 -0400
X-MC-Unique: nYLXnMC7OdelymroV_q0lw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l17-20020a05600c4f11b0290225ef65c35dso3605780wmq.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 00:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jOr/p3ZhI+etOrrN3Zi2nraDobql1IKzoKipTp4TP6E=;
 b=gmKKvmBtbSabQ3sgqgaZAapVt+xMFl770wbVY88Za3+qkApo0Mcg64NC1uUeqeXnDp
 rXCnlmMcqmgsKjnuAHSjZPPEDutR0gD2VoFian4OO6szQltVCIrewM+tnCTk0TXPk6RU
 41bGL3bVvfbXYoQ5V7lnOFlwkP2T+4/tIbBnKF3PDC8wdegSlVnloeUYfr9d+zTmoX5R
 LyJ59otwnrWgneYGGpHwHrBZFaaZiF6+Zft2YybazPIfQbnpvt914SRqWi1gEJSyFnss
 KfFdly2ZeFafI7BTmRtDPruhAW6wj0bb6YRECdweEr4OTAcc1e9GTSKPp3MzdDne1o/9
 RZDg==
X-Gm-Message-State: AOAM531JKTcEnqRPg1enc0jO8WCtOuxhn1F+DqIN9hCGVqUDRVS9TJdx
 L+KSPKvGQza/L06cDS7uxiGt6Ep3CD7+W86hi2dbKjGyWlIDybBYuTTlyx5vL822lHBEeZmgVbp
 gSjpSQpDNm6Or7JAjY4IcQ5IGnw==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr30543677wma.178.1626680072119; 
 Mon, 19 Jul 2021 00:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4JmBlHgpvtENl1P0gPmtxrbpR7YPHRRWA08ddnW+DEM6maj6QCOlmFbATn/hUjX9m+hB8yg==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr30543647wma.178.1626680071866; 
 Mon, 19 Jul 2021 00:34:31 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id m32sm18461358wms.23.2021.07.19.00.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 00:34:31 -0700 (PDT)
Subject: Re: [PATCH] powerpc/xive: Do not skip CPU-less nodes when creating
 the IPIs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210629131542.743888-1-clg@kaod.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <8eed20ea-1b87-7263-95f0-c09dc9cd656e@redhat.com>
Date: Mon, 19 Jul 2021 09:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629131542.743888-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/06/2021 15:15, Cédric Le Goater wrote:
> On PowerVM, CPU-less nodes can be populated with hot-plugged CPUs at
> runtime. Today, the IPI is not created for such nodes, and hot-plugged
> CPUs use a bogus IPI, which leads to soft lockups.
> 
> We could create the node IPI on demand but it is a bit complex because
> this code would be called under bringup_up() and some IRQ locking is
> being done. The simplest solution is to create the IPIs for all nodes
> at startup.
> 
> Fixes: 7dcc37b3eff9 ("powerpc/xive: Map one IPI interrupt per node")
> Cc: stable@vger.kernel.org # v5.13
> Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
> This patch breaks old versions of irqbalance (<= v1.4). Possible nodes
> are collected from /sys/devices/system/node/ but CPU-less nodes are
> not listed there. When interrupts are scanned, the link representing
> the node structure is NULL and segfault occurs.
> 
> Version 1.7 seems immune. 
> 
> ---
>  arch/powerpc/sysdev/xive/common.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index f3b16ed48b05..5d2c58dba57e 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1143,10 +1143,6 @@ static int __init xive_request_ipi(void)
>  		struct xive_ipi_desc *xid = &xive_ipis[node];
>  		struct xive_ipi_alloc_info info = { node };
>  
> -		/* Skip nodes without CPUs */
> -		if (cpumask_empty(cpumask_of_node(node)))
> -			continue;
> -
>  		/*
>  		 * Map one IPI interrupt per node for all cpus of that node.
>  		 * Since the HW interrupt number doesn't have any meaning,
> 

What happened to this fix? Will it be merged?

Thanks,
Laurent

