Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829A23D894
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 11:27:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMjnk5vXMzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+51efaf08c314c7af39ff+6192+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=vMRW28d8; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMjlm2zPwzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 19:25:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uwezxHeiyaP46V7+gw/LOWQd5VBMStsMPyZz8mwar24=; b=vMRW28d8XB+LZ5/F3umjcu/6s1
 JHiPpaXc8g6GMXfgxJmovJDNR85MQigTyuMIc87kgKR8w1ybRJ6EJGS/8wokC7SWRiJG4l2cqIa8O
 ph1ZgeflH0bhuhMQB/nWqBkZicGkUITCREPG3bLaL3HtanQuN+eq6dvpoJi8bwKRGZiXrGG99uaDc
 tTeOtTmBq8DOdfXQggCi3dhHv3WXjKJVPlI1fxXBb7wxOzFJQmaSFQ+EqW40m6kkVQy2/qYB2GMXj
 VBS7Uxr+iQfqyG6ynPUuysB6SQQZIUdrfKObvvVhV3U8QPTTt51QrHx2/e4DMH2VO6zrNTYm2/4hg
 Mpc9ptlg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k3c9j-0000nU-Ou; Thu, 06 Aug 2020 09:25:47 +0000
Date: Thu, 6 Aug 2020 10:25:47 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal: Move and simplify get_clean_sp()
Message-ID: <20200806092547.GA2544@infradead.org>
References: <04169f40c09682ce5747518268ca84285bc17fbc.1596703345.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04169f40c09682ce5747518268ca84285bc17fbc.1596703345.git.christophe.leroy@csgroup.eu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 06, 2020 at 08:50:20AM +0000, Christophe Leroy wrote:
> get_clean_sp() is only used in kernel/signal.c . Move it there.
> 
> And GCC is smart enough to reduce the function when on PPC32, no
> need of a special PPC32 simple version.

What about just open coding it in the only caller, which would seem even
cleaner?
