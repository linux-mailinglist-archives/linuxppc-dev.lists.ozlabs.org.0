Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23F474F3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:28:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGMD46Dvz3dpj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:28:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGJm29zyz308J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJm1C1bz4xhr;
 Wed, 15 Dec 2021 11:26:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <1f0ede830ccb33a659119a55cb590820c27004db.1638208156.git.christophe.leroy@csgroup.eu>
References: <1f0ede830ccb33a659119a55cb590820c27004db.1638208156.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 1/5] powerpc/inst: Refactor ___get_user_instr()
Message-Id: <163952787871.919625.8366650351098120185.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:38 +1100
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

On Mon, 29 Nov 2021 18:49:37 +0100, Christophe Leroy wrote:
> PPC64 version of ___get_user_instr() can be used for PPC32 as well,
> by simply disabling the suffix part with IS_ENABLED(CONFIG_PPC64).
> 
> 

Applied to powerpc/next.

[1/5] powerpc/inst: Refactor ___get_user_instr()
      https://git.kernel.org/powerpc/c/3261d99adba269a024d0e55737beeedec5eba00e
[2/5] powerpc/inst: Define ppc_inst_t
      https://git.kernel.org/powerpc/c/c545b9f040f341038d5228932140fb17e0c156e2
[3/5] powerpc/inst: Define ppc_inst_t as u32 on PPC32
      https://git.kernel.org/powerpc/c/07b863aef5b682a482474b524f3df4957d2862ac
[4/5] powerpc/inst: Move ppc_inst_t definition in asm/reg.h
      https://git.kernel.org/powerpc/c/9b307576f37136d37d5e42b1d8713ec34a601a62
[5/5] powerpc/inst: Optimise copy_inst_from_kernel_nofault()
      https://git.kernel.org/powerpc/c/0d76914a4c99ab5658f3fb07cdf3799d28e2eab3

cheers
