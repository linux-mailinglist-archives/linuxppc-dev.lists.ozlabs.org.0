Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54259103452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 07:33:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HtF32pllzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 17:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="M5JfFEHK"; 
 dkim-atps=neutral
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HtCD0VJ4zDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 17:32:05 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191120063200euoutp01a388593fe5f2a09665b29e31282d9855~YyzoSornK1169211692euoutp01S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 06:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191120063200euoutp01a388593fe5f2a09665b29e31282d9855~YyzoSornK1169211692euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1574231520;
 bh=VuP+7hLCzIF5CXYFSp9ODDyAE/nkXT9DTt7GKRfI+Rw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=M5JfFEHKNIL2wtPWPxH/Kk8umIkRNLdlcF/+aKYVfyX+UxUJkpkrNvs60+jqlY5QD
 4u5E3/TAl8ATLd+peU5yjBCe3xhL1dQDXlCJzlMyJwRTxLp9BuoeEaNFd2nvvHlI7v
 uMIsMhYB3C6Sk2gmZuu3hwgajz9ZZYy5IRCraAZ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191120063159eucas1p1be157e07933fc702f68a301ca3dfe648~YyzoAWKjk2887928879eucas1p1d;
 Wed, 20 Nov 2019 06:31:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EF.5C.04469.FDDD4DD5; Wed, 20
 Nov 2019 06:31:59 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191120063159eucas1p24037006cafb00ad61296f27ecbeec8c7~YyznlA8Ic3093730937eucas1p2Q;
 Wed, 20 Nov 2019 06:31:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191120063159eusmtrp2efbd68729a55379cdf8b40555fa4c9b9~YyznkTyei0619706197eusmtrp2k;
 Wed, 20 Nov 2019 06:31:59 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-d5-5dd4dddfffbb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 13.CD.04117.FDDD4DD5; Wed, 20
 Nov 2019 06:31:59 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191120063158eusmtip22fb55c7b5e7302cde7487c94d51e3a99~YyznGpBeu0446004460eusmtip2v;
 Wed, 20 Nov 2019 06:31:58 +0000 (GMT)
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
To: Christoph Hellwig <hch@lst.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a05d7d34-0f1c-ee1b-cfe7-bdb5d99ce37c@samsung.com>
Date: Wed, 20 Nov 2019 07:31:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119164652.GA18983@lst.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7r3716JNdh+WNNi5eqjTBYL9ltb
 nD+/gd1i0+NrrBadm7YyWsw4v4/J4tDUvYwWv7//Y7XYNms5m8XOOyeYLbo3nGV04Pa4fO0i
 s8emVZ1sHpuX1HtMvrGc0eP8jIWMHrtvNrB5bHy3g8lj8+lqj8+b5AI4o7hsUlJzMstSi/Tt
 ErgypnT9Zy14z1Ix/0Q3SwPjR+YuRk4OCQETia9tD9i7GLk4hARWMEoceL2XCcL5wijxo+Mv
 VOYzo8Sao1OBWjggWjYbQsSXM0rs/t3FDOG8ZZT482gjE8hcYQE3ic39s8F2iAgoSTx9dZYR
 pIhZoIVZYtPyrWBFbAKGEl1vu9hAbF4BO4lvD3+DNbAIqErsWPkfbJuoQKxEx/IMiBJBiZMz
 n7CA2JwCOhKvDlxkBLGZBeQltr+dwwxhi0vcejIf7AUJgbfsEudXz2OHeNRFYtvdySwQtrDE
 q+NboOIyEv93wjQ0M0o8PLeWHcLpYZS43DSDEaLKWuLw8YusIBcxC2hKrN+lDxF2lHjy+AoT
 JFj4JG68FYQ4gk9i0rbp0NDilehoE4KoVpOYdXwd3NqDFy4xT2BUmoXktVlI3pmF5J1ZCHsX
 MLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECExnp/8d/7SD8eulpEOMAhyMSjy8E65c
 jhViTSwrrsw9xCjBwawkwrvn+pVYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tS
 s1NTC1KLYLJMHJxSDYxuYe98YsMmP/d7XO3/US/7aO2FuzcXHuR+ZBT2mnkNMJXdKUo9f8H6
 ep+XQEv4/B/xPbez2sI++bJOTTNd8O6v9GSd9w/mbM9LCVvY37zg4s0zCn90JOcElgTM+bxa
 9MDl7AeBZiyNTxL+bFtvtqVz9Sutjcs53D2d0wQ+6E47pZ8zUbjqT7cSS3FGoqEWc1FxIgDb
 RYBzYwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7r3716JNfg1hd9i5eqjTBYL9ltb
 nD+/gd1i0+NrrBadm7YyWsw4v4/J4tDUvYwWv7//Y7XYNms5m8XOOyeYLbo3nGV04Pa4fO0i
 s8emVZ1sHpuX1HtMvrGc0eP8jIWMHrtvNrB5bHy3g8lj8+lqj8+b5AI4o/RsivJLS1IVMvKL
 S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQypnT9Zy14z1Ix/0Q3SwPj
 R+YuRg4OCQETia+bDbsYuTiEBJYySsy+1QYU5wSKy0icnNbACmELS/y51sUGUfSaUeLavmcs
 IAlhATeJzf2zwRpEBJQknr46ywhSxCzQxixx+e9CZoiOX0wSPae+gFWxCRhKdL0FGcXJwStg
 J/Ht4W+wOIuAqsSOlf/BbFGBWInvKz8xQtQISpyc+QRsG6eAjsSrAxfB4swCZhLzNj9khrDl
 Jba/nQNli0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5
 uZsYgRG87djPLTsYu94FH2IU4GBU4uG1uHQ5Vog1say4MvcQowQHs5II757rV2KFeFMSK6tS
 i/Lji0pzUosPMZoCPTeRWUo0OR+YXPJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqem
 FqQWwfQxcXBKNTCuKUzeemrTzV1nk2dlxRrsle8MXHYv6RCP7OfpzsVKiUar+6OmPb6788+c
 9b4LjhXG2InzFTGtvqy+uiFzTsiiK8tYF76+lqawe8vMpxfFlmk7nv2aVXV9m/zZhYdnvfgm
 9I25OlG185IKd0/xxe36kSV2JqyeW54uSOWIm28k8lZRMsM4+esPJZbijERDLeai4kQAyEVB
 VfYCAAA=
X-CMS-MailID: 20191120063159eucas1p24037006cafb00ad61296f27ecbeec8c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
References: <20191113073539.9660-1-hch@lst.de>
 <CGME20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9@epcas3p2.samsung.com>
 <20191113073539.9660-2-hch@lst.de>
 <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
 <CAJKOXPdM1+x_4PQ1AfoPY6GuV0e9bk3hv_1EfEdHcLjMwwYxgw@mail.gmail.com>
 <a3e2d65b-7270-9555-a251-d7ed0c4fb85c@samsung.com>
 <20191119164652.GA18983@lst.de>
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Russell King <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Gong <yibin.gong@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On 19.11.2019 17:46, Christoph Hellwig wrote:
> On Tue, Nov 19, 2019 at 11:26:39AM +0100, Marek Szyprowski wrote:
>> Christoph: Let me know if this is a proper fix for you, then I will send
>> it as a full patch.
> Besides the point from Robin, which is really older than you patch
> I'm not a fan of duplicating dma_capable here.  Let me know what you
> think of the two attached patches.

I'm fine with both patches.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

