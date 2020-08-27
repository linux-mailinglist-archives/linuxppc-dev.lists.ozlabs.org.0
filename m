Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E270253F9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 09:52:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcZhb47w9zDqfG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYm3WlFzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYl40F3z9sSP; Thu, 27 Aug 2020 17:46:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20200821080610.123997-1-kjain@linux.ibm.com>
References: <20200821080610.123997-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Move cpumask file to top folder of
 hv-24x7 driver
Message-Id: <159851435998.52163.8295064031379722049.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:51 +1000 (AEST)
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
Cc: suka@us.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Aug 2020 13:36:10 +0530, Kajol Jain wrote:
> Commit 792f73f747b8 ("powerpc/hv-24x7: Add sysfs files inside hv-24x7
> device to show cpumask") added cpumask file as part of hv-24x7 driver
> inside the interface folder. Cpumask file suppose to be in the top
> folder of the pmu driver inorder to make hotplug works.
> 
> This patch fix that issue and create new group 'cpumask_attr_group'
> to add cpumask file and make sure it added on top folder.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf/hv-24x7: Move cpumask file to top folder of hv-24x7 driver
      https://git.kernel.org/powerpc/c/64ef8f2c4791940d7f3945507b6a45c20d959260

cheers
