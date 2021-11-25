Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DB45D89C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 12:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0FLS3qN4z3cBq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 22:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0FL11lYxz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 22:01:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0FKz74jxz4xZ5;
 Thu, 25 Nov 2021 22:01:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211125103346.1188958-1-npiggin@gmail.com>
References: <20211125103346.1188958-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
Message-Id: <163783805597.1241708.15463973399995983176.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 22:00:55 +1100
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

On Thu, 25 Nov 2021 20:33:46 +1000, Nicholas Piggin wrote:
> wd_smp_last_reset_tb now gets reset by watchdog_smp_panic() as part of
> marking CPUs stuck and removing them from the pending mask before it
> begins any printing. This causes last reset times reported to be off.
> 
> Fix this by reading it into a local variable before it gets reset.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
      https://git.kernel.org/powerpc/c/3d030e301856da366380b3865fce6c03037b08a6

cheers
