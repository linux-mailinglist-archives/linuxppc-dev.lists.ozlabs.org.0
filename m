Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F849295D5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmSV62wLz3g1F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ31tSSz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ26BRRz4xPc;
	Sun,  7 Jul 2024 09:12:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
References: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
Message-Id: <172030740413.964765.4617244559617362750.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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
Cc: Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 May 2024 19:44:12 -0500, Nathan Lynch wrote:
> Smatch warns:
> 
>   arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
>   spectre issue 'args.args' [r] (local cap)
> 
> The 'nargs' and 'nret' locals come directly from a user-supplied
> buffer and are used as indexes into a small stack-based array and as
> inputs to copy_to_user() after they are subject to bounds checks.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
      https://git.kernel.org/powerpc/c/0974d03eb479384466d828d65637814bee6b26d7

cheers
