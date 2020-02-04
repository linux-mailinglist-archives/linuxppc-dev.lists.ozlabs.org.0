Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB2151A45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:05:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Bk0N38bxzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjwC2dzHzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:01:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjwB6VYYzB3wr; Tue,  4 Feb 2020 23:01:30 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 58b278f568f0509497e2df7310bfd719156a60d1
In-Reply-To: <20190828082729.16695-1-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [DOC][PATCH v2] powerpc: Provide initial documentation for PAPR
 hcalls
Message-Id: <48BjwB6VYYzB3wr@ozlabs.org>
Date: Tue,  4 Feb 2020 23:01:30 +1100 (AEDT)
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
Cc: msuchanek@suse.de, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-28 at 08:27:29 UTC, Vaibhav Jain wrote:
> This doc patch provides an initial description of the hcall op-codes
> that are used by Linux kernel running as a guest (LPAR) on top of
> PowerVM or any other sPAPR compliant hyper-visor (e.g qemu).
> 
> Apart from documenting the hcalls the doc-patch also provides a
> rudimentary overview of how hcall ABI, how they are issued with the
> Linux kernel and how information/control flows between the guest and
> hypervisor.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/58b278f568f0509497e2df7310bfd719156a60d1

cheers
