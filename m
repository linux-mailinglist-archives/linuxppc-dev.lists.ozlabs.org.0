Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7025345D7A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cp02Ps6z3cnV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Cjl2H0xz306m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:48:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Cjk5yp8z4xdS;
 Thu, 25 Nov 2021 20:48:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211110025056.2084347-1-npiggin@gmail.com>
References: <20211110025056.2084347-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 0/4] powerpc: watchdog fixes
Message-Id: <163783300386.1228879.11827829331246737742.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:43 +1100
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Nov 2021 12:50:52 +1000, Nicholas Piggin wrote:
> These are some watchdog fixes and improvements, in particular a
> deadlock between the wd_smp_lock and console lock when the watchdog
> fires, found by Laurent.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
      https://git.kernel.org/powerpc/c/5dad4ba68a2483fc80d70b9dc90bbe16e1f27263
[2/4] powerpc/watchdog: tighten non-atomic read-modify-write access
      https://git.kernel.org/powerpc/c/858c93c31504ac1507084493d7eafbe7e2302dc2
[3/4] powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_nmi_ipi
      https://git.kernel.org/powerpc/c/76521c4b0291ad25723638ade5a0ff4d5f659771
[4/4] powerpc/watchdog: read TB close to where it is used
      https://git.kernel.org/powerpc/c/1f01bf90765fa5f88fbae452c131c1edf5cda7ba

cheers
