Return-Path: <linuxppc-dev+bounces-4287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A49F5F2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 08:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YClVW4Fm4z30Sw;
	Wed, 18 Dec 2024 18:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734506515;
	cv=none; b=Lelu+WJgDeWGMja7IjzET692CWYp+yMRcqbD4aZ/2IfBQWOOzmjzk9qq9dcRx+fjWPq4c0tvdeS2Zwm367EyJTHWwfb6OZ5aaPRDcFh6oLKjuxMBC9FjWNu8oiNoSLjrAcN0DX+9twzd+U2sp5IUr8F9jxiLVrBT7Jhxv4fZ1+Sg/jn9jvviQMlKclk0LUxTixZF3Ufs29Jefv9OeMyg9LpsMIPVm9ytDPzoqYtIUaOWZjyXOoU+IYknvexgQjszrDNTS6xOHWfZEbDBuT4tMygYe0/HENGMWq3i1collanMEIFHCsk9897JrMLyvw5SI6MMQfKulKUIrQb+dbrM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734506515; c=relaxed/relaxed;
	bh=2rUU40jhwPDoUiGlDPe5FwstHWoxhMuaz2x8LDA0XJo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XeRb/R9wHkIsP3VCGjrtFh8oRGrc32t/39sheDg8tPI7esDLr+0FAmIjsv7Qbcu5Y3RVzOFG4VwwmSovL7YyExNm7PBmBjEm4CkmYjWW6siD3L2pefxJlB2zMWnxko+tuKu4JiYvh5c29t3HiHKXDpp/xtW56v+izk5fSZbvWjC7NaqJ7F2Wb/rTx5ptjAQDPQrapzbYei9k9IKROAoLwXWy0cUFsMqOMZmsjFy60AVe9V7cvPi5/HOK0X63wg1kMeRzcYIliMYTEoYRIC3IIrVnJ/mWy9FVvOeOClhyHeHku05xcmHqKZePVc5H+PxQ4KvwSAHkipLO/ckng3HxFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KFUi65fy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KFUi65fy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YClVV3zBCz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 18:21:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI02BlX021319;
	Wed, 18 Dec 2024 07:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2rUU40
	jhwPDoUiGlDPe5FwstHWoxhMuaz2x8LDA0XJo=; b=KFUi65fy0zP3N2mC8ZmF2i
	xOpC5VlExVXL7JDEbMxhOIoCCyA+5QmW8Zbe2dxoAQ/MhbQrj44aZmi77yQPU6kb
	J1KEKU+Z04NvTtu4tSLG7ynq+MDB+3gv8DlmSI/+RiKtp75PqTIoWtw3SLJH/lQn
	UIWFVK2viFplY0y/MfZpARTS3b9Y5xiXBgWjsVfaTNI7ZUTiJeUH0x1C5PV9tY68
	OqCyFUgcq87EQryQ4Pat2XRkL2MBvyBpcTeMFjeltjjcogbMHLpXp6K+JTeEAmPy
	TIyXMeFd0rrh6iAA82JWkJIod+jZEUUHuNT8SNsCulFKlBNjJowGRaewg5cJa4Xg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43kas4v1td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:21:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI57H9O011252;
	Wed, 18 Dec 2024 07:21:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjk6gnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:21:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BI7LlTL30736892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 07:21:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A38DD20040;
	Wed, 18 Dec 2024 07:21:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 305AA2004B;
	Wed, 18 Dec 2024 07:21:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Dec 2024 07:21:47 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A155660057;
	Wed, 18 Dec 2024 18:21:45 +1100 (AEDT)
Message-ID: <3e67ac908ed4ea41290b8eb42d4fbdbe5a093b08.camel@linux.ibm.com>
Subject: Re: [PATCH 1/9] ocxl: Constify 'struct bin_attribute'
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Frederic
 Barrat <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Dec 2024 18:21:45 +1100
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-1-d50ff7b21367@weissschuh.net>
References: 
	<20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
	 <20241216-sysfs-const-bin_attr-misc-drivers-v1-1-d50ff7b21367@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
X-Proofpoint-ORIG-GUID: 3EXoV1VrMGghGDJs6NrSvOSc6p3UCWNf
X-Proofpoint-GUID: 3EXoV1VrMGghGDJs6NrSvOSc6p3UCWNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=522 mlxscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180054
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 2024-12-16 at 12:32 +0100, Thomas Wei=C3=9Fschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

