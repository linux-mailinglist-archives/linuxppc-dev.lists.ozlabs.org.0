Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A692D5C8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsFrL4jWVzDr0P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY20dBXzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXz72Bhz9sXf; Thu, 10 Dec 2020 22:30:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201130004404.30953-1-jniethe5@gmail.com>
References: <20201130004404.30953-1-jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
Message-Id: <160756605954.1313423.1646378330067290332.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:11 +1100 (AEDT)
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

On Mon, 30 Nov 2020 11:44:04 +1100, Jordan Niethe wrote:
> Commit 63ce271b5e37 ("powerpc/prom: convert PROM_BUG() to standard
> trap") added an EMIT_BUG_ENTRY for the trap after the branch to
> start_kernel(). The EMIT_BUG_ENTRY was for the address "0b", however the
> trap was not labeled with "0". Hence the address used for bug is in
> relative_toc() where the previous "0" label is. Label the trap as "0" so
> the correct address is used.

Applied to powerpc/next.

[1/1] powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
      https://git.kernel.org/powerpc/c/fe18a35e685c9bdabc8b11b3e19deb85a068b75d

cheers
