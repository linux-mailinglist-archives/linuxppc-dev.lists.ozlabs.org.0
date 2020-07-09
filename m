Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A762194D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:03:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2GbM55HNzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=qrKWR8Eu; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2GYP13SczDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 10:01:27 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id E0092281F7C;
 Wed,  8 Jul 2020 20:01:23 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lG4q4Nn1zGDe; Wed,  8 Jul 2020 20:01:23 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id A6B06282313;
 Wed,  8 Jul 2020 20:01:23 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A6B06282313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594252883;
 bh=lyhd5ItoTOKI7OWcz81IExv3vzCfWlfU9GUlxZNs2Yw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=qrKWR8EulDCtOTlrTR8MahZETMIjcm4W0UcWGVfdEEkiJqHz0ipTmN1tTOgJ0vgYC
 TDEFeTOZvJr2F0NEsECebEIqY0XhvzuxVV69e3tz4JmU1Ghk+RmkOh+CBT7i3w52s8
 B5cGqgRZst/AIRF+X0c1MNT5taPq0dih4Nj1tcMZpA5WoEup0NtG7T9NwMUOk+rWu+
 us40yLFVO+vwQC2QceizAWFz3+jpjTDxyv5NMjlciJRpI7GRxzMnq0rvJ4jxfE1n8p
 yS2OWUlzSRinRDY6CXTI/QoB1ui0gg8NwzmK+CIZJFT3pU3wkEnaVoA25WA0wdCi8D
 1mSaKKC03RYmw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oqf3wFDUxF6q; Wed,  8 Jul 2020 20:01:23 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 9A18E281FF5;
 Wed,  8 Jul 2020 20:01:23 -0400 (EDT)
Date: Wed, 8 Jul 2020 20:01:23 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200708235331.GA3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org> <87k0ze2nv4.fsf@mpe.ellerman.id.au>
 <20200708235331.GA3598@gate.crashing.org>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (zclient/8.8.15_GA_3955)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: gW9FshrTA4LMHnDNsgamhSAiT8vZhA==
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


----- Segher Boessenkool <segher@kernel.crashing.org> wrote:
> Hi!
> 
> On Wed, Jul 08, 2020 at 10:27:27PM +1000, Michael Ellerman wrote:
> > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > You'll have to show the actual failing machine code, and with enough
> > > context that we can relate this to the source code.
> > >
> > > -save-temps helps, or use -S instead of -c, etc.
> > 
> > Attached below.
> 
> Thanks!
> 
> > I think that's from:
> > 
> > #define LOAD_WORD       "ld "
> > 
> > #define RSEQ_ASM_OP_CMPEQ(var, expect, label)                                   \
> >                 LOAD_WORD "%%r17, %[" __rseq_str(var) "]\n\t"                   \
> 
> The way this hardcodes r17 *will* break, btw.  The compiler will not
> likely want to use r17 as long as your code (after inlining etc.!) stays
> small, but there is Murphy's law.

r17 is in the clobber list, so it should be ok.

> 
> Anyway...  something in rseq_str is wrong, missing %X<n>.  This may
> have to do with the abuse of inline asm here, making a fix harder :-(

I just committed a fix which enhances the macros.

Thanks for your help!

Mathieu

> 
> 
> Segher

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
