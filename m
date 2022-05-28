Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E546536D01
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 14:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9M9T0Q5Pz3cg2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 22:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9M961C5Vz2x9G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:55:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9M960Yjpz4xYY;
	Sat, 28 May 2022 22:55:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220519122205.746276-1-mpe@ellerman.id.au>
References: <20220519122205.746276-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64s: Add CPU_FTRS_POWER9_DD2_2 to CPU_FTRS_ALWAYS mask
Message-Id: <165374252238.3061085.2965690259164188151.b4-ty@ellerman.id.au>
Date: Sat, 28 May 2022 22:55:22 +1000
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

On Thu, 19 May 2022 22:22:04 +1000, Michael Ellerman wrote:
> CPU_FTRS_POWER9_DD2_2 is missing from CPU_FTRS_ALWAYS.
> 
> That doesn't cause any bug, because CPU_FTRS_POWER9_DD2_2 adds new bits
> that don't appear in other values, so when anded with the other masks
> the result is the same.
> 
> But for consistency we should have all values in the CPU_FTRS_ALWAYS
> mask, so that the logic is robust against the values being changed in
> future.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/64s: Add CPU_FTRS_POWER9_DD2_2 to CPU_FTRS_ALWAYS mask
      https://git.kernel.org/powerpc/c/3e36960a27fec30f16bace1521dc852105522f5e
[2/2] powerpc/64s: Add CPU_FTRS_POWER10 to ALWAYS mask
      https://git.kernel.org/powerpc/c/b4d9cc75721bdbceba0d71aa5accf6aa09ee26c1

cheers
