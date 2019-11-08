Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C1F45AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 12:27:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478dK103FwzF6s2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 22:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rjwysocki.net (client-ip=79.96.170.134;
 helo=cloudserver094114.home.pl; envelope-from=rjw@rjwysocki.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478dGV31dqzF66N
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 22:24:47 +1100 (AEDT)
Received: from 79.184.254.83.ipv4.supernova.orange.pl (79.184.254.83) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id c76056e31ef5e5d1; Fri, 8 Nov 2019 12:24:42 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Date: Fri, 08 Nov 2019 12:24:42 +0100
Message-ID: <4367615.jSCgeRn5tF@kreacher>
In-Reply-To: <20191021145149.31657-5-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-5-geert+renesas@glider.be>
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Breno =?ISO-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, amd-gfx@lists.freedesktop.org,
 Casey Leedom <leedom@chelsio.com>, linux-pm@vger.kernel.org,
 Pensando Drivers <drivers@pensando.io>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, October 21, 2019 4:51:48 PM CET Geert Uytterhoeven wrote:
> There is no need to cast a typed pointer to a void pointer when calling
> a function that accepts the latter.  Remove it, as the cast prevents
> further compiler checks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Greg, have you taken this one by any chance?

> ---
>  drivers/power/avs/smartreflex.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/avs/smartreflex.c b/drivers/power/avs/smartreflex.c
> index 4684e7df833a81e9..5376f3d22f31eade 100644
> --- a/drivers/power/avs/smartreflex.c
> +++ b/drivers/power/avs/smartreflex.c
> @@ -905,7 +905,7 @@ static int omap_sr_probe(struct platform_device *pdev)
>  	sr_info->dbg_dir = debugfs_create_dir(sr_info->name, sr_dbg_dir);
>  
>  	debugfs_create_file("autocomp", S_IRUGO | S_IWUSR, sr_info->dbg_dir,
> -			    (void *)sr_info, &pm_sr_fops);
> +			    sr_info, &pm_sr_fops);
>  	debugfs_create_x32("errweight", S_IRUGO, sr_info->dbg_dir,
>  			   &sr_info->err_weight);
>  	debugfs_create_x32("errmaxlimit", S_IRUGO, sr_info->dbg_dir,
> 




