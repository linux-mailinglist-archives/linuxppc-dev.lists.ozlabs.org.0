Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4760808846
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:47:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDZM2g14z3dDp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVp62Vcz3dDp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVp4w1Gz4xPf;
	Thu,  7 Dec 2023 23:44:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231129131919.2528517-1-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/5] powerpc/suspend: Add prototype for do_after_copyback()
Message-Id: <170195271166.2310221.15576290190918769105.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Nov 2023 00:19:15 +1100, Michael Ellerman wrote:
> With HIBERNATION=y the build breaks with:
> 
>   arch/powerpc/kernel/swsusp_64.c:14:6: error: no previous prototype for ‘do_after_copyback’ [-Werror=missing-prototypes]
>   14 | void do_after_copyback(void)
>      |      ^~~~~~~~~~~~~~~~~
> 
> do_after_copyback() is only called from asm, so there is no prototype,
> nor any header where it makes sense to place one. Just add a prototype
> in the C file to fix the build error.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/suspend: Add prototype for do_after_copyback()
      https://git.kernel.org/powerpc/c/360f051d82ee0cc580edfffe9e8c0b93011ab86d
[2/5] powerpc/512x: Make pdm360ng_init() static
      https://git.kernel.org/powerpc/c/24afc61990de29dd47be7642c196a173f6cc21fc
[3/5] powerpc/512x: Fix missing prototype warnings
      https://git.kernel.org/powerpc/c/10feb8f9612239b665815807e950bcd999a75dd2
[4/5] powerpc/44x: Make ppc44x_idle_init() static
      https://git.kernel.org/powerpc/c/b90ad501715f2feb1b0bf97aa700adb39c78deb3
[5/5] powerpc/64s: Fix CONFIG_NUMA=n build
      https://git.kernel.org/powerpc/c/ede66cd22441820cbd399936bf84fdc4294bc7fa

cheers
