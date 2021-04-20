Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6FF366222
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 00:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPylF6NHvz302m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 08:19:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=mzrAyP3z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=mzrAyP3z; 
 dkim-atps=neutral
X-Greylist: delayed 210 seconds by postgrey-1.36 at boromir;
 Tue, 20 Apr 2021 21:27:06 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPhGy4DTGz2xdP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 21:27:06 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KBMmuM012376; Tue, 20 Apr 2021 11:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=R7JGUmF3J71wLA6dPwUce8FwqmxU6JTnhs1XaoTWtpc=;
 b=mzrAyP3z3vTbOYF05fKTtm1FSfsRhaXIMtNI32junvaq2xixqdu4DFtiOEnKHMCjmDAu
 pzOmg6bFqIFulJfFAK3gAc4G1ubri2zL7y+ukl2ZTNZd4enmkHEeJ6kOxa09vXbI9Cau
 pxckDe5aQNXRp1SihBx1WvxHHU5bOAl0qwzbdRlKb6bAcGZRRvbBEvMsbe3h/AM/l6mO
 6K0B0emzos5cXJDAWeD+zogdWeN4yukpTfk465biG7Agf/JhaT7Tq2FLJjNIss62qUS9
 j74qQsLbz2k9Dn5eRznUZ+6NPhFOVGc2XKyCruqh+CG4TG6qi4y3ofFXm87t+4F6DYgG CQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 381bjn86tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 11:22:48 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13KBKXsp006877;
 Tue, 20 Apr 2021 11:22:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3809k06m19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 11:22:47 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13KBKAbB005467;
 Tue, 20 Apr 2021 11:22:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 3809k06m07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 11:22:46 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13KBMEHV030572;
 Tue, 20 Apr 2021 11:22:18 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 20 Apr 2021 04:22:13 -0700
Date: Tue, 20 Apr 2021 14:21:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for
 soc_device_match returning -EPROBE_DEFER
Message-ID: <20210420112151.GE1981@kadam>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
 <CAMuHMdUbrPxtJ9DCP0_nFrReuuO4vFY2J79LrKY82D7bCOfzRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUbrPxtJ9DCP0_nFrReuuO4vFY2J79LrKY82D7bCOfzRw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: e0r_GcH24oUhB4PQiI_vI2-dauff_ZRM
X-Proofpoint-ORIG-GUID: e0r_GcH24oUhB4PQiI_vI2-dauff_ZRM
X-Mailman-Approved-At: Wed, 21 Apr 2021 08:18:41 +1000
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 peter.ujfalusi@gmail.com, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, horia.geanta@nxp.com, khilman@baylibre.com,
 joro@8bytes.org, narmstrong@baylibre.com, linux-staging@lists.linux.dev,
 iommu@lists.linux-foundation.org, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linus.walleij@linaro.org, linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, will@kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, balbi@kernel.org,
 tomba@kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
 robert.foss@linaro.org, leoyang.li@nxp.com, linux@prisktech.co.nz,
 vkoul@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 daniel@ffwll.ch, j-keerthy@ti.com, dmaengine@vger.kernel.org,
 Roy.Pledge@nxp.com, jyri.sarha@iki.fi, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 19, 2021 at 10:20:13AM +0200, Geert Uytterhoeven wrote:
> Hi Alice,
> 
> CC Arnd (soc_device_match() author)
> 
> On Mon, Apr 19, 2021 at 6:28 AM Alice Guo (OSS) <alice.guo@oss.nxp.com> wrote:
> > From: Alice Guo <alice.guo@nxp.com>
> >
> > In i.MX8M boards, the registration of SoC device is later than caam
> > driver which needs it. Caam driver needs soc_device_match to provide
> > -EPROBE_DEFER when no SoC device is registered and no
> > early_soc_dev_attr.
> 
> I'm wondering if this is really a good idea: soc_device_match() is a
> last-resort low-level check, and IMHO should be made available early on,
> so there is no need for -EPROBE_DEFER.
> 
> >
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/base/soc.c
> > +++ b/drivers/base/soc.c
> > @@ -110,6 +110,7 @@ static void soc_release(struct device *dev)
> >  }
> >
> >  static struct soc_device_attribute *early_soc_dev_attr;
> > +static bool soc_dev_attr_init_done = false;
> 
> Do you need this variable?
> 
> >
> >  struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
> >  {
> > @@ -157,6 +158,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
> >                 return ERR_PTR(ret);
> >         }
> >
> > +       soc_dev_attr_init_done = true;
> >         return soc_dev;
> >
> >  out3:
> > @@ -246,6 +248,9 @@ const struct soc_device_attribute *soc_device_match(
> >         if (!matches)
> >                 return NULL;
> >
> > +       if (!soc_dev_attr_init_done && !early_soc_dev_attr)
> 
> if (!soc_bus_type.p && !early_soc_dev_attr)

There is one place checking this already.  We could wrap it in a helper
function:

static bool device_init_done(void)
{
	return soc_bus_type.p ? true : false;
}

regards,
dan carpenter
