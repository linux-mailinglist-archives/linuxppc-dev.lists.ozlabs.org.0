Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B375285731
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:47:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5gJ317b4zDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:46:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fqJ3DrkzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4C5fqH0Nhzz9sTm; Wed,  7 Oct 2020 14:25:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fqG4YKLz9ryj; Wed,  7 Oct 2020 14:25:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20201006122051.190176-1-mpe@ellerman.id.au>
References: <20201006122051.190176-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v5] powerpc/powernv/elog: Fix race while processing OPAL
 error log event.
Message-Id: <160204111833.262680.16327366891660217531.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:25:30 +1100 (AEDT)
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
Cc: aneesh.kumar@linux.ibm.com, oohall@gmail.com, hegdevasant@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Oct 2020 23:20:51 +1100, Michael Ellerman wrote:
> Every error log reported by OPAL is exported to userspace through a
> sysfs interface and notified using kobject_uevent(). The userspace
> daemon (opal_errd) then reads the error log and acknowledges the error
> log is saved safely to disk. Once acknowledged the kernel removes the
> respective sysfs file entry causing respective resources to be
> released including kobject.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/elog: Fix race while processing OPAL error log event.
      https://git.kernel.org/powerpc/c/aea948bb80b478ddc2448f7359d574387521a52d

cheers
