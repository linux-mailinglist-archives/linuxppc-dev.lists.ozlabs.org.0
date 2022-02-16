Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DE4B87B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:31:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHQ30yDSz3dnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNM4L4kz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNM68mqz4xmt;
 Wed, 16 Feb 2022 23:30:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <1e6162f334167e75f1140082932e3a354b16daba.1642413973.git.christophe.leroy@csgroup.eu>
References: <1e6162f334167e75f1140082932e3a354b16daba.1642413973.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Enable STRICT_MODULE_RWX for the 603 core
Message-Id: <164501434892.521186.15893809567759741150.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:48 +1100
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

On Mon, 17 Jan 2022 10:06:39 +0000, Christophe Leroy wrote:
> The book3s/32 MMU doesn't support per page execution protection and
> doesn't support RO protection for kernel pages.
> 
> However, on the 603 which implements software loaded TLBs, execution
> protection is honored by the TLB Miss handler which doesn't load
> Instruction TLB for non executable pages. And RO protection is
> honored by clearing the C bit for RO pages, leading to DSI.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32s: Enable STRICT_MODULE_RWX for the 603 core
      https://git.kernel.org/powerpc/c/0670010f3b10aeaad0dfdf0dad0bcd020fc70eb5

cheers
