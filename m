Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54231978C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:39:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcF4d5zfqzDx0K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf819gszDwlq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf70Lx9z9sTD; Fri, 12 Feb 2021 11:19:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210209095234.837356-1-kjain@linux.ibm.com>
References: <20210209095234.837356-1-kjain@linux.ibm.com>
Subject: Re: [PATCH V3] powerpc/perf: Adds support for programming of
 Thresholding in P10
Message-Id: <161308904941.3606979.12435840058472237094.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:59 +1100 (AEDT)
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Feb 2021 15:22:34 +0530, Kajol Jain wrote:
> Thresholding, a performance monitoring unit feature, can be
> used to identify marked instructions which take more than
> expected cycles between start event and end event.
> Threshold compare (thresh_cmp) bits are programmed in MMCRA
> register. In Power9, thresh_cmp bits were part of the
> event code. But in case of P10, thresh_cmp are not part of
> event code due to inclusion of MMCR3 bits.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Adds support for programming of Thresholding in P10
      https://git.kernel.org/powerpc/c/82d2c16b350f72aa21ac2a6860c542aa4b43a51e

cheers
