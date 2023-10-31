Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 193617DCFC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 15:56:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jog2dxcM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKYBX6yd1z3c5H
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 01:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jog2dxcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKY9g1XVrz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 01:56:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA2C2CE09EC;
	Tue, 31 Oct 2023 14:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EF5C433C7;
	Tue, 31 Oct 2023 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698764162;
	bh=Cxdgq83jiMoJ70NysJNU4kcpJnjm2mFKYjiQrvsOqUQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Jog2dxcMmGGGRASrapDOhOj8zcOAieXrt9M+dygNz7EEFwueTaWid3idU+e4dvxSS
	 t1f3nvl2Xw/eDzoVtpUWnuRZsugYFVvFiXd7LhhFiJjbo5w3uZ8erqzsbZGA8i2hfZ
	 irEX+TgbAk6CmRjYTxjsoFZ1kTYwoGd55+uaLinwBYIj2Q8SQqAUBI2N93hIRyulpw
	 mkSQ8QtRFnyTjHF2Wzf3qNdgwT+GjCUfPZssWyEpD28aTw2tD/fM4PWNLWfygZUgpr
	 bKIiavOsnkyE1cb0yoF3pZdMva1irDxt+WcHoLWdfZfTCb6ALlcGiCRkSwS/MO5yjD
	 WG4cRXU75oC9Q==
Date: Tue, 31 Oct 2023 09:56:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [pci:controller/xilinx-xdma] BUILD REGRESSION
 8d786149d78c7784144c7179e25134b6530b714b
Message-ID: <20231031145600.GA9161@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310282050.Y5D8ZPCw-lkp@intel.com>
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
Cc: linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc powerpc, clang folks]

On Sat, Oct 28, 2023 at 08:22:54PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/xilinx-xdma
> branch HEAD: 8d786149d78c7784144c7179e25134b6530b714b  PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver
> 
> Error/Warning ids grouped by kconfigs:
> 
> clang_recent_errors
> `-- powerpc-pmac32_defconfig
>     |-- arch-powerpc-sysdev-grackle.c:error:unused-function-grackle_set_stg-Werror-Wunused-function
>     |-- arch-powerpc-xmon-xmon.c:error:unused-function-get_output_lock-Werror-Wunused-function
>     `-- arch-powerpc-xmon-xmon.c:error:unused-function-release_output_lock-Werror-Wunused-function

This report is close to useless.  It doesn't show the complete error
message, it doesn't show how to reproduce the issue, and the pci -next
branch (including controller/xilinx-xdma) doesn't reference any of
these functions:

  $ git grep -E "grackle_set_stg|get_output_lock|release_output_lock" | cat
  arch/powerpc/sysdev/grackle.c:static inline void grackle_set_stg(struct pci_controller* bp, int enable)
  arch/powerpc/sysdev/grackle.c:	grackle_set_stg(hose, 1);
  arch/powerpc/xmon/xmon.c:static void get_output_lock(void)
  arch/powerpc/xmon/xmon.c:static void release_output_lock(void)
  arch/powerpc/xmon/xmon.c:static inline void get_output_lock(void) {}
  arch/powerpc/xmon/xmon.c:static inline void release_output_lock(void) {}
  arch/powerpc/xmon/xmon.c:		get_output_lock();
  arch/powerpc/xmon/xmon.c:		release_output_lock();
  arch/powerpc/xmon/xmon.c:			get_output_lock();
  arch/powerpc/xmon/xmon.c:			release_output_lock();
  arch/powerpc/xmon/xmon.c:		get_output_lock();
  arch/powerpc/xmon/xmon.c:		release_output_lock();
  arch/powerpc/xmon/xmon.c:		get_output_lock();
  arch/powerpc/xmon/xmon.c:		release_output_lock();

That said, the unused functions do look legit:

grackle_set_stg() is a static function and the only call is under
"#if 0".

Same with get_output_lock() and release_output_lock(): they're static
and always defined in xmon.c, but only called if either CONFIG_SMP or
CONFIG_DEBUG_FS.

But they're certainly not related to controller/xilinx-xdma, so I'm
going to ignore them.

Bjorn

P.S. Nathan & Nick, I cc'd you because of this earlier report that
also mentioned grackle_set_stg():
https://lore.kernel.org/lkml/202308121120.u2d3YPVt-lkp@intel.com/
