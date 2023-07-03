Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081A745523
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZsj3Ncgz3ckY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp166cnz2ywt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp14dq4z4wxn;
	Mon,  3 Jul 2023 15:52:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230606064657.183969-1-npiggin@gmail.com>
References: <20230606064657.183969-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/boot: build flags refactoring
Message-Id: <168836201884.50010.17180570432347803482.b4-ty@ellerman.id.au>
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

On Tue, 06 Jun 2023 16:46:53 +1000, Nicholas Piggin wrote:
> This is a rebase of the series here. It's no longer a fix because
> the clang build issue got a minimal fix. A couple were merged, and
> I pulled the rest of the boot specific ones into this series.
> 
> https://lore.kernel.org/linuxppc-dev/20230426055848.402993-1-npiggin@gmail.com/
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/boot: Separate target flags from BOOTCFLAGS
      https://git.kernel.org/powerpc/c/689d592e406983debe919acb87855cab0f25b7bc
[2/4] powerpc/boot: Separate CPP flags from BOOTCFLAGS
      https://git.kernel.org/powerpc/c/d1b7d40d4ffa02d59e72abf31ee2119778c6673e
[3/4] powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
      https://git.kernel.org/powerpc/c/54194a2fab4f78b96347882cf27894f76833c631
[4/4] powerpc/boot: Clean up Makefile after cflags and asflags separation
      https://git.kernel.org/powerpc/c/8bce81dbce4f3563fffca48ebfce208b1112ab09

cheers
