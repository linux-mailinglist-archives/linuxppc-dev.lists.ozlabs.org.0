Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20E2D5BBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:29:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsFBM3y2WzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:29:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXs5hXPzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXr3lsGz9sXZ; Thu, 10 Dec 2020 22:30:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201201144427.1228745-1-dja@axtens.net>
References: <20201201144427.1228745-1-dja@axtens.net>
Subject: Re: [PATCH] selftests/powerpc: update .gitignore
Message-Id: <160756606054.1313423.13044236173516111861.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:04 +1100 (AEDT)
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

On Wed, 2 Dec 2020 01:44:27 +1100, Daniel Axtens wrote:
> I did an in-place build of the self-tests and found that it left
> the tree dirty.
> 
> Add missed test binaries to .gitignore

Applied to powerpc/next.

[1/1] selftests/powerpc: update .gitignore
      https://git.kernel.org/powerpc/c/f0812f6ca8299e864fe0f41bd7ffdaae3ce7630e

cheers
