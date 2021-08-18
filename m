Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F53F0542
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTnc2qXnz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgt1pgfz3cWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgs1XN2z9t23; Wed, 18 Aug 2021 23:46:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, benh@kernel.crashing.org, mpe@ellerman.id.au,
 Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20210511073136.17795-1-ldufour@linux.ibm.com>
References: <20210511073136.17795-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v2] ppc64/numa: consider the max numa node for migratable
 LPAR
Message-Id: <162929388912.3619265.15749940956800275665.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:09 +1000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 May 2021 09:31:36 +0200, Laurent Dufour wrote:
> When a LPAR is migratable, we should consider the maximum possible NUMA
> node instead the number of NUMA node from the actual system.
> 
> The DT property 'ibm,current-associativity-domains' is defining the maximum
> number of nodes the LPAR can see when running on that box. But if the LPAR
> is being migrated on another box, it may seen up to the nodes defined by
> 'ibm,max-associativity-domains'. So if a LPAR is migratable, that value
> should be used.
> 
> [...]

Applied to powerpc/next.

[1/1] ppc64/numa: consider the max numa node for migratable LPAR
      https://git.kernel.org/powerpc/c/9c7248bb8de31f51c693bfa6a6ea53b1c07e0fa8

cheers
