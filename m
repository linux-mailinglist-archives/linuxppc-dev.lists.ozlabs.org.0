Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98099381B87
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLBV3zZ2z3cWq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:47:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8V6DRkz2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:46 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8T5db1z9sj1; Sun, 16 May 2021 08:45:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210513140800.1391706-1-mpe@ellerman.id.au>
References: <20210513140800.1391706-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix entry flush patching w/strict RWX &
 hash
Message-Id: <162111863528.1890426.10537690113813040837.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:55 +1000
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

On Fri, 14 May 2021 00:07:59 +1000, Michael Ellerman wrote:
> The entry flush mitigation can be enabled/disabled at runtime. When this
> happens it results in the kernel patching its own instructions to
> enable/disable the mitigation sequence.
> 
> With strict kernel RWX enabled instruction patching happens via a
> secondary mapping of the kernel text, so that we don't have to make the
> primary mapping writable. With the hash MMU this leads to a hash fault,
> which causes us to execute the exception entry which contains the entry
> flush mitigation.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/64s: Fix entry flush patching w/strict RWX & hash
      https://git.kernel.org/powerpc/c/49b39ec248af863781a13aa6d81c5f69a2928094
[2/2] powerpc/64s: Fix stf mitigation patching w/strict RWX & hash
      https://git.kernel.org/powerpc/c/5b48ba2fbd77bc68feebd336ffad5ff166782bde

cheers
