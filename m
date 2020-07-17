Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716A223D3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 15:47:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7XW95kLGzDrPX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 23:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=ma1zH3Z6; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7XPL4Y5gzDrP5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 23:42:46 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 5F54929F2A7;
 Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jN3jsl16ovkH; Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 268FE29EE7D;
 Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 268FE29EE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594993363;
 bh=GC3ddsIx6YDC8lre9W0wbffnyhB0KFZu7j1u1JF1RP4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ma1zH3Z6Oeo1HyVTHrIgYu0S5+/f5NlI5oZGjrclUDdUk18Tg4/VuFnjycHtN9Vhl
 sHyN6b0BIuUNyIiFUSS1MpzDqQKdTtspMfIhcqr+R5J0T95VclTBCmJaHvTXKKbS2p
 QJcy0KLegYDbAsdBWn3aNfC3XZun9bz247aORtgXdbBzyO9mQvEhzU3crDU29vaYB8
 GH+77edaFwX31CtCGmKZdb7O6ZUa9Z7muSP11UDvBtwWQohm8m1qDbiyDakxGyYlZO
 WpjPpFk77z+zr2V190Qr197qyRK0Y+ftgdEnM+B/+RFJUG48nt09inMjQ9ndQ7P1Nk
 s6Vt4gmCzqQOQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nr_pEIWotEQc; Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 13F0629F31E;
 Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
Date: Fri, 17 Jul 2020 09:42:43 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
In-Reply-To: <1594906688.ikv6r4gznx.astroid@bobo.none>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: tih2wG5S7/k8ds/ZwlGdEfhVUfBRJg==
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
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 16, 2020, at 7:26 PM, Nicholas Piggin npiggin@gmail.com wrote:
[...]
> 
> membarrier does replace barrier instructions on remote CPUs, which do
> order accesses performed by the kernel on the user address space. So
> membarrier should too I guess.
> 
> Normal process context accesses like read(2) will do so because they
> don't get filtered out from IPIs, but kernel threads using the mm may
> not.

But it should not be an issue, because membarrier's ordering is only with respect
to submit and completion of io_uring requests, which are performed through
system calls from the context of user-space threads, which are called from the
right mm.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
