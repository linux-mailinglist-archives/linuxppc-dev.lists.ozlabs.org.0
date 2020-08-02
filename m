Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAB235761
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 16:16:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKNNN3Ts0zDqL5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 00:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMTC5hJszDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMTB0P16z9sTp; Sun,  2 Aug 2020 23:35:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>,
 linux-nvdimm@lists.01.org
In-Reply-To: <20200731064153.182203-1-vaibhav@linux.ibm.com>
References: <20200731064153.182203-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] powerpc/papr_scm: add support for reporting NVDIMM
 'life_used_percentage' metric
Message-Id: <159637524118.42190.10318141751963824378.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:09 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 31 Jul 2020 12:11:51 +0530, Vaibhav Jain wrote:
> Changes since v3[1]:
> 
> * Fixed a rebase issue pointed out by Aneesh in first patch in the series.
> 
> [1] https://lore.kernel.org/linux-nvdimm/20200730121303.134230-1-vaibhav@linux.ibm.com

Applied to powerpc/next.

[1/2] powerpc/papr_scm: Fetch nvdimm performance stats from PHYP
      https://git.kernel.org/powerpc/c/2d02bf835e5731de632c8a13567905fa7c0da01c
[2/2] powerpc/papr_scm: Add support for fetching nvdimm 'fuel-gauge' metric
      https://git.kernel.org/powerpc/c/af0870c4e75655b1931d0a5ffde2f448a2794362

cheers
