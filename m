Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E6F36EBF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHNS1Ybkz3f40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJJ6CJ3z30Ds
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:40 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJC14Jsz9tJD; Fri, 30 Apr 2021 00:02:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210421125402.1955013-1-mpe@ellerman.id.au>
References: <20210421125402.1955013-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/fadump: Fix sparse warnings
Message-Id: <161970488123.4033873.8516662789483389479.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:21 +1000
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
Cc: hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Apr 2021 22:54:01 +1000, Michael Ellerman wrote:
> Sparse says:
>   arch/powerpc/kernel/fadump.c:48:16: warning: symbol 'fadump_kobj' was not declared. Should it be static?
>   arch/powerpc/kernel/fadump.c:55:27: warning: symbol 'crash_mrange_info' was not declared. Should it be static?
>   arch/powerpc/kernel/fadump.c:61:27: warning: symbol 'reserved_mrange_info' was not declared. Should it be static?
>   arch/powerpc/kernel/fadump.c:83:12: warning: symbol 'fadump_cma_init' was not declared. Should it be static?
> 
> And indeed none of them are used outside this file, they can all be made
> static. Also fadump_kobj needs to be moved inside the ifdef where it's
> used.

Applied to powerpc/next.

[1/2] powerpc/fadump: Fix sparse warnings
      https://git.kernel.org/powerpc/c/2e341f56a16a71f240c87ec69711aad0d95a704c
[2/2] powerpc/powernv: Fix type of opal_mpipl_query_tag() addr argument
      https://git.kernel.org/powerpc/c/d936f8182e1bd18f5e9e6c5e8d8b69261200ca96

cheers
