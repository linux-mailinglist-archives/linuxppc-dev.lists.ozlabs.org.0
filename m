Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A3E5039
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 17:36:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4707W10zCRzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 02:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.orG
Delivered-To: linuxppc-dev@lists.ozlabs.orG
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4707KR49pszDqVp
 for <linuxppc-dev@lists.ozlabs.orG>; Sat, 26 Oct 2019 02:27:54 +1100 (AEDT)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iO1Un-0001vM-5Z; Fri, 25 Oct 2019 23:27:21 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iO1Ue-0007uU-5p; Fri, 25 Oct 2019 23:27:12 +0800
Date: Fri, 25 Oct 2019 23:27:12 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/5] crypto: nx - Improve debugfs_create_u{32,64}()
 handling for atomics
Message-ID: <20191025152712.26q6s5gbygdxd33j@gondor.apana.org.au>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021145149.31657-2-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Kevin Hilman <khilman@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Casey Leedom <leedom@chelsio.com>,
 linux-pm@vger.kernel.org, Pensando Drivers <drivers@pensando.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 21, 2019 at 04:51:45PM +0200, Geert Uytterhoeven wrote:
> Variables of type atomic{,64}_t can be used fine with
> debugfs_create_u{32,64}, when passing a pointer to the embedded counter.
> This allows to get rid of the casts, which prevented compiler checks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/crypto/nx/nx_debugfs.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
