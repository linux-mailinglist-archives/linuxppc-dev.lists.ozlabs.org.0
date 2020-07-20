Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FAB226177
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:58:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9NcF1Sw3zDqLH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:58:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9NYc2WqXzDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 23:56:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UtNpR9qY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9NYb50Gwz9sRN;
 Mon, 20 Jul 2020 23:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595253379;
 bh=YOfuz1HsYtbnV/gQKJDx2PgsL0NDBwej/3aYQDdUqGo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UtNpR9qY+aziAfMelw6mMbHvTT8vmEpFbf7M2wk2aolgx3ItJlMw+Ac2z0mmvp0Hx
 b2vcFoPLJJDL7WOG6W25xEjEpPswwyMK6F4d+Ac7FtcKgtXl+u5a+zktKGddv6pFZX
 est1RWIz+ZxJ63clfLHcLgWir7MQX4r+8AKpxp5BcHcXq95FqkcCZukPFfQXvrnwLH
 NVFlLie6H/9iRiR4r7zhs1culBLAzd2YFh0DnPcPi+9cdfwQHSpDksINGR5NXw53hG
 BuPhY5Btk25Je8sV436Ou8vfV2X0ughs95lwCn4Fsrk1+/U1cuJqlwalwbMTBkCI2/
 9w+ri/rNIUYIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 07/11] Powerpc/numa: Detect support for coregroup
In-Reply-To: <20200714043624.5648-8-srikar@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-8-srikar@linux.vnet.ibm.com>
Date: Mon, 20 Jul 2020 23:56:19 +1000
Message-ID: <875zaithmk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> Add support for grouping cores based on the device-tree classification.
> - The last domain in the associativity domains always refers to the
> core.
> - If primary reference domain happens to be the penultimate domain in
> the associativity domains device-tree property, then there are no
> coregroups. However if its not a penultimate domain, then there are
> coregroups. There can be more than one coregroup. For now we would be
> interested in the last or the smallest coregroups.

Should I know what a "coregroup" is? It's not a term I'm familiar with.

When you repost can you expand the Cc list to include lkml and
scheduler/topology folks please.

cheers
