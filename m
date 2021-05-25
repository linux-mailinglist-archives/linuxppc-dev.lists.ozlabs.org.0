Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2D3903C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 16:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqGQD03Shz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 00:18:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QhHEV9SM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqGPc38qkz2ykL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 00:17:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=R3CM2Lsu3VJH05B4Xvgeahvan2waaA6zGmOBWkB7ucM=; b=QhHEV9SMIPb9e2vcx+sRttOMHg
 1ad1UfpqbfBTF6PegXck6vLnK73iJuqtO6GfRcvGORNSBb4MCtN0si8dz88f5aiVt+4+EyiCYfry1
 ALK/NQ2paQxgVX9Mk5PBOWdqrynvSShRsuri2mDaFWs1V7n0RMedD8gwrSoxbZrqI2HHsZatAq00Y
 uhn2zFGoshrfJ4xM5HHL3nI0ij3ZhHpBXMIYqZUeNfjD3Kb1CeZVBPJJi4lHiMSrUI9Ww/AJY7leR
 oaCluGDG5hsTV5huoSAGd9RVDfVxnb9dUfN98NPPXq5aLiDMm0SoWiJRMoJM+RnZ7tKGPp7aP4Sy1
 r/u1nKpA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llXrX-0008HI-Je; Tue, 25 May 2021 14:16:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1782A30022C;
 Tue, 25 May 2021 16:16:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 31889202A6057; Tue, 25 May 2021 16:16:54 +0200 (CEST)
Date: Tue, 25 May 2021 16:16:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [RFC v2 4/4] powerpc/papr_scm: Add cpu hotplug support for
 nvdimm pmu device
Message-ID: <YK0G1nmvhOPimRay@hirez.programming.kicks-ass.net>
References: <20210525132216.1239259-1-kjain@linux.ibm.com>
 <20210525132216.1239259-5-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525132216.1239259-5-kjain@linux.ibm.com>
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, ira.weiny@intel.com,
 linux-nvdimm@lists.01.org, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 06:52:16PM +0530, Kajol Jain wrote:
> Patch here adds cpu hotplug functions to nvdimm pmu.

I'm thinking "Patch here" qualifies for "This patch", see
Documentation/process/submitting-patches.rst .

> It adds cpumask to designate a cpu to make HCALL to
> collect the counter data for the nvdimm device and
> update ABI documentation accordingly.
> 
> Result in power9 lpar system:
> command:# cat /sys/devices/nmem0/cpumask
> 0

Is this specific to the papr thing, or should this be in generic nvdimm
code?
