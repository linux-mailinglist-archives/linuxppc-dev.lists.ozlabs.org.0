Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D8544FC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 16:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJn594V2Yz3f7N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 00:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJn2K4ZbVz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 00:45:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJn2H6n0Jz4xZB;
	Fri, 10 Jun 2022 00:45:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>, nvdimm@lists.linux.dev
In-Reply-To: <20220524112353.1718454-1-vaibhav@linux.ibm.com>
References: <20220524112353.1718454-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: don't requests stats with '0' sized stats buffer
Message-Id: <165478587347.589231.8636928755378535882.b4-ty@ellerman.id.au>
Date: Fri, 10 Jun 2022 00:44:33 +1000
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
Cc: Dan Williams <dan.j.williams@intel.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 May 2022 16:53:53 +0530, Vaibhav Jain wrote:
> Sachin reported [1] that on a POWER-10 lpar he is seeing a kernel panic being
> reported with vPMEM when papr_scm probe is being called. The panic is of the
> form below and is observed only with following option disabled(profile) for the
> said LPAR 'Enable Performance Information Collection' in the HMC:
> 
>  Kernel attempted to write user page (1c) - exploit attempt? (uid: 0)
>  BUG: Kernel NULL pointer dereference on write at 0x0000001c
>  Faulting instruction address: 0xc008000001b90844
>  Oops: Kernel access of bad area, sig: 11 [#1]
> <snip>
>  NIP [c008000001b90844] drc_pmem_query_stats+0x5c/0x270 [papr_scm]
>  LR [c008000001b92794] papr_scm_probe+0x2ac/0x6ec [papr_scm]
>  Call Trace:
>        0xc00000000941bca0 (unreliable)
>        papr_scm_probe+0x2ac/0x6ec [papr_scm]
>        platform_probe+0x98/0x150
>        really_probe+0xfc/0x510
>        __driver_probe_device+0x17c/0x230
> <snip>
>  ---[ end trace 0000000000000000 ]---
>  Kernel panic - not syncing: Fatal exception
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/papr_scm: don't requests stats with '0' sized stats buffer
      https://git.kernel.org/powerpc/c/07bf9431b1590d1cd7a8d62075d0b50b073f0495

cheers
