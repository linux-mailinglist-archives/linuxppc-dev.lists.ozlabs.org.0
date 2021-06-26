Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1593B4E2B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr5n1SgCz3c97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:41:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2V10gnz30BR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:58 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2S1NPpz9t2G; Sat, 26 Jun 2021 20:38:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210418074003.6651-1-kjain@linux.ibm.com>
References: <20210418074003.6651-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: trivial: fix typo in a comment
Message-Id: <162470384564.3589875.1244984138894329682.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:25 +1000
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
Cc: trivial@kernel.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 18 Apr 2021 13:10:03 +0530, Kajol Jain wrote:
> There is a spelling mistake "byes" -> "bytes" in a comment of
> function drc_pmem_query_stats(). Fix that typo.

Applied to powerpc/next.

[1/1] powerpc/papr_scm: trivial: fix typo in a comment
      https://git.kernel.org/powerpc/c/d2827e5e2e0f0941a651f4b1ca5e9b778c4b5293

cheers
