Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4A63D241
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ5x3p9pz3gTW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:43:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqy3t30z3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqx6ywtz4xN8;
	Wed, 30 Nov 2022 20:31:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220809105425.424045-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220809105425.424045-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/ftrace: Ignore weak functions
Message-Id: <166980023046.3017288.11082860988132310643.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:50 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Aug 2022 16:24:25 +0530, Naveen N. Rao wrote:
> Extend commit b39181f7c6907d ("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to
> avoid adding weak function") to ppc32 and ppc64 -mprofile-kernel by
> defining FTRACE_MCOUNT_MAX_OFFSET.
> 
> For ppc64 -mprofile-kernel ABI, we can have two instructions at function
> entry for TOC setup followed by 'mflr r0' and 'bl _mcount'. So, the
> mcount location is at most the 4th instruction in a function. For ppc32,
> mcount location is always the 3rd instruction in a function, preceded by
> 'mflr r0' and 'stw r0,4(r1)'.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ftrace: Ignore weak functions
      https://git.kernel.org/powerpc/c/7af82ff90a2b0690c2c45818fcce4c4ac3b187f3

cheers
