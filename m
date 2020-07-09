Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF821A66A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 19:58:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2kRk3HyRzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 03:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=TcMSSvmz; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2kPg0gkmzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 03:56:22 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 184FF29126B;
 Thu,  9 Jul 2020 13:56:20 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mXKfqIg6XXZy; Thu,  9 Jul 2020 13:56:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B6C142912D3;
 Thu,  9 Jul 2020 13:56:19 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B6C142912D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594317379;
 bh=VxFFyICjl7esdkbHxUyPi2zFNcGjMFP309ML9n923V0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=TcMSSvmzf7dGDmwKGFhUX4CwLlSkpSidgr9gMb3lfDjx5XfZ31R33NopHcuzmnE30
 D7bhODQrkTrhA5k6puRfFDPfjPmv+w0BhZWD5XIZrWrCey++PsCHKEwU/7W4lhIga6
 kxGIOwrtqeupu6fhdTLR10orJwRvWpyRcEeyF/qdHOD1eBEIez+dGjwvtmKrQmQ9/t
 Auj003BlJh94TKT8pZhvk0GBdqoAQwhRq3F8i24VDx3iWLGFCYjN1fbf4K1oH6vj77
 xfcE1MS7RJ+VP2HP2id0yCRAYyjX0mB77/2KIkblKbk0vc/YZ4mcsZl0u9IelocrPg
 erauSvQc9T6LA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BAa6cGdb2L8L; Thu,  9 Jul 2020 13:56:19 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id A984A29158E;
 Thu,  9 Jul 2020 13:56:19 -0400 (EDT)
Date: Thu, 9 Jul 2020 13:56:19 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <1682947575.7422.1594317379612.JavaMail.zimbra@efficios.com>
In-Reply-To: <1584179170.7410.1594316576293.JavaMail.zimbra@efficios.com>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <87k0ze2nv4.fsf@mpe.ellerman.id.au> <20200708235331.GA3598@gate.crashing.org>
 <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
 <20200709001837.GD3598@gate.crashing.org>
 <1769596686.6365.1594302227962.JavaMail.zimbra@efficios.com>
 <20200709173712.GL3598@gate.crashing.org>
 <1584179170.7410.1594316576293.JavaMail.zimbra@efficios.com>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: q69V8GVx/SoKpVhL7JIT4yP2NgYiwCJBkMC5
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

----- On Jul 9, 2020, at 1:42 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> ----- On Jul 9, 2020, at 1:37 PM, Segher Boessenkool segher@kernel.crashing.org
> wrote:
> 
>> On Thu, Jul 09, 2020 at 09:43:47AM -0400, Mathieu Desnoyers wrote:
>>> > What protects r17 *after* this asm statement?
>>> 
>>> As discussed in the other leg of the thread (with the code example),
>>> r17 is in the clobber list of all asm statements using this macro, and
>>> is used as a temporary register within each inline asm.
>> 
>> That works fine then, for a testcase.  Using r17 is not a great idea for
>> performance (it increases the active register footprint, and causes more
>> registers to be saved in the prologue of the functions, esp. on older
>> compilers), and it is easier to just let the compiler choose a good
>> register to use.  But maybe you want to see r17 in the generated
>> testcases, as eyecatcher or something, dunno :-)
> 
> Just to make sure I understand your recommendation. So rather than
> hard coding r17 as the temporary registers, we could explicitly
> declare the temporary register as a C variable, pass it as an
> input operand to the inline asm, and then refer to it by operand
> name in the macros using it. This way the compiler would be free
> to perform its own register allocation.
> 
> If that is what you have in mind, then yes, I think it makes a
> lot of sense.

Except that asm goto have this limitation with gcc: those cannot
have any output operand, only inputs, clobbers and target labels.
We cannot modify a temporary register received as input operand. So I don't
see how to get a temporary register allocated by the compiler considering
this limitation.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
