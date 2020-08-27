Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B570A25405B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:10:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcb585Q4DzDqDW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYt0MBtzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYs4JQDz9sTn; Thu, 27 Aug 2020 17:46:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Shawn Anastasio <shawn@anastas.io>
In-Reply-To: <20200821185558.35561-1-shawn@anastas.io>
References: <20200821185558.35561-1-shawn@anastas.io>
Subject: Re: [PATCH v2 0/3] Reintroduce PROT_SAO
Message-Id: <159851436050.52163.13623918515223516011.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:57 +1000 (AEST)
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Aug 2020 13:55:55 -0500, Shawn Anastasio wrote:
> Changes in v2:
>     - Update prot_sao selftest to skip ISA 3.1
> 
> This set re-introduces the PROT_SAO prot flag removed in
> Commit 5c9fa16e8abd ("powerpc/64s: Remove PROT_SAO support").
> 
> To address concerns regarding live migration of guests using SAO
> to P10 hosts without SAO support, the flag is disabled by default
> in LPARs. A new config option, PPC_PROT_SAO_LPAR was added to
> allow users to explicitly enable it if they will not be running
> in an environment where this is a conern.
> 
> [...]

Applied to powerpc/fixes.

[1/3] Revert "powerpc/64s: Remove PROT_SAO support"
      https://git.kernel.org/powerpc/c/12564485ed8caac3c18572793ec01330792c7191
[2/3] powerpc/64s: Disallow PROT_SAO in LPARs by default
      https://git.kernel.org/powerpc/c/9b725a90a8f127802e19466d4e336e701bcea0d2
[3/3] selftests/powerpc: Update PROT_SAO test to skip ISA 3.1
      https://git.kernel.org/powerpc/c/24ded46f53f954b9cf246c5d4e3770c7a8aa84ce

cheers
