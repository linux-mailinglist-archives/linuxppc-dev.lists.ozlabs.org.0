Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F03AC1AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lSn1BPxz3dsS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:55:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=GOndNqBA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=GOndNqBA; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lMP1CkJz3bx3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5lML0yvYz9sf8; Fri, 18 Jun 2021 13:50:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5lML0FS1z9sXL; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623988254; bh=kXsKNRX3WJuXQNt4gey7cARtXl6yCLPvt7gcgtOcRUM=;
 h=Date:From:To:Subject:From;
 b=GOndNqBAj7LleSVO60tByCc3VlgciPstuSMnhkosFPl368tQzh5VG8W1e6S94PLag
 aLXDmlrX1BDEQ+cGBVbhDeqauT5Rx+PBUpHMDlbNVYyJhRoQGUBklmdOi4lOlSgjnP
 FhBZUouiXNQRKIvLSqmePtDM5o374NhfVJm5naRRmYfq1inN03iItVB4l7CFJUlFZf
 FYcn6xoy4BQLBkYWaDexAA10+bp2AB49VjSlFnMzxpoacr+WFS74ArGNxraT1EpB6S
 V5ChkUGnyP0P4o5ucaWMyZbzFLpPIm5pcYgFbYdMwIs2RlE+vUR9KDmCs4eiNxjx7x
 bgJnXIQs12xKg==
Date: Fri, 18 Jun 2021 13:42:53 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 0/9] powerpc: Add support for Microwatt soft-core
Message-ID: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
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
logical partitioning (i.e. it does not have hypervisor mode or nested
radix translation).

Changes in v2:

- Dropped the patch that adds support for the PRTBL register, since it
  is not architected.  Instead, I have added support for a 1-entry
  partition table to Microwatt and implemented the PTCR register.

- Updated the device tree.

- Dropped the change to archrandom.h.

- Combined patches 10 and 11 of the previous series into one.

Paul.

 arch/powerpc/Kconfig                      |   2 +-
 arch/powerpc/boot/Makefile                |   4 +
 arch/powerpc/boot/devtree.c               |  59 ++++---
 arch/powerpc/boot/dts/microwatt.dts       | 138 ++++++++++++++++
 arch/powerpc/boot/microwatt.c             |  24 +++
 arch/powerpc/boot/ns16550.c               |   9 +-
 arch/powerpc/boot/wrapper                 |   5 +
 arch/powerpc/configs/microwatt_defconfig  |  98 ++++++++++++
 arch/powerpc/kernel/udbg_16550.c          |  39 +++++
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
 19 files changed, 718 insertions(+), 28 deletions(-)
