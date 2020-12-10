Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D962D5D3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:14:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGBR4nkDzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY51r6qzDqv5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY34RwFz9sdm; Thu, 10 Dec 2020 22:30:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bill Wendling <morbo@google.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201118223910.2711337-1-morbo@google.com>
References: <20201017000151.150788-1-morbo@google.com>
 <20201118223910.2711337-1-morbo@google.com>
Subject: Re: [PATCH] powerpc/wrapper: add "-z rodynamic" when using LLD
Message-Id: <160756604674.1313423.12181057246622757040.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:15 +1100 (AEDT)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Fangrui Song <maskray@google.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Nov 2020 14:39:10 -0800, Bill Wendling wrote:
> Normally all read-only sections precede SHF_WRITE sections. .dynamic and
> .got have the SHF_WRITE flag; .dynamic probably because of DT_DEBUG. LLD
> emits an error when this happens, so use "-z rodynamic" to mark .dynamic
> as read-only.

Applied to powerpc/next.

[1/1] powerpc/boot/wrapper: Add "-z rodynamic" when using LLD
      https://git.kernel.org/powerpc/c/26ba9f9651d802ba38583138f43fea5dc7eb0fd6

cheers
