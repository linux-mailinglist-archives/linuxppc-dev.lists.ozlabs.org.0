Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B380A6EF42C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:19:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5ybM4rv2z3ghd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:19:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5ySb6tkWz3fkS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:13:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5ySb5TYfz4xD5;
	Wed, 26 Apr 2023 22:13:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
Subject: Re: [PATCH 0/8] RTAS changes for 6.4
Message-Id: <168251115562.3983444.8929118170063820811.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:12:35 +1000
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 06 Mar 2023 15:33:39 -0600, Nathan Lynch wrote:
> Proposed changes for the RTAS subsystem and client code.
> 
> Fixes that are subject to backporting are at the front of the queue,
> followed by documentation and cleanups, with enhancements at the end.
> 
> Noteworthy changes:
> * Change sys_rtas() to consume -2/990x statuses instead of returning
>   them to user space.
> * Lockdep annotations for invariants in rtas.c.
> 
> [...]

Patches 1-4, 6 applied to powerpc/next.

[1/8] powerpc/rtas: ensure 8-byte alignment for struct rtas_args
      https://git.kernel.org/powerpc/c/f40b0f6c5c27de167fdd10e541e0a4b5f2bc772b
[2/8] powerpc/rtas: use memmove for potentially overlapping buffer copy
      https://git.kernel.org/powerpc/c/271208ee5e335cb1ad280d22784940daf7ddf820
[3/8] powerpc/rtas: rtas_call_unlocked() kerneldoc
      https://git.kernel.org/powerpc/c/1792e46ed0cfc1fa27c8c805f8098f806bcc5fc3
[4/8] powerpc/rtas: fix miswording in rtas_function kerneldoc
      https://git.kernel.org/powerpc/c/32740fce09f98d30f3c71a09ee4e9d90b3965427
[6/8] powerpc/rtas: lockdep annotations
      https://git.kernel.org/powerpc/c/af8bc68263b2184e63ee67ca70cecff4636f7901

cheers
