Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF881745B6C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 13:44:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g7TH291r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvkbm41vtz3c2r
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 21:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g7TH291r;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvkYx2MV8z30QD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 21:42:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688384565;
	bh=7hwERyLQO07wOyVEs4ZJL+VlsGd3XcJ2f7egzuLhmAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g7TH291rihb3oAV78m2bund4L20sRE47iA09CK4HawHcO5W1KQx0UUtUqSo1fv/vQ
	 Y5VVFmKgMJjlZUQiR0kUVCo3MWYnYqo1f1J7qWX1joKMzXFKK5fjJpFS39eQteAHy2
	 Zprm4PlBWlLuY8z4RtQ60w7oBjQ2gIpCZoxidACelOGAfZ/9RHdReiLKrC8jnt/CZP
	 /yoBn+WiR69V//LblG1mdP9/LBQFjYfYAW/60243ohnMdz8IQYoUV2O+h/XImKkgUZ
	 dIQuV7TBBfiR5zSojCxDR14PBwvdGf7t6A6Wv6hYDdyfGABdB2A65vc3EjN8yDhF6M
	 wbS7enfqe8a+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvkYx0ytwz4wb1;
	Mon,  3 Jul 2023 21:42:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Pali Rohár <pali@kernel.org>
In-Reply-To: <20230505172818.18416-1-pali@kernel.org>
References: <20230505172818.18416-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node
Message-Id: <168838439191.114505.1179382602668753872.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 21:39:51 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 05 May 2023 19:28:18 +0200, Pali Rohár wrote:
> Freescale PCIe controllers on their PCIe Root Ports do not have any
> mappable PCI BAR allocate from PCIe MEM.
> 
> Information about 1MB window on BAR0 of PCIe Root Port was misleading
> because Freescale PCIe controllers have at BAR0 position different register
> PEXCSRBAR, and kernel correctly skipts BAR0 for these Freescale PCIe Root
> Ports.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node
      https://git.kernel.org/powerpc/c/abaa02fc944f2f9f2c2e1925ddaceaf35c48528c

cheers
