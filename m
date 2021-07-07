Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C5D3BED33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 19:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKmpy4Tw5z3bkm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 03:38:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCHPVMyp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCHPVMyp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PCHPVMyp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCHPVMyp; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKmpR62Sjz306C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 03:37:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625679450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZcg4pbX4DqrmDVnsG+v20JrCZKWBMOdM4aseOUqFpw=;
 b=PCHPVMypu507z+IgX13p5Fyj/cehK9qKDqWMuv8HLRf21NyvZGxBfLDVgSL2Fo9fWK4jDe
 gbWi2bMkJUQMZIb6Mb5RXJeJZ1NIbBjF3j8KVgH++GE2M6QnvwEwYZNxLWhnemORjo82cR
 KK+FSXNCibjUYWM0gJ1giG17BO9IjiI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625679450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZcg4pbX4DqrmDVnsG+v20JrCZKWBMOdM4aseOUqFpw=;
 b=PCHPVMypu507z+IgX13p5Fyj/cehK9qKDqWMuv8HLRf21NyvZGxBfLDVgSL2Fo9fWK4jDe
 gbWi2bMkJUQMZIb6Mb5RXJeJZ1NIbBjF3j8KVgH++GE2M6QnvwEwYZNxLWhnemORjo82cR
 KK+FSXNCibjUYWM0gJ1giG17BO9IjiI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-YOcwlOclMrSY1iN4NHAxxQ-1; Wed, 07 Jul 2021 13:37:29 -0400
X-MC-Unique: YOcwlOclMrSY1iN4NHAxxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so710838wrs.15
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 10:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TZcg4pbX4DqrmDVnsG+v20JrCZKWBMOdM4aseOUqFpw=;
 b=fKHwOjjwvxKIuutZ8SxHTVALacUjdsttyx+Wr7636Ji8PUg+RuHiizh6sXI5TjPYkq
 mKGtjOXrLiOCB5cBH7CwbKEzvFBkoAuwFbUsYU3q+nUsOG4NaBhE04udDL7tCycgG2U1
 g9YFh3hgX/pKgLikfubxkYCY73fgM4JDgD51tlOXoHppDQu3WNrC5DIcMoh618dZIwjV
 9i0i4glggvSfKQm2HvQzobel0njVVA4gwPyOLRJnagZXmlh+zafzPMQeEeH77xrJXGm8
 x69SO2RnyAk0dMnLCi5PuuFD6vejUDLpL1uRes8gN3FwyAhODqIE6+rIsmm7jVd7aiZC
 lB2g==
X-Gm-Message-State: AOAM531SX9G8clcWFyzUT/rffEzYeakgytAvVFsdapTP3ijvcHP8g/ED
 oSwPvM5s50n+QVTUbKLmYhMFijFisZ/lXGQnNejZPxZWut9l2FvvM9alkqRISzidHeEp5PGBKST
 WdsGdZt/eXcJvpx6ACVct7adugA==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr28107951wmj.120.1625679448160; 
 Wed, 07 Jul 2021 10:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz/LwMibWOtU4uAWyJ9yuaponiWXXmzXyq/qdmRqGDFpIVaWsqzbq/snuA9PDDhnqwxCsksA==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr28107936wmj.120.1625679447987; 
 Wed, 07 Jul 2021 10:37:27 -0700 (PDT)
Received: from [192.168.100.43] ([82.142.13.34])
 by smtp.gmail.com with ESMTPSA id z12sm17883895wrs.39.2021.07.07.10.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 10:37:27 -0700 (PDT)
Subject: Re: [PATCH] powerpc/xive: Do not skip CPU-less nodes when creating
 the IPIs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210629131542.743888-1-clg@kaod.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <36bc9257-b39b-ae6c-1df5-9006de989220@redhat.com>
Date: Wed, 7 Jul 2021 19:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629131542.743888-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Tested-by: Laurent Vivier <lvivier@redhat.com>

