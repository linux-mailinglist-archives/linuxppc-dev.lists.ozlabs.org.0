Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA3697C42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGybt17HPz3gD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRQ6XBFz3cLc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRQ5NBVz4x8G;
	Wed, 15 Feb 2023 23:43:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230121102618.2824429-1-npiggin@gmail.com>
References: <20230121102618.2824429-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: Don't recurse irq replay
Message-Id: <167646482170.1421441.403555993331285105.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:21 +1100
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

On Sat, 21 Jan 2023 20:26:18 +1000, Nicholas Piggin wrote:
> Interrupt handlers called by soft-pending irq replay code can run
> softirqs, softirq replay enables and disables local irqs, which allows
> interrupts to come in including soft-masked interrupts, and it can
> cause pending irqs to be replayed again. That makes the soft irq replay
> state machine and possible races more complicated and fragile than it
> needs to be.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Don't recurse irq replay
      https://git.kernel.org/powerpc/c/5746ca131e2496ccd5bb4d7a0244d6c38070cbf5

cheers
