Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1155276FA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1Jbl3RqPz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZJ06mFz3cFx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZH6CDzz4xYY;
 Sun, 15 May 2022 20:31:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <d2610043419ce3e0e53a85386baf2c3625af5cfb.1647877442.git.christophe.leroy@csgroup.eu>
References: <d2610043419ce3e0e53a85386baf2c3625af5cfb.1647877442.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Simplify flush_tlb_kernel_range()
Message-Id: <165261053042.1047019.17331367437728392692.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:50 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Mar 2022 16:44:18 +0100, Christophe Leroy wrote:
> In the same spirit as commit 63f501e07a85 ("powerpc/8xx: Simplify TLB
> handling"), simplify flush_tlb_kernel_range() for 8xx.
> 
> 8xx cannot be SMP, and has 'tlbie' and 'tlbia' instructions, so
> an inline version of flush_tlb_kernel_range() for 8xx is worth it.
> 
> With this page, first leg of change_page_attr() is:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Simplify flush_tlb_kernel_range()
      https://git.kernel.org/powerpc/c/9290c379d19774d8de6e2b895d756004dbad9ce5

cheers
