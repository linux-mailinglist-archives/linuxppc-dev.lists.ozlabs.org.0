Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1A1E636E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 16:12:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XqR14pZCzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 00:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XqFn23qmzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:04:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49XqFm6trTz9sPK; Fri, 29 May 2020 00:04:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XqFm4B9Gz9sSW; Fri, 29 May 2020 00:04:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200526061808.2472279-1-mpe@ellerman.id.au>
References: <20200526061808.2472279-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix restore of NV GPRs after facility
 unavailable exception
Message-Id: <159067468158.2993487.4331119823135387908.b4-ty@ellerman.id.au>
Date: Fri, 29 May 2020 00:04:44 +1000 (AEST)
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 May 2020 16:18:08 +1000, Michael Ellerman wrote:
> Commit 702f09805222 ("powerpc/64s/exception: Remove lite interrupt
> return") changed the interrupt return path to not restore non-volatile
> registers by default, and explicitly restore them in paths where it is
> required.
> 
> But it missed that the facility unavailable exception can sometimes
> modify user registers, ie. when it does emulation of move from DSCR.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix restore of NV GPRs after facility unavailable exception
      https://git.kernel.org/powerpc/c/595d153dd1022392083ac93a1550382cbee127e0

cheers
