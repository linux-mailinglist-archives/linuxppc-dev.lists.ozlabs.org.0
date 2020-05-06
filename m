Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9F1C6618
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 04:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H1Sv0dDWzDqWM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 12:56:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H1Ld1QqtzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 12:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49H1Ld14Y5z9sSy; Wed,  6 May 2020 12:51:04 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 57b3ed941b5542aaebcd9f59369571bbce9d6dcc
In-Reply-To: <20200422092612.514301-1-naveen.n.rao@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Have MPROFILE_KERNEL depend on FUNCTION_TRACER
Message-Id: <49H1Ld14Y5z9sSy@ozlabs.org>
Date: Wed,  6 May 2020 12:51:04 +1000 (AEST)
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-22 at 09:26:12 UTC, "Naveen N. Rao" wrote:
> Currently, it is possible to have CONFIG_FUNCTION_TRACER disabled, but
> CONFIG_MPROFILE_KERNEL enabled. Though all existing users of
> MPROFILE_KERNEL are doing the right thing, it is weird to have
> MPROFILE_KERNEL enabled when the function tracer isn't. Fix this by
> making MPROFILE_KERNEL depend on FUNCTION_TRACER.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/57b3ed941b5542aaebcd9f59369571bbce9d6dcc

cheers
