Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA94E1FBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 06:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMMzt4wsgz30RN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMMzW1dNGz306r
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 16:06:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMMzS5x0Sz4xXV;
 Mon, 21 Mar 2022 16:06:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220124143930.3923442-1-npiggin@gmail.com>
References: <20220124143930.3923442-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64s/interrupt: Fix decrementer storm
Message-Id: <164783915433.1783931.15144105177430156080.b4-ty@ellerman.id.au>
Date: Mon, 21 Mar 2022 16:05:54 +1100
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Jan 2022 00:39:28 +1000, Nicholas Piggin wrote:
> The decrementer exception can fail to be cleared when the interrupt
> returns in the case where the decrementer wraps with the next timer
> still beyond decrementer_max. This results in a decrementer interrupt
> storm. This is triggerable with small decrementer system with hard
> and soft watchdogs disabled.
> 
> Fix this by always programming the decrementer if there was no timer.
> 
> [...]

Patch 2 & 3 applied to powerpc/next.

[2/3] powerpc/time: Fix KVM host re-arming a timer beyond decrementer range
      https://git.kernel.org/powerpc/c/cf74ff52e352112be78c4c4c3637a37ec36a6608
[3/3] powerpc/time: improve decrementer clockevent processing
      https://git.kernel.org/powerpc/c/35de589cb8793573ed56a915af9cb4b5f15ad7d7

cheers
