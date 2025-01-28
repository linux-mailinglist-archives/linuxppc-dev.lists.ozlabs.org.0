Return-Path: <linuxppc-dev+bounces-5656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE012A214A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKf5ddkz30QX;
	Wed, 29 Jan 2025 09:57:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105078;
	cv=none; b=avnnwXkP/XAUYfeMIkdpjg/pxzvitTSgsKhgVoV1tEgfVuZlbs5Uhdf6LSU2ErRODbujhTu2or/l4xZozD2W1pXUFv3kkHcWMBH75NL05z9lJqeP/MOE/JvdXkYXhFpQLyGsbBDEky7eCwSRbkVTSBoisUQBlBtHqy0JeBjBOKOn05vx4YfNNvYO12vJ91TUWtEVoxR4zpst9wwey+GD26TH0IMVefixz59WwskUnzi0cgOP2gNdYWT3bM7BqEsKo8bMdui1C5HdFBJjN19o12lzLriLQqWNE4bVKgT1+BHBFYNjpfMd0tIO7Mmxm3GOvC3aNhclSsp1Py6cF4tf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105078; c=relaxed/relaxed;
	bh=rI/5OgEQ2vtL5yCEv760Gnlek58Fk0BsLr3ntlAtEVQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQ2XUD5MhBv6X+5oBwrTlKdzjkpWQoguBqRYfrmP3H1vK5WDYGyo9iSj/U7blVZuLuDp1SAkMpSg6vxJj20KzscyCOzJpF1D2a6mq7UXpDFtGqzkXjCej1Piwgv31wDpFRHjd2yGNUe3jUkDXlfchrICO2jMx6VLnYJ2sE6zljN5+UdTob27DylRQuMx/auy8W1RkolJpyH6INfzmy7kQMOUMZ9cJrsPijOhn0Wxb52hH7zHxkCHyCDbgyz5+0X4CSZFBxUmxM9qavRIVdS5pRMn47wOcMChMzbruWMPdTz/V1Z7eoS60AIrcn1V/1/n8F9HaWu41Vmlan3MggVmtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=SR3Tniv4; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=SR3Tniv4;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKc18dvz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=rI/5OgEQ2vtL5yCEv760Gnlek58Fk0BsLr3ntlAtEVQ=;
	h=Date:From:To:Subject:From;
	b=SR3Tniv4YMny4vmREpTgP66jstwg0e+Dn9cQ0FqHSgjDtNrpDfPgS29UGCpZe6lVy
	 kt+rvedDZNx+vqa1N1xN1bEyZuGxMA+D6lNN3kyNewRDU8TJKgdj3gbTJ97rpMiU7H
	 bM/gYNYlvNvpYFq6uloxpz4gIllcHaTClZX9pszkIH33JUPAx8+9Rnr57fFVYJpM/q
	 ZwJFB+Ai4yr1M9fs+YazUeuPN0SXH5rhiBoxffGJoDznj23Gt+Hoo5zhCUiRaSE7JP
	 diPu3iGmYYfu6xe5TcnSkviuA9BfkGyL6SYKnivZQcnyUZ97uweLX0owSuWTGoFDl3
	 wJWreeX4Z7nlA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR2sKBz4x2c; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:49:49 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] Microwatt updates
Message-ID: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
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
Fixed-poin and Floating-point Subset) compliancy subset of Power ISA
version 3.1C, including prefixed instructions and the fixed-point hash
(ROP mitigation) instructions.  It is also now SMP-capable, and a
dual-core system will fit on the Arty A7-100 board.

Microwatt does not have broadcast TLB invalidations in SMP systems;
the kernel already has code to deal with this.  One of the patches in
this series provides a config option to allow platforms to select
unconditionally the behaviour where cross-CPU TLB invalidations are
handled using inter-processor interrupts.

Paul.
---
 arch/powerpc/boot/dts/microwatt.dts          | 107 +++++++++++++++++++++++----
 arch/powerpc/mm/book3s64/pgtable.c           |  10 ++-
 arch/powerpc/platforms/Kconfig.cputype       |  12 +++
 arch/powerpc/platforms/microwatt/Kconfig     |   4 +-
 arch/powerpc/platforms/microwatt/Makefile    |   1 +
 arch/powerpc/platforms/microwatt/microwatt.h |   1 +
 arch/powerpc/platforms/microwatt/setup.c     |  19 +++++
 7 files changed, 138 insertions(+), 16 deletions(-)

