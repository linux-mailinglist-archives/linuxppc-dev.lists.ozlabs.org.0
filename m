Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7D7857B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4rY1Gt6z3dSb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cs6rMlz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cs31yXz4x2n;
	Wed, 23 Aug 2023 22:03:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b8d6ae4483fcfd17524e79d803c969694a85cc02.1687428075.git.christophe.leroy@csgroup.eu>
References: <b8d6ae4483fcfd17524e79d803c969694a85cc02.1687428075.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/ptrace: Split gpr32_set_common
Message-Id: <169279175565.797584.14665256369695357987.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Jun 2023 12:01:23 +0200, Christophe Leroy wrote:
> objtool report the following warning:
> 
>   arch/powerpc/kernel/ptrace/ptrace-view.o: warning: objtool:
>     gpr32_set_common+0x23c (.text+0x860): redundant UACCESS disable
> 
> gpr32_set_common() conditionnaly opens and closes UACCESS based on
> whether kbuf point is NULL or not. This is wackelig.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptrace: Split gpr32_set_common
      https://git.kernel.org/powerpc/c/9a32584bc108c8fe4d02fa33b16caf686e4a788a

cheers
