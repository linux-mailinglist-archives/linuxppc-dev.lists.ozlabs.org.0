Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F666319794
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:45:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFBz5JtpzDx1Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:44:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDfC44LDzDwnQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:03 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDfB6vBdz9sVy; Fri, 12 Feb 2021 11:20:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210208063406.331655-1-npiggin@gmail.com>
References: <20210208063406.331655-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Remove EXSLB interrupt save area
Message-Id: <161308903986.3606979.1147645719599134830.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:20:02 +1100 (AEDT)
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

On Mon, 8 Feb 2021 16:34:06 +1000, Nicholas Piggin wrote:
> SLB faults should not be taken while the PACA save areas are live, all
> memory accesses should be fetches from the kernel text, and access to
> PACA and the current stack, before C code is called or any other
> accesses are made.
> 
> All of these have pinned SLBs so will not take a SLB fault. Therefore
> EXSLB is not be required.

Applied to powerpc/next.

[1/1] powerpc/64s: Remove EXSLB interrupt save area
      https://git.kernel.org/powerpc/c/ac7c5e9b08acdb54ef3525abcad24bdb3ed05551

cheers
