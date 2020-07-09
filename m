Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 360AA21A11E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2crz3tYCzDr9v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 23:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=rqROrYct; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2cpH5GVJzDr6d
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:43:51 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 4CF09287902;
 Thu,  9 Jul 2020 09:43:48 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zVXNIT6rJg8C; Thu,  9 Jul 2020 09:43:48 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 1CCB2287881;
 Thu,  9 Jul 2020 09:43:48 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 1CCB2287881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594302228;
 bh=vZpyXnYCpcaA3+PIniybaAEMdDuMNURrywNFwGXuzOU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=rqROrYctBY5Mu+MJJD4XYPkbUTa4WRpKOaohyWmm7qkfI9uIpkW4ipEbVLuRRhITY
 31CUaogt+91tmgFT0SuWaFd3Ze42eCk1TW08ZBNJtmlXQBCAZ4ZX8zV4ntupywdMtk
 rnibje94DqRtYb2RFuz85SVQqWHhs6yvP35eJLAvAv2gLlco0C144sDY3lYTKjiQXG
 nPHt68R518FEouxd1NFA1N0ASY0y4mWu0Z0KZ7qgrQhB+/oI5BMoj4QHp5gG1VyvcE
 GZmuGUMKTmt2ZlA6Q6RT/L/uwRV3fNLgJrueLc7PPr3bm/fJd72iYd9bNlEHpKeTL/
 8OZ0WxkLKcZuw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RRuPZnMuI5UW; Thu,  9 Jul 2020 09:43:48 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 0DB452875E4;
 Thu,  9 Jul 2020 09:43:48 -0400 (EDT)
Date: Thu, 9 Jul 2020 09:43:47 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <1769596686.6365.1594302227962.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200709001837.GD3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org> <87k0ze2nv4.fsf@mpe.ellerman.id.au>
 <20200708235331.GA3598@gate.crashing.org>
 <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
 <20200709001837.GD3598@gate.crashing.org>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: gP6cQ2k5oYjDnwx5a20MwfNnavNDMw==
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

----- On Jul 8, 2020, at 8:18 PM, Segher Boessenkool segher@kernel.crashing.org wrote:

> On Wed, Jul 08, 2020 at 08:01:23PM -0400, Mathieu Desnoyers wrote:
>> > > #define RSEQ_ASM_OP_CMPEQ(var, expect, label)
>> > > \
>> > >                 LOAD_WORD "%%r17, %[" __rseq_str(var) "]\n\t"                   \
>> > 
>> > The way this hardcodes r17 *will* break, btw.  The compiler will not
>> > likely want to use r17 as long as your code (after inlining etc.!) stays
>> > small, but there is Murphy's law.
>> 
>> r17 is in the clobber list, so it should be ok.
> 
> What protects r17 *after* this asm statement?

As discussed in the other leg of the thread (with the code example),
r17 is in the clobber list of all asm statements using this macro, and
is used as a temporary register within each inline asm.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
