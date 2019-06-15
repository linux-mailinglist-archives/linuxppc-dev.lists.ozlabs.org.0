Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FB546EBF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 09:39:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qq9P145TzDrdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 17:39:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qq7X0KBwzDrcW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 17:37:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="djIhF63m"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45Qq7W45fFz9sNk; Sat, 15 Jun 2019 17:37:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45Qq7W3GGlz9sNC; Sat, 15 Jun 2019 17:37:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560584247; bh=RQlS/YGl7nl7lg0dX0YZ7lSdRdKWpVUbXN2p5z5araU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djIhF63m3QNctERvE6C8SBA6S0u9kwKsIumUdSt9KnspzrRoXYUWCTqbGw5Fx7foE
 uNyUbSvGNusuJthv6pcc/S66S7eMsdMqFl/260/R2jCUtEa5HRAyN6vAlzt69BObgh
 VYwNTfIgsXYdrVHMksanL8yia/D9AxmPf4g2vgwTvsWhpMjeU70H+8eGZEPudB+t5c
 jykWUsD7zbrqchNFuIUBqacPOtm1ui47TqBbTwq79rC25+13+HKhnWhuMS6ecPH7o3
 0+brV8YdRA7NOjp1fTGBnerJrpBBnChWIMU5xasM6w7tSFDgMuW+17Z/P/nO1vHS55
 nNTIeOAF+QdMA==
Date: Sat, 15 Jun 2019 17:36:00 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v3 3/9] powerpc: Introduce FW_FEATURE_ULTRAVISOR
Message-ID: <20190615073600.GA24709@blackberry>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-4-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606173614.32090-4-cclaudio@linux.ibm.com>
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

On Thu, Jun 06, 2019 at 02:36:08PM -0300, Claudio Carvalho wrote:
> This feature tells if the ultravisor firmware is available to handle
> ucalls.

Everything in this patch that depends on CONFIG_PPC_UV should just
depend on CONFIG_PPC_POWERNV instead.  The reason is that every host
kernel needs to be able to do the ultracall to set partition table
entry 0, in case it ends up being run on a machine with an ultravisor.
Otherwise we will have the situation where a host kernel may crash
early in boot just because the machine it's booted on happens to have
an ultravisor running.  The crash will be a particularly nasty one
because it will happen before we have probed the machine type and
initialized the console; therefore it will just look like the machine
hangs for no discernable reason.

We also need to think about how to provide a way for petitboot to know
whether the kernel it is booting knows how to do a ucall to set its
partition table entry.  One suggestion would be to modify
vmlinux.lds.S to add a new PT_NOTE entry in the program header of the
binary with (say) a 64-bit doubleword which is a bitmap indicating
capabilities of the binary.  We would define the first bit as
indicating that the kernel knows how to run under an ultravisor.
When running under an ultravisor, petitboot could then look for the
PT_NOTE and the ultravisor-capable bit in it, and if the PT_NOTE is
not there or the bit is zero, put up a dialog warning the user that
the kernel will probably crash early in boot, and asking for explicit
confirmation that the user wants to proceed.

Paul.
