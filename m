Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980287C989E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:08:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iUrRrh8O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bXn3y0qz3vry
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:08:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iUrRrh8O;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRG4Wj0z30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364202;
	bh=Mke0dnFejaTWMpzHUAbVKCThE3iF96U/Yymw0Fb3yp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iUrRrh8OZ8qN1e3YI4DJZERCcjPE9UYJ8jGbqoUOGEXF7jbhutAV5IuP2akhFCyMf
	 4+kYNuWprpdsy6SL6/9eQxgeR0EEoqZmmRyVonelnZthfwFErms68ZNQnKtJukAv7z
	 u5wrC1CoqNT1lPvWw2yv2VShnDIe/SK/PNHT6mhauc/4D8EeLEVYXdYy/aQokxXAzX
	 pw2IJ0fq5H9UjGeAtKi4Snnm3XvehrmwerJEZ2YergaxA//s0poMuID2w7F5Y/hKnC
	 do3QW9cUp7p6o37iS1tKHWAXsBZYUERuZWyQVdRyazl9X/c+I64gMxcyXj+lMOewMF
	 uAWjqwK0B+u+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRG1qdJz4wwG;
	Sun, 15 Oct 2023 21:03:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230921232441.1181843-1-mpe@ellerman.id.au>
References: <20230921232441.1181843-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: Fix arch_stack_walk_reliable()
Message-Id: <169736402372.957740.3532327123925195902.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, npiggin@gmail.com, live-patching@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Sep 2023 09:24:41 +1000, Michael Ellerman wrote:
> The changes to copy_thread() made in commit eed7c420aac7 ("powerpc:
> copy_thread differentiate kthreads and user mode threads") inadvertently
> broke arch_stack_walk_reliable() because it has knowledge of the stack
> layout.
> 
> Fix it by changing the condition to match the new logic in
> copy_thread(). The changes make the comments about the stack layout
> incorrect, rather than rephrasing them just refer the reader to
> copy_thread().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/stacktrace: Fix arch_stack_walk_reliable()
      https://git.kernel.org/powerpc/c/c5cc3ca707bc916a3f326364751a41f25040aef3

cheers
