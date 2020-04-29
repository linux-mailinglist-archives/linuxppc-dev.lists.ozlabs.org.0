Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6F1BD4CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:44:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bps928nKzDr43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpcK0TRMzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Z4nDe29Z; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BpcF3W3jz9sSl;
 Wed, 29 Apr 2020 16:33:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1588141999; bh=3MKZzbOxV7CZNMIIu+rSiDhnp5u7vnphPsD8HQA8wEU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Z4nDe29ZwLxjR5q8UZrt43rf3HI+UXJI4Qv80xc4hFTm9Ohhfomp65bwGqNZCZAb+
 WNjaEHfky/Hguil8WFXRH5Eub3FuVzDhKzHVF0dU7iRTbKB1p+pT7oAjM5pL3ODtY4
 Foo1vHiVPOS9UiCaKAQ/zA7PEt7FG4edcizX/Y/voDxjIsuy4lhqJP5AkaL6ubp3ap
 33bx/2otMrJJ/cVRzDrZJpVG2RG5C9zLy0ce78TKCkeHls5PubHHZ4ZoEnghbTnJh/
 CAhXPrwqOTSk5UK4FObUuxAjZUKfciLaJNbZZnxax30DJeMceYpwc5r5CHErd/bu6s
 hCQJ4Ya1niVUw==
Message-ID: <2014678ca837f6aaa4cf23b4ea51e4805146c36d.camel@ozlabs.org>
Subject: Re: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
From: Jeremy Kerr <jk@ozlabs.org>
To: Christoph Hellwig <hch@lst.de>
Date: Wed, 29 Apr 2020 14:33:13 +0800
In-Reply-To: <20200429061514.GD30946@lst.de>
References: <20200427200626.1622060-2-hch@lst.de>
 <20200428120207.15728-1-jk@ozlabs.org> <20200428171133.GA17445@lst.de>
 <e1ebea36b162e8a3b4b24ecbc1051f8081ff5e53.camel@ozlabs.org>
 <20200429061514.GD30946@lst.de>
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

> And another one that should go on top of this one to address Al's other
> compaint:

Yeah, I was pondering that one. The access_ok() is kinda redundant, but
it does avoid forcing a SPU context save on those errors.

However, it's not like we really need to optimise for the case of
invalid addresses from userspace. So, I'll include this change in the
submission to Michael's tree. Arnd - let me know if you have any
objections.

Cheers,


Jeremy


