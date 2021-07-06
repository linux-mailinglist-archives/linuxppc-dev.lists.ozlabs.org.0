Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7E3BCAFE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJzv86msfz3cfk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJzt23FM1z3bTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:52:58 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GJzt21KsDz9sXN; Tue,  6 Jul 2021 20:52:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210706051310.608992-1-npiggin@gmail.com>
References: <20210706051310.608992-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64e: Fix system call illegal mtmsrd instruction
Message-Id: <162556874361.460578.15789629703127119372.b4-ty@ellerman.id.au>
Date: Tue, 06 Jul 2021 20:52:23 +1000
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Jul 2021 15:13:10 +1000, Nicholas Piggin wrote:
> BookE does not have mtmsrd, switch to use wrteei to enable MSR[EE].

Applied to powerpc/fixes.

[1/1] powerpc/64e: Fix system call illegal mtmsrd instruction
      https://git.kernel.org/powerpc/c/1df3af6dc3cfe643f43d46f202bd44861ccbdb99

cheers
