Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EFF30DA56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:57:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1tZ2y1zzF01k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09n6PxTzDqBp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09m2mnzz9vG3; Wed,  3 Feb 2021 22:40:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210118123451.1452206-1-npiggin@gmail.com>
References: <20210118123451.1452206-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: always enable queued spinlocks for 64s,
 disable for others
Message-Id: <161235200567.1516112.14719261642261670927.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:43 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Jan 2021 22:34:51 +1000, Nicholas Piggin wrote:
> Queued spinlocks have shown to have good performance and fairness
> properties even on smaller (2 socket) POWER systems. This selects
> them automatically for 64s. For other platforms they are de-selected,
> the standard spinlock is far simpler and smaller code, and single
> chips with a handful of cores is unlikely to show any improvement.
> 
> CONFIG_EXPERT still allows this to be changed, e.g., to help debug
> performance or correctness issues.

Applied to powerpc/next.

[1/1] powerpc: Always enable queued spinlocks for 64s, disable for others
      https://git.kernel.org/powerpc/c/c9f3401313a5089f100d7d1ef4b75cd7b49b2190

cheers
