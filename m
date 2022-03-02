Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380B4CA53A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:50:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v9h2lXJz3fMs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v551rs4z3bwG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v5574M4z4xvS;
 Wed,  2 Mar 2022 23:46:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20220204035348.545435-1-npiggin@gmail.com>
References: <20220204035348.545435-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/hash: Make hash faults work in NMI context
Message-Id: <164622488476.2052779.3251580030023729315.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:24 +1100
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Feb 2022 13:53:48 +1000, Nicholas Piggin wrote:
> Hash faults are not resoved in NMI context, instead causing the access
> to fail. This is done because perf interrupts can get backtraces
> including walking the user stack, and taking a hash fault on those could
> deadlock on the HPTE lock if the perf interrupt hits while the same HPTE
> lock is being held by the hash fault code. The user-access for the stack
> walking will notice the access failed and deal with that in the perf
> code.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/hash: Make hash faults work in NMI context
      https://git.kernel.org/powerpc/c/8b91cee5eadd2021f55e6775f2d50bd56d00c217

cheers
