Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20F2DFB77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:25:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czxw13wJRzDqGF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxR70xStzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR66P7qz9sW9; Mon, 21 Dec 2020 22:03:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, Leonardo Bras <leobras.c@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201208215707.31149-1-leobras.c@gmail.com>
References: <20201208215707.31149-1-leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Fix mask size for emulated msgsndp
Message-Id: <160854857761.1696279.18011483882082447442.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:30 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 18:57:08 -0300, Leonardo Bras wrote:
> According to ISAv3.1 and ISAv3.0b, the msgsndp is described to split RB in:
> msgtype <- (RB) 32:36
> payload <- (RB) 37:63
> t       <- (RB) 57:63
> 
> The current way of getting 'msgtype', and 't' is missing their MSB:
> msgtype: ((arg >> 27) & 0xf) : Gets (RB) 33:36, missing bit 32
> t:       (arg &= 0x3f)       : Gets (RB) 58:63, missing bit 57
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S HV: Fix mask size for emulated msgsndp
      https://git.kernel.org/powerpc/c/87fb4978ef8f7e3d6f51ea8e259638c4e96f2fc0

cheers
