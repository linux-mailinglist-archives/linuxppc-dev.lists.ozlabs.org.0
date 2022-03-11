Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C74D5A0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 05:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFD4g3JNnz3bVK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 15:49:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RiCFEZwB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=RiCFEZwB; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFD42601lz2xTn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 15:49:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42D80B82A7B;
 Fri, 11 Mar 2022 04:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85350C340EC;
 Fri, 11 Mar 2022 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1646974158;
 bh=ieKn790GjrKSPuQn2caaZWrzBmooKYSB6PRk5jmqHFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RiCFEZwBuQmmlgqHA+kqM/K6eJdBD9xlftp7cCJ5OGOGTeIyz87Fuq0iGjyKcsQBL
 vBl7/JIVlxHBbL5/2DwFurRmzUKDbDDJDSAgMikQ8N1XkICyckwdAugEPNVo1fpCdR
 wy5s2Gdn/tqDbRW9VclshFIYtN0XHH7w6epPguo8=
Date: Thu, 10 Mar 2022 20:49:17 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
Message-Id: <20220310204917.3d42e6cf3088f7cf1c7fe7a6@linux-foundation.org>
In-Reply-To: <877d91m7wd.fsf@mpe.ellerman.id.au>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
 <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
 <877d91m7wd.fsf@mpe.ellerman.id.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Mar 2022 15:26:42 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:

> > What will be the merge strategy ? I guess it's a bit late to get it 
> > through powerpc tree, so I was just wondering whether we could get 
> > patches 2 to 5 in mm this cycle, and the powerpc ones next cycle ?
> 
> Yeah I didn't pick it up because the mm changes don't have many acks and
> I'm always nervous about carrying generic mm changes.
> 
> It would be my preference if Andrew could take 2-5 through mm for v5.18,
> but it is quite late, so I'm not sure how he will feel about that.

5.18 isn't a problem.  Perhaps you meant 5.17, which would be real tough.

Can we take a look after 5.18-rc1?
