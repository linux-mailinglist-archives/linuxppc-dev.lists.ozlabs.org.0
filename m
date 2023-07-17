Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98A7558E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 02:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R434F0wVXz3cXv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R432B1rx7z3072
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:32:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R43273089z4wxm;
	Mon, 17 Jul 2023 10:32:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230622112451.735268-1-mpe@ellerman.id.au>
References: <20230622112451.735268-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64e: Fix obtool warnings in exceptions-64e.S
Message-Id: <168955377881.195506.7833765420653688598.b4-ty@ellerman.id.au>
Date: Mon, 17 Jul 2023 10:29:38 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Jun 2023 21:24:51 +1000, Michael Ellerman wrote:
> Since commit aec0ba7472a7 ("powerpc/64: Use -mprofile-kernel for big
> endian ELFv2 kernels"), this file is checked by objtool. Fix warnings
> such as:
> 
>   arch/powerpc/kernel/idle_64e.o: warning: objtool: .text+0x20: unannotated intra-function call
>   arch/powerpc/kernel/exceptions-64e.o: warning: objtool: .text+0x218: unannotated intra-function call
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64e: Fix obtool warnings in exceptions-64e.S
      https://git.kernel.org/powerpc/c/cf65b12c17b4910d099d78f6ed6919ec040ecdbc

cheers
