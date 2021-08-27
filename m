Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1B3F99B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0mv5DjRz3dY9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kB1Lvnz2ypP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0k94crDz9ssD;
 Fri, 27 Aug 2021 23:22:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <6457eb4f327313323ed1f70e540bbb4ddc9178fa.1629701106.git.christophe.leroy@csgroup.eu>
References: <6457eb4f327313323ed1f70e540bbb4ddc9178fa.1629701106.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/syscalls: Remove __NR__exit
Message-Id: <163007015022.52768.8922934112571254736.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:50 +1000
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

On Mon, 23 Aug 2021 06:45:20 +0000 (UTC), Christophe Leroy wrote:
> __NR_exit is nowhere used. On most architectures it was removed by
> commit 135ab6ec8fda ("[PATCH] remove remaining errno and
> __KERNEL_SYSCALLS__ references") but not on powerpc.
> 
> powerpc removed __KERNEL_SYSCALLS__ in commit 3db03b4afb3e ("[PATCH]
> rename the provided execve functions to kernel_execve"), but __NR_exit
> was left over.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/syscalls: Remove __NR__exit
      https://git.kernel.org/powerpc/c/a00ea5b6f2bbef8b004b0b7228c61680a50c7c3f

cheers
