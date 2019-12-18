Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B02124297
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 10:17:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d8Xm6ZztzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 20:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="f2iQ9azv"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d8VV18dGzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 20:15:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yy7XJzKs/UVClyYTN6M5/1lRHUyMKVCwSsAA8ZPCmDQ=; b=f2iQ9azv80SPhY1T31gNmGIth
 IRmUrC2nCGebnp8jCvPy6rwls9g/I+lCe9ysconaUXAjoLM5a7hO1Zwp35Zz9HlKCRktBLUDc+2ck
 rvgcEcrnipKOUkHFAylmYW1CeD45Qd20DK0oRrkaRXq8bt/lCqNXnq3TIvyYPUlG3DMZAO1eq0tuA
 MPlzwIyak2WIrkPE00kXSKlQkuM8ydEarSWrGm0Ks2LqQKBHi2Rz99vIDlwGNU0upOm4ge1Cbgnkv
 /O6ixuJxILbPjSXh+gVGt7H3MaqptdS7QzbEZt8FBfep+a3zcpw17WrRDF3sS1RWk/2c6w50A1MsK
 DTyfUYK/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihVQ2-0000jH-56; Wed, 18 Dec 2019 09:14:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CD9163007F2;
 Wed, 18 Dec 2019 10:13:31 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CB8072B3E30F5; Wed, 18 Dec 2019 10:14:54 +0100 (CET)
Date: Wed, 18 Dec 2019 10:14:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/mmu_gather: Enable RCU_TABLE_FREE even
 for !SMP case
Message-ID: <20191218091454.GN2844@hirez.programming.kicks-ass.net>
References: <20191218053530.73053-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218053530.73053-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


I'm going to assume you'll take these 3 patches through the powerpc tree
for convenience, a few small nits, but otherwise ACK on the lot.

On Wed, Dec 18, 2019 at 11:05:28AM +0530, Aneesh Kumar K.V wrote:
> A follow up patch is going to make sure we correctly invalidate page walk cache
> before we free page table pages. In order to keep things simple enable
> RCU_TABLE_FREE even for !SMP so that we don't have to fixup the !SMP case
> differently in the followup patch

Perhaps more clearly state that !SMP is broken for Radix/PWC. The above
sorta implies it is, but it's not spelled out in any detail.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
