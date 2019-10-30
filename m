Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15DE9B99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:37:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737JR3ZtkzF3v6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736np37SQzF4Bc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4736nn5D3Sz9sPd; Wed, 30 Oct 2019 23:14:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nn1GkHz9sR5; Wed, 30 Oct 2019 23:14:20 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: cd1d55f16d48d97d681d9534170ce712ac1d09e7
In-Reply-To: <157063484064.11906.3586824898111397624.stgit@hbathini.in.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: make syntax for FADump config options in
 kernel/Makefile readable
Message-Id: <4736nn1GkHz9sR5@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:20 +1100 (AEDT)
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
Cc: joel@jms.id.au, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-09 at 15:27:20 UTC, Hari Bathini wrote:
> arch/powerpc/kernel/fadump.c file needs to be compiled in if 'config
> FA_DUMP' or 'config PRESERVE_FA_DUMP' is set. The current syntax
> achieves that but looks a bit odd. Fix it for better readability.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/cd1d55f16d48d97d681d9534170ce712ac1d09e7

cheers
