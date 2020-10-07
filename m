Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C404E28572E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:43:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5gCt4X0VzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:43:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkX5BhGzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkX3sX6z9sTq; Wed,  7 Oct 2020 14:21:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wang Wensheng <wangwensheng4@huawei.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200918085951.44983-1-wangwensheng4@huawei.com>
References: <20200918085951.44983-1-wangwensheng4@huawei.com>
Subject: Re: [PATCH -next] powerpc/papr_scm: Fix warnings about undeclared
 variable
Message-Id: <160204083034.257875.10677454204358541362.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:23 +1100 (AEDT)
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
Cc: santosh@fossix.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Sep 2020 08:59:51 +0000, Wang Wensheng wrote:
> Build the kernel with 'make C=2':
> arch/powerpc/platforms/pseries/papr_scm.c:825:1: warning: symbol
> 'dev_attr_perf_stats' was not declared. Should it be static?

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Fix warnings about undeclared variable
      https://git.kernel.org/powerpc/c/4366337490cbe5a35b50e83755be629a502ec7e2

cheers
