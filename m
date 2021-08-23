Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABE3F46AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 10:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtQXF4KMwz2ywv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 18:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aHpeNTob;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=aHpeNTob; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtQWR1GrBz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 18:33:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZqQlJEs3+S/YbegzWanXys/MVIhQy2d1jIm/fVWjrbc=; b=aHpeNTobIPGNP3awR0rnjFJYpN
 hwJg6bbdwFk0KAouDD7NF2fx57Ccbugi68CglwfRLBNefWqiJSWV9Eca4zzNJOXV8wtTZetSH1lZw
 0I0NSGNGV/4n3DwGVVijDL+VFfPCMeeT5MpagugwZwSam+s4KjIlS6vOzSdtbjRHvSZChlvD9TgTS
 QR4/ug2NyxWHTSkC4g7rorLgk6gWv8JRyEscGz9a7fOzVCZa7d5Glge5lrvYgsXwp1FAdnTWsCVFe
 aW1dV7QwCFacUHKYKYb9iSbm3xL4+uC99Y04Sqd6NNEQtUTsXC7cbX28PxAIWmySKy1j4GV5LmDX0
 rZBZ3WTQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI5Oe-00CGJH-PG; Mon, 23 Aug 2021 08:33:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C58BC30067B;
 Mon, 23 Aug 2021 10:33:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8488025D644A1; Mon, 23 Aug 2021 10:33:30 +0200 (CEST)
Date: Mon, 23 Aug 2021 10:33:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/3] Updates to powerpc for robust CPU online/offline
Message-ID: <YSNdWhxVWtMJKAWi@hirez.programming.kicks-ass.net>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 21, 2021 at 03:55:32PM +0530, Srikar Dronamraju wrote:
> Scheduler expects unique number of node distances to be available
> at boot. It uses node distance to calculate this unique node
> distances. On Power Servers, node distances for offline nodes is not
> available. However, Power Servers already knows unique possible node
> distances. Fake the offline node's distance_lookup_table entries so
> that all possible node distances are updated.
> 
> For example distance info from numactl from a fully populated 8 node
> system at boot may look like this.
> 
> node distances:
> node   0   1   2   3   4   5   6   7
>   0:  10  20  40  40  40  40  40  40
>   1:  20  10  40  40  40  40  40  40
>   2:  40  40  10  20  40  40  40  40
>   3:  40  40  20  10  40  40  40  40
>   4:  40  40  40  40  10  20  40  40
>   5:  40  40  40  40  20  10  40  40
>   6:  40  40  40  40  40  40  10  20
>   7:  40  40  40  40  40  40  20  10
> 
> However the same system when only two nodes are online at boot, then
> distance info from numactl will look like
> node distances:
> node   0   1
>   0:  10  20
>   1:  20  10
> 
> With the faked numa distance at boot, the node distance table will look
> like
> node   0   1   2
>   0:  10  20  40
>   1:  20  10  40
>   2:  40  40  10
> 
> The actual distance will be populated once the nodes are onlined.

How did you want all this merged? I picked up Valentin's patch, do you
want me to pick up these PowerPC patches in the same tree, or do you
want to route them seperately?
