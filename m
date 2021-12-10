Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07D46FCAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 09:22:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9P6P00lvz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 19:22:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F/o31sxF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=F/o31sxF; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9P5k1STyz305J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 19:22:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GopIij0BzU8QEXq7yj6L1CinZaI6/cuY3bDW5pw222A=; b=F/o31sxFTsrtg2zfzbX+IuThCy
 vNr9S3QP17ySgsripnuSAiqM2CVTPdXQDKH8O7Jacsxo8cOjv2rzmpX/EJdbBLHZIWNChkWJEQFU0
 hO9Q/2w+V/+P+mPaicovylNNMIQ+AmizhbUxTvn8OtpyEO8WNiAxyJTXhw4456VJ1R94yNpqdN1pp
 nXSaDMBQEytS1HgxeL8GYxgCK8EaDTeqXkWWHgXqqC7iNgReQcQiFEfXPgFiM7JizXBVMwsAemUtx
 mfST4Z3En5ZdepblWeQ/stx0bUNISUoKTnpYr0sDaU2YJv+9ApadzKF5vWRpUrobV2XtkBj4XuTPJ
 vfplG+Uw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvb9p-00A9bg-5r; Fri, 10 Dec 2021 08:21:34 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7C3789817E0; Fri, 10 Dec 2021 09:21:33 +0100 (CET)
Date: Fri, 10 Dec 2021 09:21:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 1/4] perf: Add new macros for mem_hops field
Message-ID: <20211210082133.GP16608@worktop.programming.kicks-ass.net>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
 <20211206091749.87585-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206091749.87585-2-kjain@linux.ibm.com>
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
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, ast@kernel.org, linux-perf-users@vger.kernel.org,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 02:47:46PM +0530, Kajol Jain wrote:
> Add new macros for mem_hops field which can be used to
> represent remote-node, socket and board level details.
> 
> Currently the code had macro for HOPS_0, which corresponds
> to data coming from another core but same node.
> Add new macros for HOPS_1 to HOPS_3 to represent
> remote-node, socket and board level data.
> 
> For ex: Encodings for mem_hops fields with L2 cache:
> 
> L2			- local L2
> L2 | REMOTE | HOPS_0	- remote core, same node L2
> L2 | REMOTE | HOPS_1	- remote node, same socket L2
> L2 | REMOTE | HOPS_2	- remote socket, same board L2
> L2 | REMOTE | HOPS_3	- remote board L2
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
