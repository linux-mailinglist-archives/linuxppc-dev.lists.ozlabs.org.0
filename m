Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C11629042D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 13:37:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCPKF0Q4rzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 22:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCPC84kT4zDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 22:32:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CCPC805pJz9sTv; Fri, 16 Oct 2020 22:32:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
References: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] powerpc/mce: Fix mce handler and add selftest
Message-Id: <160284791867.1794337.3709853894956238598.b4-ty@ellerman.id.au>
Date: Fri, 16 Oct 2020 22:32:35 +1100 (AEDT)
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
Cc: msuchanek@suse.de, mahesh@linux.ibm.com, npiggin@gmail.com,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 9 Oct 2020 12:10:03 +0530, Ganesh Goudar wrote:
> This patch series fixes mce handling for pseries, Adds LKDTM test
> for SLB multihit recovery and enables selftest for the same,
> basically to test MCE handling on pseries/powernv machines running
> in hash mmu mode.
> 
> v4:
> * Use radix_enabled() to check if its in Hash or Radix mode.
> * Use FW_FEATURE_LPAR instead of machine_is_pseries().
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/2] powerpc/mce: Avoid nmi_enter/exit in real mode on pseries hash
      https://git.kernel.org/powerpc/c/8d0e2101274358d9b6b1f27232b40253ca48bab5

cheers
