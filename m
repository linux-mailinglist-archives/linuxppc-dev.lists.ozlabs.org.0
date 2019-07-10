Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07A6495B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:09:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMzW5VCVzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMtw2MTNzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45kMtw0SYPz9sPV; Thu, 11 Jul 2019 01:05:27 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 73a2b047c81046a7f734a5759ab5fdedbb6968fd
In-Reply-To: <20190605111545.19762-1-fbarrat@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 alastair@au1.ibm.com, ajd@linux.ibm.com, clombard@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] ocxl: Update for AFU descriptor template version 1.1
Message-Id: <45kMtw0SYPz9sPV@ozlabs.org>
Date: Thu, 11 Jul 2019 01:05:26 +1000 (AEST)
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-05 at 11:15:45 UTC, Frederic Barrat wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The OpenCAPI discovery and configuration specification has been
> updated and introduces version 1.1 of the AFU descriptor template,
> with new fields to better define the memory layout of an OpenCAPI
> adapter.
> 
> The ocxl driver doesn't do much yet to support LPC memory but as we
> start seeing (non-LPC) AFU images using the new template, this patch
> updates the config space parsing code to avoid spitting a warning.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> Reviewed-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/73a2b047c81046a7f734a5759ab5fdedbb6968fd

cheers
