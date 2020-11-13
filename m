Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F602B1A62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 12:58:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXcRh3C06zDqHl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 22:58:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXc1V09lCzDr1N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 22:38:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jl8/r0xaMvasSwPtiqvuXDrfgB86XgTbuKStGFmkiqY=; b=TFLbTK0JP/5BAcXKX2HQt08pv9
 +yfdqZ45zKuzf9IDyKKPjB/o3TbxkGrOMnA79gVfHVP6tSs5G4asBxys+mFaGoEMWLuBcLO7hW0Zh
 BVJbQUkn1tosKYOXrYdlG4NsZaHX+wzJz2Q2DcYFfy6MPe2fw4ensHMnO66kO1pJQB0MAyy5ihv/p
 Mzv6U+/wH/1G2ro5d52EcghpQxybxZ90RovOSSa10Rlvbir/gBzAZ53PlVyso0pC9cQ1IpQr5+ozJ
 OLJWhjtmLBPhD5OSVPcl2Y7vlpY7NIpLM4h75aQjSgy6OhfHNPdj0Xn9qaRak6oiHAsDB2wRC4Flm
 rLXSbwMw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdXPK-0001jN-TN; Fri, 13 Nov 2020 11:38:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 53967300238;
 Fri, 13 Nov 2020 12:38:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 363C72BB8B0D0; Fri, 13 Nov 2020 12:38:19 +0100 (CET)
Message-ID: <20201113111901.743573013@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 13 Nov 2020 12:19:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 eranian@google.com
Subject: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
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
Cc: linux-arch@vger.kernel.org, ak@linux.intel.com, catalin.marinas@arm.com,
 peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, willy@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, sparclinux@vger.kernel.org, will@kernel.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

These patches provide generic infrastructure to determine TLB page size from
page table entries alone. Perf will use this (for either data or code address)
to aid in profiling TLB issues.

While most architectures only have page table aligned large pages, some
(notably ARM64, Sparc64 and Power) provide non page table aligned large pages
and need to provide their own implementation of these functions.

I've provided (completely untested) implementations for ARM64 and Sparc64, but
failed to penetrate the _many_ Power MMUs. I'm hoping Nick or Aneesh can help
me out there.

