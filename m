Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CFFC31D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:56:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DH1r45GVzDrdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxw15jFzF5RB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFxv6GS0z9sSN; Thu, 14 Nov 2019 20:08:03 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxv2Jjpz9sRs; Thu, 14 Nov 2019 20:08:02 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 4238fad366a660cbc6499ca1ea4be42bd4d1ac5b
In-Reply-To: <1572492694-6520-3-git-send-email-zohar@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v10 2/9] powerpc/ima: add support to initialize ima policy
 rules
Message-Id: <47DFxv2Jjpz9sRs@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:02 +1100 (AEDT)
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
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 03:31:27 UTC, Mimi Zohar wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> PowerNV systems use a Linux-based bootloader, which rely on the IMA
> subsystem to enforce different secure boot modes.  Since the verification
> policy may differ based on the secure boot mode of the system, the
> policies must be defined at runtime.
> 
> This patch implements arch-specific support to define IMA policy
> rules based on the runtime secure boot mode of the system.
> 
> This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
> config is enabled.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4238fad366a660cbc6499ca1ea4be42bd4d1ac5b

cheers
