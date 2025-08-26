Return-Path: <linuxppc-dev+bounces-11313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3DB359B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB37g5nz1z3dRr;
	Tue, 26 Aug 2025 20:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756202431;
	cv=none; b=GBioyRzVXp0bieYhc7ova/F69NMVq1/+ynN/bw1t1DBcZSg53BV6sJ1byZfuIp0TlSB5Dy2nDd+OdFEO6js+BIIa8F6d6vIO7pI0BG8Po+uMRkd2xZvAl/tL9rOMri4TpiUMoF8ldeH+fJ4f8tkO7rh0kJN/iEdhjkfURIdcimWn111TV0TBRMA1qxBdR7jFi+J43St2NztY2pDeZDRoHAzS6XEn+Y4p7ddzdIwY99R44jw1usT5+xt+GPXKHHJdwR4G5SA8qxXrvrlwz7dDm3wouzMkqVBeEOojl/TAX+X9VIb6geo203hPgahVufIPiGbpnn6U/JK+NOmmqwYDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756202431; c=relaxed/relaxed;
	bh=RZH+TwBr6ueQMAaybKrZKRVrDtnXG+g8a3P12eZE8Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1WdF0r8Eep4WrmHl3WdwPJiMtM7Rn+KEiUyXmAEHrpVCjf1d/OTqg7IZUFlizmcdu/lZwbLEUkFTgnrvpwFsonyZXMLQyjF+I3PKPjLUb3l4pfdEc2AEg406cztSz1ms7myCQdbpBtc5Hv/eMiR3rdbztTOBdvJjyIu+3VRYJROv+5IL1DK+Q5MgYiGsg9gGAYKnHYk2hqtCSu+LNcNk2hJyHDU4e9w3GcDALXL3075dTFUIaIfhaa2vzumi2t9VzxvmaLzcf13iZLtLIBGNnq2rgV6x8Gvr2woNFU4RGZk8ozKrvRmavkDlo0XwTlXspxDhtjLKHy6pzSZUXJOJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n0kV5Wue; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n0kV5Wue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB37c5J24z3dRQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:00:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RZH+TwBr6ueQMAaybKrZKRVrDtnXG+g8a3P12eZE8Z0=; b=n0kV5Wue5+lQyR4Jy72DEbGldq
	VXg3ka9QF87+d0Pz3thNNd5X9pb/WZUrN+hOyyQoS8nDllPli2pceHjzG19BqQqvKyBGiuBlWIgNZ
	ra25yhVychtVyjcS1314JePUcGb3SXpcI+lT7P7TkWO05fGvQ5vlHVeZqj0eR/uXGhvjLaAzL+XzX
	Y+mIKuNjRUG2b+XfCK4y8u3N289YbCji4OMwNRNqLBkLjxVvnuoWbvf6hmqlQpHFzXOU3FADb5iGs
	0Vj6QcqvEYS3loYSnyXMjgbbgr5PjQK6h52wvkADq+FCFvFs9a21yXUPQ1h84W9dA3K9/nG0wEvZI
	jZ9Ku3OQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqT1-00000002Brt-33nE;
	Tue, 26 Aug 2025 09:59:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 87BEE300220; Tue, 26 Aug 2025 11:59:50 +0200 (CEST)
Date: Tue, 26 Aug 2025 11:59:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard
 MC scheduling bits
Message-ID: <20250826095950.GI4068168@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 11:43:58AM +0200, Peter Zijlstra wrote:

> Now, when I look at unifying those config options (there's a metric ton
> of crap that's duplicated in the arch/*/Kconfig), I end up with something
> like the below.
> 
> And while that isn't exact, it is the closest I could make it without
> making a giant mess of things.
> 
> WDYT?

Anyway, enough tinkering with this for a little bit. Things are here:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core

For to robots to provide feedback :-)

