Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7D14C682
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:31:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tt612lQzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:31:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sFD03LZzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sF35PGbz9sSd; Wed, 29 Jan 2020 16:17:43 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 493a55f1e7724dee5e71bc726d5b819292094587
In-Reply-To: <20200123010455.GA15080@us.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xmon: Fix compile error in print_insn* functions
Message-Id: <486sF35PGbz9sSd@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:43 +1100 (AEDT)
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

On Thu, 2020-01-23 at 01:04:55 UTC, Sukadev Bhattiprolu wrote:
> >From 72a7497a8673c93a4b80aa4fc38b88a8e90aa650 Mon Sep 17 00:00:00 2001
> From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Date: Wed, 22 Jan 2020 18:57:18 -0600
> Subject: [PATCH 1/1] powerpc/xmon: Fix compile error in print_insn* functions
> 
> Fix couple of compile errors I stumbled upon with CONFIG_XMON=y and
> CONFIG_XMON_DISASSEMBLY=n
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/493a55f1e7724dee5e71bc726d5b819292094587

cheers
