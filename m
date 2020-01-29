Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995714C659
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:07:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tKx5rMPzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDw3FLQzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDr53nSz9sSF; Wed, 29 Jan 2020 16:17:32 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7e6f8cbc5e10cf7601c762db267b795273d53078
In-Reply-To: <20200108064647.169637-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com,
 "Oliver O'Halloran" <oohall@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/papr_scm: Don't enable direct map for a region by
 default
Message-Id: <486sDr53nSz9sSF@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:32 +1100 (AEDT)
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

On Wed, 2020-01-08 at 06:46:47 UTC, "Aneesh Kumar K.V" wrote:
> Setting ND_REGION_PAGEMAP flag implies namespace mode defaults to fsdax mode.
> This also means kernel ends up creating struct page backing for these namspace
> ranges. With large namespaces that is not the right thing to do. We
> should let the user select the mode he/she wants the namespace to be created
> with.
> 
> Hence disable ND_REGION_PAGEMAP for papr_scm regions. We still keep the flag for
> of_pmem because it supports only small persistent memory regions.
> 
> This is similar to what is done for x86 with commit
> commit: 004f1afbe199 ("libnvdimm, pmem: direct map legacy pmem by default")
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7e6f8cbc5e10cf7601c762db267b795273d53078

cheers
