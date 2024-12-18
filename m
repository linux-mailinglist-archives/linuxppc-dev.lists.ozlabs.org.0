Return-Path: <linuxppc-dev+bounces-4286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB2C9F5F2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 08:21:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YClVM2X7cz30Nc;
	Wed, 18 Dec 2024 18:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734506507;
	cv=none; b=Zz7KqxL/ePYMZOunCynUsj9RdlHTx3W57AsYwQ6jQnKMvldr755dw+Aa6qfJjggErIptblEO6ccwdnI4dwVYc/+2ejIUjo+BwlH3HMOrPlJknvc0SfHDoeBsjMbVJbOeiuoxE/+sh8HHvIHKyp7PMZJvbfKkeZh8UD7xJQyi4Y1q+1ckB2yUsw+56zkdxV2sYLhs53vLVIOwqQCEBaXlFo4iIcFlI98ogDfNUx67bvRP2oAGSe+eUdjHNwV6Gv/xtf5pZSTSSn7if99oCT1fGNrDFcqKXOSBrcGSTrwODB5fn93hDJ1g9ZGHmdac9H+2S9FO5EhttGuWnmU2amO3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734506507; c=relaxed/relaxed;
	bh=AU9/zre5ymc9+pyhn+pVAkK83kbsL/v+mPpeXMAIWss=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vm3U0giTc2cppbbJkSWyddRK3M1yxmEvX2w3Z4W7Dkrt/kG4EGTl1NuYN/OYKre+gkNY3rcFNPjOeSIrmuP8xsum/ke0F67wU+E7aqWfB8AAv6uIWwxzlYp/gf3YtJShKAozzMX7NvfbcXMyc0bB0gvwni/FNZw44hDb/pueF49fVOMp5Z8jQDYXx0wMzcRxYFZr9R1KTpzKgBuQLe9OUL+zoqY0OwMmNpMHRb8buagK0VO2kVFZqoKG1HRUYkLwDsez1+PoXroDBx+7rnkUCOP4w2z0P7y8JgGUWm9uUCXD03w7bPMgHk4tlw9HiNo04qyoTdXuq2x8CTKWXQTFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKfZh6Nz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKfZh6Nz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YClVK0KNwz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 18:21:44 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNaoIA019936;
	Wed, 18 Dec 2024 07:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AU9/zr
	e5ymc9+pyhn+pVAkK83kbsL/v+mPpeXMAIWss=; b=DKfZh6NzLXoXX6N0zQ7hfM
	aEisOdtnUBq8zjQOSx/xjgNerkb7WgHECaTW+y5WgwN1cSBGg4MsPeJ64TcdTzPS
	5v/eZyrjN0GDyvy8dLGFlKmi1vUk+Tx6tsKX7Zyvis3hBvSJubyA6jgxR0UaGQnq
	IUOQwzdGjTgb0Ej0gqjjtWCJRcbLPEOW8oL/aVZKjRaLoae/H9U1giKKtcf/4b4f
	odJSM867THWvx7Jaesg4Rh6dnNTFEUVqv5+3vuR21xQyf3vn23gWpXYTHgMyoz2T
	4OCDP9EXyDh7Cg5jPuEDPnNB6qDXgAHrxY/XNMYRJOAyE+02y9nj48zRGbguWpUA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43kk4a9gar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:21:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI5kdUk014438;
	Wed, 18 Dec 2024 07:21:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21pdas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:21:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BI7LZd955116280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 07:21:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A66F2004B;
	Wed, 18 Dec 2024 07:21:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C24420043;
	Wed, 18 Dec 2024 07:21:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Dec 2024 07:21:35 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6C9F760A79;
	Wed, 18 Dec 2024 18:21:31 +1100 (AEDT)
Message-ID: <4362fad63a4bf67e4ebef714498ed3acd0657ee7.camel@linux.ibm.com>
Subject: Re: [PATCH 2/9] cxl: Constify 'struct bin_attribute'
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Frederic
 Barrat <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Dec 2024 18:21:30 +1100
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-2-d50ff7b21367@weissschuh.net>
References: 
	<20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
	 <20241216-sysfs-const-bin_attr-misc-drivers-v1-2-d50ff7b21367@weissschuh.net>
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
X-Proofpoint-GUID: dttfmnS1Y6bJDSkx-IRTxkSHhaMbqvSA
X-Proofpoint-ORIG-GUID: dttfmnS1Y6bJDSkx-IRTxkSHhaMbqvSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=583 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

noting that we're hoping to remove this driver shortly.


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

