Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95734F617
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:18:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97jW0wVTz3gL6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xg0srvz3bsP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xf4KNvz9shx; Wed, 31 Mar 2021 12:10:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kernel test robot <lkp@intel.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210318234441.GA63469@f8e20a472e81>
References: <202103190721.joUfcBzf-lkp@intel.com>
 <20210318234441.GA63469@f8e20a472e81>
Subject: Re: [PATCH] powerpc/iommu/debug: fix ifnullfree.cocci warnings
Message-Id: <161715298004.226945.14572289924746154784.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:40 +1100
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
Cc: kbuild-all@lists.01.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 07:44:41 +0800, kernel test robot wrote:
> arch/powerpc/kernel/iommu.c:76:2-16: WARNING: NULL check before some freeing functions is not needed.
> 
>  NULL check before some freeing functions is not needed.
> 
>  Based on checkpatch warning
>  "kfree(NULL) is safe this check is probably not required"
>  and kfreeaddr.cocci by Julia Lawall.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu/debug: fix ifnullfree.cocci warnings
      https://git.kernel.org/powerpc/c/bbbe563f8490958861777d98871e16960163ea1b

cheers
