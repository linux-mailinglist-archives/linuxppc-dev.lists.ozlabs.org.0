Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03436FC3C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:13:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHP12WDBzF4Rk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFy82CzczF5gT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFy65flMz9sSS; Thu, 14 Nov 2019 20:08:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFy61bydz9sSL; Thu, 14 Nov 2019 20:08:13 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d72ea4915c7e6fa5e7b9022a34df66e375bfe46c
In-Reply-To: <1572492694-6520-10-git-send-email-zohar@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RFC PATCH v10 9/9] powerpc/ima: indicate kernel modules appended
 signatures are enforced
Message-Id: <47DFy61bydz9sSL@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:13 +1100 (AEDT)
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
 Jessica Yu <jeyu@kernel.org>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 03:31:34 UTC, Mimi Zohar wrote:
> The arch specific kernel module policy rule requires kernel modules to
> be signed, either as an IMA signature, stored as an xattr, or as an
> appended signature.  As a result, kernel modules appended signatures
> could be enforced without "sig_enforce" being set or reflected in
> /sys/module/module/parameters/sig_enforce.  This patch sets
> "sig_enforce".
> 
> Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Jessica Yu <jeyu@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d72ea4915c7e6fa5e7b9022a34df66e375bfe46c

cheers
