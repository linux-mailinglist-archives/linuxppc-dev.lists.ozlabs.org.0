Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5BA4EAA71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSPKT4xSfz30QB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B1myBB6p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=B1myBB6p; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSPJq5mTjz2x9b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 20:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GNMAqIh0j6P//qlq8Z1xIR7mjldURS8/Ro5eIkOUj+w=; b=B1myBB6pcjFAoPaZpBLrlBlJeD
 lsya7OrVyrHw3xcSbhztqK72QHvaKM7rlZiEwgxOP2yYEYqjbBeoEDmeVDa4MqcnzDMzmeGMW3H8q
 WtVql6DJiGqyDmAVKo7v46USmmMOREJ8zcQ5d2QzhOUaiFLbjciuI46l69y6CmIfyhB5A9fijRTEt
 jn/8DfIFZpZbfgX/7tE93ChQoMbYbftFhHJgPX7W41AB0ge/6sAAVoKDbQHbxuSj8Otk7dRXCqZVS
 pBJVklp/JiQAbIC48SRmBkrcEnzZl9fvhWoyE23U8AReqJwCGR+kLmJ9daNkl+SavvD5dOm8QRTMs
 JjVv4/rw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ84a-005o2F-Tu; Tue, 29 Mar 2022 09:23:33 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B1DD9861E9; Tue, 29 Mar 2022 11:23:30 +0200 (CEST)
Date: Tue, 29 Mar 2022 11:23:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH 1/3] sched: topology: add input parameter for
 sched_domain_flags_f()
Message-ID: <20220329092330.GG8939@worktop.programming.kicks-ass.net>
References: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
 <1648545322-14531-2-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648545322-14531-2-git-send-email-wangqing@vivo.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 29, 2022 at 02:15:19AM -0700, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> sched_domain_flags_f() are statically set now, but actually, we can get a lot
> of necessary information based on the cpu_map. e.g. we can know whether its
> cache is shared.
> 
> Allows custom extension without affecting current.

Still NAK
