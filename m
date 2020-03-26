Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3755193EF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:36:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4GW18QbzDqtY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:36:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cc2XXwzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cb6Wghz9sSK; Thu, 26 Mar 2020 23:06:39 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c5e76fa05b2df519b9f08571cc57e623c1569faa
In-Reply-To: <20200307024547.5748-1-tyreld@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: fix of_read_drc_info_cell() to point at
 next record
Message-Id: <48p3cb6Wghz9sSK@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:39 +1100 (AEDT)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, mwb@linux.vnet.ibm.com,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-03-07 at 02:45:47 UTC, Tyrel Datwyler wrote:
> The expectation is that when calling of_read_drc_info_cell()
> repeatedly to parse multiple drc-info records that the in/out curval
> parameter points at the start of the next record on return. However,
> the current behavior has curval still pointing at the final value of
> the record just parsed. The result of which is that if the
> ibm,drc-info property contains multiple properties the parsed value
> of the drc_type for any record after the first has the power_domain
> value of the previous record appended to the type string.
> 
> Ex: observed the following 0xffffffff prepended to PHB
> 
> [   69.485037] drc-info: type: \xff\xff\xff\xffPHB, prefix: PHB , index_start: 0x20000001
> [   69.485038] drc-info: suffix_start: 1, sequential_elems: 3072, sequential_inc: 1
> [   69.485038] drc-info: power-domain: 0xffffffff, last_index: 0x20000c00
> 
> Fix by incrementing curval past the power_domain value to point at
> drc_type string of next record.
> 
> Fixes: a29396653b8bf ("pseries/drc-info: Search DRC properties for CPU indexes")
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c5e76fa05b2df519b9f08571cc57e623c1569faa

cheers
