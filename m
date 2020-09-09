Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4F263016
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:01:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmlb22Tr0zDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWP4HgPzDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:28:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWP01gtz9sW4; Wed,  9 Sep 2020 23:28:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
In-Reply-To: <20200828020542.393022-1-ruscur@russell.cc>
References: <20200828020542.393022-1-ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/tools: Remove 90 line limit in checkpatch script
Message-Id: <159965717409.808686.14538029470863523106.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:28:00 +1000 (AEST)
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

On Fri, 28 Aug 2020 12:05:42 +1000, Russell Currey wrote:
> As of commit bdc48fa11e46, scripts/checkpatch.pl now has a default line
> length warning of 100 characters.  The powerpc wrapper script was using
> a length of 90 instead of 80 in order to make checkpatch less
> restrictive, but now it's making it more restrictive instead.
> 
> I think it makes sense to just use the default value now.

Applied to powerpc/next.

[1/1] powerpc/tools: Remove 90 line limit in checkpatch script
      https://git.kernel.org/powerpc/c/0fb4871bcc8997acbb8edf14b301fc150101d6c0

cheers
