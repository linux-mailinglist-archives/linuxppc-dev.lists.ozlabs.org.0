Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AF5F447D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf596v7sz3fGj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1N0st1z3blt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1M6kBdz4xGw;
	Wed,  5 Oct 2022 00:38:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <ae6aa7fce84f7abcbf67f534271a4a6dd7949b0d.1662543243.git.christophe.leroy@csgroup.eu>
References: <ae6aa7fce84f7abcbf67f534271a4a6dd7949b0d.1662543243.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/nohash: Remove pgd_huge() stub
Message-Id: <166488985737.779920.8762393003008837052.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:17 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Sep 2022 11:34:44 +0200, Christophe Leroy wrote:
> linux/hugetlb.h has a fallback pgd_huge() macro for when
> pgd_huge is not defined.
> 
> Remove the powerpc redundant definitions.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/nohash: Remove pgd_huge() stub
      https://git.kernel.org/powerpc/c/a26494cf4aeb8e9888428a43f55cc486f06f1334
[2/2] powerpc: Rely on generic definition of hugepd_t and is_hugepd when unused
      https://git.kernel.org/powerpc/c/691cdf016d3be6f66a3ea384809be229e0f9c590

cheers
