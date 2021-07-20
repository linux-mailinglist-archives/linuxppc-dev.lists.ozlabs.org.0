Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E571C3CF43A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 08:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTSrD4qdFz3bfk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 16:05:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PlZqnYBf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+d721ffb997130df132c6+6540+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=PlZqnYBf; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTSqh3v8mz2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 16:05:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xo2+BXQHItnxNJhVgG4zVbHYnMLsWJSV/TYOAQ+LULo=; b=PlZqnYBfjarsc8dkKeEA6qDvnn
 EkEdH+uR1mGSy+NzSb0UqFrT9stVKc1KdGeLOpo2ihsIjh+VHV1EqpXjdFQWb9AY7rOMbZJXOOZhn
 1h3MB5xJ27u0Of29QELCsxqdzVeJxNMHNp//J1G/jBQ7+9ej5xkCyFRNTer0JNpfwqWZspKyx3hPw
 opwkZ5soOWPHENTN5kAiuMvolFMNwkfVjBnBHKfm/NniA2k1y8Vy1Kz9PsoNmcFaVYCptAAphuNLy
 oKrmX6kAha1Tk9aWjFqVOd82NHJAOOWYw12i61EMBQkzJBLRP4wHQa8j4wcyymTim8cLoyvKtkngL
 PM730Bng==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m5irU-007oCE-Hk; Tue, 20 Jul 2021 06:04:20 +0000
Date: Tue, 20 Jul 2021 07:04:12 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Subject: Re: [RFC 1/2] ppc/fpu: Add generic FPU api similar to x86
Message-ID: <YPZnXDQLwV70qyrb@infradead.org>
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
 <20210719195211.520428-2-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719195211.520428-2-Anson.Jacob@amd.com>
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
Cc: Harry.Wentland@amd.com, Sunpeng.Li@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, amd-gfx@lists.freedesktop.org,
 Bhawanpreet.Lakha@amd.com, Aurabindo.Pillai@amd.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 19, 2021 at 03:52:10PM -0400, Anson Jacob wrote:
> - Add kernel_fpu_begin & kernel_fpu_end API as x86
> - Add logic similar to x86 to ensure fpu
>   begin/end call correctness
> - Add kernel_fpu_enabled to know if FPU is enabled
> 
> Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>

All the x86 FPU support is EXPORT_SYMBOL_GPL for a good reason, so
please stick to that.
