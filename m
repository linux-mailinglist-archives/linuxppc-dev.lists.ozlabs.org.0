Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA82DAB6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:52:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFTb41YRzDqMt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:52:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP235cqzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP22ZPnz9sS8; Tue, 15 Dec 2020 21:48:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1606289215-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606289215-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Exclude kernel samples while counting
 events in user space.
Message-Id: <160802921142.504444.13858621470495661057.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:54 +1100 (AEDT)
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 02:26:55 -0500, Athira Rajeev wrote:
> Perf event attritube supports exclude_kernel flag
> to avoid sampling/profiling in supervisor state (kernel).
> Based on this event attr flag, Monitor Mode Control Register
> bit is set to freeze on supervisor state. But sometime (due
> to hardware limitation), Sampled Instruction Address
> Register (SIAR) locks on to kernel address even when
> freeze on supervisor is set. Patch here adds a check to
> drop those samples.

Applied to powerpc/next.

[1/1] powerpc/perf: Exclude kernel samples while counting events in user space.
      https://git.kernel.org/powerpc/c/aa8e21c053d72b6639ea5a7f1d3a1d0209534c94

cheers
