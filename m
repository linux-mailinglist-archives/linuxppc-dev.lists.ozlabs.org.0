Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 783FA7454F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZRX336nz3cH4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:36:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP363gVz30gy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP34pKxz4wxW;
	Mon,  3 Jul 2023 15:34:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <df36c6205ab64326fb1b991993c82057e92ace2f.1685955214.git.christophe.leroy@csgroup.eu>
References: <df36c6205ab64326fb1b991993c82057e92ace2f.1685955214.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
Message-Id: <168836201884.50010.18257455967677978392.b4-ty@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 05 Jun 2023 10:55:26 +0200, Christophe Leroy wrote:
> A disassembly of interrupt_exit_kernel_prepare() shows a useless read
> of MSR register. This is shown by r9 being re-used immediately without
> doing anything with the value read.
> 
>   c000e0e0:       60 00 00 00     nop
>   c000e0e4:       7d 3a c2 a6     mfmd_ap r9
>   c000e0e8:       7d 20 00 a6     mfmsr   r9
>   c000e0ec:       7c 51 13 a6     mtspr   81,r2
>   c000e0f0:       81 3f 00 84     lwz     r9,132(r31)
>   c000e0f4:       71 29 80 00     andi.   r9,r9,32768
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
      https://git.kernel.org/powerpc/c/0eb089a72fda3f7969e6277804bde75dc1474a14

cheers
