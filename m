Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48E3F0533
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTl02LL5z3dnp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgq4jBPz3cSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgh48fMz9sWq; Wed, 18 Aug 2021 23:45:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
References: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v8 0/5] Add support for FORM2 associativity
Message-Id: <162929393258.3619265.13986258706271193307.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:52 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Aug 2021 18:52:18 +0530, Aneesh Kumar K.V wrote:
> Form2 associativity adds a much more flexible NUMA topology layout
> than what is provided by Form1. More details can be found in patch 7.
> 
> $ numactl -H
> ...
> node distances:
> node   0   1   2   3
>   0:  10  11  222  33
>   1:  44  10  55  66
>   2:  77  88  10  99
>   3:  101  121  132  10
> $
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/pseries: rename min_common_depth to primary_domain_index
      https://git.kernel.org/powerpc/c/7e35ef662ca05c42dbc2f401bb76d9219dd7fd02
[2/5] powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
      https://git.kernel.org/powerpc/c/0eacd06bb8adea8dd9edb0a30144166d9f227e64
[3/5] powerpc/pseries: Consolidate different NUMA distance update code paths
      https://git.kernel.org/powerpc/c/8ddc6448ec5a5ef50eaa581a7dec0e12a02850ff
[4/5] powerpc/pseries: Add a helper for form1 cpu distance
      https://git.kernel.org/powerpc/c/ef31cb83d19c4c589d650747cd5a7e502be9f665
[5/5] powerpc/pseries: Add support for FORM2 associativity
      https://git.kernel.org/powerpc/c/1c6b5a7e74052768977855f95d6b8812f6e7772c

cheers
