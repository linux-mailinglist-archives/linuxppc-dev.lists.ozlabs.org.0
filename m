Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928AB781D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:04:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yv9b4y11zF3jy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 21:04:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKj6M5tzF4Xl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46YtKh6GKqz9sPq; Thu, 19 Sep 2019 20:26:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKh1Kwlz9sN1; Thu, 19 Sep 2019 20:25:59 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: ca986d7fa7e7f7b3f018f227b999f35e654fbb79
In-Reply-To: <156821313134.5656.6597770626574392140.stgit@hbathini.in.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v6 01/36] powerpc/fadump: move internal macros/definitions
 to a new header
Message-Id: <46YtKh1Kwlz9sN1@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:59 +1000 (AEST)
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-11 at 14:46:21 UTC, Hari Bathini wrote:
> Though asm/fadump.h is meant to be used by other components dealing
> with FADump, it also has macros/definitions internal to FADump code.
> Move them to a new header file used within FADump code. This also
> makes way for refactoring platform specific FADump code.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/ca986d7fa7e7f7b3f018f227b999f35e654fbb79

cheers
