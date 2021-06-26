Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCB3B4E36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr8Q57bqz3fT1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2d3KJBz3bwg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2c275Dz9sxS; Sat, 26 Jun 2021 20:39:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20210601074801.617363-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20210601074801.617363-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/xmon: Add support for running a command on all
 cpus in xmon
Message-Id: <162470384380.3589875.18024101066814789926.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:23 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Jun 2021 13:18:01 +0530, Naveen N. Rao wrote:
> It is sometimes desirable to run a command on all cpus in xmon. A
> typical scenario is to obtain the backtrace from all cpus in xmon if
> there is a soft lockup. Add rudimentary support for the same. The
> command to be run on all cpus should be prefixed with 'c#'. As an
> example, 'c#t' will run 't' command and produce a backtrace on all cpus
> in xmon.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: Add support for running a command on all cpus in xmon
      https://git.kernel.org/powerpc/c/b8ee3e6d6c5eec7e66de82449382f1a206db2046

cheers
