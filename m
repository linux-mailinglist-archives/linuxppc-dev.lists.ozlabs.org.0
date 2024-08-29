Return-Path: <linuxppc-dev+bounces-739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB5963F82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 11:07:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvb5Y56F7z2ytd;
	Thu, 29 Aug 2024 19:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724922449;
	cv=none; b=PhfOd4TGIjtpxgovnxNLDa7Cqmlr7BvZvtdX1dD7VWfc+u/XG6Lv3LK5x1RHDe7fkv+OHqZv64rt2He4VT9Z7+PL6rDPx3VfLlcTjp7qXK7/n5WhoqZ6bodZkb7XGQgX+KNRaSxiObFh2qjT+zBkHtNNf3pv6qPYpCT7W8VZ1mPfNfOY9Dx6oh7d4BzXwjMcKCyuRCcCKJx556Y5wGeUdZOaappv1hkTQ3t70C4Ge/mYBpwBbfoT5IvBgXGEDVVgOQyQG5zs+ToVTwIDwFI74xJjBZh+pBWwU0tTdvcyrRLOVOQ7tU1mHT3xCmihjCT5oFYu25NXDMQBKam33yv1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724922449; c=relaxed/relaxed;
	bh=jEima/U9FKakYBr/4b8z/cWQ828mok13pTdAAncPLoI=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Subject:From:To:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TM-AS-GCONF:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=BiDVDEKwMDP6Zfgr9qq+a7BO5E5ghnHRM8XlNj4Qdw6AUB2S1jlG/hig7xYevO7nKZxk3pvmPrvs2CEVhBBMsck9bpFgDXhJYjf9Oo8Pd/l2fV+yORX58xfN2gPgmDhE7z/W5QC3zjauu7WCRnIPx1LCEwxHUCjZgPfVqLURa0T0zKOR3/KrbOTHjZCNdwWX5x1pAdxYQkVg6lhC9OOUtIke58l6409W1jG8wb9Ou6EdVb105MWeq74CbJMBflIbpIWXHOJC3Kr2POiRSVrfBB5YKXocIBG8h833n13Wn/a1lqCtcwj73q/PU+4zVYuNzuVoY3+KRcPFv9mYqQ6RLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bdBssbNL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bdBssbNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvb5Y00xdz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 19:07:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SN9IqW011867;
	Thu, 29 Aug 2024 09:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	jEima/U9FKakYBr/4b8z/cWQ828mok13pTdAAncPLoI=; b=bdBssbNLuYFZeUIG
	bxRsVpDxpRYDAzsPI1ww//3X+C68zJvGYmIJ6zjrVrMcmwJQ14PuJdGZq39Lor0C
	gnMJ0u4ut7+yMxWHazIo8DAqP4h0ZKyMjwMZVScDS+GSvlqmyKTGCyLl6PJpteJy
	2uUErjNKy+d6wRAzexQ3pgglp151LmP4nXRE96P0rD/ti/PO9Y/tkhVVRA/HKFMJ
	OBdGNm5A4ztqe4WNUwFptAjYvqoLS+Ylue/4wAcv7tXbYRiRCtUd2l5p3de7tEtj
	AnFU5x2TPUAVr+c5p8odJ3TqhZnKtEcyWDjDc19NuclLMk5YSU9adT7m7qcBaYPq
	dap/jg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8nyck4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:07:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47T82XNe024673;
	Thu, 29 Aug 2024 09:07:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 417vj3kmcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:07:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47T97B9149021354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2024 09:07:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56C8620043;
	Thu, 29 Aug 2024 09:07:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCE7520040;
	Thu, 29 Aug 2024 09:07:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Aug 2024 09:07:10 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 22794602F3;
	Thu, 29 Aug 2024 19:07:07 +1000 (AEST)
Message-ID: <c2b6eb9e9a1477d73ed7b5835e61d0f4eb53afd8.camel@linux.ibm.com>
Subject: Re: [PATCH -next] cxl: Remove unused cxl_pci_to_cfg_record()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, fbarrat@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Thu, 29 Aug 2024 19:07:06 +1000
In-Reply-To: <20240828103807.3683308-1-ruanjinjie@huawei.com>
References: <20240828103807.3683308-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pM5YN0VfgxiuouhrKkx3MJ6A6pe2fyx4
X-Proofpoint-ORIG-GUID: pM5YN0VfgxiuouhrKkx3MJ6A6pe2fyx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 mlxlogscore=793
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290066

On Wed, 2024-08-28 at 18:38 +0800, Jinjie Ruan wrote:
> cxl_pci_to_cfg_record() is not used anywhere, and its function can be
> replacd with PCI_DEVID(), so remove it.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This description is inaccurate - this removes both
cxl_pci_to_cfg_record() (which is unused), and replaces
cxl_pcie_cfg_record() with PCI_DEVID().

The patch itself looks fine.

Note that I am planning to remove this driver soon anyway.

> ---
> =C2=A0drivers/misc/cxl/vphb.c | 12 +-----------
> =C2=A0include/misc/cxl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A02 files changed, 1 insertion(+), 15 deletions(-)
>=20
> diff --git a/drivers/misc/cxl/vphb.c b/drivers/misc/cxl/vphb.c
> index 6332db8044bd..1cf614bf104d 100644
> --- a/drivers/misc/cxl/vphb.c
> +++ b/drivers/misc/cxl/vphb.c
> @@ -72,11 +72,6 @@ static void cxl_pci_reset_secondary_bus(struct
> pci_dev *dev)
> =C2=A0	/* Should we do an AFU reset here ? */
> =C2=A0}
> =C2=A0
> -static int cxl_pcie_cfg_record(u8 bus, u8 devfn)
> -{
> -	return (bus << 8) + devfn;
> -}
> -
> =C2=A0static inline struct cxl_afu *pci_bus_to_afu(struct pci_bus *bus)
> =C2=A0{
> =C2=A0	struct pci_controller *phb =3D bus ? pci_bus_to_host(bus) :
> NULL;
> @@ -99,7 +94,7 @@ static inline int cxl_pcie_config_info(struct
> pci_bus *bus, unsigned int devfn,
> =C2=A0{
> =C2=A0	int record;
> =C2=A0
> -	record =3D cxl_pcie_cfg_record(bus->number, devfn);
> +	record =3D PCI_DEVID(bus->number, devfn);
> =C2=A0	if (record > afu->crs_num)
> =C2=A0		return PCIBIOS_DEVICE_NOT_FOUND;
> =C2=A0
> @@ -302,8 +297,3 @@ struct cxl_afu *cxl_pci_to_afu(struct pci_dev
> *dev)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(cxl_pci_to_afu);
> =C2=A0
> -unsigned int cxl_pci_to_cfg_record(struct pci_dev *dev)
> -{
> -	return cxl_pcie_cfg_record(dev->bus->number, dev->devfn);
> -}
> -EXPORT_SYMBOL_GPL(cxl_pci_to_cfg_record);
> diff --git a/include/misc/cxl.h b/include/misc/cxl.h
> index d8044299d654..5ffa6e02bb07 100644
> --- a/include/misc/cxl.h
> +++ b/include/misc/cxl.h
> @@ -23,10 +23,6 @@
> =C2=A0/* Get the AFU associated with a pci_dev */
> =C2=A0struct cxl_afu *cxl_pci_to_afu(struct pci_dev *dev);
> =C2=A0
> -/* Get the AFU conf record number associated with a pci_dev */
> -unsigned int cxl_pci_to_cfg_record(struct pci_dev *dev);
> -
> -
> =C2=A0/*
> =C2=A0 * Context lifetime overview:
> =C2=A0 *

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

