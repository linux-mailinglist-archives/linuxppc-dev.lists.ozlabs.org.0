Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB911668B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 06:48:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WXKr6dVqzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WXGG0KXrzDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 16:45:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47WXGF5D4Xz9sR0; Mon,  9 Dec 2019 16:45:09 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 48e626ac85b43cc589dd1b3b8004f7f85f03544d
In-Reply-To: <20191127072035.4283-1-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] platforms/powernv: Avoid re-registration of imc
 debugfs directory
Message-Id: <47WXGF5D4Xz9sR0@ozlabs.org>
Date: Mon,  9 Dec 2019 16:45:09 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com, nasastry@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-11-27 at 07:20:35 UTC, Anju T Sudhakar wrote:
> export_imc_mode_and_cmd() function which creates the debugfs interface for
> imc-mode and imc-command, is invoked when each nest pmu units is
> registered.
> When the first nest pmu unit is registered, export_imc_mode_and_cmd()
> creates 'imc' directory under `/debug/powerpc/`. In the subsequent
> invocations debugfs_create_dir() function returns, since the directory
> already exists.
> 
> The recent commit <c33d442328f55> (debugfs: make error message a bit more
> verbose), throws a warning if we try to invoke `debugfs_create_dir()`
> with an already existing directory name.
> 
> Address this warning by making the debugfs directory registration
> in the opal_imc_counters_probe() function, i.e invoke
> export_imc_mode_and_cmd() function from the probe function.
> 
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/48e626ac85b43cc589dd1b3b8004f7f85f03544d

cheers
