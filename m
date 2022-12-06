Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACA644572
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:19:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRMwz2pyfz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=RFUbxY27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:7010::802; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=RFUbxY27;
	dkim-atps=neutral
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn20802.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::802])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRMvz0Gvrz3000
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:18:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdaQ7q72Lj2Sg5wreW+FEbshBRAeAtO+XQB/Ib18vIM9i8X8a0PUdtiA75YVvUKtQj49GUXgM7+LRkkT9BlN7+8xPyFZ/a3EIUH6xGkrvKlN/3t+uuWflnQHzQfLiwSdkrNFBj703mERGio0ST7j9KZaEtMYHzvjwLkCVGaQpNIRsasem1YEUgD9IGbFzhAUQenMe14bGE7ysny6pkb793x/e43x4A/0hY5y2zsqwzIrenHFjfq7O/oFvAsP3+XmTLYN5j9lb7/XWJ9KbavIke82hzSo1Li3iP4yFTcC6KDb3clIZjYWaFBM7DcxfVD0SSfQ1lLuuAwloGSUxllJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWS56LCTfrTyPjDhEbJz0+BgnjIr9N35uxhEGoU9JFA=;
 b=XQpmyoI3kreYZIiIxHbq6aGhYU5j95aTHj7PuObJUgxh+nRHQZ/mPExDOpK31F/6+27ANjfRfzRjkSagvuqNpmVmQJiLcM3Z+xIJjqhPTqc+ETSkWhA4OohgEbKRCgebfuHznmM84qIT6J+3UZN9YF4qqR3oH2Gf2pGMCUVS0+36++PtVmd7DR4zM8bO+kIH/QZIznWNDVLdLr8hnZcl+UtmUv4fIEE+q+7sMeQ3w4zjD4mLTkuRxcYdwP9FpsppfsRRLWdTBQfDMWwbJ4ui2xqNEPRil72D8dOO4to1CmGpgzgl13RexAxkBAdCH9+Cx5lS8hbzgBjShg10jyAN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWS56LCTfrTyPjDhEbJz0+BgnjIr9N35uxhEGoU9JFA=;
 b=RFUbxY272nXbQJtnElxW1pstjDKyKxDOIbMQ0aGhNQ7otEp24bueigB1G/iFCa9PKC+cbDW6EG6qXte8G9E1a3PRfW7WC68NPvvSERPB9K7FvFt4mKa+dYbAyzfBHPaBVZdTRwizqF+vjHFjndEqBEaPih7Ifqmir3xtPEoLbjhCTj00SZ/wdydfQWPBDZ4Bx/p6kxxziFbOogzVmSM4f6DmrYlt+VqKCKmszWi5CyotIA8uLSNmlscSdfmaVpIbRL5NgiMPTsjmrUMDfenCiXbzNp20pFeLysUbBr9KSoc6D32/89SjEaqD28LvR1vVMpN9qhbC9D2+YEhqUbjqgQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYWP286MB2317.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:17:57 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:17:57 +0000
Date: Tue, 6 Dec 2022 22:17:53 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH 1/6] hyperv: Make remove callback of hyperv driver void
 returned
Message-ID:  <TYCP286MB232352B671291649EB81F33BCA1B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <Y48pdr9DEmXShhFR@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y48pdr9DEmXShhFR@liuwe-devbox-debian-v2>
X-TMN: [5AWq+o4mcznM6BkaCRMdDIYjM9WRghia]
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221206141753.GA176233@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYWP286MB2317:EE_
X-MS-Office365-Filtering-Correlation-Id: 58920e56-fefd-42b5-6f1a-08dad794ab14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MUz5EFxAW9Kz9XsG63PupaquIUGIs7wYl7y60YI8UmQDQ9YV4bVoUnanW9J9JoZUm1DhsEzV+9hfosjpVNtk1Ywkwr3gH3oQjhn1NHhLcoKtLgE2r1Iq0VipqEcNZTU6d6aZOBu3DYNc1BvlBW2P5OFOwGADmodkJ2XJmAlJX+5WlFky51TxvVEwW/0KtT/80RH0VCENSzIvSjjgMHu6108jddWx7nOdnejIR4VBVc/bm5B2d3l4TDrFbyViGVRriALl04/CpB/y6IuPV8tKutwMrv7wAWlT2ALtp+/tUk28Mxxig93m2XtmZfaIOQA8nOEv3PlGdEp0sUEBitVrW+zn/q3EEh4orqoQUtb/jsJF8bqgfF1zPOxMQ2oLiPSzbci9d40zheMyJPmQrN8IcIesC6GCQbM3NaRGAtq8yH0DSDJsZlvfAL3uz0QYZsCXG/UbKTjMbIS0z6BiLyWfhjWSuY14doNCFSon5V9W3KvbNLO4e1btYOdCYvQEyNsy0CQ2LoDXeTnIr1SgujSK9IMZ7ip1edCzo33y//5c2CgzhIQ+dt4rX5KNXv5V6D+uOnizsLtgS6ZqhQ/dGzgh8dbX2qSyQcjERjr5cJ+r0O0F68keljywQlTQ8bHn0C/7ayGWZNNXTsKvBVciX7PliQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?M6JwybxQXH6HWJkHpkh0mbuH2znRmgTVfoxoRkaMWkj9xCiThIjLMnPTWrHL?=
 =?us-ascii?Q?ZY3waU6XZvEdDfv4/MhowUtD+kaVCqv6uGq4OD4NBgiwmSvaFcjKxnsLEj/k?=
 =?us-ascii?Q?NZg6uiIWz3S44iZS1o6pL52LjNXlggx287DSGEHw82Y5TuiDovdH1Q299GAb?=
 =?us-ascii?Q?T0okFiNlatolUTvV85ZdsEiiYbRRZvJDxye3XVqbSlNeavTvS8Z3cWdwfTA3?=
 =?us-ascii?Q?j8TtRocTwZUL7xUP7zHgevWTht0Q1beiyhckuVFoYjkvVgirndEN04HvXs8j?=
 =?us-ascii?Q?65tDOUTWIJy7bww/aqOegxKfBCVdwYzViIHOLLYO8OVbauH9+ZAQxqPf+iOY?=
 =?us-ascii?Q?zm6ej6m/A/oz74m3MzeQmAxk0hNo6cZRQPjwXJ3uahTlUJx2l45obUzHXR58?=
 =?us-ascii?Q?K8azt/77lk8LWG4QSq+BMJO0ReJY0awkqev6tEiKQ+/8ilqS/EFcoeF8vu3J?=
 =?us-ascii?Q?sEPTJoocjN8xLbEWo/7eiZGBIIOFwAa7pl1o9MCgslOpwoDRDX9pd7kAiarh?=
 =?us-ascii?Q?/ODgFnsWy8Qh+cmh0fI9B1BVseZyylpyNqI8bNprzuB88GfXm2hyhmMHBUfL?=
 =?us-ascii?Q?WimcWPpnGo4J/Y4//ZMv3+KUlG+57ZHQmfULpYl9fL/pkQkI5ptrHU/Jc13U?=
 =?us-ascii?Q?32PbrhVK81/LOi1Z6AfOONVUESu05GYQS2u9MX93VU0seKdWZSi3WJmUZGf6?=
 =?us-ascii?Q?y1z8QOEzQ0HNjdFVfn4Q3/uSD9fOK4o4C3wvk28CUltiCurHIEBIDiYdB5FB?=
 =?us-ascii?Q?5S2hAd2Smgqdb2vqPCTABm1LrlcJTzUW+s05o6BP188PNGYgJf9pVH5pwp/V?=
 =?us-ascii?Q?UH85+dMNj3cFgveYK/Cz2ZbZF4W6ghteAygcjjvNIGnwBNQcGDrx6SZ6OWN8?=
 =?us-ascii?Q?EUUyisHdTY/5FbEOqsdD5j+/qPObk5JWJ6rB0skgCBdFivROWTTzebbUJz4P?=
 =?us-ascii?Q?FX5Iz7XXa7ENL179LtKFwhQ6tpQ12e1Xi8snNrrpKLyYDx/fE29cj0oWKRIQ?=
 =?us-ascii?Q?Hp+3bhgvkoeuhoRkd2dOupf9+m3ffTIggHstE95+O5OzRr+0MlnoWUGHH1+J?=
 =?us-ascii?Q?29n1uqbwzoAbpJypiKnL5HEEJzu9LHPcURjFS2yrczGe4mQHaO7OeDDXyOqC?=
 =?us-ascii?Q?9cLq3X43s2uECbOQJz1E6wPiNetWNAhn8GBuXumwdKvAY4gYzY8aqOW0LOsX?=
 =?us-ascii?Q?TRl4w/0O1Sc9rC60ExRouyorw7jgaqm4QG2pMHBhDmFa6EKApXeOc3BJgRfF?=
 =?us-ascii?Q?2TLauBO42icbb/sAKxN6pFksIoOvMhXpRKqIiTg2Ig=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58920e56-fefd-42b5-6f1a-08dad794ab14
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:17:57.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2317
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
Cc: jgross@suse.com, alsa-devel@alsa-project.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, gregkh@linuxfoundation.org, haiyangz@microsoft.com, decui@microsoft.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 06, 2022 at 11:37:26AM +0000, Wei Liu wrote:
> On Mon, Dec 05, 2022 at 11:36:39PM +0800, Dawei Li wrote:
> > Since commit fc7a6209d571 ("bus: Make remove callback return
> > void") forces bus_type::remove be void-returned, it doesn't
> > make much sense for any bus based driver implementing remove
> > callbalk to return non-void to its caller.
> > 
> > This change is for hyperv bus based drivers.
> > 
> > Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> [...]

Hi Wei:
Thanks for the review.

> > -static int netvsc_remove(struct hv_device *dev)
> > +static void netvsc_remove(struct hv_device *dev)
> >  {
> >  	struct net_device_context *ndev_ctx;
> >  	struct net_device *vf_netdev, *net;
> > @@ -2603,7 +2603,6 @@ static int netvsc_remove(struct hv_device *dev)
> >  	net = hv_get_drvdata(dev);
> >  	if (net == NULL) {
> >  		dev_err(&dev->device, "No net device to remove\n");
> > -		return 0;
> 
> This is wrong. You are introducing a NULL pointer dereference.
Nice catch, will fix it.

> 
> >  	}
> >  
> >  	ndev_ctx = netdev_priv(net);
> > @@ -2637,7 +2636,6 @@ static int netvsc_remove(struct hv_device *dev)
> >  
> >  	free_percpu(ndev_ctx->vf_stats);
> >  	free_netdev(net);
> > -	return 0;
> >  }
> >  
> >  static int netvsc_suspend(struct hv_device *dev)
> > diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> > index ba64284eaf9f..3a09de70d6ea 100644
> > --- a/drivers/pci/controller/pci-hyperv.c
> > +++ b/drivers/pci/controller/pci-hyperv.c
> > @@ -3756,7 +3756,7 @@ static int hv_pci_bus_exit(struct hv_device *hdev, bool keep_devs)
> >   *
> >   * Return: 0 on success, -errno on failure
> >   */
> 
> This comment is no longer needed in the new world.
> 
> But, are you sure you're modifying the correct piece of code?
> 
> hv_pci_remove is not a hook in the base bus type. It is used in struct
> hv_driver.
> 
> The same comment applies to all other modifications.
Sorry about the confusion.
In short, the point of this commit is making remove() of _driver_ void returned.

For bus-based driver, device removal is implemented as:
1 device_remove() =>
  2 bus->remove() =>
    3 driver->remove()

1 is void. 
For 2, commit fc7a6209d571 ("bus: Make remove callback return void") forces
bus_type::remove be void-returned, which applies for hv_bus(vmbus) too.
So it doesn't make sense for 3(driver->remove) to return non-void, in this case it's hv_driver. 

Thanks,
      Dawei

> 
> Thanks,
> Wei.
