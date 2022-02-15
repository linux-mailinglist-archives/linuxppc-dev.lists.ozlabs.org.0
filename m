Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12164B62D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV8T2bmgz3dtk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV683d6Lz3cP5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV685GSvz4y45;
 Tue, 15 Feb 2022 16:30:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <bbb13848ff0100a76ee9ea95118058c30ae95f2c.1643613343.git.christophe.leroy@csgroup.eu>
References: <bbb13848ff0100a76ee9ea95118058c30ae95f2c.1643613343.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/603: Clear C bit when PTE is read only
Message-Id: <164490280429.270256.7360085115220568003.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:44 +1100
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

On Mon, 31 Jan 2022 07:17:57 +0000, Christophe Leroy wrote:
> On book3s/32 MMU, PP bits don't offer kernel RO protection,
> kernel pages are always RW.
> 
> However, on the 603 a page fault is always generated when the
> C bit (change bit = dirty bit) is not set.
> 
> Enforce kernel RO protection by clearing C bit in TLB miss
> handler when the page doesn't have _PAGE_RW flag.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/603: Clear C bit when PTE is read only
      https://git.kernel.org/powerpc/c/4634bf4455fe26f07dabf97c3585c9ccb86353c4

cheers
