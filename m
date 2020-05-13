Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5891D13B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:00:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MZXS6lhGzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MZ9D5fBwzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 22:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49MZ9D4QCHz9sSk; Wed, 13 May 2020 22:43:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
In-Reply-To: <1588342612-14532-1-git-send-email-nayna@linux.ibm.com>
References: <1588342612-14532-1-git-send-email-nayna@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/ima: fix secure boot rules in ima arch policy
Message-Id: <158937375594.3526905.9967004768395504429.b4-ty@ellerman.id.au>
Date: Wed, 13 May 2020 22:43:44 +1000 (AEST)
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
Cc: linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 May 2020 10:16:52 -0400, Nayna Jain wrote:
> To prevent verifying the kernel module appended signature twice
> (finit_module), once by the module_sig_check() and again by IMA, powerpc
> secure boot rules define an IMA architecture specific policy rule
> only if CONFIG_MODULE_SIG_FORCE is not enabled. This, unfortunately, does
> not take into account the ability of enabling "sig_enforce" on the boot
> command line (module.sig_enforce=1).
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/ima: Fix secure boot rules in ima arch policy
      https://git.kernel.org/powerpc/c/fa4f3f56ccd28ac031ab275e673ed4098855fed4

cheers
