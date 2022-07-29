Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC535850A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:16:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvShP1LT1z3f6x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ91GZ0z3cBy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ73gb6z4x1f;
	Fri, 29 Jul 2022 23:10:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20220725015619.618070-1-masahiroy@kernel.org>
References: <20220725015619.618070-1-masahiroy@kernel.org>
Subject: Re: [PATCH v2] powerpc/purgatory: Omit use of bin2c
Message-Id: <165909973721.253830.12640822046249290787.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:17 +1000
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
Cc: "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Jul 2022 10:56:19 +0900, Masahiro Yamada wrote:
> The .incbin assembler directive is much faster than bin2c + $(CC).
> 
> Do similar refactoring as in commit 4c0f032d4963 ("s390/purgatory:
> Omit use of bin2c").
> 
> Please note the .quad directive matches to size_t in C (both 8 byte)
> because the purgatory is compiled only for the 64-bit kernel.
> (KEXEC_FILE depends on PPC64).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/purgatory: Omit use of bin2c
      https://git.kernel.org/powerpc/c/9257971377e2fe6e82f41f688651a82a2f160a88

cheers
