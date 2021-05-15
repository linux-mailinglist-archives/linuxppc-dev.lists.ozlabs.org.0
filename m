Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E30381B86
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLB93PQwz3bt6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8V130kz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:46 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8T0XPtz9sfG; Sun, 16 May 2021 08:45:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cf0a050d124d4f426cdc7a74009d17b01d8d8969.1620465917.git.christophe.leroy@csgroup.eu>
References: <cf0a050d124d4f426cdc7a74009d17b01d8d8969.1620465917.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/uaccess: Fix __get_user() with
 CONFIG_CC_HAS_ASM_GOTO_OUTPUT
Message-Id: <162111863389.1890426.7179342188504537886.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:53 +1000
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

On Sat, 8 May 2021 09:25:32 +0000 (UTC), Christophe Leroy wrote:
> Building kernel mainline with GCC 11 leads to following failure
> when starting 'init':
> 
>   init[1]: bad frame in sys_sigreturn: 7ff5a900 nip 001083cc lr 001083c4
>   Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> This is an issue due to a segfault happening in
> __unsafe_restore_general_regs() in a loop copying registers from user
> to kernel:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/uaccess: Fix __get_user() with CONFIG_CC_HAS_ASM_GOTO_OUTPUT
      https://git.kernel.org/powerpc/c/7315e457d6bc342d06ba0b7ee498221c5237a547

cheers
