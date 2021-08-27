Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 959563F99BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0pd3fWPz3cH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kM5dd5z2ywJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kK4Nzfz9sWc;
 Fri, 27 Aug 2021 23:22:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com
In-Reply-To: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v3 1/3] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
Message-Id: <163007018206.52768.16263402363741709388.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:22 +1000
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

On Mon, 23 Aug 2021 08:24:20 +0000 (UTC), Christophe Leroy wrote:
> In those hot functions that are called at every interrupt, any saved
> cycle is worth it.
> 
> interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
> called from three places:
> - From entry_32.S
> - From interrupt_64.S
> - From interrupt_exit_user_restart() and interrupt_exit_kernel_restart()
> 
> [...]

Applied to powerpc/next.

[2/3] powerpc: Refactor verification of MSR_RI
      https://git.kernel.org/powerpc/c/806c0e6e7e97adc17389c8dc1f52d4736f49299b

cheers
