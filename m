Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2D3087FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 11:58:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRvTl37lzzDrj8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 21:58:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=kKPmEvCE; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRvRz60b5zDrbn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 21:57:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gmJnKiOpmIO5sxf/3PEyvhKZXg73QWNeq0qkSTPfgWo=; b=kKPmEvCEfxEjYQl/sS+44NOzxO
 Gqmi3S3Tf4cMGdOazyj/DxQvuCP8kAxaebOCNnEDraOWqHCb2QlbmMfk1ekS3U7elMO5rWlkwd+dd
 SkRu6fdc6jABkh8TKmUKTO7BSwhuNCx/oDT5TUBFdfy4Y4XHdCWXjQ04jseR+UbyEgPBvpbo/ukyH
 aISvMKS3t3C33B4JbCdxWkNWuD94xAdy9lgMXypUFsIG3FJS4uCALUjkGlQqbgYDDzyAUkkHPiUUY
 lXMUXB5WVZM0ldMMVlHENqgTfhjvKTaJZFmgpjfUdoUIfM9OznIl3kkjNX3KXdP2U5YzyRq6NdlV/
 hsEJJ9mA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l5RRE-009ivk-7k; Fri, 29 Jan 2021 10:55:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 71F043019CE;
 Fri, 29 Jan 2021 11:55:36 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 300892D19736B; Fri, 29 Jan 2021 11:55:36 +0100 (CET)
Date: Fri, 29 Jan 2021 11:55:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 0/3] sched: Task priority related cleanups
Message-ID: <YBPpqAe5id97csAj@hirez.programming.kicks-ass.net>
References: <20210128131040.296856-1-dietmar.eggemann@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128131040.296856-1-dietmar.eggemann@arm.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Hillf Danton <hdanton@sina.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Jeremy Kerr <jk@ozlabs.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 02:10:37PM +0100, Dietmar Eggemann wrote:

> Dietmar Eggemann (3):
>   sched: Remove MAX_USER_RT_PRIO
>   sched: Remove USER_PRIO, TASK_USER_PRIO and MAX_USER_PRIO
>   sched/core: Update task_prio() function header

Thanks!
