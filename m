Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CD3AC25D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:31:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mGf0P7gz3gcT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4T25d2z3c67
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4S1Trfz9srX; Fri, 18 Jun 2021 14:23:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210610072949.3198522-1-mpe@ellerman.id.au>
References: <20210610072949.3198522-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/signal64: Don't read sigaction arguments back
 from user memory
Message-Id: <162398829895.1363949.843605890887600120.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:38 +1000
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Jun 2021 17:29:49 +1000, Michael Ellerman wrote:
> When delivering a signal to a sigaction style handler (SA_SIGINFO), we
> pass pointers to the siginfo and ucontext via r4 and r5.
> 
> Currently we populate the values in those registers by reading the
> pointers out of the sigframe in user memory, even though the values in
> user memory were written by the kernel just prior:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/signal64: Don't read sigaction arguments back from user memory
      https://git.kernel.org/powerpc/c/a3309226454a7e76d76251579c1183787694f303

cheers
