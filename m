Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BAA411ED6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 19:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCsB451XJz2yg7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 03:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=91.221.196.215; helo=mx1.smtp.larsendata.com;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4505 seconds by postgrey-1.36 at boromir;
 Tue, 21 Sep 2021 03:33:56 AEST
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCs9c6nK0z2xrg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 03:33:54 +1000 (AEST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 42d45781-1a2e-11ec-a02a-0050568c148b;
 Mon, 20 Sep 2021 16:17:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4B7C8194BFA;
 Mon, 20 Sep 2021 18:17:32 +0200 (CEST)
Date: Mon, 20 Sep 2021 18:17:37 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] agp: define proper stubs for empty helpers
Message-ID: <YUi0Ie66CDhqxgrn@ravnborg.org>
References: <20210920121728.94045-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920121728.94045-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 20, 2021 at 02:17:19PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The empty unmap_page_from_agp() macro causes a warning when
> building with 'make W=1' on a couple of architectures:
> 
> drivers/char/agp/generic.c: In function 'agp_generic_destroy_page':
> drivers/char/agp/generic.c:1265:28: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>  1265 |   unmap_page_from_agp(page);
> 
> Change the definitions to a 'do { } while (0)' construct to
> make these more reliable.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
