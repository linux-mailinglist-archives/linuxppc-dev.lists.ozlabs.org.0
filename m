Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D55B6E31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 15:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRkWM2G12z3c42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 23:16:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zd//mRqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zd//mRqG;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRkVg4h0xz2xfs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 23:15:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HxCe9N2ZPr/5kCwic9CoLe8DjVEylSYlBt3jF6Yv8Fg=; b=Zd//mRqGShzJlFQxc6viPN+bIw
	kbZezimhUR3BjYgIkXV6eQcAOXQKJIeSbcBMLodKuMgyEHsA12CxrVYSUiKwy96TGXF87SetMBnQU
	ad0kfKMW2qywRdTrsOP/x0TX99WEPu5XngPrP4oqFMDDXUajGueV6vNhr46lDHpzVaam6f9nnGCzJ
	yxobQy5BhxW2Fz5ylxWcmgi3fmm+Kc9dWrTPUrR37Ub8rmscjivgoPCdcACXrxWqiABaaIaedUqpJ
	rBJ0htLB0LG9V1WHhCip0bYTJIsthMuhu5jP0Bdn+SukC0dF72bKKQt2QKk8qM0jLuvbep3UiViGf
	we/3HZBQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY5l5-00C5UN-Tf; Tue, 13 Sep 2022 13:15:24 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6CA993002AE;
	Tue, 13 Sep 2022 15:15:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3D49F2027D6A2; Tue, 13 Sep 2022 15:15:20 +0200 (CEST)
Date: Tue, 13 Sep 2022 15:15:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Message-ID: <YyCCaPzVi3Yv0tFB@hirez.programming.kicks-ass.net>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <20220912082020.226755-3-sv@linux.ibm.com>
 <YyBxqjtC0DAhmQrT@hirez.programming.kicks-ass.net>
 <8480c380-2eb9-4eff-ceb4-f8bbcb425149@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8480c380-2eb9-4eff-ceb4-f8bbcb425149@csgroup.eu>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 13, 2022 at 12:21:51PM +0000, Christophe Leroy wrote:

> > Like mentioned last time; I'm fixing this (but you're right to not wait
> > on that), that said, would it make sense to write it like:
> > 
> > #define __ALIGN		.balign 4
> > #define __ALIGN_STR	__stringify(__ALIGN)
> 
> By the way, I commented to Sathvika to not use __stringify() in order to 
> avoid having to include stringify.h as we are trying to minimise 
> dependencies between headers.
> 
> Several other architectures also do it that way.

stringify.h is a trivial header and included by linux/linkage.h before
it includes asm/linkage.

Anyway, I was thinking of having:

#ifndef __ALIGN_STR
#define __ALIGN_STR __stringify(__ALIGN)
#endif

in linux/linkage.h, that avoids having to duplicate this all over the
place.
