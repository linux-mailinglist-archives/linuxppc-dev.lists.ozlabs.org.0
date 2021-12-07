Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D646BCB3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h8M6wTjz3fLX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:33:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2V1sbjz3c5j
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2V13rVz4xhC;
 Wed,  8 Dec 2021 00:28:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211129030915.1888332-1-npiggin@gmail.com>
References: <20211129030915.1888332-1-npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/64s: Get LPID bit width from device tree
Message-Id: <163888362848.3690807.13796221309035667338.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:08 +1100
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Nov 2021 13:09:15 +1000, Nicholas Piggin wrote:
> Allow the LPID bit width and partition table size to be set at runtime
> from the device tree.
> 
> Move the PID bit width detection into the same place.
> 
> KVM does not support using the extra bits yet, this is mainly required
> to get the PTCR register values correct (so KVM will run but it will
> not allocate > 4096 LPIDs).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Get LPID bit width from device tree
      https://git.kernel.org/powerpc/c/5402e239d09feea482d25d60df9b908cfaf9ec3c

cheers
