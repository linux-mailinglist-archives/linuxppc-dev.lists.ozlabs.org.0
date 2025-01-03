Return-Path: <linuxppc-dev+bounces-4643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C942A00C20
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 17:37:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPq3h3sZdz30V1;
	Sat,  4 Jan 2025 03:37:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735922224;
	cv=none; b=SSN/9Iz/wVwkNuwsF+n0rbAqiAtEemz1/Ptij7i/5KwqAskE42EkUxd2ybjZfYSr9sqOTjiIfCrYZRWnQcW0PMU9LhF7Yt2JAoJU0akUGgQs8Fz1+38+4LGIGpJ2oImE8JlNQfaoPOUqSKaaH21d+o/zFF9Lmek6Xv4cUjBXEj5+VhkeNrkGxi7yaFHisUBp+jHJWJ2JzwYVsG+WjgGsEOJJuC3ef+x31YPIhZ02fvR6TmFrcG9GjpfzjISzGR9BVLkij/L0xdHOdKMM2ILgiXqYsMHGHP+duHD0xNku/8soXe9hrU1JQ4mt3RGxPQbmGggkUitBTQafXwxI6nI/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735922224; c=relaxed/relaxed;
	bh=naLeKwPcqD1Rq9VfSL49ftRd6mng6Ffw8D1o/l9rX2A=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADey18uCApupZ6OmfVU4TUY2I34pyXS8CPjDE3c2ev7oJk0q74SPpaBSj/H5pJoFp+JiSJDPtasPuZoRSQSFSKhZjl6rMS2MDF8KdmETwuCn2BMCrsHhdZUKVExkGN0PKznsHKhLCGrrz/SuRAZIZNXn6dIGeu0BeJDQXCzfdIjiCOVldHt626EZTaDzB9NgA1Eo+ZRIZWutoPZm8ClIj6D27QWYaTy4YtU0b904OTgxWRSHTBGbFjqc49pDA9WnbSP6ZRylqv2CWIH1KDMMMDLcv/IGW/rUBz9VVJ3TGJl+mOX62GuwJGZKk7JNHElG8zEkeASxD9NPqERB1PLMTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPq3g448Tz30TS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 03:37:03 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPq2c0nJNz6K6K9;
	Sat,  4 Jan 2025 00:36:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 803DF1406AC;
	Sat,  4 Jan 2025 00:37:00 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 17:36:59 +0100
Date: Fri, 3 Jan 2025 16:36:58 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lukas Wunner
	<lukas@wunner.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
	<linux-kernel@vger.kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v8 5/7] PCI: Store # of supported End-End TLP Prefixes
Message-ID: <20250103163658.00003c81@huawei.com>
In-Reply-To: <20241218143747.3159-6-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
	<20241218143747.3159-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 16:37:45 +0200
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
> are supported by the path or not, the value is only calculated if
> CONFIG_PCI_PASID is set.
>=20
> The Max End-End TLP Prefixes field in the Device Capabilities Register
> 2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe
> r6.2 sec 7.5.3.15). The number of supported End-End Prefixes is useful
> for reading correct number of DWORDs from TLP Prefix Log register in AER
> capability (PCIe r6.2 sec 7.8.4.12).
>=20
> Replace eetlp_prefix_path with eetlp_prefix_max and determine the
> number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
> that an upcoming commit generalizing TLP Prefix Log register reading
> does not have to read extra DWORDs for End-End Prefixes that never will
> be there.
>=20
> The value stored into eetlp_prefix_max is directly derived from
> device's Max End-End TLP Prefixes and does not consider limitations
> imposed by bridges or the Root Port beyond supported/not supported
> flags. This is intentional for two reasons:
>=20
>   1) PCIe r6.2 spec sections r6.1 2.2.10.4 & 6.2.4.4 indicate that TLP
>   is handled malformed only if the number of prefixes exceed the number
>   of Max End-End TLP Prefixes, which seems to be the case even if the
>   device could never receive that many prefixes due to smaller maximum
>   imposed by a bridge or the Root Port. If TLP parsing is later added,
>   this distinction is significant in interpreting what is logged by the
>   TLP Prefix Log registers and the value matching to the Malformed TLP
>   threshold is going to be more useful.
>=20
>   2) TLP Prefix handling happens autonomously on a low layer and the
>   value in eetlp_prefix_max is not programmed anywhere by the kernel
>   (i.e., there is no limiter OS can control to prevent sending more
>   than n TLP Prefixes).
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
Extra explanation looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

