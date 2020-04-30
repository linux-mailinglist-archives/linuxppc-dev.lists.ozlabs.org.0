Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAA1BF003
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 08:05:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CPxT4rgnzDrJt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 16:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CPvk41K6zDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 16:03:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QYD1i3dW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49CPvj4Cknz9sSg;
 Thu, 30 Apr 2020 16:03:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588226626;
 bh=elBER65qppGyFsY+iYRbJD5NeTDZbQ7OyBJU28uzXyM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QYD1i3dWyp2wgbuqUrLUzmq+uNN+0F2STt43/RyPvqIEyGmTBVs2npXqAvXtjZNpo
 NxlTH8+wVAZALLZGaFvwW88v00ixfkN5Hwx37mX8Z5efoqnCzTIM+SZvaPMEg3qB47
 WXZR+eslYkazw/CWFYtCyRNUXnr1BYVRnf9IYhqvYA1sXKkqumZ0rs2RQ8LKDlgnSi
 0nuxkCIfq6MV5CqsemkEgHceump3foznBPJWfRrQgmb4lpBjfnKyAGD2s/4K0vjWom
 +PM3BpNdGcS/CVV7cwOAyUn44OvlNqnFGHzVs3b2CfFOLjAVPPa7ELG0AaekkqnLDi
 LI1SVrW/z62ZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v6 1/4] powerpc: Document details on H_SCM_HEALTH hcall
In-Reply-To: <20200420070711.223545-2-vaibhav@linux.ibm.com>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
 <20200420070711.223545-2-vaibhav@linux.ibm.com>
Date: Thu, 30 Apr 2020 16:04:01 +1000
Message-ID: <87r1w5echa.fsf@mpe.ellerman.id.au>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Santosh Sivaraj <santosh@fossix.org>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Add documentation to 'papr_hcalls.rst' describing the bitmap flags
> that are returned from H_SCM_HEALTH hcall as per the PAPR-SCM
> specification.
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v5..v6
> * New patch in the series
> ---
>  Documentation/powerpc/papr_hcalls.rst | 43 ++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
> index 3493631a60f8..9a5ba5eaf323 100644
> --- a/Documentation/powerpc/papr_hcalls.rst
> +++ b/Documentation/powerpc/papr_hcalls.rst
> @@ -220,13 +220,48 @@ from the LPAR memory.
>  **H_SCM_HEALTH**
>  
>  | Input: drcIndex
> -| Out: *health-bitmap, health-bit-valid-bitmap*
> +| Out: *health-bitmap (r4), health-bit-valid-bitmap (r5)*
>  | Return Value: *H_Success, H_Parameter, H_Hardware*
>  
>  Given a DRC Index return the info on predictive failure and overall health of
> -the NVDIMM. The asserted bits in the health-bitmap indicate a single predictive
> -failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
> -valid.
> +the NVDIMM. The asserted bits in the health-bitmap indicate one or more states
> +(described in table below) of the NVDIMM and health-bit-valid-bitmap indicate
> +which bits in health-bitmap are valid.
> +
> +Health Bitmap Flags:
> +
> ++------+-----------------------------------------------------------------------+
> +|  Bit |               Definition                                              |
> ++======+=======================================================================+
> +|  00  | SCM device is unable to persist memory contents.                      |
> +|      | If the system is powered down, nothing will be saved.                 |
> ++------+-----------------------------------------------------------------------+

Are these correct bit numbers or backward IBM big endian bit numbers?

ie. which bit is LSB?

cheers
