Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B535861903
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:49:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpKc5Nn1zDq83
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hng14tCDzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hng007V0z9sNy; Mon,  8 Jul 2019 11:19:39 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 259a948c4ba1829ae4a3c31bb6e40ad458a21254
In-Reply-To: <20190607064705.29043-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, oohall@gmail.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/scm: Use a specific endian format for storing
 uuid from the device tree
Message-Id: <45hng007V0z9sNy@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:39 +1000 (AEST)
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

On Fri, 2019-06-07 at 06:47:05 UTC, "Aneesh Kumar K.V" wrote:
> We used uuid_parse to convert uuid string from device tree to two u64
> components. We want to make sure we look at the uuid read from device
> tree in an endian-neutral fashion. For now, I am picking little-endian
> to be format so that we don't end up doing an additional conversion.
> 
> The reason to store in a specific endian format is to enable reading
> the namespace created with a little-endian kernel config on a big-endian kernel.
> We do store the device tree uuid string as a 64-bit little-endian cookie in the
> label area. When booting the kernel we also compare this cookie
> against what is read from the device tree. For this, to work we have
> to store and compare these values in a CPU endian config independent fashion.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/259a948c4ba1829ae4a3c31bb6e40ad458a21254

cheers
