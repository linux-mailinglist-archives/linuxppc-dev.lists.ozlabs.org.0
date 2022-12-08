Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63064704F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ4w1nyzz3fHx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:00:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs36cfxz3cLc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs35VFgz4xvp;
	Thu,  8 Dec 2022 23:49:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221024030150.852517-1-npiggin@gmail.com>
References: <20221024030150.852517-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults
Message-Id: <167050320099.1457988.10604091000281853570.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:00 +1100
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

On Mon, 24 Oct 2022 13:01:50 +1000, Nicholas Piggin wrote:
> This option increases the number of hash misses by limiting the number
> of kernel HPT entries, by keeping a per-CPU record of the last kernel
> HPTEs installed, and removing that from the hash table on the next hash
> insertion. A timer round-robins CPUs removing remaining kernel HPTEs and
> clearing the TLB (in the case of bare metal) to increase and slightly
> randomise kernel fault activity.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults
      https://git.kernel.org/powerpc/c/6b34a099faa123488b13caf704562f4dbe483fc4

cheers
