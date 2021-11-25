Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224645D752
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:35:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0CRZ6gRNz3cW1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:35:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0CQj4Xqqz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:35:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0CQj3Wqsz4xcv;
 Thu, 25 Nov 2021 20:35:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20211119031627.577853-1-npiggin@gmail.com>
References: <20211119031627.577853-1-npiggin@gmail.com>
Subject: Re: [PATCH v1] KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush
 flushing SLB
Message-Id: <163783287534.1228083.4493694109236916164.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:34:35 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Nov 2021 13:16:27 +1000, Nicholas Piggin wrote:
> The POWER9 ERAT flush instruction is a SLBIA with IH=7, which is a
> reserved value on POWER7/8. On POWER8 this invalidates the SLB entries
> above index 0, similarly to SLBIA IH=0.
> 
> If the SLB entries are invalidated, and then the guest is bypassed, the
> host SLB does not get re-loaded, so the bolted entries above 0 will be
> lost. This can result in kernel stack access causing a SLB fault.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush flushing SLB
      https://git.kernel.org/powerpc/c/cf0b0e3712f7af90006f8317ff27278094c2c128

cheers
