Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228F52770A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JgC0h02z3ds1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZQ4CyCz3cfP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZQ3Pczz4xZ4;
 Sun, 15 May 2022 20:31:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649226186.git.christophe.leroy@csgroup.eu>
References: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649226186.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/5] powerpc/8xx: Move CPM interrupt controller into a
 dedicated file
Message-Id: <165261054465.1047019.17725531961068292233.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:29:04 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Apr 2022 08:23:17 +0200, Christophe Leroy wrote:
> CPM interrupt controller is quite standalone. Move it into a
> dedicated file. It will help for next step which will change
> it to a platform driver.
> 
> This is pure code move, checkpatch report is ignored at this point,
> except one parenthesis alignment which would remain at the end of
> the series. All other points fly away with following patches.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/8xx: Move CPM interrupt controller into a dedicated file
      https://git.kernel.org/powerpc/c/acf9e575d889eb8806be2c8451e7ad12bf444b50
[2/5] powerpc/8xx: Convert CPM1 error interrupt handler to platform driver
      https://git.kernel.org/powerpc/c/22add2a20e968291251d46d1b833b651b6aba5d7
[3/5] powerpc/8xx: Convert CPM1 interrupt controller to platform_device
      https://git.kernel.org/powerpc/c/14d893fc6846892ae68f8b259594d9cdae99e515
[4/5] powerpc/8xx: Remove mpc8xx_pics_init()
      https://git.kernel.org/powerpc/c/e3ba31b78074bee155662edccd9ca00324087e04
[5/5] powerpc/8xx: Use kmalloced data structure instead of global static
      https://git.kernel.org/powerpc/c/5ad1aa007da5f1907673a7cbfdf6e355835ef428

cheers
