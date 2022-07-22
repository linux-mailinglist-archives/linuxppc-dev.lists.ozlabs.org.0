Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B223857DD37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 11:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq3YY4jQBz3cjC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 19:10:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FSBam89I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FSBam89I;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq3Xx3J6Nz304m
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 19:09:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BFDE61EED;
	Fri, 22 Jul 2022 09:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9E2C341CE;
	Fri, 22 Jul 2022 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658480972;
	bh=QQARAL8ZRGtJnkmOAlwG2vpBW61GGATrU3fd8wEd2E8=;
	h=Date:From:To:Subject:From;
	b=FSBam89IHk8yTHAJd/n7DMeV0qmZaPp4kvWnoB7uNRhSGYYzserkXXqea0tgQ7EIr
	 orVXe7hHXRnseEA6ygiBE4FeVlBgsKUZEdoXn2Km81wxhWYHh89G3RPyDKdQErt09+
	 fn1qt+AbPGWO+6pvnpkJWc6XFSJ9bP3xt3/Wqt7QN7hZJbfa2G6VoqaP5eBBjpUtT3
	 /c8FRieKurNl+ajzEq/43SmyxuHc1nD4EaRrvlN/49LQse4vQRrLskB+h9bdUYtsEH
	 EU2hOkkdUVNEpE1za3GLh6Zd9LiAhv7VclsJAt+B+M926bd9LXiJIIVWN+GGKE9qAs
	 OFXmHSLa5SjUQ==
Received: by pali.im (Postfix)
	id 99A2920A2; Fri, 22 Jul 2022 11:09:29 +0200 (CEST)
Date: Fri, 22 Jul 2022 11:09:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220722090929.mwhmxxdd7yioxqpz@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
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

Hello!

Trying to boot mainline Linux kernel v5.15+, including current version
from master branch, on Freescale P2020 does not work. Kernel does not
print anything to serial console, seems that it does not work and after
timeout watchdog reset the board.

I run git bisect and it found following commit:

9401f4e46cf6965e23738f70e149172344a01eef is the first bad commit
commit 9401f4e46cf6965e23738f70e149172344a01eef
Author: Christophe Leroy <christophe.leroy@csgroup.eu>
Date:   Tue Mar 2 08:48:11 2021 +0000

    powerpc: Use lwarx/ldarx directly instead of PPC_LWARX/LDARX macros

    Force the eh flag at 0 on PPC32.

    Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://lore.kernel.org/r/1fc81f07cabebb875b963e295408cc3dd38c8d85.1614674882.git.christophe.leroy@csgroup.eu

:040000 040000 fe6747e45736dfcba74914a9445e5f70f5120600 96358d08b65d3200928a973efb5b969b3d45f2b0 M      arch


If I revert this commit then kernel boots correctly. It also boots fine
if I revert this commit on top of master branch.

Freescale P2020 has two 32-bit e500 powerpc cores.

Any idea why above commit is causing crash of the kernel? And why it is
needed? Could eh flag set to 0 cause deadlock?

I have looked into e500 Reference Manual for lwarx instruction (page 562)
https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf and
both 0 and 1 values for EH flag should be supported.
