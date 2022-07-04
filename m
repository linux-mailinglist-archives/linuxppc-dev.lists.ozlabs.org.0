Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABB5653F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3qz2ZGzz3gks
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3ff4sGPz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fc6HvKz4ySS;
	Mon,  4 Jul 2022 21:36:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rob Herring <robh+dt@kernel.org>, Pali Rohár <pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220624085550.20570-1-pali@kernel.org>
References: <20220511143712.22550-1-pali@kernel.org> <20220624085550.20570-1-pali@kernel.org>
Subject: Re: [PATCH v2] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
Message-Id: <165693444903.9954.14449281887878429329.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:34:09 +1000
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
Cc: devicetree@vger.kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Marek Behun <marek.behun@nic.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jun 2022 10:55:50 +0200, Pali Rohár wrote:
> CZ.NIC Turris 1.0 and 1.1 are open source routers, they have dual-core
> PowerPC Freescale P2020 CPU and are based on Freescale P2020RDB-PC-A board.
> Hardware design is fully open source, all firmware and hardware design
> files are available at Turris project website:
> 
> https://docs.turris.cz/hw/turris-1x/turris-1x/
> https://project.turris.cz/en/hardware.html
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
      https://git.kernel.org/powerpc/c/54c15ec3b738c6086f2be001dae962ec412640e5

cheers
