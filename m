Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F568AF10
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:45:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kzS1pSnz3fGQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:45:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvW244Sz3dwd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvS0BK1z4xyj;
	Sun,  5 Feb 2023 20:42:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230121100156.2824054-1-npiggin@gmail.com>
References: <20230121100156.2824054-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: Fix perf profiling asynchronous interrupt handlers
Message-Id: <167559010526.1647710.419514345651025158.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:45 +1100
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

On Sat, 21 Jan 2023 20:01:56 +1000, Nicholas Piggin wrote:
> Interrupt entry sets the soft mask to IRQS_ALL_DISABLED to match the
> hard irq disabled state. So when should_hard_irq_enable() returns true
> because we want PMI interrupts in irq handlers, MSR[EE] is enabled but
> PMIs just get soft-masked. Fix this by clearing IRQS_PMI_DISABLED before
> enabling MSR[EE].
> 
> This also tidies some of the warnings, no need to duplicate them in
> both should_hard_irq_enable() and do_hard_irq_enable().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64: Fix perf profiling asynchronous interrupt handlers
      https://git.kernel.org/powerpc/c/c28548012ee2bac55772ef7685138bd1124b80c3

cheers
