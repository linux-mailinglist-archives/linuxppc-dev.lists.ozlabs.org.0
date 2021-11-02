Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96D442D29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7WT5tLFz3gSf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7G454GGz3c5f
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G44Ylqz4xdX;
 Tue,  2 Nov 2021 22:38:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211026122531.3599918-1-npiggin@gmail.com>
References: <20211026122531.3599918-1-npiggin@gmail.com>
Subject: Re: [PATCH v1] powerpc/64s/interrupt: Fix check_return_regs_valid
 false positive
Message-Id: <163584791735.1845480.147504591640251031.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:57 +1100
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

On Tue, 26 Oct 2021 22:25:31 +1000, Nicholas Piggin wrote:
> The check_return_regs_valid can cause a false positive if the return
> regs are marked as norestart and they are an HSRR type interrupt,
> because the low bit in the bottom of regs->trap causes interrupt
> type matching to fail.
> 
> This can occcur for example on bare metal with a HV privileged doorbell
> interrupt that causes a signal, but do_signal returns early because
> get_signal() fails, and takes the "No signal to deliver" path. In this
> case no signal was delivered so the return location is not changed so
> return SRRs are not invalidated, yet set_trap_norestart is called, which
> messes up the match. Building go-1.16.6 is known to reproduce this.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/interrupt: Fix check_return_regs_valid false positive
      https://git.kernel.org/powerpc/c/4a5cb51f3db4be547225a4bce7a43d41b231382b

cheers
