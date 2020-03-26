Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E121193EE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:30:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p48M6wTzzDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cY595CzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cY33Lfz9sSY; Thu, 26 Mar 2020 23:06:37 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8645aaa87963439007773ed8862ae6a29ea15eae
In-Reply-To: <20200306073904.4737-1-oohall@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/6] powerpc/eeh: Add sysfs files in late probe
Message-Id: <48p3cY33Lfz9sSY@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:37 +1100 (AEDT)
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-06 at 07:38:59 UTC, Oliver O'Halloran wrote:
> Move creating the EEH specific sysfs files into eeh_add_device_late()
> rather than being open-coded all over the place. Calling the function is
> generally done immediately after calling eeh_add_device_late() anyway. This
> is also a correctness fix since currently the sysfs files will be added
> even if the EEH probe happens to fail.
> 
> Similarly, on pseries we currently add the sysfs files before calling
> eeh_add_device_late(). This is flat-out broken since the sysfs files
> require the pci_dev->dev.archdata.edev pointer to be set, and that is done
> in eeh_add_device_late().
> 
> Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8645aaa87963439007773ed8862ae6a29ea15eae

cheers
