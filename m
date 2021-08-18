Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03D3F055F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTr54WF6z3ff5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTh34lG7z3d8W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTh06bxbz9sX2; Wed, 18 Aug 2021 23:46:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Parth Shah <parth@linux.ibm.com>
In-Reply-To: <20210728175607.591679-1-parth@linux.ibm.com>
References: <20210728175607.591679-1-parth@linux.ibm.com>
Subject: Re: [PATCHv2 0/3] Subject: [PATCHv2 0/3] Make cache-object aware of
 L3 siblings by parsing "ibm, thread-groups" property
Message-Id: <162929389333.3619265.2561500273870932225.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:13 +1000
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
Cc: parths1229@gmail.com, mikey@neuling.org, svaidy@linux.vnet.ibm.com,
 srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jul 2021 23:26:04 +0530, Parth Shah wrote:
> Changes from v1 -> v2:
> - Based on Gautham's comments, use a separate thread_group_l3_cache_map
>   and modify parsing code to build cache_map for L3. This makes the
>   cache_map building code isolated from the parsing code.
> v1 can be found at:
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-June/230680.html
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/cacheinfo: Lookup cache by dt node and thread-group id
      https://git.kernel.org/powerpc/c/a4bec516b9c0823d7e2bb8c8928c98b535cf9adf
[2/3] powerpc/cacheinfo: Remove the redundant get_shared_cpu_map()
      https://git.kernel.org/powerpc/c/69aa8e078545bc14d84a8b4b3cb914ac8f9f280e
[3/3] powerpc/smp: Use existing L2 cache_map cpumask to find L3 cache siblings
      https://git.kernel.org/powerpc/c/e9ef81e1079b0c4c374fba0f9affa7129c7c913b

cheers
