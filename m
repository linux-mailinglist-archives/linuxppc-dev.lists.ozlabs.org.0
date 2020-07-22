Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C048122929D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:54:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBSRW6dHpzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:54:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=CEqxqaNL; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSG1468rzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UtSNhIf2wpJr1Xu6wPJnrBrzTE5gyQVve7CwYw8dNtc=; b=CEqxqaNLXFqUG0/lq8sCbUl+px
 +zsCBZ4wSYjVTZHgYdhKLg3OX0lReiMHBKKpiKdNHddVDCRuFcaH09IDFHyDMEnoZJD0F35A1VWjM
 zgQ517U0gTMd5TwWkv0RPleM/CJ67f7CaDg6F6HaVzN7MuEE4ookPkJSTqF4ysA25IKDXIn+2M8S1
 gDBI70R+Z46A7RgPkPCQtzv1JQnEpRIepHSHWDfQksWAPaJoEU6US7/V7+yeAa9CrDm22fppWKgty
 Y8eOau7gL12wqclb70XhVVWF6gDTvm3EcdveQr/IojyxQtnWhI0l+U5htoxoZAlxpB7fhRHrCP5nv
 1nxbSJnw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9SN-0003eB-MZ; Wed, 22 Jul 2020 07:46:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1C57B303A02;
 Wed, 22 Jul 2020 09:46:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DE71B29A6A87E; Wed, 22 Jul 2020 09:46:24 +0200 (CEST)
Date: Wed, 22 Jul 2020 09:46:24 +0200
From: peterz@infradead.org
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 06/10] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200722074624.GP119549@hirez.programming.kicks-ass.net>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
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
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Blanchard <anton@au1.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 05:08:10PM +0530, Srikar Dronamraju wrote:
> Currently "CACHE" domain happens to be the 2nd sched domain as per
> powerpc_topology. This domain will collapse if cpumask of l2-cache is
> same as SMT domain. However we could generalize this domain such that it
> could mean either be a "CACHE" domain or a "BIGCORE" domain.

What's the whole smallcore vs bigcore thing?

Would it make sense to have an actual overview of the various topology
layers somewhere? Because I'm getting lost and can't really make sense
of the code due to that.
