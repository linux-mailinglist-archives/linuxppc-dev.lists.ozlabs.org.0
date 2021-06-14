Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320FF3A7258
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:08:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nF35l37z3d7t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:08:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=UN9c83Mx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=UN9c83Mx; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9g0Ymfz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9b11Yyz9t0G; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9b0TTXz9sWM; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711939; bh=gJdE0WJ6G6wq9a5vsKIaZ7dQi1PRfMvqIisp3LX6JUw=;
 h=Date:From:To:Subject:From;
 b=UN9c83MxVIK1hve1pveQMdg8DNM9XcYXRpD3xIZhJlKyKWjM5rqWmb6qswlVYijYs
 zsV2ioXVzwj5ucMlKvT6kfu4xaHQNPlL3B0i9HMRLRM1l1l1Yn5NunGCHW+vgi/U60
 VzcU/yZGpVGNx8qec/uWXwjtRmKKjSmVyAzSDNmjNDu8pZNwkUk3L6DFMbqByYmQke
 mgSIrARPUYTSu6SIqZ6kF5YCZSRwAklxZ9FYAL0z73CSatiK5JUQJTPgDkaq7uy7Ap
 J2FtrtGbrdsD+O4oFNxLJdfYwJCjIQ91dCkLhDcxGAqZ1kcHGILOrgvu97Mq/obIGl
 hxsy6EzJlu3rQ==
Date: Tue, 15 Jun 2021 08:56:51 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 00/11] powerpc: Add support for Microwatt soft-core
Message-ID: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This series of patches adds support for the Microwatt soft-core.
Microwatt is an open-source 64-bit Power ISA processor written in VHDL
which targets medium-sized FPGAs such as the Xilinx Artix-7 or the
Lattice ECP5.  Microwatt currently implements the scalar fixed plus
floating-point subset of Power ISA v3.0B plus the radix MMU, but not
logical partitioning (i.e. it does not have hypervisor mode, the
partition table or nested radix translation).

Paul.

 arch/powerpc/Kconfig                      |   2 +-
 arch/powerpc/boot/Makefile                |   4 +
 arch/powerpc/boot/devtree.c               |  59 ++++---
 arch/powerpc/boot/dts/microwatt.dts       | 145 +++++++++++++++++
 arch/powerpc/boot/microwatt.c             |  19 +++
 arch/powerpc/boot/ns16550.c               |   9 +-
 arch/powerpc/boot/wrapper                 |   5 +
 arch/powerpc/configs/microwatt_defconfig  |  98 ++++++++++++
 arch/powerpc/include/asm/archrandom.h     |  12 +-
 arch/powerpc/include/asm/reg.h            |   1 +
 arch/powerpc/kernel/udbg_16550.c          |  39 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  13 +-
 arch/powerpc/platforms/Kconfig            |   1 +
 arch/powerpc/platforms/Makefile           |   1 +
 arch/powerpc/platforms/microwatt/Kconfig  |  13 ++
 arch/powerpc/platforms/microwatt/Makefile |   1 +
 arch/powerpc/platforms/microwatt/rng.c    |  48 ++++++
 arch/powerpc/platforms/microwatt/setup.c  |  41 +++++
 arch/powerpc/sysdev/xics/Kconfig          |   3 +
 arch/powerpc/sysdev/xics/Makefile         |   1 +
 arch/powerpc/sysdev/xics/ics-native.c     | 257 ++++++++++++++++++++++++++++++
 arch/powerpc/sysdev/xics/xics-common.c    |   2 +
 22 files changed, 741 insertions(+), 33 deletions(-)
