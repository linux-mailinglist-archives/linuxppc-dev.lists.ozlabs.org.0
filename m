Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906533F0564
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTsP3NdCz3frp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqThB3ZCBz3cTM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:18 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTh13bTxz9t18; Wed, 18 Aug 2021 23:46:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: pratik.r.sampat@gmail.com, rjw@rjwysocki.net,
 "Pratik R. Sampat" <psampat@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org, mpe@ellerman.id.au
In-Reply-To: <20210728120500.87549-1-psampat@linux.ibm.com>
References: <20210728120500.87549-1-psampat@linux.ibm.com>
Subject: Re: [PATCH v2 0/1] cpufreq:powernv: Fix init_chip_info initialization
 in numa=off
Message-Id: <162929392908.3619265.5755055049744911919.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:49 +1000
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

On Wed, 28 Jul 2021 17:34:59 +0530, Pratik R. Sampat wrote:
> v1: https://lkml.org/lkml/2021/7/26/1509
> Changelog v1-->v2:
> Based on comments from Gautham,
> 1. Included a #define for MAX_NR_CHIPS instead of hardcoding the
> allocation.
> 
> Pratik R. Sampat (1):
>   cpufreq:powernv: Fix init_chip_info initialization in numa=off
> 
> [...]

Applied to powerpc/next.

[1/1] cpufreq:powernv: Fix init_chip_info initialization in numa=off
      https://git.kernel.org/powerpc/c/f34ee9cb2c5ac5af426fee6fa4591a34d187e696

cheers
