Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1872618B7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 20:00:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmCcG6DpXzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 04:00:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=TgU0nbUg; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmCYm62sJzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 03:58:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DO6W80RdfG9P9Z4fc9rbaY/MdeJfPrgZXo3Rg960r0c=; b=TgU0nbUgP8phE3d+0e2QoGBHwD
 feFtPdBAtdEUbNiMqPm/NVSd+CE+MM4/wZoKFaY/3kaNkarsSzAEcimpK4Do9wIl8maTrW1Du71hI
 zYZecYMsVtVLhzfUUyza+suNgTeHebQ9tS/p/NnPhV46tR8hb5sGj6vP7cQQJ7v3VRm4/NQZE4o0z
 MiknYyoeDKA44fWsJis4tcZnyeeGSMzSmr+aBA6WwkfNnxOv3vVdchd4A4Mtx9/JxBIMB6UqHe9uN
 IEoyAnN5V/5vTSoXA58/nEkv6c8+IFyOe0p9BxadW9g/kkC1i3MHF8x/igPFUkuECYrfkt6caA2j2
 Js+InoZA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFhsh-0006Ym-Vv; Tue, 08 Sep 2020 17:58:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9ED99307590;
 Tue,  8 Sep 2020 19:58:08 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8601D24C37E82; Tue,  8 Sep 2020 19:58:08 +0200 (CEST)
Date: Tue, 8 Sep 2020 19:58:08 +0200
From: peterz@infradead.org
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH -next] fork: silence a false postive warning in __mmdrop
Message-ID: <20200908175808.GX1362448@hirez.programming.kicks-ass.net>
References: <20200604150344.1796-1-cai@lca.pw>
 <20200722100637.GR119549@hirez.programming.kicks-ass.net>
 <20200722131900.GA4041@lca.pw>
 <20200722134406.GN10769@hirez.programming.kicks-ass.net>
 <20200908165043.GD5147@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908165043.GD5147@lca.pw>
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
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 08, 2020 at 12:50:44PM -0400, Qian Cai wrote:
> > No, you're talking nonsense. We must not free @mm when
> > 'current->active_mm == mm', never.
> 
> Yes, you are right. It still trigger this below on powerpc with today's
> linux-next by fuzzing for a while (saw a few times on recent linux-next before
> as well but so far mostly reproducible on powerpc here). Any idea?

If you can reliably reproduce this, the next thing is to trace mm_count
and figure out where it goes side-ways. I suppose we're looking for an
'extra' decrement.

Mark tried this for a while but gave up because he couldn't reliably
reproduce.
