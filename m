Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A000F366C25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLYt3yvHz3dCy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:12:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVM2dvCz30DT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:15 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVL40C0z9vFf; Wed, 21 Apr 2021 23:09:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210416125750.49550-1-ganeshgr@linux.ibm.com>
References: <20210416125750.49550-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/mce: Fix a typo in error type assignment
Message-Id: <161901049898.1961279.13178176794089393730.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:18 +1000
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 18:27:50 +0530, Ganesh Goudar wrote:
> The error type is ICACHE and DCACHE, for case MCE_ERROR_TYPE_ICACHE.

Applied to powerpc/next.

[1/1] powerpc/pseries/mce: Fix a typo in error type assignment
      https://git.kernel.org/powerpc/c/864ec4d40c83365b16483d88990e7e579537635c

cheers
