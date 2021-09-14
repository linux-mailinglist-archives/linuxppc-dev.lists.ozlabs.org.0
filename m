Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719240ACC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 13:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H81rT3fbTz2ygC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 21:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lHcgxOs9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=lHcgxOs9; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H81qj33JHz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 21:50:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sOiknpjgebMSxy2rtFAmjlZL6dFw6P6xeEwKRmQVXg0=; b=lHcgxOs9L6fdd3/+naCd5qQGlF
 pBVcAvJFdwbcipUDn3MAungQE/UDwwcjdE4P26PJBdFwImkfE8A7ZJPKZxLEVHx/eWrW8eJ1h5uPF
 0C0tB/ICoezZgM599DPveVdneMoc2UXuTSLf07nbskrkBr0PfZqNaHN4XlXfcPl7yPyFC8obu513a
 RbBhUaTjm5UMorLyaZHEIXU4yHjti7VOV/wDTXqAvnNaa1vLi2M4emPfSSZBPvll4MWTqvgnr/ZlF
 5PTC8s6cNUxV/d5nmo6ssLaCjR6xRyZkIfKsJCd8PjU8HCdHtvBncErwY50T81RTOvhsYT8qsTxlx
 yKDbMtgw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ6wV-0038BB-9f; Tue, 14 Sep 2021 11:49:39 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 74ED8300129;
 Tue, 14 Sep 2021 13:49:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5CF822D1FEA0A; Tue, 14 Sep 2021 13:49:37 +0200 (CEST)
Date: Tue, 14 Sep 2021 13:49:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] perf: Add macros to specify onchip L2/L3 accesses
Message-ID: <YUCMUZbchMjD54eY@hirez.programming.kicks-ass.net>
References: <20210904064932.307610-1-kjain@linux.ibm.com>
 <87ilzbmt7i.fsf@mpe.ellerman.id.au>
 <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
 <87czphnchp.fsf@mpe.ellerman.id.au>
 <YTob/xfn1gt901K4@hirez.programming.kicks-ass.net>
 <87k0jjl9sp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0jjl9sp.fsf@mpe.ellerman.id.au>
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

On Tue, Sep 14, 2021 at 08:40:38PM +1000, Michael Ellerman wrote:
> Peter Zijlstra <peterz@infradead.org> writes:

> > I'm thinking we ought to keep hops as steps along the NUMA fabric, with
> > 0 hops being the local node. That only gets us:
> >
> >  L2, remote=0, hops=HOPS_0 -- our L2
> >  L2, remote=1, hops=HOPS_0 -- L2 on the local node but not ours
> >  L2, remote=1, hops!=HOPS_0 -- L2 on a remote node
> 
> Hmm. I'm not sure about tying it directly to NUMA hops. I worry we're
> going to see more and more systems where there's a hierarchy within the
> chip/package, in addition to the traditional NUMA hierarchy.
> 
> Although then I guess it becomes a question of what exactly is a NUMA
> hop, maybe the answer is that on those future systems those
> intra-chip/package hops should be represented as NUMA hops.
> 
> It's not like we have a hard definition of what a NUMA hop is?

Not really, typically whatever the BIOS/DT/whatever tables tell us. I
think in case of Power you're mostly making things up in software :-)

But yeah, I think we have plenty wriggle room there.
