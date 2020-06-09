Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6641F337B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:33:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzLJ51rmzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDZ60W7zDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDZ52Vkz9sT6; Tue,  9 Jun 2020 15:28:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <20200226043923.5481-1-ajd@linux.ibm.com>
References: <20200226043923.5481-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] ocxl: Fix misleading comment
Message-Id: <159168031390.1381411.18391095748504756426.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:30 +1000 (AEST)
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Feb 2020 15:39:23 +1100, Andrew Donnellan wrote:
> In ocxl_context_free() we note that the AFU reference we're releasing was
> taken in "ocxl_context_init", a function that doesn't actually exist.
> 
> Fix it to say ocxl_context_alloc() instead, which I expect was what was
> intended.

Applied to powerpc/next.

[1/1] ocxl: Fix misleading comment
      https://git.kernel.org/powerpc/c/a0594e89c9dc8e37883cc0d6642d1baad9c0744e

cheers
