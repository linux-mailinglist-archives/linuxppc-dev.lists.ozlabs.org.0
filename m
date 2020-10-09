Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70B288203
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:16:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yWc4HbRzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFH2NcJzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFG5x8yz9sVV; Fri,  9 Oct 2020 17:04:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20201003074943.338618-1-kjain@linux.ibm.com>
References: <20201003074943.338618-1-kjain@linux.ibm.com>
Subject: Re: [PATCH 1/5] powerpc/hv-gpci: Fix starting index value
Message-Id: <160222338862.867048.17515612969796613615.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:02 +1100 (AEDT)
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

On Sat, 3 Oct 2020 13:19:39 +0530, Kajol Jain wrote:
> Commit 9e9f60108423f ("powerpc/perf/{hv-gpci, hv-common}: generate
> requests with counters annotated") adds a framework for defining
> gpci counters.
> In this patch, they adds starting_index value as '0xffffffffffffffff'.
> which is wrong as starting_index is of size 32 bits.
> 
> Because of this, incase we try to run hv-gpci event we get error.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/perf/hv-gpci: Fix starting index value
      https://git.kernel.org/powerpc/c/0f9866f7e85765bbda86666df56c92f377c3bc10
[2/5] Documentation/ABI: Add ABI documentation for hv-24x7 format
      https://git.kernel.org/powerpc/c/264a034099b6e3c76fae85e75329373f3652a033
[3/5] Documentation/ABI: Add ABI documentation for hv-gpci format
      https://git.kernel.org/powerpc/c/435387dd1f6fc03c64e3fdb4cc8737904c08a4db
[4/5] powerpc/perf/hv-gpci: Add cpu hotplug support
      https://git.kernel.org/powerpc/c/dcb5cdf60a1fbbdb3b4dd2abc562206481f09ef1
[5/5] powerpc/hv-gpci: Add sysfs files inside hv-gpci device to show cpumask
      https://git.kernel.org/powerpc/c/09b791d95559ef82542063333ecaa2ac9d57118e

cheers
