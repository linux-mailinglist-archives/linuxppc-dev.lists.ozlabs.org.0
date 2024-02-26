Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E778669D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjqlg0fy8z3vdG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjqkp19hwz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:01:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tjqkl4T99z4wcT;
	Mon, 26 Feb 2024 17:01:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] powerpc: Convert to platform remove callback returning void
Message-Id: <170892700817.3915597.5848071453716874860.b4-ty@ellerman.id.au>
Date: Mon, 26 Feb 2024 16:56:48 +1100
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
Cc: Rob Herring <robh@kernel.org>, Haoran Liu <liuhaoran14@163.com>, Scott Wood <oss@buserror.net>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 16:40:14 +0100, Uwe Kleine-König wrote:
> this series converts all platform drivers below drivers/powerpc to
> struct platform_driver::remove_new(). See commit 5c5a7680e67b
> ("platform: Provide a remove callback that returns no value") for an
> extended explanation and the eventual goal.
> 
> All conversations are trivial, because their .remove() callbacks
> returned zero unconditionally.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc: sgy_cts1000: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/9d16a8591a52d614507ed76f0b105c7de7b8dbe7
[2/6] powerpc: gpio_mdio: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/b1cd248f427607e595c2799044f8166dac1e953b
[3/6] powerpc: opal-prd: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/ca899c1221b6beee80ac91977309c08b78c74ad2
[4/6] powerpc: papr_scm: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/18a4a2612ba1e54526bbc11980f1fbb31b7aa440
[5/6] powerpc: fsl_msi: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/e2064de2f3c89976a4a03f265edb5bc3795fc8ff
[6/6] powerpc: pmi: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/a3e1820186b5ed3703e690eb064ad7c6c7477cfb

cheers
