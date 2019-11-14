Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77606FC2B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:35:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGXw0vvvzF7W0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxh1n2wzF59y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFxf5BHqz9sPL; Thu, 14 Nov 2019 20:07:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxf2Pscz9s7T; Thu, 14 Nov 2019 20:07:49 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 39a963b457b5c6cbbdc70441c9d496e39d151582
In-Reply-To: <1569973038-2710-1-git-send-email-nayna@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] sysfs: Fixes __BIN_ATTR_WO() macro
Message-Id: <47DFxf2Pscz9s7T@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:49 +1100 (AEDT)
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
 Eric Ricther <erichte@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nayna Jain <nayna@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-01 at 23:37:18 UTC, Nayna Jain wrote:
> This patch fixes the size and write parameter for the macro
> __BIN_ATTR_WO().
> 
> Fixes: 7f905761e15a8 ("sysfs: add BIN_ATTR_WO() macro")
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/39a963b457b5c6cbbdc70441c9d496e39d151582

cheers
