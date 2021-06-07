Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7B39D756
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 10:28:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz630209Qz3btL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 18:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I2WarOQv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+51016fb3e20a9aefc17f+6497+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=I2WarOQv; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz62Q27z0z2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 18:28:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Gm/Z4ZEed7fwYvc2lrsvQUFJOpzqbnReZh3AcOm9gYM=; b=I2WarOQvkgsFqNSXPKcah6GQKq
 jeBgdpqKK12q7hvx9wBGPxm0WF2ziLRAM13cchy7N0XoaQFj60Oms2wN7vOUoZop31TAr/CpEGDE1
 WVh0S8Q0z8rnEi2nxIg1c7C8lmB82PX/0spN3ewh3XfKU0wZYrsSuM1HiEFtraeRnlHB3Nrnh9WBa
 J+PYkXN3ukUXz+LSQ1Ax/FN0G5Ia1WrwxvB0SegWTzymw8QUoZJL92sgtPiKnZmA/kKjhXLR4Hwuo
 78NIpBQ7E20T+t83m3NQHnOtw3aj55onG1ks81EiR5nz1iKutFFNsPyOw3sxOc2+TA7JmJ0V9xxuC
 QoULjKTQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lqAaW-00FWsl-Qa; Mon, 07 Jun 2021 08:26:26 +0000
Date: Mon, 7 Jun 2021 09:26:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/21] Rid W=1 warnings from IDE
Message-ID: <YL3YMGl9kmtv55B/@infradead.org>
References: <20210602101722.2276638-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602101722.2276638-1-lee.jones@linaro.org>
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
Cc: linux-ide@vger.kernel.org, Mike Waychison <crlf@sun.com>,
 Paul Mackerras <paulus@samba.org>,
 "Christopher J. Reimer" <reimer@doe.carleton.ca>, Tim Hockin <thockin@sun.com>,
 Erik Andersen <andersee@debian.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
 CJ <cjtsai@ali.com.tw>, Sergei Shtylyov <sshtylyov@ru.mvista.com>,
 Duncan Laurie <void@sun.com>, Scott Snyder <snyder@fnald0.fnal.gov>,
 Gadi Oxman <gadio@netvision.net.il>, Andre Hedrick <andre@linux-ide.org>,
 Christian Brunner <chb@muc.de>, Jens Axboe <axboe@suse.de>,
 or <source@mvista.com>, Benoit Poulot-Cazajous <poulot@chorus.fr>,
 Robert Bringman <rob@mars.trion.com>, linux-kernel@vger.kernel.org,
 Clear Zhang <Clear.Zhang@ali.com.tw>, Mark Lord <mlord@pobox.com>,
 Adrian Sun <a.sun@sun.com>, Frank Tiernan <frankt@promise.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please don't touch this code as it is about to be removed entirely.
