Return-Path: <linuxppc-dev+bounces-6141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23489A33427
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 01:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtbvJ4RBHz2xyG;
	Thu, 13 Feb 2025 11:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739407244;
	cv=none; b=IUluXtHkBFsNIzxUkfK9pslTHuZb5j1rRcGqZ4Gt6wJc/MRb3emZV6Mc8hKvJs8ZXvktKgIsBtMw68fjvLYOShOiqBrioGvWJnHnEhjYqWb6P/JyFoY8QkwXxsnlDwgmHetPOfiL5umK46N60vgF5OU76iw05ERFkgxlWuqao0sCFahZgyw4XWIZAADcvAvOF7VDEwaLTZGT04KTiQsmR/oScNl7gSegj0mmR9pZLuzn211AyNpo7p9kdt606D9lqzdcfdKR00U45ZcjHYGq3df2GDcOgKzUf02VVNLPxZLX6XGCnqjXk3gcZX/3hIj12K2796BFahCptKMKgwQBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739407244; c=relaxed/relaxed;
	bh=kvPsauXDyf47SKQKq4L7sX8eCJo/Sjkz/am1Ygpjog8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cf9G8t25kbCiO22Ui9jFvjcHZ8XnPz+2cdkNpXLb9+Ym3BXM8EgQMmJbqwgHQbOh/Ofj+Tynd99QBLR+S2YR+iVCZn6fiaUevvALdD0DExe6kpI9MFprIp2BwdS0woTeels3h2BnQ/ID4MJr/Sd4ghnIH+Uk5PT9/6v6ZR3kMEIdAGUl8YGba8XXO5Orx6xh5Nd2wbAZmjSHZAkunemIlVYbsmckgaQVWpA+vPBiNsKRVhA+7J0KCDsXsdJ+Nm797HywcgWeRgU3N04PuhVbLGI9j5WHp93WaKO8JfQYNr8lcMe6r4ZWS/bWnbZ+fFSZ8JcX4uXPh/uyEeY7wbgvZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEnWYm6G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEnWYm6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtbvH3NpRz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 11:40:42 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CKG8FP004594;
	Thu, 13 Feb 2025 00:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kvPsau
	XDyf47SKQKq4L7sX8eCJo/Sjkz/am1Ygpjog8=; b=UEnWYm6GywtAWklet8Kgpk
	ry9C4dDxYoUnjlmbMhR0g8vGlzqt9nrrYlr4pT4ZH/HFnl+aUieYO9JL0FaV0Z2X
	wgnsvrixboTeC4h3j7FLogqEFZHRQqvix/eL8cCK2Ohx0ukW8Mgs4enLAb/QXKed
	VHf0IriPmvQU0LL44IJypBnfxnTjiGkgyDoX6VdWGBzB420z/iDMFHPM7E6e13Cj
	VfefLAUgEiGzBKNAz19wwzO3mdB2I/np6ENZCNvI2pgs8XbKcNCg3/flpn8DJAt/
	g0RNpy4h0c26wxoO9h3vCnPGRgWEL2uboa5tLC5aq+yuCQ90coVWd+e2UlBVHyxA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rhqaefkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 00:39:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51D0Yq7p011254;
	Thu, 13 Feb 2025 00:39:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rhqaefka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 00:39:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51CNV6bh016749;
	Thu, 13 Feb 2025 00:39:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3kbmxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 00:39:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51D0diJD39125320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 00:39:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2372E20040;
	Thu, 13 Feb 2025 00:39:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9747620043;
	Thu, 13 Feb 2025 00:39:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Feb 2025 00:39:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.5.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0DEA2600D7;
	Thu, 13 Feb 2025 11:39:26 +1100 (AEDT)
Message-ID: <835f0504d85398707997b7fe96b4f1a44179ff9a.camel@linux.ibm.com>
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bagas Sanjaya
	 <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet	
 <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        "David S. Miller"	
 <davem@davemloft.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Avadhut
 Naik	 <avadhut.naik@amd.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Eric Dumazet	 <edumazet@google.com>,
        Hu Haowen
 <2023002089@link.tyut.edu.cn>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg	
 <mika.westerberg@linux.intel.com>,
        Paolo Abeni <pabeni@redhat.com>, Sean
 Young	 <sean@mess.org>,
        Yanteng Si <si.yanteng@linux.dev>,
        Yehezkel Bernat	
 <YehezkelShB@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael
 Ellerman	 <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>,
        James Morse	 <james.morse@arm.com>,
        "Nysal Jan K.A" <nysal@linux.ibm.com>,
        Tom Lendacky	
 <thomas.lendacky@amd.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Frederic Barrat
 <fbarrat@linux.ibm.com>,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy	
 <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        workflows@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Thu, 13 Feb 2025 11:39:20 +1100
In-Reply-To: <20250212135808.58d2f032@foz.lan>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
		<Z6yFG_NntQfkwYli@archie.me> <20250212135808.58d2f032@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
X-Proofpoint-ORIG-GUID: OZ4Ih_TXKxH9HgohVnb0WeQrzyi138qF
X-Proofpoint-GUID: _CytR_Qn18YZDyX1vFuvKdYXq73CWqPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=609 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130002
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2025-02-12 at 13:58 +0100, Mauro Carvalho Chehab wrote:
> > WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
>=20
> I need to double-check verify this one, as it didn't appear on
> my tests. Are you getting it against docs-next or linux-next?
>=20

This is moved to obsolete/ by 5731d41af924b which was merged in rc1,
and will be moved again to removed/ by [0].

Andrew

[0]
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250203072801.3655=
51-3-ajd@linux.ibm.com/

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

