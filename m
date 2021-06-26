Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A53B4E37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr8s64P3z3fZ0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2f34vTz3c3p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:06 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2d1TX1z9sjD; Sat, 26 Jun 2021 20:39:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210622053036.474678-1-npiggin@gmail.com>
References: <20210622053036.474678-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix copy-paste data exposure into newly
 created tasks
Message-Id: <162470384210.3589875.375778181743975829.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:22 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Jun 2021 15:30:36 +1000, Nicholas Piggin wrote:
> copy-paste contains implicit "copy buffer" state that can contain
> arbitrary user data (if the user process executes a copy instruction).
> This could be snooped by another process if a context switch hits while
> the state is live. So cp_abort is executed on context switch to clear
> out possible sensitive data and prevent the leak.
> 
> cp_abort is done after the low level _switch(), which means it is never
> reached by newly created tasks, so they could snoop on this buffer
> between their first and second context switch.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Fix copy-paste data exposure into newly created tasks
      https://git.kernel.org/powerpc/c/f35d2f249ef05b9671e7898f09ad89aa78f99122

cheers
