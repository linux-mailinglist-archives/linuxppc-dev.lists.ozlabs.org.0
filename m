Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD8FC42F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:30:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHnB47ZGzF51h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:30:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFyQ1ylxzF630
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFyL05nZz9sSK; Thu, 14 Nov 2019 20:08:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFyK2l6Jz9sSl; Thu, 14 Nov 2019 20:08:24 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 2702809a4a1ab414d75c00936cda70ea77c8234e
In-Reply-To: <e9eeee6b-b9bf-1e41-2954-61dbd6fbfbcf@linux.ibm.com>
To: Eric Richter <erichte@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v10a 3/9] powerpc: detect the trusted boot state of the
 system
Message-Id: <47DFyK2l6Jz9sSl@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:24 +1100 (AEDT)
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Jeremy Kerr <jk@ozlabs.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-11-05 at 23:02:07 UTC, Eric Richter wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> While secure boot permits only properly verified signed kernels to be
> booted, trusted boot calculates the file hash of the kernel image and
> stores the measurement prior to boot, that can be subsequently compared
> against good known values via attestation services.
> 
> This patch reads the trusted boot state of a PowerNV system. The state
> is used to conditionally enable additional measurement rules in the IMA
> arch-specific policies.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Eric Richter <erichte@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2702809a4a1ab414d75c00936cda70ea77c8234e

cheers
