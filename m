Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECF3F99AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:23:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0m26Twkz3cX3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:23:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0k80cTLz2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0k16fKwz9sWl;
 Fri, 27 Aug 2021 23:22:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <91b1d242525307ceceec7ef6e832bfbacdd4501b.1629436472.git.christophe.leroy@csgroup.eu>
References: <91b1d242525307ceceec7ef6e832bfbacdd4501b.1629436472.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: indirect function call use bctrl rather than
 blrl in ret_from_kernel_thread
Message-Id: <163007015584.52768.11072289865515594442.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:55 +1000
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

On Fri, 20 Aug 2021 05:16:05 +0000 (UTC), Christophe Leroy wrote:
> Copied from commit 89bbe4c798bc ("powerpc/64: indirect function call
> use bctrl rather than blrl in ret_from_kernel_thread")
> 
> blrl is not recommended to use as an indirect function call, as it may
> corrupt the link stack predictor.
> 
> This is not a performance critical path but this should be fixed for
> consistency.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: indirect function call use bctrl rather than blrl in ret_from_kernel_thread
      https://git.kernel.org/powerpc/c/113ec9ccc8049c3772f0eab46b62c5d6654c09f7

cheers
