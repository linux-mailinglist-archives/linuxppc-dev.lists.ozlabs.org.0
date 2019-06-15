Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450846EDD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 09:53:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QqTV0jxJzDrg6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 17:53:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QqMR2mDtzDrQw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 17:47:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="cckdYsiE"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45QqMR0G49z9sNy; Sat, 15 Jun 2019 17:47:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45QqMQ6mFsz9sNC; Sat, 15 Jun 2019 17:47:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560584866; bh=U4SYbjz4U+6Wsqkyzvs7txI2fXrHWgxLLSwdp3uAUTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cckdYsiEtfS4WN8bppW3NlL6eJH69EywRLSCJ5KMan3Z3pHuSmyo+JjWnmhg4lyaM
 R2vIPIE1/4U5x5OyxofQVayM8j1QtjNMYYRhGu5aXdF2FCpfnhv9iTROBnZATJ56Tf
 H5/fqg72ZcyM0944GSxv3aedZXpRIruvd/bdWsOuIj1psUVFIDlIlt5Wtp7ndZveUM
 8h+siEnzz5E9/IIZQMXyg6nPOVbP10V9jeOpvN2zmeNcT+5N7GvtNMXUQulXjfG+iM
 jNvibLS5NDR/Qv5ITGNx8wCzX6OMTw1jEkqfpsRWqNvHgmGmGgVW5qw1KKn7Tqhpou
 wDgL9Qg2/bo3w==
Date: Sat, 15 Jun 2019 17:45:50 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v3 8/9] KVM: PPC: Ultravisor: Enter a secure guest
Message-ID: <20190615074550.GE24709@blackberry>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-9-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606173614.32090-9-cclaudio@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 02:36:13PM -0300, Claudio Carvalho wrote:
> From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> 
> To enter a secure guest, we have to go through the ultravisor, therefore
> we do a ucall when we are entering a secure guest.
> 
> This change is needed for any sort of entry to the secure guest from the
> hypervisor, whether it is a return from an hcall, a return from a
> hypervisor interrupt, or the first time that a secure guest vCPU is run.
> 
> If we are returning from an hcall, the results are already in the
> appropriate registers (R3:12), except for R6,7, which need to be
> restored before doing the ucall (UV_RETURN).
> 
> Have fast_guest_return check the kvm_arch.secure_guest field so that a
> new CPU enters UV when started (in response to a RTAS start-cpu call).
> 
> Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> [Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
>  the MSR_S bit]
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> [Fix UV_RETURN token number and arch.secure_guest check]
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [Update commit message and ret_to_ultra comment]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>

Paul.
