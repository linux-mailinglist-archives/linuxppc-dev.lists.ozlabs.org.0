Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA77D0F53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 14:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBjs43HXyz3vb7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 23:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBjrc4fhbz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 23:02:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBjrb4SlFz4xbT;
	Fri, 20 Oct 2023 23:02:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 0/6] powerpc/qspinlock: Fix yield latency bug and other
Message-Id: <169780326156.635093.12316159968992864929.b4-ty@ellerman.id.au>
Date: Fri, 20 Oct 2023 23:01:01 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Oct 2023 22:42:59 +1000, Nicholas Piggin wrote:
> This fixes a long-standing latency bug in the powerpc qspinlock
> implementation that quite a few people have reported and helped
> out with debugging.
> 
> The first patch is a minimal fix that avoids the problem. The
> other patches are streamlining and improvements after the fix.
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/6] powerpc/qspinlock: Fix stale propagated yield_cpu
      https://git.kernel.org/powerpc/c/f9bc9bbe8afdf83412728f0b464979a72a3b9ec2

cheers
