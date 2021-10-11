Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C5428CAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HScyS4W8Qz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:08:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxf2q63z2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:07:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxd5hktz4xbc;
 Mon, 11 Oct 2021 23:07:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <aa6055769b92a5d8685b8d0adab99c48a0b0ef4b.1631956926.git.christophe.leroy@csgroup.eu>
References: <aa6055769b92a5d8685b8d0adab99c48a0b0ef4b.1631956926.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/476: Fix sparse report
Message-Id: <163395399612.4094789.12159474891179171395.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:36 +1100
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 18 Sep 2021 11:22:32 +0200, Christophe Leroy wrote:
> 	arch/powerpc/platforms/44x/ppc476.c:236:17: warning: cast removes address space '__iomem' of expression
> 	arch/powerpc/platforms/44x/ppc476.c:241:34: warning: incorrect type in argument 1 (different address spaces)
> 	arch/powerpc/platforms/44x/ppc476.c:241:34:    expected void const volatile [noderef] __iomem *addr
> 	arch/powerpc/platforms/44x/ppc476.c:241:34:    got unsigned char [usertype] *
> 	arch/powerpc/platforms/44x/ppc476.c:243:17: warning: incorrect type in argument 1 (different address spaces)
> 	arch/powerpc/platforms/44x/ppc476.c:243:17:    expected void volatile [noderef] __iomem *addr
> 	arch/powerpc/platforms/44x/ppc476.c:243:17:    got unsigned char [usertype] *[assigned] fpga
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/476: Fix sparse report
      https://git.kernel.org/powerpc/c/494f238a3861863d908af7b98a369f6d8a986c85

cheers
