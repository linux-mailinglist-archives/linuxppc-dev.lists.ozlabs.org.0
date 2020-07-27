Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F622E687
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:29:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWdZ74ztzDrPQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWZr6HnyzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZr4BXpz9sRN; Mon, 27 Jul 2020 17:26:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200726132517.399076-1-aneesh.kumar@linux.ibm.com>
References: <20200726132517.399076-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/book3s64/pkey: Disable pkey on POWER6 and
 before
Message-Id: <159583479032.602200.1885885497207397861.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:44 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Jul 2020 18:55:17 +0530, Aneesh Kumar K.V wrote:
> POWER6 only support AMR update via privileged mode(MSR[PR] = 0, SPRN_AMR=29)
> The PR=1 alias for that SPR (SPRN_AMR=13) was only supported
> from POWER7. Since we don't allow userspace modifying of AMR value
> we should disable pkey support on P6 and before.
> 
> The hypervisor will still report pkey support via ibm,processor-storage-keys.
> Hence check for P7 CPU_FTR bit to decide on pkey support.

Applied to powerpc/next.

[1/1] powerpc/book3s64/pkey: Disable pkey on POWER6 and before
      https://git.kernel.org/powerpc/c/269e829f48a0d0d27667abe25ca5c9e5b6ab08e2

cheers
