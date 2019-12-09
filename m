Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B211668A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 06:46:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WXJ15s7nzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WXGD5SYnzDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 16:45:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47WXGD2ddxz9sPh; Mon,  9 Dec 2019 16:45:08 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 249fad734a25889a4f23ed014d43634af6798063
In-Reply-To: <20191118034452.9939-1-maddy@linux.vnet.ibm.com>
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/perf: Disable trace_imc pmu
Message-Id: <47WXGD2ddxz9sPh@ozlabs.org>
Date: Mon,  9 Dec 2019 16:45:08 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-11-18 at 03:44:52 UTC, Madhavan Srinivasan wrote:
> When a root user or a user with CAP_SYS_ADMIN
> privilege use trace_imc performance monitoring
> unit events, to monitor application or KVM threads,
> may result in a checkstop (System crash). Reason
> being frequent switch of the "trace/accumulation"
> mode of In-Memory Collection hardware.
> This patch disables trace_imc pmu unit, but will
> be re-enabled at a later stage with a fix patchset.
> 
> Fixes: 012ae244845f1 ('powerpc/perf: Trace imc PMU functions') 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/249fad734a25889a4f23ed014d43634af6798063

cheers
