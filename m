Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DDF93EFE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 10:29:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K07xeRmB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXWkF0gN2z3cYb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 18:29:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K07xeRmB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXWjX4Lv3z3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 18:29:03 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T5lmAm022522;
	Mon, 29 Jul 2024 08:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	j8aSvM5c0U5e8+c0U5FZ/H+W5Oq37NGrCmQ7dwBTMt8=; b=K07xeRmBmXNW3OKV
	ou5+xS47PHAo3UUjTTWkxEh3OCJm+8l0BlP+WUUS5cO/IyCS5l1lMEyWZj4UbgTb
	ukIvz9ntSs8D96T0wXAN8d5NKgxH6ldNRhlRdOz0dO1eKMFZpIaJpNPeXgAvt2dk
	/jZCB2oTGE6olCnxcfdSWocOOiLx2LhuDu114SGHHEDu1ZMRuyfKHHww//bR6N4F
	yyOZrn2RG22OuvoAUgLKgsvmb7vLJaPNJErEoXCtG1lW2aaU/qLhWm+h9uuZlkGT
	U9vaFQmgpbibBrQc8J08irxBGgNVfX9NG8m8/a402k9k9q4Y+YQRr7LYpuJJYj+V
	5u1wAQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40mputc9j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 08:28:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46T80Af6003856;
	Mon, 29 Jul 2024 08:28:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndem5ckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 08:28:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46T8SaSv51773812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2024 08:28:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98BF720040;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB172004F;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.0.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 88C7360245;
	Mon, 29 Jul 2024 18:28:28 +1000 (AEST)
Message-ID: <6fb5918a9a56b3e459055025f3b7b25e6d0d3247.camel@linux.ibm.com>
Subject: Re: [PATCH v12 00/11] Support page table check PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 29 Jul 2024 18:27:55 +1000
In-Reply-To: <ab298f1f-2c99-40eb-b5ba-13f3ac9260a9@cs-soprasteria.com>
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
	 <ab298f1f-2c99-40eb-b5ba-13f3ac9260a9@cs-soprasteria.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ky4T8G8i_WE-rFM0yd5Xro-fFvHA9kMA
X-Proofpoint-GUID: Ky4T8G8i_WE-rFM0yd5Xro-fFvHA9kMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_06,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=630 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407290053
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2024-06-18 at 13:09 +0000, LEROY Christophe wrote
>=20
> Seems like this series doesn't apply, patch 1 has conflict with
> RISCV,=20
> patch 2 with mm and RISCV.
>=20
> Please rebase as appropriate.

As you've probably gathered from the mailer-daemon failure notice I
assume you probably received, Rohan has sadly moved on to other things.
I'll send a rebased version of this when I get the chance.

Andrew

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
