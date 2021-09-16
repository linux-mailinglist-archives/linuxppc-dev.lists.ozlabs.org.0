Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1D40D80E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 12:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9Db415K7z305C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 20:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j+eAgDzF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j+eAgDzF; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9DZN5f6mz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 20:57:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631789866;
 bh=ZispAWzioAVbjxueTjRm+hiDj1TZC69+PxYkYh1lWBA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j+eAgDzFwK8z9d+QuWLV+d7slJps5jsQp4dRysMAI+bc19oxRoC8W4gbJ+tvcEdnd
 OV2H7AyiQ98cJ1M1hJPOy9WzyJZGxPXetztdknB+TV3itWhfCbwUYqNda2H7F5rKGl
 v5PQOTfUBCoqPjOcUHDrFXrCHKBTRaWHnRljM57KoahGZ14xe4Sym8HQsqfCoxiGrL
 yvcZVavQ4K++0YtDp2ga0MRoW53N+PSqS04tLBKAsidBQPPNGm8+aTwzrp5OpyqfRw
 vzHUXrwm9n8fw2XHX9ZJzr30Rl33MOMtza+QITtUVgXy8QQfXoMkk9SAlT5UJ6ujxi
 mleoa0SUsg08Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9DZJ1Ny9z9sW8;
 Thu, 16 Sep 2021 20:57:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] perf: Add macros to specify onchip L2/L3 accesses
In-Reply-To: <YUCMUZbchMjD54eY@hirez.programming.kicks-ass.net>
References: <20210904064932.307610-1-kjain@linux.ibm.com>
 <87ilzbmt7i.fsf@mpe.ellerman.id.au>
 <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
 <87czphnchp.fsf@mpe.ellerman.id.au>
 <YTob/xfn1gt901K4@hirez.programming.kicks-ass.net>
 <87k0jjl9sp.fsf@mpe.ellerman.id.au>
 <YUCMUZbchMjD54eY@hirez.programming.kicks-ass.net>
Date: Thu, 16 Sep 2021 20:57:33 +1000
Message-ID: <87fsu4kcte.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, Kajol Jain <kjain@linux.ibm.com>,
 linux-kernel@vger.kernel.org, acme@kernel.org, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Tue, Sep 14, 2021 at 08:40:38PM +1000, Michael Ellerman wrote:
>> Peter Zijlstra <peterz@infradead.org> writes:
>
>> > I'm thinking we ought to keep hops as steps along the NUMA fabric, with
>> > 0 hops being the local node. That only gets us:
>> >
>> >  L2, remote=0, hops=HOPS_0 -- our L2
>> >  L2, remote=1, hops=HOPS_0 -- L2 on the local node but not ours
>> >  L2, remote=1, hops!=HOPS_0 -- L2 on a remote node
>> 
>> Hmm. I'm not sure about tying it directly to NUMA hops. I worry we're
>> going to see more and more systems where there's a hierarchy within the
>> chip/package, in addition to the traditional NUMA hierarchy.
>> 
>> Although then I guess it becomes a question of what exactly is a NUMA
>> hop, maybe the answer is that on those future systems those
>> intra-chip/package hops should be represented as NUMA hops.
>> 
>> It's not like we have a hard definition of what a NUMA hop is?
>
> Not really, typically whatever the BIOS/DT/whatever tables tell us. I
> think in case of Power you're mostly making things up in software :-)

Firmware is software so yes :)

> But yeah, I think we have plenty wriggle room there.

OK.

cheers
