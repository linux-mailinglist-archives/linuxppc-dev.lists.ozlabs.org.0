Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07846FCB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 09:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9P7F0Yxdz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 19:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DpB7kk+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=DpB7kk+b; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9P5x1V3Wz3cBq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 19:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qCd3ofQIkPoBQszSns7SHd2GIzmG4RnKHOMiYd2VhCg=; b=DpB7kk+by4/CIQgowmU6p6xIYw
 7U1O0x0D/HiPeeKc/ZMnLqEFM5EnZ2Yq5noUXO6vH3/B1FGKegavS0UpunIiUa8nB4J07dwFKhSMo
 VdG6CPdAGAa1EFrWUWkWD7Y1oTccKzJMDYwsauvcsw49u6BJQ5J+qq3n6HH53W1vDVYtqUjOuN2V9
 C6Ww1TrkowmjC7XPRG3FQkagGOCRrsGnlmSOyMxBvgbbo5w4ZpL933eYf+paYZ6Y4wBWBv7FdSsS9
 xKK4arxyxrNmrIkB2XtnJ2qYQgZWlahP8k6WDvbW0yX1MtfqwL7fpPN5gVCr3UpTD0ITIFPh1Swv8
 00rRzUEQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvbAI-000X0W-HT; Fri, 10 Dec 2021 08:22:02 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id D9C949817E0; Fri, 10 Dec 2021 09:22:02 +0100 (CET)
Date: Fri, 10 Dec 2021 09:22:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/4] perf: Add new macros for mem_hops field
Message-ID: <20211210082202.GQ16608@worktop.programming.kicks-ass.net>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
 <YbJWVYZg1el9PR1I@kernel.org> <87o85pm0g2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o85pm0g2.fsf@mpe.ellerman.id.au>
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
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 ast@kernel.org, linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com,
 mingo@redhat.com, paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org,
 namhyung@kernel.org, songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 05:35:41PM +1100, Michael Ellerman wrote:
> Arnaldo Carvalho de Melo <acme@kernel.org> writes:
> > Em Mon, Dec 06, 2021 at 02:47:45PM +0530, Kajol Jain escreveu:
> >> Patchset adds new macros for mem_hops field which can be
> >> used to represent remote-node, socket and board level details.
> >> 
> >> Currently the code had macro for HOPS_0, which corresponds
> >> to data coming from another core but same node.
> >> Add new macros for HOPS_1 to HOPS_3 to represent
> >> remote-node, socket and board level data.
> >> 
> >> For ex: Encodings for mem_hops fields with L2 cache:
> >
> > I checked and this hasn't hit mainstream, is it already merged on a tree
> > where this is slated to be submitted in the next window? If so please
> > let me know which one so that I can merge it on perf/core.
> 
> I haven't picked it up. I guess the kernel changes are mainly in
> powerpc, but I'd at least need an ack from eg. Peter for the generic
> perf uapi change.

Done :-)
