Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA404B62CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV7d0j76z3cQs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV654ks0z3bPP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6454LFz4y3t;
 Tue, 15 Feb 2022 16:30:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chen Jingwen <chenjingwen6@huawei.com>, kasan-dev <kasan-dev@googlegroups.com>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>
In-Reply-To: <20211229035226.59159-1-chenjingwen6@huawei.com>
References: <20211229035226.59159-1-chenjingwen6@huawei.com>
Subject: Re: [PATCH] powerpc/kasan: Fix early region not updated correctly
Message-Id: <164490280217.270256.12753879562641501185.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:42 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Dec 2021 11:52:26 +0800, Chen Jingwen wrote:
> The shadow's page table is not updated when PTE_RPN_SHIFT is 24
> and PAGE_SHIFT is 12. It not only causes false positives but
> also false negative as shown the following text.
> 
> Fix it by bringing the logic of kasan_early_shadow_page_entry here.
> 
> 1. False Positive:
> ==================================================================
> BUG: KASAN: vmalloc-out-of-bounds in pcpu_alloc+0x508/0xa50
> Write of size 16 at addr f57f3be0 by task swapper/0/1
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kasan: Fix early region not updated correctly
      https://git.kernel.org/powerpc/c/dd75080aa8409ce10d50fb58981c6b59bf8707d3

cheers
