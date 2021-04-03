Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953F33533F3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCFfS4Mn0z3cFX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 22:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCFds3PD4z3047
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 22:52:16 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FCFdq60Bkz9sX5; Sat,  3 Apr 2021 22:52:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, masahiroy@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8bb015bc98c51d8ced581415b7e3d157e18da7c9.1617181918.git.christophe.leroy@csgroup.eu>
References: <8bb015bc98c51d8ced581415b7e3d157e18da7c9.1617181918.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso: Make sure vdso_wrapper.o is rebuilt
 everytime vdso.so is rebuilt
Message-Id: <161745070569.936361.16001284768397289607.b4-ty@ellerman.id.au>
Date: Sat, 03 Apr 2021 22:51:45 +1100
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

On Wed, 31 Mar 2021 09:12:19 +0000 (UTC), Christophe Leroy wrote:
> Commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
> vgettimeofday.o") moved vdso32_wrapper.o and vdso64_wrapper.o out
> of arch/powerpc/kernel/vdso[32/64]/ and removed the dependencies in
> the Makefile. This leads to the wrappers not being re-build hence the
> kernel embedding the old vdso library.
> 
> Add back missing dependencies to ensure vdso32_wrapper.o and vdso64_wrapper.o
> are rebuilt when vdso32.so.dbg and vdso64.so.dbg are changed.

Applied to powerpc/fixes.

[1/1] powerpc/vdso: Make sure vdso_wrapper.o is rebuilt everytime vdso.so is rebuilt
      https://git.kernel.org/powerpc/c/791f9e36599d94af5a76d3f74d04e16326761aae

cheers
