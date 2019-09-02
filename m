Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B8A4D6C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 05:08:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFQZ1tFhzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:08:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFN663SnzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MFN65Jzkz9sDB; Mon,  2 Sep 2019 13:06:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFN651G8z9sN1; Mon,  2 Sep 2019 13:06:14 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 250c6c31228d49f3b96855ec387cf37bbe7cb6a7
In-Reply-To: <20190822034838.27876-2-cclaudio@linux.ibm.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v6 1/7] Documentation/powerpc: Ultravisor API
Message-Id: <46MFN651G8z9sN1@ozlabs.org>
Date: Mon,  2 Sep 2019 13:06:14 +1000 (AEST)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Ram Pai <linuxram@linux.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-22 at 03:48:32 UTC, Claudio Carvalho wrote:
> From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> 
> Protected Execution Facility (PEF) is an architectural change for
> POWER 9 that enables Secure Virtual Machines (SVMs). When enabled,
> PEF adds a new higher privileged mode, called Ultravisor mode, to POWER
> architecture. Along with the new mode there is new firmware called the
> Protected Execution Ultravisor (or Ultravisor for short).
> 
> POWER 9 DD2.3 chips (PVR=0x004e1203) or greater will be PEF-capable.
> 
> Attached documentation provides an overview of PEF and defines the API
> for various interfaces that must be implemented in the Ultravisor
> firmware as well as in the KVM Hypervisor.
> 
> Based on input from Mike Anderson, Thiago Bauermann, Claudio Carvalho,
> Ben Herrenschmidt, Guerney Hunt, Paul Mackerras.
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
> Signed-off-by: Guerney Hunt <gdhh@linux.ibm.com>
> Reviewed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Reviewed-by: Michael Anderson <andmike@linux.ibm.com>
> Reviewed-by: Thiago Bauermann <bauerman@linux.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>

Series applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/250c6c31228d49f3b96855ec387cf37bbe7cb6a7

cheers
