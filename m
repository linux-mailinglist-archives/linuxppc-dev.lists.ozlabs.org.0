Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E723021D823
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 16:17:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B55Lw5R7MzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 00:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=Qd1+Lkij; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B55GZ2vnGzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 00:13:25 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0BA312A2098;
 Mon, 13 Jul 2020 10:13:22 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id S1h_oqHPAlK4; Mon, 13 Jul 2020 10:13:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id A10902A2097;
 Mon, 13 Jul 2020 10:13:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A10902A2097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594649601;
 bh=XqbvFKyVtrLGiel3RNeXGdRx+Uy0i/kVfU8B2yF1Vps=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Qd1+LkijOFRpXZ/hXeFVcIG1XDUyqXzMXheUxr4ymNDATWBtzeRngQgvcgj1UN/wQ
 a9IWntemPvANBJkCv+ERziZWUMAWLW9cP3K2yHa0C4iZse4IBq+mcswHdB4yV1Cg8K
 6D/h9sOILkANM3IpHWbJhPJIf2sPpUglCT5mgqXufzzgoLEtwLI2fVzhds7D2JYmJ2
 kozUnFllcUdECvQnMyCBRLCcx80bHdl0oKGXL1s1m8v++a/xNb2jFnua9X23Kw4kta
 KoKqnpbNCDTT6DbG6m+7xwuBBzaT9X3McZ5iKcLDXTeNqD4ZRR/bwS+QaU/QuK5WWE
 H81CVMOQJRUDw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gnjQutJ2gIVJ; Mon, 13 Jul 2020 10:13:21 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 91AC42A2095;
 Mon, 13 Jul 2020 10:13:21 -0400 (EDT)
Date: Mon, 13 Jul 2020 10:13:21 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <284592761.9860.1594649601492.JavaMail.zimbra@efficios.com>
In-Reply-To: <1594647408.wmrazhwjzb.astroid@bobo.none>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-5-npiggin@gmail.com>
 <CALCETrVqHDLo09HcaoeOoAVK8w+cNWkSNTLkDDU=evUhaXkyhQ@mail.gmail.com>
 <1594613902.1wzayj0p15.astroid@bobo.none>
 <1594647408.wmrazhwjzb.astroid@bobo.none>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: T7nLE24o9VdoF/eNvu+hhgTHKlctBA==
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
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 13, 2020, at 9:47 AM, Nicholas Piggin npiggin@gmail.com wrote:

> Excerpts from Nicholas Piggin's message of July 13, 2020 2:45 pm:
>> Excerpts from Andy Lutomirski's message of July 11, 2020 3:04 am:
>>> Also, as it stands, I can easily see in_irq() ceasing to promise to
>>> serialize.  There are older kernels for which it does not promise to
>>> serialize.  And I have plans to make it stop serializing in the
>>> nearish future.
>> 
>> You mean x86's return from interrupt? Sounds fun... you'll konw where to
>> update the membarrier sync code, at least :)
> 
> Oh, I should actually say Mathieu recently clarified a return from
> interrupt doesn't fundamentally need to serialize in order to support
> membarrier sync core.

Clarification to your statement:

Return from interrupt to kernel code does not need to be context serializing
as long as kernel serializes before returning to user-space.

However, return from interrupt to user-space needs to be context serializing.

Thanks,

Mathieu

> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-July/214171.html
> 
> So you may not need to do anything more if you relaxed it.
> 
> Thanks,
> Nick

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
