Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F63AF20E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 19:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7xRz5Zjpz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OHmCp7QT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OHmCp7QT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7xRV2Ttbz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:32:05 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LHUT4V059089; Mon, 21 Jun 2021 13:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dN/oN0n9tLV8UYomMqhhtIvx1sfbdn8AhVSokNCO/6g=;
 b=OHmCp7QT3CPbjGpUtWV7P996093GvTISSIaYbrMOwTRb1guoENQ24KNAgFmHLVweLmug
 wSgwdIT81QwXxQp2InBMszRcr3MX1fh3fRqlk2VU3xgI149ciR5I20CItJ3khgenEWFb
 33rOXRRxztyv4zInOGMCGcR/Vr45H5QMmEryytFuTS+7q5R2rEnk2wKr5XpY1dsv2+aM
 0ziivzMI4jkJUbvXCQ7v8V7sii3HoS6YNu00XHQTY0uhNlhnAFyjdyff8nRz0Zq3b3QZ
 qejGVyV9cUbqN5XSAUEB9QD+yxHGDn+ubA/dwpD9mtGhs4YegS2nhvtszWp6tjTYWqti VQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39aup3qqb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 13:31:57 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LHETPt019177;
 Mon, 21 Jun 2021 17:31:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3998788j4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 17:31:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LHVrcw23331192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 17:31:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3576EA405B;
 Mon, 21 Jun 2021 17:31:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38637A4060;
 Mon, 21 Jun 2021 17:31:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.196.19])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 17:31:52 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <CAKfTPtACzzoGhDFW0bTGgZRPB=3LR6kSwuUOrcKDFTAJ7BhTFQ@mail.gmail.com>
Date: Mon, 21 Jun 2021 23:01:51 +0530
Message-Id: <14EEE4A4-B2B1-4D0C-B2F6-BDB7C11B05DE@linux.vnet.ibm.com>
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
 <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
 <20210621162243.GA29874@vingu-book>
 <CAKfTPtACzzoGhDFW0bTGgZRPB=3LR6kSwuUOrcKDFTAJ7BhTFQ@mail.gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A57L-lTFSpwIsTbGCYyBbkxDN9_wFonX
X-Proofpoint-GUID: A57L-lTFSpwIsTbGCYyBbkxDN9_wFonX
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_10:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210101
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> Any thoughts Vincent?
>>=20
>>=20
>> I would prefer that we use the reason of adding the cfs in the list inst=
ead.
>>=20
>> Something like the below should also fixed the problem. It is based on a
>> proposal I made to Rik sometimes ago when he tried to flatten the rq:
>> https://lore.kernel.org/lkml/20190906191237.27006-6-riel@surriel.com/
>>=20
>> This will ensure that a cfs is added in the list whenever one of its  ch=
ild
>> is still in the list.
>=20
> Could you confirm that this patch fixes the problem for you too ?
>=20
Thanks for the fix.

The patch fixes the reported problem. The test ran to completion without
any failure.=20

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

-Sachin

