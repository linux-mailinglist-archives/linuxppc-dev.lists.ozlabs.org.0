Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B85F8A7B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 12:00:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlcxW4VNTz3dvx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 21:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mlcx03Vd3z3bj1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 21:00:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mlcwz2BBVz4xFv;
	Sun,  9 Oct 2022 21:00:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221004051157.308999-1-npiggin@gmail.com>
References: <20221004051157.308999-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s/interrupt: Change must-hard-mask interrupt check from BUG to WARN
Message-Id: <166530952488.1856352.3001570263015477261.b4-ty@ellerman.id.au>
Date: Sun, 09 Oct 2022 20:58:44 +1100
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
Cc: Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Oct 2022 15:11:56 +1000, Nicholas Piggin wrote:
> This new assertion added is generally harmless and gets fixed up
> naturally, but it does indicate a problem with MSR manipulation
> somewhere.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/64s/interrupt: Change must-hard-mask interrupt check from BUG to WARN
      https://git.kernel.org/powerpc/c/8154850b28bd57a35ea73a7518ffcb9ccd5e43bc
[2/2] powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
      https://git.kernel.org/powerpc/c/0fa6831811f62cfc10415d731bcf9fde2647ad81

cheers
