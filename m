Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E32C8113
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:32:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl0Pl3jf4zDqJc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=AenMzpFa; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl0M44HxlzDrFP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 20:30:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Qm+mEK06jeIylWH4CfquOTPlX9S20bRHRY0l3x6+Qik=; b=AenMzpFaJkqNGAxuS8hKwAiMgA
 4ISTolEMS6eong2QZUaJjw2leQiObEK1qwozGsZ4f+nZbatk0DJ2MX5ZWdkZ0Xb9n5e0iQZ+gVZVf
 eduxONkowfOwtFnYMslTOdP38vvcJ+wHngenPmoWUE5LACtwPElVRB3eJHFvkLEtmeX64ZILYX2fs
 eHv2D5HfAxa5r8rZV4MPuyD5rfqFkGcfBTfvefdL52q0ZeC3nQk3fC50qcXi8GxYh8O+orGpTG+QN
 8MQjbdH3TcGu4sRFR61XMC4uzyQDW4KEW079MA7FTJjpU/yJLSwla0Ci/q3yyLpIiK+tKyiKBad2e
 zcHfSNyg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfVQ-0007lb-Ue; Mon, 30 Nov 2020 09:30:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B1F9305815;
 Mon, 30 Nov 2020 10:30:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 26073203EEFB6; Mon, 30 Nov 2020 10:30:00 +0100 (CET)
Date: Mon, 30 Nov 2020 10:30:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201130093000.GM2414@hirez.programming.kicks-ass.net>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 28, 2020 at 07:54:57PM -0800, Andy Lutomirski wrote:
> This means that mm_cpumask operations won't need to be full barriers
> forever, and we might not want to take the implied full barriers in
> set_bit() and clear_bit() for granted.

There is no implied full barrier for those ops.
