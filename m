Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED184FADD6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 14:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbrqm2Fp3z3bcy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 22:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbrqN55M0z2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:28:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbrqM5B0Fz4xL4;
 Sun, 10 Apr 2022 22:27:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <89cf27bf43ee07a0b2879b9e8e2f5cd6386a3645.1648366338.git.christophe.leroy@csgroup.eu>
References: <89cf27bf43ee07a0b2879b9e8e2f5cd6386a3645.1648366338.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64: Fix build failure with allyesconfig in
 book3s_64_entry.S
Message-Id: <164959362678.1306388.2413338700188573457.b4-ty@ellerman.id.au>
Date: Sun, 10 Apr 2022 22:27:06 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 27 Mar 2022 09:32:26 +0200, Christophe Leroy wrote:
> Using conditional branches between two files is hasardous,
> they may get linked to far from each other.
> 
> 	arch/powerpc/kvm/book3s_64_entry.o:(.text+0x3ec): relocation truncated
> 	to fit: R_PPC64_REL14 (stub) against symbol `system_reset_common'
> 	defined in .text section in arch/powerpc/kernel/head_64.o
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S
      https://git.kernel.org/powerpc/c/af41d2866f7d75bbb38d487f6ec7770425d70e45

cheers
