Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A6F30D9B2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:22:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW16H0mZ0zF1dn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4DW09R3kXxzDwt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09Q6g3Fz9vFB; Wed,  3 Feb 2021 22:40:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20201212142707.2102141-1-clg@kaod.org>
References: <20201212142707.2102141-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/vas: Fix IRQ name allocation
Message-Id: <161235200551.1516112.12114282419997734153.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:26 +1100 (AEDT)
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 12 Dec 2020 15:27:07 +0100, Cédric Le Goater wrote:
> The VAS device allocates a generic interrupt to handle page faults but
> the IRQ name doesn't show under /proc. This is because it's on
> stack. Allocate the name.

Applied to powerpc/next.

[1/1] powerpc/vas: Fix IRQ name allocation
      https://git.kernel.org/powerpc/c/9dd31b11370380c488c8f2d347058617cd3fff99

cheers
