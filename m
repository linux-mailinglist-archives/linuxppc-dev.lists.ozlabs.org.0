Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDF3B3CA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6SD4qVNz3bw0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6RT6r6Hz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:37 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RS27fxz9sXL; Fri, 25 Jun 2021 16:24:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210622133923.295373-1-danielhb413@gmail.com>
References: <20210622133923.295373-1-danielhb413@gmail.com>
Subject: Re: [PATCH 0/3] powerpc/pseries: cleanups for dlpar_memory_add*
 functions
Message-Id: <162460208979.3247425.13730421208257445234.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:29 +1000
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

On Tue, 22 Jun 2021 10:39:20 -0300, Daniel Henrique Barboza wrote:
> These are a couple of cleanups for the dlpar_memory_add* functions
> that are similar to those I did a month or so ago in
> dlpar_memory_remove_by_count and dlpar_memory_remove_by_ic.
> 
> 
> 
> Daniel Henrique Barboza (3):
>   powerpc/pseries: skip reserved LMBs in dlpar_memory_add_by_count()
>   powerpc/pseries: break early in dlpar_memory_add_by_count() loops
>   powerpc/pseries: fail quicker in dlpar_memory_add_by_ic()
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/pseries: skip reserved LMBs in dlpar_memory_add_by_count()
      https://git.kernel.org/powerpc/c/b3e3b4db7a9bafdd81735e6f8db0c5ee9b9d0b5f
[2/3] powerpc/pseries: break early in dlpar_memory_add_by_count() loops
      https://git.kernel.org/powerpc/c/c2aaddcc65b343fad4ed184e625abd3e68f63b9b
[3/3] powerpc/pseries: fail quicker in dlpar_memory_add_by_ic()
      https://git.kernel.org/powerpc/c/0e5962b2ec3d07204fd995ed07870bff3322525c

cheers
