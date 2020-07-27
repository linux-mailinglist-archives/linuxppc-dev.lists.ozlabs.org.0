Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCD22EBBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 14:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFdsY1Ms3zDqq7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 22:09:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFdq53JlqzF0fc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 22:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BFdq50rnKz9sRN; Mon, 27 Jul 2020 22:07:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFdq509X0z9sRR; Mon, 27 Jul 2020 22:07:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200724131609.1640533-1-mpe@ellerman.id.au>
References: <20200724131609.1640533-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/sstep: Fix incorrect CONFIG symbol in scv handling
Message-Id: <159585165745.634388.2453305840146591215.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 22:07:44 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 23:16:09 +1000, Michael Ellerman wrote:
> When I "fixed" the ppc64e build in Nick's recent patch, I typoed the
> CONFIG symbol, resulting in one that doesn't exist. Fix it to use the
> correct symbol.

Applied to powerpc/next.

[1/1] powerpc/sstep: Fix incorrect CONFIG symbol in scv handling
      https://git.kernel.org/powerpc/c/826b07b190c8ca69ce674f13b4dc9be2bc536fcd

cheers
