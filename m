Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52921A973
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 22:59:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2pT24RdyzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 06:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=rMcZ8L2Q; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2pR970FvzDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 06:57:57 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 04DC02928C0;
 Thu,  9 Jul 2020 16:57:53 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WNUsV1GDHBRB; Thu,  9 Jul 2020 16:57:52 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B904C2928BF;
 Thu,  9 Jul 2020 16:57:52 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B904C2928BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594328272;
 bh=j8L5xeGd9McORpcjaf5FdpAMBj3b4OCMGzV2SSpglJI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=rMcZ8L2QjwnTIXmJP50yPRHvLJ7FL3AnIh9zl37yK1drK7/EHeZS452ftliUGkrAZ
 gfcNy/wzlsZEbF1Mw1Euqa6Px2otnijfgQKK+AC8Miq3dPOJ/PBnlcf9d1bJfbPnOh
 8nb7pmlYUlYlzF1B//vqXjgTMI7TIi8XbKw41sa6XCIfCHtrYPS87N/PSXvPX6zRpI
 hYqQJ+h9bIuBcsMYfzTMdVcf7U+h+8MqPo7UMjbanJpKvi0MZEKiwdJpsO3RHypMVP
 s4/6PhEZw4cLceTGum81zFkC9Eqb+b+1OKQg2rUeW5LEOHGD+m71y2PDP/B7OXtG12
 61fVVipPaoH1A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8KRNKCQJERPK; Thu,  9 Jul 2020 16:57:52 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id AF497292852;
 Thu,  9 Jul 2020 16:57:52 -0400 (EDT)
Date: Thu, 9 Jul 2020 16:57:52 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <285510163.7773.1594328272638.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200709204609.GQ3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
 <20200709001837.GD3598@gate.crashing.org>
 <1769596686.6365.1594302227962.JavaMail.zimbra@efficios.com>
 <20200709173712.GL3598@gate.crashing.org>
 <1584179170.7410.1594316576293.JavaMail.zimbra@efficios.com>
 <1682947575.7422.1594317379612.JavaMail.zimbra@efficios.com>
 <20200709204609.GQ3598@gate.crashing.org>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: A3Re7gQDd7JxEOujPX5Z9ycuIkoKwg==
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 9, 2020, at 4:46 PM, Segher Boessenkool segher@kernel.crashing.org wrote:

> On Thu, Jul 09, 2020 at 01:56:19PM -0400, Mathieu Desnoyers wrote:
>> > Just to make sure I understand your recommendation. So rather than
>> > hard coding r17 as the temporary registers, we could explicitly
>> > declare the temporary register as a C variable, pass it as an
>> > input operand to the inline asm, and then refer to it by operand
>> > name in the macros using it. This way the compiler would be free
>> > to perform its own register allocation.
>> > 
>> > If that is what you have in mind, then yes, I think it makes a
>> > lot of sense.
>> 
>> Except that asm goto have this limitation with gcc: those cannot
>> have any output operand, only inputs, clobbers and target labels.
>> We cannot modify a temporary register received as input operand. So I don't
>> see how to get a temporary register allocated by the compiler considering
>> this limitation.
> 
> Heh, yet another reason not to obfuscate your inline asm: it didn't
> register this is asm goto.
> 
> A clobber is one way, yes (those *are* allowed in asm goto).  Another
> way is to not actually change that register: move the original value
> back into there at the end of the asm!  (That isn't always easy to do,
> it depends on your code).  So something like
> 
>	long start = ...;
>	long tmp = start;
>	asm("stuff that modifies %0; ...; mr %0,%1" : : "r"(tmp), "r"(start));
> 
> is just fine: %0 isn't actually modified at all, as far as GCC is
> concerned, and this isn't lying to it!

It appears to be at the cost of adding one extra instruction on the fast-path
to restore the register to its original value. I'll leave Boqun whom authored
the original rseq-ppc code to figure out what works best performance-wise
(when he finds time).

Thanks for the pointers!

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
