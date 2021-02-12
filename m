Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECF319795
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:46:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFDz1YBHzDwxW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDfC5dkMzDwnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:03 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDfC3s2Dz9sS8; Fri, 12 Feb 2021 11:20:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210208063326.331502-1-npiggin@gmail.com>
References: <20210208063326.331502-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: syscall real mode entry use mtmsrd rather
 than rfid
Message-Id: <161308903962.3606979.7125366570571003647.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:20:03 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Feb 2021 16:33:26 +1000, Nicholas Piggin wrote:
> Have the real mode system call entry handler branch to the kernel
> 0xc000... address and then use mtmsrd to enable the MMU, rather than use
> SRRs and rfid.
> 
> Commit 8729c26e675c ("powerpc/64s/exception: Move real to virt switch
> into the common handler") implemented this style of real mode entry for
> other interrupt handlers, so this brings system calls into line with
> them, which is the main motivcation for the change.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: syscall real mode entry use mtmsrd rather than rfid
      https://git.kernel.org/powerpc/c/14ad0e7d04f46865775fb010ccd96fb1cc83433a

cheers
