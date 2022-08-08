Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945D58C31D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 08:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Qg33DDLz3052
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 16:05:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S7DBDmOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S7DBDmOy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1QfK2tCjz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 16:05:12 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2785gsLc030563;
	Mon, 8 Aug 2022 06:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LdNLLUg2m6TbR4BSeU9TdHhccW8S37xMWjAofPmjQCY=;
 b=S7DBDmOyPp05sldirmqcYDdKS1/ve+s5oQKH2ppwCGzKr9Aq1kryzUNbOxm26KvVO0Sn
 +Kc2pws+htCO6dDVkIbqlnQ27i4a4QylK1eDs8b+wdKBvz6xwPmkXTag/HKQLGilPouK
 ZadQVWu3r0CUxipFj+LPn1G9qUuy5DEYZwG58lfduf27pPQi7m6P45agL4ACrBknx5Po
 jQEHhnEVIwvLbD+fmai9I1eJR/eGAsga57EE+vQIO4eO6c3AdTk5SiG4qd183GI/d0k8
 0zUMtwdtpUe2jAn9RYLl1f9CU4yfai3eYDEW3U+i3FsLwItSOABxflo+R2RiXq9NE+Au 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htvjv0hp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 06:05:05 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2785toLi020064;
	Mon, 8 Aug 2022 06:05:04 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htvjv0hmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 06:05:04 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2785orof016194;
	Mon, 8 Aug 2022 06:05:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3hsfx8sahd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 06:05:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27862XCJ27197734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 06:02:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC0E642041;
	Mon,  8 Aug 2022 06:04:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5669E4203F;
	Mon,  8 Aug 2022 06:04:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 06:04:59 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 95B796010A;
	Mon,  8 Aug 2022 16:04:57 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 01/14] powerpc: Adopt SYSCALL_DEFINE for arch-specific
 syscall handlers
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <34538d4b-2c44-a527-66c8-5049f0176877@csgroup.eu>
Date: Mon, 8 Aug 2022 16:04:53 +1000
Message-Id: <59FC80E2-27E0-43AD-854E-4F351E13E9E2@linux.ibm.com>
References: <20220725062420.118013-1-rmclure@linux.ibm.com>
 <34538d4b-2c44-a527-66c8-5049f0176877@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sdJaUICVK5o3IXNorhMfBazrCBb0Zehz
X-Proofpoint-ORIG-GUID: EUZiTCFSfu__NY31dj4B_DguP-CMqOm_
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080031
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for reviewing my patches.

> I think this patch should be split in two patches. One where you just=20
> change to using SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE, and a second=20
> patch for everything else.
>=20
> The first patch could then be linked to=20
> https://github.com/linuxppc/issues/issues/146
>=20
> Or in the reverse order if it makes more sense maybe.

My reasoning for completing all of these changes in a single patch is for
retaining bisectability. Adopting SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE
prepends {sys_, compat_sys_} to the symbol names, and so this must be
reflected immediately in the symbol tables.

> Is that 'asmlinkage' still needed ? Not all syscalls have it seems, and=20
> as far as I can see that macro voids for powerpc.

Sorry, you commented on this in the previous revision, and I should have
acted on it then. I in fact touch all but one usages of =E2=80=98asmlinkage=
=E2=80=99 in arch/powerpc, and so am in a good position to get rid of all o=
f them. I=E2=80=99ll
do that in next revision.

