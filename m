Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E969A745524
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZtD648Qz3d8p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp221QSz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp20trdz4wxp;
	Mon,  3 Jul 2023 15:52:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230606064830.184083-1-npiggin@gmail.com>
References: <20230606064830.184083-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/build: Remove -pipe from compilation flags
Message-Id: <168836201884.50010.3863878974276690202.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 06 Jun 2023 16:48:30 +1000, Nicholas Piggin wrote:
> x86 removed -pipe in commit 437e88ab8f9e2 ("x86/build: Remove -pipe from
> KBUILD_CFLAGS") and the newer arm64 and riscv seem to have never used it,
> so that seems to be the way the world's going.
> 
> Compile performance building defconfig on a POWER10 PowerNV system
> was in the noise after 10 builds each. No point in adding options unless
> they help something, so remove it.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/build: Remove -pipe from compilation flags
      https://git.kernel.org/powerpc/c/f5df87b855fd835ff0f4928575adbf4f5302bb40

cheers
