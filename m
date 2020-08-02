Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C06235730
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMmm43JszDqPk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT20lvmzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT151Ccz9sTW; Sun,  2 Aug 2020 23:35:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, David Lamparter <equinox@diac24.net>
In-Reply-To: <20180920230422.GK487685@eidolon.nox.tf>
References: <20180920230422.GK487685@eidolon.nox.tf>
Subject: Re: [PATCH] powerpc/fsl/dts: add missing P4080DS I2C devices
Message-Id: <159637523520.42190.2475863723977768291.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:01 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Sep 2018 01:04:22 +0200, David Lamparter wrote:
> This just adds the zl2006 voltage regulators / power monitors and the
> onboard I2C eeproms.  The ICS9FG108 clock chip doesn't seem to have a
> driver, so it is left in the DTS as a comment.  And for good measure,
> the SPD eeproms are tagged as such.

Applied to powerpc/next.

[1/1] powerpc/fsl/dts: add missing P4080DS I2C devices
      https://git.kernel.org/powerpc/c/d3c61954fc1827df571e235b9a98e10108ef5c3d

cheers
