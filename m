Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C883F5AF7C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:48:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c40h2ZPhzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:48:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lp38QjzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lp2KMhz9sNf; Sun, 30 Jun 2019 18:37:26 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1b7de1df997a57e3e144bdb31ceaee9c16d6d284
X-Patchwork-Hint: ignore
In-Reply-To: <20190612155418.GB22739@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] cxl: no need to check return value of debugfs_create
 functions
Message-Id: <45c3lp2KMhz9sNf@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:26 +1000 (AEST)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 15:54:18 UTC, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Because there's no need to check, also make the return value of the
> local debugfs_create_io_x64() call void, as no one ever did anything
> with the return value (as they did not need to.)
> 
> And make the cxl_debugfs_* calls return void as no one was even checking
> their return value at all.
> 
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1b7de1df997a57e3e144bdb31ceaee9c16d6d284

cheers
