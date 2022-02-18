Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5C4BAF9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Fry4NXYz3cPg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 13:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0FrY0jZ8z3bV4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 13:24:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K0FrX2PKXz4xZq;
 Fri, 18 Feb 2022 13:24:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>, mpe@ellerman.id.au
In-Reply-To: <20220211005113.1361436-1-anders.roxell@linaro.org>
References: <20220211005113.1361436-1-anders.roxell@linaro.org>
Subject: Re: [PATCHv2] powerpc/lib/sstep: fix 'ptesync' build error
Message-Id: <164515104019.912400.12978382532397324353.b4-ty@ellerman.id.au>
Date: Fri, 18 Feb 2022 13:24:00 +1100
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Feb 2022 01:51:13 +0100, Anders Roxell wrote:
> Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
> 2.37.90.20220207) the following build error shows up:
> 
> {standard input}: Assembler messages:
> {standard input}:2088: Error: unrecognized opcode: `ptesync'
> make[3]: *** [/builds/linux/scripts/Makefile.build:287: arch/powerpc/lib/sstep.o] Error 1
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/lib/sstep: fix 'ptesync' build error
      https://git.kernel.org/powerpc/c/fe663df7825811358531dc2e8a52d9eaa5e3515e

cheers
