Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3862CEDE1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 13:15:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnWr14cZ4zDrhS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 23:15:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnWTw27FYzDrQd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 22:59:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CnWTs3gD5z9sWn; Fri,  4 Dec 2020 22:59:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/8] powerpc/64s: fix and improve machine check handling
Message-Id: <160708314571.99163.1566766431664408141.b4-ty@ellerman.id.au>
Date: Fri,  4 Dec 2020 22:59:45 +1100 (AEDT)
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 28 Nov 2020 17:07:20 +1000, Nicholas Piggin wrote:
> First patch is a nasty memory scribble introduced by me :( That
> should go into fixes.
> 
> The next ones could wait for next merge window. They get things to the
> point where misbehaving or buggy guest isn't so painful for the host,
> and also get the guest SLB dumping code working (because the host no
> longer clears them before delivering the MCE to the guest).
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/8] powerpc/64s/powernv: Fix memory corruption when saving SLB entries on MCE
      https://git.kernel.org/powerpc/c/a1ee28117077c3bf24e5ab6324c835eaab629c45

cheers
