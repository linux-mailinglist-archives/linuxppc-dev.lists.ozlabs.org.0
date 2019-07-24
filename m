Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD773001
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 15:36:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45txFL56j5zDqMy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 23:36:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tx9d0twszDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:32:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45tx9c3l56z9s8m; Wed, 24 Jul 2019 23:32:52 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6d140e7569db89a1b596c1c2d1c2293d5c594432
In-Reply-To: <20190629160610.23402-2-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/3] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
Message-Id: <45tx9c3l56z9s8m@ozlabs.org>
Date: Wed, 24 Jul 2019 23:32:52 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-06-29 at 16:06:08 UTC, Vaibhav Jain wrote:
> Update the hvcalls.h to include op-codes for new hcalls introduce to
> manage SCM memory. Also update existing hcall definitions to reflect
> current papr specification for SCM.
> 
> The removed hcall op-codes H_SCM_MEM_QUERY, H_SCM_BLOCK_CLEAR were
> transient proposals and there support was never implemented by
> Power-VM nor they were used anywhere in Linux kernel. Hence we don't
> expect anyone to be impacted by this change.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Series applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/6d140e7569db89a1b596c1c2d1c2293d5c594432

cheers
