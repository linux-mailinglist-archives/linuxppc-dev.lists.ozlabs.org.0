Return-Path: <linuxppc-dev+bounces-5731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F64A23989
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:30:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkmGl55C7z30Vb;
	Fri, 31 Jan 2025 17:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738305023;
	cv=none; b=XD93D3ilTO1pIRsBo427hOdYXtRVnYjUgr4XnwGaA5i/JNbGtErSdpZ0u+elpRFgohx5Rm890cqY8T/9IkL2bO/tBwnTpvyhzo7ICTEL2I+RKtud/koEmFfjmxGYVtXhw/Ui6PybPQRngDqT9HFf9NvKyAsRWn9ku1eUKvAa9PiuqSHJa3rX5dGQnxsP3m05VHNjIzmtDOqJHUWHxEV+IpwPXGDBUBKAXs4efMwMyukLYG13dL3cvajT1ZE/NPwzKASxI2bKEBOfbgOfI3FGZqs92Cu29XbN25KLk4Nc6R2/l6dVhA97hUlRxXG07z/sAO8ZvZo5dkLLLyguMKdKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738305023; c=relaxed/relaxed;
	bh=/nTeQ6BRKscUQiVug/BIsBoSy7fOq/deRVpWJxKn5Ng=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/BMrFAtEqgjzdCCeACwaK9r7MH01uHxmzAjXvPKS6v6hfZ80xer10kkT4gjPe+pFEH62m79ksGnwecyP1kNFsHsxJtQaD2Ti5pIlbL1siuwZ+dO76CZI9jxSdKs3w0pR/eqD11litHTDzBwqlKyQ8PwEvGX/gt/7w6Guf8EpwzRs3spDc7f0dQWa+a4b1RD3eXSraPOWaX3fSsOJ5t75YbQAPcY8ldrwoD5O1duzhXuwApWzIz06S3UjZKiWblTAwnD9rjHHG1i/9vaUFmTV1yGAKLGWh3IrhCZcy+Yk7y9Zxr4a94N97uAyVM6cCgQEGKs5hzMsPT5NWG1joycNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=OuXm5+T7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=OuXm5+T7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkmGk2hdkz30VN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738305012;
	bh=/nTeQ6BRKscUQiVug/BIsBoSy7fOq/deRVpWJxKn5Ng=;
	h=Date:From:To:Subject:From;
	b=OuXm5+T7VzmHQS6S0RCpiFD/Dxmj6St+YfDc7TXabgWvJqaPu51lMe31oyntKvgZ8
	 L2xFr+3Q32N2D/eqzM43ZGVBwJS6CnqA/f+0pZnnPXKsTBXMnmOCK4yTGMM7MrN42u
	 avPzFw6YmbFn3xw0xkhp+Kpz5DHSubA0ELukY9S2nxwDlGFqpCu6SN5ccIceSp6NEE
	 NF3dCv+Fgy3nho86z/B8cQj3AIye0cH6nN90NTDq5udoLR/ml/uWshiRLDfQ4lJTf/
	 +lsdzAaqiipoEYhO6XM+L1qhLz0HQNVIIroV9qhBfyxOxqA60OILflhLX0XoPTyoMW
	 tCW3ygOx6hQrA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YkmGX1qJKz4x6g; Fri, 31 Jan 2025 17:30:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 17:26:41 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] Microwatt updates
Message-ID: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch series updates the kernel support for the Microwatt
soft-core and its implementation on FPGA systems, particularly the
Digilent Arty A7-100 FPGA development board.

Microwatt now supports almost all of the features of the SFFS (Scalar
Fixed-point and Floating-point Subset) compliancy subset of Power ISA
version 3.1C, including prefixed instructions and the fixed-point hash
(ROP mitigation) instructions.  It is also now SMP-capable, and a
dual-core system will fit on the Arty A7-100 board.

Microwatt does not have broadcast TLB invalidations in SMP systems;
the kernel already has code to deal with this.  One of the patches in
this series provides a config option to allow platforms to select
unconditionally the behaviour where cross-CPU TLB invalidations are
handled using inter-processor interrupts.

Tested on an Arty A7-100 FPGA board with 2 CPUs.  Compile-tested for
pseries and powernv.

Paul.
---
v2: Address review comments

 arch/powerpc/boot/dts/microwatt.dts          | 107 +++++++++++++++++++++++----
 arch/powerpc/mm/book3s64/pgtable.c           |   4 +-
 arch/powerpc/platforms/Kconfig.cputype       |  13 ++++
 arch/powerpc/platforms/microwatt/Kconfig     |   3 +-
 arch/powerpc/platforms/microwatt/Makefile    |   1 +
 arch/powerpc/platforms/microwatt/microwatt.h |   1 +
 arch/powerpc/platforms/microwatt/setup.c     |  18 +++++
 arch/powerpc/platforms/microwatt/smp.c       |  80 ++++++++++++++++++++
 arch/powerpc/platforms/powernv/Kconfig       |   1 +
 arch/powerpc/platforms/pseries/Kconfig       |   1 +
 10 files changed, 213 insertions(+), 16 deletions(-)


