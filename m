Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBB14C5E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:33:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sbB0jFzzDqSm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:33:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDh1YcJzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDh0N0vz9sRm; Wed, 29 Jan 2020 16:17:23 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b059c63620fbba8a5da60f01d99d003681447e3c
In-Reply-To: <157384145834.181768.944827793193636924.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xive: Drop extern qualifiers from header function
 prototypes
Message-Id: <486sDh0N0vz9sRm@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:23 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, trivial@kernel.org,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-15 at 18:10:58 UTC, Greg Kurz wrote:
> As reported by ./scripts/checkpatch.pl --strict:
> 
> CHECK: extern prototypes should be avoided in .h files
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b059c63620fbba8a5da60f01d99d003681447e3c

cheers
