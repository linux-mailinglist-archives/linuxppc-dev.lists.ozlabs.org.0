Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B677FC41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:41:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=afbiIZBk;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=aU7GlH1E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRW413wClz3cR8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=afbiIZBk;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=aU7GlH1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:400::1; helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRW340k3Pz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:40:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=vIZEApjN48v7cjxMWecDniUYGxJ1pBYdlqtVcwGIpD4=;
	b=afbiIZBkDs4heKfhbghMmeD4NDauTO4zHYXx7GwvDSoUudh5dRzdfzzzZ9TKJYNq5o2Zg9gPPzx/2
	 pO1mBnTUHH68D10xoCEu/g/ELHOKcwA42C5FOdHCySvCwKAHDebv8MqGiWexGlAcBu57+ejcULfnjt
	 psejozQNn0kflhd4mUCCOVy1UGLKwe1oK9Eq6FxqQFHjpAZAQqFgXDq4NcLE5HBd7opM9kFrnU6/sG
	 FDik21/qNeoWx9b651AEYuM9i2W6oZB/9CoSVodFUEQBfZkonFXsRbw1NcNqUqLFVrJfu1KiTvWU5U
	 jU48fKXHb2ME7TvDFkcX0nn6TsxXioQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=vIZEApjN48v7cjxMWecDniUYGxJ1pBYdlqtVcwGIpD4=;
	b=aU7GlH1EhJat8ieYjr1tdfY1IaPGhPENN3XtgpOGEdP2VKMUUpnLUAsd17kC/5B3icem4A1j4Pt4I
	 BGw03biAg==
X-HalOne-ID: a3bc9125-3d1c-11ee-8c77-c5367ef0e45e
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id a3bc9125-3d1c-11ee-8c77-c5367ef0e45e;
	Thu, 17 Aug 2023 16:39:33 +0000 (UTC)
Date: Thu, 17 Aug 2023 18:39:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/9] sparc: Remove <asm/ide.h>
Message-ID: <20230817163931.GA93297@ravnborg.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <d26247f29e65b017c06e993f8aedece13a100369.1692288018.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d26247f29e65b017c06e993f8aedece13a100369.1692288018.git.geert@linux-m68k.org>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 06:07:35PM +0200, Geert Uytterhoeven wrote:
> As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
> v5.14, there are no more generic users of <asm/ide.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
