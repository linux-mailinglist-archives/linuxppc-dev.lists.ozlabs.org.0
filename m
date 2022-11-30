Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131ED63D265
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZCC6pG4z3fSN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:48:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYth6c2Nz3fQC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtg6NjXz4xV1;
	Wed, 30 Nov 2022 20:34:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20221010165721.106267e6@canb.auug.org.au>
References: <20221010165721.106267e6@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: suppress some linker warnings in recent linker versions
Message-Id: <166980024734.3017288.12071068399388319871.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:07 +1100
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Oct 2022 16:57:21 +1100, Stephen Rothwell wrote:
> This is a follow on from commit
> 
>   0d362be5b142 ("Makefile: link with -z noexecstack --no-warn-rwx-segments")
> 
> for arch/powerpc/boot to address wanrings like:
> 
>   ld: warning: opal-calls.o: missing .note.GNU-stack section implies executable stack
>   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>   ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: suppress some linker warnings in recent linker versions
      https://git.kernel.org/powerpc/c/579aee9fc594af94c242068c011b0233563d4bbf

cheers
