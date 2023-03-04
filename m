Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043E6AA933
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 11:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTLrz1gn7z3fST
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 21:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTLqr2PFvz3bVD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 21:36:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PTLqp0J0Xz4x5R;
	Sat,  4 Mar 2023 21:36:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230221130331.2714199-1-mpe@ellerman.id.au>
References: <20230221130331.2714199-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Avoid dead code/data elimination when using recordmcount
Message-Id: <167792619787.383795.11115043565491314467.b4-ty@ellerman.id.au>
Date: Sat, 04 Mar 2023 21:36:37 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Feb 2023 00:03:31 +1100, Michael Ellerman wrote:
> Although powerpc now has objtool mcount support, it's not enabled in all
> configurations due to dependencies.
> 
> On those configurations, with some linkers (binutils 2.37 at least),
> it's still possible to hit the dreaded "recordmcount bug", eg. errors
> such as:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Avoid dead code/data elimination when using recordmcount
      https://git.kernel.org/powerpc/c/f8b2336f15f3bc30e37ce5c052cde5b6319bb6df

cheers
