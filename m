Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE331697C32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:49:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyZ85LjWz3g3n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRP2KXVz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRP15w9z4x89;
	Wed, 15 Feb 2023 23:43:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230203111718.1149852-1-npiggin@gmail.com>
References: <20230203111718.1149852-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc/64s/radix: misc tidying
Message-Id: <167646482600.1421441.7798672578302042527.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:26 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Feb 2023 21:17:15 +1000, Nicholas Piggin wrote:
> Here's a few things I wanted to tidy before doing the lazy tlb mm
> shootdown / exit TLB flush IPI optimisation. There is no hard
> dependency just slight code rearrangement but since we're waiting
> for the shootdown patches to go via the -mm tree we could do these
> now.
> 
> It basically just removing a bunch of dead code, or replacing them
> with WARN so we can remove them entirely in a release or two.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/64s/radix: Remove need_flush_all test from radix__tlb_flush
      https://git.kernel.org/powerpc/c/45abf5d94b9bd0eebca5c7272788e2d16c8b5b43
[2/3] powerpc/64s/radix: mm->context.id should always be valid
      https://git.kernel.org/powerpc/c/d01dc25e47af9d30185ca12bb9e221d6af915d9f
[3/3] powerpc/64s/radix: Remove TLB_FLUSH_ALL test from range flushes
      https://git.kernel.org/powerpc/c/dcfecb989afdf9101ee42e2adf04756a2ea4819d

cheers
