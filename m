Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BDF47BF79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 13:15:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJFm26DtSz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 23:15:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJFlZ6tfLz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 23:15:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJFlT4lm0z4xbd;
 Tue, 21 Dec 2021 23:15:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ak@linux.intel.com, Kajol Jain <kjain@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, acme@kernel.org, mpe@ellerman.id.au,
 namhyung@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 jolsa@kernel.org, peterz@infradead.org
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
Subject: Re: [PATCH 0/4] perf: Add new macros for mem_hops field
Message-Id: <164008884985.2078648.16441657679018856536.b4-ty@ellerman.id.au>
Date: Tue, 21 Dec 2021 23:14:09 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Dec 2021 14:47:45 +0530, Kajol Jain wrote:
> Patchset adds new macros for mem_hops field which can be
> used to represent remote-node, socket and board level details.
> 
> Currently the code had macro for HOPS_0, which corresponds
> to data coming from another core but same node.
> Add new macros for HOPS_1 to HOPS_3 to represent
> remote-node, socket and board level data.
> 
> [...]

Patches 1, 3 and 4 applied to powerpc/next.

[1/4] perf: Add new macros for mem_hops field
      https://git.kernel.org/powerpc/c/cb1c4aba055f928ffae0c868e8dfe08eeab302e7
[3/4] powerpc/perf: Add encodings to represent data based on newer composite PERF_MEM_LVLNUM* fields
      https://git.kernel.org/powerpc/c/4a20ee106154ac1765dea97932faad29f0ba57fc
[4/4] powerpc/perf: Add data source encodings for power10 platform
      https://git.kernel.org/powerpc/c/6ed05a8efda56e5be11081954929421de19cce88

cheers
