Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C2A4D7A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 05:16:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFbx1CkXzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFN85rRTzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:06:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MFN84MLtz9sBF; Mon,  2 Sep 2019 13:06:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFN82G7vz9sDB; Mon,  2 Sep 2019 13:06:16 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 70ed86f4de5bd74dd2d884dcd2f3275c4cfe665f
In-Reply-To: <20190829155021.2915-2-maxiwell@linux.ibm.com>
To: "Maxiwell S. Garcia" <maxiwell@linux.ibm.com>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc: Add PowerPC Capabilities ELF note
Message-Id: <46MFN82G7vz9sDB@ozlabs.org>
Date: Mon,  2 Sep 2019 13:06:16 +1000 (AEST)
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
Cc: linux-arch@vger.kernel.org, andmike@linux.ibm.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, cclaudio@linux.ibm.com,
 "Maxiwell S . Garcia" <maxiwell@linux.ibm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-29 at 15:50:20 UTC, "Maxiwell S. Garcia" wrote:
> From: Claudio Carvalho <cclaudio@linux.ibm.com>
> 
> Add the PowerPC name and the PPC_ELFNOTE_CAPABILITIES type in the
> kernel binary ELF note. This type is a bitmap that can be used to
> advertise kernel capabilities to userland.
> 
> This patch also defines PPCCAP_ULTRAVISOR_BIT as being the bit zero.
> 
> Suggested-by: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> [ maxiwell: Define the 'PowerPC' type in the elfnote.h ]
> Signed-off-by: Maxiwell S. Garcia <maxiwell@linux.ibm.com>

Series applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/70ed86f4de5bd74dd2d884dcd2f3275c4cfe665f

cheers
