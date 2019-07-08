Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD81618FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:45:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpDC31jwzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnfz5k3BzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnfz3WXDz9sNC; Mon,  8 Jul 2019 11:19:39 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 53e80bd042773c8ddeed856bd1b68ca74c3b8b46
In-Reply-To: <20190607064511.25083-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, oohall@gmail.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/nvdimm: Add support for multibyte read/write
 for metadata
Message-Id: <45hnfz3WXDz9sNC@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:37 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-07 at 06:45:11 UTC, "Aneesh Kumar K.V" wrote:
> SCM_READ/WRITE_MEATADATA hcall supports multibyte read/write. This patch
> updates the metadata read/write to use 1, 2, 4 or 8 byte read/write as
> mentioned in PAPR document.
> 
> READ/WRITE_METADATA hcall supports the 1, 2, 4, or 8 bytes read/write.
> For other values hcall results H_P3.
> 
> Hypervisor stores the metadata contents in big-endian format and in-order
> to enable read/write in different granularity, we need to switch the contents
> to big-endian before calling HCALL.
> 
> Based on an patch from Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/53e80bd042773c8ddeed856bd1b68ca74c3b8b46

cheers
