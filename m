Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 740887398FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 10:07:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1B2WVgh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmtJd2Zk1z3bV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 18:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1B2WVgh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmtHj3hdNz2yyV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 18:06:40 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35M86MSB030132;
	Thu, 22 Jun 2023 08:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=H8LdlmX/gsBoPJ5VEWnUihpFedu5RsNoIbfQGlSDio4=;
 b=F1B2WVghOV5TXnTFxcFx2FUBG9lD2eKoIeYwKmX8pHjDSZeKtDuTbRf07RuHij3Pgr6P
 z5lyglFBmFjhIBATMnzu21vsOP1wc7gZoVZMstTZh5DtAjhslsRdykYq2MrkUjJXb+9x
 FceCPbSq8dJ0QEbIr55fcUfeNHg5kBLjeK/ihckwXvkbjGu7tWkrleSgfs71dWMN6b4e
 PhiMCNQxThcQ4fTMgm2swJdpGUa1iGDzR2LiYXNNIh1TjzdTzcPX3vRTNX3Entyvw1e2
 R9OZOWX07Kil2d6Es10+K2wjud437+NLWphiV63jWDsXCNoiNLqtJlT9Sax4rv9DOJir NA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rcj8cg8ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 08:06:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35LMLSGM028057;
	Thu, 22 Jun 2023 08:01:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e3ax2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 08:01:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35M81qJN18350628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 08:01:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9244020287;
	Thu, 22 Jun 2023 08:01:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF09420282;
	Thu, 22 Jun 2023 08:01:51 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jun 2023 08:01:51 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [6.4.0-rc7-next-20230620] Boot failure on IBM Power LPAR
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87edm5pj4u.fsf@mail.lhotse>
Date: Thu, 22 Jun 2023 13:31:40 +0530
Message-Id: <568F6E65-DBDF-43F2-8B3E-E783AE5A2B6C@linux.ibm.com>
References: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
 <87edm5pj4u.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HzhqrMOXasp1JCtoz2C7lvM3NEZbOct9
X-Proofpoint-GUID: HzhqrMOXasp1JCtoz2C7lvM3NEZbOct9
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_04,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=980 bulkscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220066
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> The problem was introduced in 6.4.0-rc7-next-20230619. I tried git bisec=
t, but unsure of the
>> result reported by it. Bisect points to following patch
>>=20
>> # git bisect bad
>> 70c94cc2eefd4f98d222834cbe7512804977c2d4 is the first bad commit
>> commit 70c94cc2eefd4f98d222834cbe7512804977c2d4
>> Merge: 48f5ee5c48c3 3fe08f7d5e80
>> Author: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date:   Tue Jun 20 09:43:25 2023 +1000
>>=20
>>    Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/akpm/mm
>>         # Conflicts:
>>         #       mm/mmap.c
>=20
> Usually bisect pointing to a merge means something has gone wrong with
> the bisect. It's not impossible for a merge to be the cause of a bug,
> but IME it's rare.
>=20

I have tried the bisect 3 times and the result was same. It always
points to this merge commit.

Is there anything else I can try to help debug this issue?

-Sachin=
