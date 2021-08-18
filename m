Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D43F0543
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTp31B2Xz3fKm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgt2n00z3cQ8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgt12HPz9t1C; Wed, 18 Aug 2021 23:46:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, benh@kernel.crashing.org, mpe@ellerman.id.au,
 Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20210517090606.56930-1-ldufour@linux.ibm.com>
References: <20210517090606.56930-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v5] pseries/drmem: update LMBs after LPM
Message-Id: <162929391930.3619265.14579706708870831597.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:39 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 May 2021 11:06:06 +0200, Laurent Dufour wrote:
> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
> updated by the hypervisor in the case the NUMA topology of the LPAR's
> memory is updated.
> 
> This is handled by the kernel, but the memory's node is not updated because
> there is no way to move a memory block between nodes from the Linux kernel
> point of view.
> 
> [...]

Applied to powerpc/next.

[1/1] pseries/drmem: update LMBs after LPM
      https://git.kernel.org/powerpc/c/d144f4d5a8a804133d20ff311d7be70bcdbfaac2

cheers
