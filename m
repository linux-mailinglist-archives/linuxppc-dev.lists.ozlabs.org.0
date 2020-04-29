Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB311BD1C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 03:37:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bh3R0KsczDqxH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 11:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bh1t6XCzzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 11:36:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=sLXdyA3a; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Bh1s0GwXz9sSb;
 Wed, 29 Apr 2020 11:36:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1588124194; bh=aX6yuTZNfS6VpnGOKXY3BwUwvbi+L3YPZlT8aZPIt/Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sLXdyA3asl4Ggu+8sp54jw2RxX89A307Eca03BspfzrH5LAbDE8tcQ7GXelho0cJ4
 h0+ugwPDC0ylK0WrGGYom841yaBKVxl7ZDsBwTGt479MPHm3YLsyUenIawkyqeWeGK
 5DgdA4AH+ve27bFPyGSW2irceBlfdO/Gh7x7XdgVxt5LrczFlchU5WPu7RUCRPVQc1
 HfirjIkc2a/MCcXSnZbs+R2OHfX57P2JK9lUGvooL70+eH91x52qwtRjqokz+RhUfg
 Vh39zw4qpqmfBzNS5pZKFPyHdzDIS4NVysxTIj+8RIta8BZUH/ukIKyK7nrpvRDcTf
 UABIFc++ieJAQ==
Message-ID: <e1ebea36b162e8a3b4b24ecbc1051f8081ff5e53.camel@ozlabs.org>
Subject: Re: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
From: Jeremy Kerr <jk@ozlabs.org>
To: Christoph Hellwig <hch@lst.de>
Date: Wed, 29 Apr 2020 09:36:30 +0800
In-Reply-To: <20200428171133.GA17445@lst.de>
References: <20200427200626.1622060-2-hch@lst.de>
 <20200428120207.15728-1-jk@ozlabs.org> <20200428171133.GA17445@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

> FYI, these little hunks reduce the difference to my version, maybe
> you can fold them in?

Sure, no problem.

How do you want to coordinate these? I can submit mine through mpe, but
that may make it tricky to synchronise with your changes. Or, you can
include this change in your series if you prefer.

Cheers,


Jeremy


