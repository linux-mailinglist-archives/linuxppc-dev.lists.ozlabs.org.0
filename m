Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4811DB19F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:26:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rr7H20CVzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXQ3xl0zDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49RqXQ2q3jz9sTn; Wed, 20 May 2020 21:00:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXQ1vpfz9sV9; Wed, 20 May 2020 21:00:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200402124929.3574166-1-mpe@ellerman.id.au>
References: <20200402124929.3574166-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/64: Update Speculation_Store_Bypass in
 /proc/<pid>/status
Message-Id: <158997214065.943180.13543453708151461572.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:06 +1000 (AEST)
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
Cc: gwalbon@linux.ibm.com, ricklind@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Apr 2020 23:49:29 +1100, Michael Ellerman wrote:
> Currently we don't report anything useful in /proc/<pid>/status:
> 
>   $ grep Speculation_Store_Bypass /proc/self/status
>   Speculation_Store_Bypass:       unknown
> 
> Our mitigation is currently always a barrier instruction, which
> doesn't map that well onto the existing possibilities for the PR_SPEC
> values.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Update Speculation_Store_Bypass in /proc/<pid>/status
      https://git.kernel.org/powerpc/c/d93e5e2d03d4f41dfedb92200a2c0413ab8ee4e7

cheers
