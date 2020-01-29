Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8E14C654
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:03:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tFv0BflzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDt5rs5zDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 486sDr3Mcbz9sSS; Wed, 29 Jan 2020 16:17:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDr0v9Jz9sSL; Wed, 29 Jan 2020 16:17:31 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c2a20711fc181e7f22ee5c16c28cb9578af84729
In-Reply-To: <20200107021633.GB29843@us.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc/xmon: don't access ASDR in VMs
Message-Id: <486sDr0v9Jz9sSL@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:31 +1100 (AEDT)
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-07 at 02:16:33 UTC, Sukadev Bhattiprolu wrote:
> >From 91a77dbea3c909ff15c66cded37f1334304a293d Mon Sep 17 00:00:00 2001
> From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Date: Mon, 6 Jan 2020 13:50:02 -0600
> Subject: [PATCH 1/1] powerpc/xmon: don't access ASDR in VMs
> 
> ASDR is HV-privileged and must only be accessed in HV-mode.
> Fixes a Program Check (0x700) when xmon in a VM dumps SPRs.
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c2a20711fc181e7f22ee5c16c28cb9578af84729

cheers
