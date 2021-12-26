Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1547F92B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:57:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZR732Blz3f2Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLx6bh1z3bVC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:54:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLx5fbnz4xn6;
 Mon, 27 Dec 2021 08:54:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211216103342.609192-1-npiggin@gmail.com>
References: <20211216103342.609192-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s/radix: Fix huge vmap false positive
Message-Id: <164055553124.3187272.1718686162886442525.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:11 +1100
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Dec 2021 20:33:42 +1000, Nicholas Piggin wrote:
> pmd_huge() is defined to false when HUGETLB_PAGE is not configured, but
> the vmap code still installs huge PMDs. This leads to false bad PMD
> errors when vunmapping because it is not seen as a huge PTE, and the bad
> PMD check catches it. The end result may not be much more serious than
> some bad pmd warning messages, because the pmd_none_or_clear_bad() does
> what we wanted and clears the huge PTE anyway.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/radix: Fix huge vmap false positive
      https://git.kernel.org/powerpc/c/467ba14e1660b52a2f9338b484704c461bd23019

cheers
