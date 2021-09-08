Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AB403399
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 07:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H494f5rfcz2yPX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 15:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kfRr8vD7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kfRr8vD7; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H49403fRWz2xry
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 15:02:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631077342;
 bh=ZJ9IP11air76uLBrwqyv2OTaxFR4vOy54e7VeF1rCiY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kfRr8vD7icgv2v2+w+tm32x3Xp2Wv5FN+A97nD6c6ajDrWjI/o9aWMh/y/nOFXvfz
 iStJLCnFV17XC/S+Zf2Oc5ZaSWjmhl/4vFiH+cIfpcM0jfO6m1fzSuNDPQx1AAgJzY
 KmAxrvbFle7hk9YmegqOxBdDRlVG7oStfL0ZeZZX7rzsf6yygfD7NGt88+TWWWpWlo
 to8enLEPEVrd7p3CCm/CpnbyiD6j0zkhjFE/qjOa3dd951E47YAzHBtYUWcsyzjAub
 o6GJSK9HrYxwuA+6ljAT+gipxBABDElZSMRMLOE4Kh9jMKJfmePTecBL7eXNIxpp5C
 0Biju6gd9VBYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H493y1Zp3z9sf8;
 Wed,  8 Sep 2021 15:02:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] powerpc/papr_scm: Move duplicate definitions to
 common header files
In-Reply-To: <163092037510.812.12838160593592476913.stgit@82313cf9f602>
References: <163092037510.812.12838160593592476913.stgit@82313cf9f602>
Date: Wed, 08 Sep 2021 15:02:18 +1000
Message-ID: <87sfyfmzhh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nvdimm@lists.linux.dev, dan.j.williams@intel.com, vaibhav@linux.ibm.com,
 sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
> papr_scm and ndtest share common PDSM payload structs like
> nd_papr_pdsm_health. Presently these structs are duplicated across papr_pdsm.h
> and ndtest.h header files. Since 'ndtest' is essentially arch independent and can
> run on platforms other than PPC64, a way needs to be deviced to avoid redundancy
> and duplication of PDSM structs in future.
>
> So the patch proposes moving the PDSM header from arch/powerpc/include/uapi/ to
> the generic include/uapi/linux directory. Also, there are some #defines common
> between papr_scm and ndtest which are not exported to the user space. So, move
> them to a header file which can be shared across ndtest and papr_scm via newly
> introduced include/linux/papr_scm.h.
>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Suggested-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> ---
> Changelog:
>
> Since v1:
> Link: https://patchwork.kernel.org/project/linux-nvdimm/patch/162505488483.72147.12741153746322191381.stgit@56e104a48989/
> * Removed dependency on this patch for the other patches
>
>  MAINTAINERS                               |    2 
>  arch/powerpc/include/uapi/asm/papr_pdsm.h |  165 -----------------------------
>  arch/powerpc/platforms/pseries/papr_scm.c |   43 --------
>  include/linux/papr_scm.h                  |   48 ++++++++
>  include/uapi/linux/papr_pdsm.h            |  165 +++++++++++++++++++++++++++++

This doesn't make sense to me.

Anything with papr (or PAPR) in the name is fundamentally powerpc
specific, it doesn't belong in a generic header, or in a generic
location.

What's the actual problem you're trying to solve?

If it's just including papr_scm bits into ndtest.c then that should be
as simple as:

#ifdef __powerpc__
#include <asm/papr_scm.h>
#endif

Shouldn't it?

cheers
