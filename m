Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56E319764
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:23:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDkY0vJPzDwtX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf04lWpzDvZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf011YKz9sTD; Fri, 12 Feb 2021 11:19:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210204121612.32721-1-aik@ozlabs.ru>
References: <20210204121612.32721-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3] powerpc/uaccess: Skip might_fault() when user
 access is enabled
Message-Id: <161308904056.3606979.2804234110870132109.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:52 +1100 (AEDT)
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Feb 2021 23:16:12 +1100, Alexey Kardashevskiy wrote:
> The amount of code executed with enabled user space access (unlocked KUAP)
> should be minimal. However with CONFIG_PROVE_LOCKING or
> CONFIG_DEBUG_ATOMIC_SLEEP enabled, might_fault() may end up replaying
> interrupts which in turn may access the user space and forget to restore
> the KUAP state.
> 
> The problem places are:
> 1. strncpy_from_user (and similar) which unlock KUAP and call
> unsafe_get_user -> __get_user_allowed -> __get_user_nocheck()
> with do_allow=false to skip KUAP as the caller took care of it.
> 2. __put_user_nocheck_goto() which is called with unlocked KUAP.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/uaccess: Avoid might_fault() when user access is enabled
      https://git.kernel.org/powerpc/c/7d506ca97b665b95e698a53697dad99fae813c1a

cheers
