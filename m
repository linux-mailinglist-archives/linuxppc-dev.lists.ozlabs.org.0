Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D22E9B97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:34:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737F02gD3zF4HM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nn45c0zF4Bc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4736nm3gTsz9sR3; Wed, 30 Oct 2019 23:14:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nm2FWLz9sQv; Wed, 30 Oct 2019 23:14:19 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: aaa351504449c4babb80753c72920e4b25fbd8a9
In-Reply-To: <157062986936.23016.10146169203560084401.stgit@hbathini.in.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/configs: add FADump awareness to skiroot_defconfig
Message-Id: <4736nm2FWLz9sQv@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:19 +1100 (AEDT)
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

On Wed, 2019-10-09 at 14:04:29 UTC, Hari Bathini wrote:
> FADump is supported on PowerNV platform. To fulfill this support, the
> petitboot kernel must be FADump aware. Enable config PRESERVE_FA_DUMP
> to make the petitboot kernel FADump aware.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aaa351504449c4babb80753c72920e4b25fbd8a9

cheers
