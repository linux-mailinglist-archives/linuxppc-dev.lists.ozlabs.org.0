Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8D2D087C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 01:15:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq3jj1lW0zDqbw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 11:15:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq3h75Q85zDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 11:13:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256
 header.s=202006 header.b=hH5+S65x; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq3h66qmfz9sW0;
 Mon,  7 Dec 2020 11:13:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=popple.id.au;
 s=202006; t=1607300039;
 bh=kLW1k+REnX3bP/wtpFOvQ2GR20yyvPOKPYd5/ZM/eW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hH5+S65xSVWTwnhJhgwICAA7vKIpro1ZPn8i75op+bUF1wNVK5vUrYwS7qyk6D4z+
 Mh8TKdy63exXo0dv7YcZ9HFOttCSuAi4kYMmaCbU8jx58IC+nWCABQGEXrO6tSILQj
 iisjd2wmLNkgRtN3IPQzE7p1KHbahj0jK6H1QuNw1oRIWa6VebpcPIJhE+omWEHiWI
 tqsrzxhii53vP4p70uYx8WtryBKAZLqYpanREnTtySJ2M7ezopW3VzWjFmQfkEndS0
 9ofoSeyU9k6GBHOgo4gvm+3Izu4dheRaC3LF5wzt4OOomcRhtY/Hbk/xbCBwLYjnTs
 bxJn2rkfLJzow==
From: Alistair Popple <alistair@popple.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
Date: Mon, 07 Dec 2020 11:13:58 +1100
Message-ID: <3357700.zKBEflIBxY@cleo>
In-Reply-To: <20201204165244.GA3390@ram-ibm-com.ibm.com>
References: <20201203050812.5234-1-alistair@popple.id.au>
 <20201204101841.GA621541@in.ibm.com>
 <20201204165244.GA3390@ram-ibm-com.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linuxppc-dev@lists.ozlabs.org, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday, 5 December 2020 3:52:44 AM AEDT Ram Pai wrote:
> On Fri, Dec 04, 2020 at 03:48:41PM +0530, Bharata B Rao wrote:
> > On Thu, Dec 03, 2020 at 04:08:12PM +1100, Alistair Popple wrote:

> This patch certainly looks like the problem, that has been hurting
> us for a while.  Let me run this patch through my SVM tests.  Looks very
> promising.
> 
> BTW: The code does a similar thing while paging out.  It pages out from the
> UV, and then does the migration. Is there a bug there aswell?

As specified the migrate_pages_vma() API can fail to migrate device private 
pages. However the fix was less obvious to me, and in practice I don't think it 
will ever fail for device private pages as you don't have the same races to 
establish the page and device private pages can't be pinned.

It might be worth adding some kind of warning though in case this ever 
changes.

 - Alistair
 
> RP
> 




