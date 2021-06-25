Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8103B3CA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6TH5qwNz3cbb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6RV6cR8z2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:38 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RT55Msz9sfG; Fri, 25 Jun 2021 16:24:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210624123420.2784187-1-mpe@ellerman.id.au>
References: <20210624123420.2784187-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix boot failure with 4K Radix
Message-Id: <162460209018.3247425.2250585798171365237.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:30 +1000
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Jun 2021 22:34:20 +1000, Michael Ellerman wrote:
> When using the Radix MMU our PGD is always 64K, and must be naturally
> aligned.
> 
> For a 4K page size kernel that means page alignment of swapper_pg_dir is
> not sufficient, leading to failure to boot.
> 
> Use the existing MAX_PTRS_PER_PGD which has the correct value, and
> avoids us hard-coding 64K here.

Applied to powerpc/next.

[1/1] powerpc/64s: Fix boot failure with 4K Radix
      https://git.kernel.org/powerpc/c/3018fbc63632e6d30abde228f29aaeaf78b782bf

cheers
