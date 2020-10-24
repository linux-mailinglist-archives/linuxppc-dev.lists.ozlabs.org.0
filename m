Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A5297BD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 12:29:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJHQW0qw7zDqL5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 21:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJHNt1MQFzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 21:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CJHNs69hpz9sV7; Sat, 24 Oct 2020 21:27:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
In-Reply-To: <20200724063946.21378-1-ganeshgr@linux.ibm.com>
References: <20200724063946.21378-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/pseries: Avoid using addr_to_pfn in real mode
Message-Id: <160353524091.3419015.8834000539209307541.b4-ty@ellerman.id.au>
Date: Sat, 24 Oct 2020 21:27:57 +1100 (AEDT)
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 12:09:46 +0530, Ganesh Goudar wrote:
> When an UE or memory error exception is encountered the MCE handler
> tries to find the pfn using addr_to_pfn() which takes effective
> address as an argument, later pfn is used to poison the page where
> memory error occurred, recent rework in this area made addr_to_pfn
> to run in real mode, which can be fatal as it may try to access
> memory outside RMO region.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Avoid using addr_to_pfn in real mode
      https://git.kernel.org/powerpc/c/4ff753feab021242144818b9a3ba011238218145

cheers
