Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92403315C43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 02:31:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db2KT0cXbzDvZG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 12:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db2Gf6zcHzDspZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 12:28:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=jmtx5CCE; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Db2Gd4pBGz9sVJ; Wed, 10 Feb 2021 12:28:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1612920537; bh=BnOJb4ZECVpQ0/TDZLWFgS+PJkwVFMihslRyuD73OY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmtx5CCELjX9ivmdhCV6xHy1KOsfFoVuol8Std0nWY4Q+EbqOS3AWf/lPU7osn5Et
 5iyGTrVI7hRGzIlEc1YNdwn/K39dDy/BqkmS/Iss6zlWCK7eJUKTyg7CLmphq/ci+q
 JGJ/Pwy0cf3too90aD0A0TeiR6mWL5XhezPCPwnRcKtyI/AkYdv7h7r23J+AMJW7sa
 MEPTzpHZV9whA1txzax1Md0PgiBOkyWciTOkcN5+OspQvnpCa3isiejs+BFHpIb1GA
 /SpLZiEIx09QQ2RjvcC22IRBAmudiJw8K/A1rqk97yFv3ZAR+tEcshmiO8MXVjt6NR
 WTXyuDZnLhxmw==
Date: Wed, 10 Feb 2021 12:28:52 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] KVM: PPC: Book3S HV: Fix radix guest SLB side channel
Message-ID: <20210210012852.GD2854001@thinks.paulus.ozlabs.org>
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118062809.1430920-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 18, 2021 at 04:28:07PM +1000, Nicholas Piggin wrote:
> The slbmte instruction is legal in radix mode, including radix guest
> mode. This means radix guests can load the SLB with arbitrary data.
> 
> KVM host does not clear the SLB when exiting a guest if it was a
> radix guest, which would allow a rogue radix guest to use the SLB as
> a side channel to communicate with other guests.

No, because the code currently clears the SLB when entering a radix
guest, which you remove in the next patch.  I'm OK with moving the SLB
clearing from guest entry to guest exit, I guess, but I don't see that
you are in fact fixing anything by doing so.

Paul.
