Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46DFC384
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:02:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DH8W19GwzF2WW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFy25P9tzF5g7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFy20p2lz9sSL; Thu, 14 Nov 2019 20:08:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxy6dpQz9sSQ; Thu, 14 Nov 2019 20:08:06 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e14555e3d0e9edfad0a6840c0152f71aba97e793
In-Reply-To: <1572492694-6520-6-git-send-email-zohar@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v10 5/9] ima: make process_buffer_measurement() generic
Message-Id: <47DFxy6dpQz9sSQ@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:05 +1100 (AEDT)
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

On Thu, 2019-10-31 at 03:31:30 UTC, Mimi Zohar wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> process_buffer_measurement() is limited to measuring the kexec boot
> command line. This patch makes process_buffer_measurement() more
> generic, allowing it to measure other types of buffer data (e.g.
> blacklisted binary hashes or key hashes).
> 
> process_buffer_measurement() may be called directly from an IMA
> hook or as an auxiliary measurement record. In both cases the buffer
> measurement is based on policy. This patch modifies the function to
> conditionally retrieve the policy defined PCR and template for the IMA
> hook case.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> [zohar@linux.ibm.com: added comment in process_buffer_measurement()]
> Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e14555e3d0e9edfad0a6840c0152f71aba97e793

cheers
