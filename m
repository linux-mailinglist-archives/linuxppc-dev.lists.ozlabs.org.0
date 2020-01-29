Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39E14C59F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:20:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sJ90PNZzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:20:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDd47DrzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDc4NdMz9sPW; Wed, 29 Jan 2020 16:17:20 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6a3163212f311daaf2ca3b676db2e11cfd81c6b3
In-Reply-To: <156219139988.578018.1046848908285019838.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: XIVE: Fix typo in comment
Message-Id: <486sDc4NdMz9sPW@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:20 +1100 (AEDT)
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-03 at 22:03:19 UTC, Greg Kurz wrote:
> Cc: trivial@kernel.org
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6a3163212f311daaf2ca3b676db2e11cfd81c6b3

cheers
