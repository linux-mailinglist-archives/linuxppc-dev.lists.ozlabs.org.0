Return-Path: <linuxppc-dev+bounces-2813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 192179BAA2D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 02:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhYhD5bPwz2xxt;
	Mon,  4 Nov 2024 12:26:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730683564;
	cv=none; b=UEGJrUq83D+m5mkN3v4v2jkcSW6TGlwyhZg3v3AmHsQWcE4hJtzhc0USHwDaXW+7h14LHSlapSPiJ94OPkppdPn9BiqP4QqM939E9zJ9SN4rV7GhAx5xpvBROdY0X58UI8ADqmnySYSHGtw0gFJJ4lq2LJzVTYP3jZj+MkhMP/Y8wl+wbvNQx3EZhNJxP2EfnW1/uL3yqnqtv7xVymCf5ToWvh0lZKHtz2xjPeRAiPgoYwQPLdfMWcPrxmhhUbYhDbgBtVTKXHxgKRoL42ZS4KmUDGf8Obp4ppfWtKSzfCMkj8cYABXWKSIPRk13+QIauxVSwk6k1DXUR61vj6IxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730683564; c=relaxed/relaxed;
	bh=iMh8eFHecHacE2bhwoTpB2hk6AqM865un55dFnhq1os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mnyE/W7A9CsE5NxnkQPaV2Kn0fQMG3agGQGApNyWjXu4cqsJDwivsMokQQ1WsN0+berfhrsYjYxu9vvgWuQOWrzSX42qLWwPvLG1JZbI1Q2rN30MCRkF6sI7Hf3ybYxh36eW4cYGQQfTWvXM3N4KwvEuy4C8Q2gfzpwCRYWNl0/TG5Is3bgDRrFQObJrkw2UG6mXYFkPow3HzGSnmzX+DFZbVyfvpnWiZ/p29yef4KU45SEQo0ygktWNePtwiaXllXZxynij2a0a940eBBB8h7reSxGd2j004uu5zLzd0kLD6neyW5ynT7DRp6TF/eO2d+SlaDban3mene45hOgk1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mwumFI9E; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mwumFI9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhYh86RQgz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 12:26:00 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nehke026061;
	Mon, 4 Nov 2024 01:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iMh8eF
	HecHacE2bhwoTpB2hk6AqM865un55dFnhq1os=; b=mwumFI9ENq4rcML09znikW
	bSKfPSoLpGiPwIVPNb+PTU/Z9iu2uh9/7IsfcbZ2541kn+9Pa1KaH43261DTcInL
	pJ3rcjIjJBQ6fzmxg8ns9KWzD3Uc3+devvxJHHrJ42w5VT1xxl9HouMu+BQwVlnS
	K2EOVqA7F3PdpEO8mnuj2Rhej4k3uU44TrsNEMww2Kr5veoMrGZuLbZbKka3UhPP
	mwbaM/NWU4zi15DYpX7ZFZ8FllhKhAH1hafqawYZz+WNlB3YXAWAHnoeUXpPgJZB
	zuibf6jNbtRmEvDez5JdDKt6c/vHhZGRrKjxNUpwH+T/eFfpc6soYKoS+By8HCdA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pk2106hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:30 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A41PT6m022592;
	Mon, 4 Nov 2024 01:25:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pk2106hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3J0Iri019625;
	Mon, 4 Nov 2024 01:25:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj1840-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A41PQfB13566404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 01:25:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B46020043;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C94C20040;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.11.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 95503602B8;
	Mon,  4 Nov 2024 12:25:07 +1100 (AEDT)
Message-ID: <3b8312490c668a99b2a89667b7d1cbdf2019b885.camel@linux.ibm.com>
Subject: Re: [PATCH v2 06/10] sysfs: treewide: constify attribute callback
 of bin_attribute::mmap()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Bjorn Helgaas	 <bhelgaas@google.com>,
        Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Davidlohr Bueso
 <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Dave
 Jiang	 <dave.jiang@intel.com>,
        Alison Schofield
 <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira
 Weiny <ira.weiny@intel.com>,
        Alex Deucher	 <alexander.deucher@amd.com>,
        Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
        Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie	 <airlied@gmail.com>,
        Simona Vetter
 <simona@ffwll.ch>,
        Dennis Dalessandro	
 <dennis.dalessandro@cornelisnetworks.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky	 <leon@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Pratyush Yadav	 <pratyush@kernel.org>,
        Michael
 Walle <mwalle@kernel.org>,
        Miquel Raynal	 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
        Carlos Bilbao	
 <carlos.bilbao.osdev@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "David E. Box"
 <david.e.box@linux.intel.com>,
        "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"	
 <martin.petersen@oracle.com>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Frederic
 Barrat <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Logan
 Gunthorpe <logang@deltatee.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang	 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui	 <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
        platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
Date: Mon, 04 Nov 2024 12:24:55 +1100
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-6-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
	 <20241103-sysfs-const-bin_attr-v2-6-71110628844c@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IVwbyg3makWwSzhu8aJUQIgu4AbnB-xA
X-Proofpoint-ORIG-GUID: b4TgSoTo26XoqfO5DuvsB1xx-Da_599i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=906
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040007
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 2024-11-03 at 17:03 +0000, Thomas Wei=C3=9Fschuh wrote:
> The mmap() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
>=20
> As there are not many callback implementers perform this change
> throughout the tree at once.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com> # ocxl

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

