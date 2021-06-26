Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E383B4E3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBrDn5BTtz3g39
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBrD84gQGz2yWy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:47:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBrD746Qwz9ssD; Sat, 26 Jun 2021 20:47:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210625140408.3351173-1-mpe@ellerman.id.au>
References: <20210625140408.3351173-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: Fix spurious "stale" traces in
 raise_backtrace_ipi()
Message-Id: <162470439646.3596556.526198219868127921.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:46:36 +1000
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 26 Jun 2021 00:04:08 +1000, Michael Ellerman wrote:
> In raise_backtrace_ipi() we iterate through the cpumask of CPUs, sending
> each an IPI asking them to do a backtrace, but we don't wait for the
> backtrace to happen.
> 
> We then iterate through the CPU mask again, and if any CPU hasn't done
> the backtrace and cleared itself from the mask, we print a trace on its
> behalf, noting that the trace may be "stale".
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ipi()
      https://git.kernel.org/powerpc/c/7c6986ade69e3c81bac831645bc72109cd798a80

cheers
