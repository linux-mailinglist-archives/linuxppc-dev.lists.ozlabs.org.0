Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C4674553B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:02:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb152Svjz3gbM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZpB1Z3fz3bx3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZpB0Jk4z4wy6;
	Mon,  3 Jul 2023 15:52:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
In-Reply-To: <2015925968.3546872.1685990936823.JavaMail.zimbra@raptorengineeringinc.com>
References: <2015925968.3546872.1685990936823.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH] powerpc/iommu: Only build sPAPR access functions on pSeries
Message-Id: <168836201906.50010.10692502204112632302.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 05 Jun 2023 13:48:56 -0500, Timothy Pearson wrote:
>  and PowerNV
> 
> A build failure with CONFIG_HAVE_PCI=y set without PSERIES or POWERNV
> set was caught by the random configuration checker.  Guard the sPAPR
> specific IOMMU functions on CONFIG_PPC_PSERIES || CONFIG_PPC_POWERNV.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: Only build sPAPR access functions on pSeries
      https://git.kernel.org/powerpc/c/bfd8d989210cb6bb1c8e87b7c525831dceb91418

cheers
