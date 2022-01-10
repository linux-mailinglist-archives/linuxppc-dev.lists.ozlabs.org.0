Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E2488E84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 02:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH635Zj8z3dgR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXH2J06fSz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 12:54:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JXH2H65Mwz4xtf;
 Mon, 10 Jan 2022 12:54:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
References: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
Subject: Re: [PATCH]powerpc/xmon: Dump XIVE information for online-only
 processors.
Message-Id: <164177946079.1604045.2233211193189990856.b4-ty@ellerman.id.au>
Date: Mon, 10 Jan 2022 12:51:00 +1100
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
Cc: clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 05 Jan 2022 19:47:48 +0530, Sachin Sant wrote:
> dxa command in XMON debugger iterates through all possible processors.
> As a result, empty lines are printed even for processors which are not
> online.
> 
> CPU 47:pp=00 CPPR=ff IPI=0x0040002f PQ=-- EQ idx=699 T=0 00000000 00000000
> CPU 48:
> CPU 49:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: Dump XIVE information for online-only processors.
      https://git.kernel.org/powerpc/c/f1aa0e47c29268776205698f2453dc07fab49855

cheers
