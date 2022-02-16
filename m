Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7C4B84BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 10:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzCnN4bdsz2yHL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 20:48:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nknqioiA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nknqioiA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzCmd58qFz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 20:47:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G7dLF0010047; 
 Wed, 16 Feb 2022 09:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=kR8m9EWj7jcTe1gTm3selny9gj9T7VDVcZkY1fHgLCo=;
 b=nknqioiASeUrescXPiiEbkM8I9L8PEfcIQbhnHo1sIdWzN7wegl46xVoGLyf8akkaTyS
 pzN7FjSSZggo06TNVrYfFW+1MjWfLlSxRnawUftFz3o3MgSX3XXPGFyyvSmuLAm+uuiX
 9rZt4qcfDjWKITDvhheXZT5k23xxIJzRKGuhRGMgFv6rBRcc3aOy8Ymv49vEBpccV5zT
 tn8E1SkGSF1bmSmlVl9ztJg79hkxa5zsYZPbuG3tpvOwFlnWiXxKF+2lHXgCzQy0gg8C
 jjMz+N2Jv/4IbY114pQpBAJfxhJKOoeb/2Q2saSDXwbzBxyJzpWxSkFc+Vn3dO/L69cS gA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8thydk11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:47:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9ggx9025424;
 Wed, 16 Feb 2022 09:47:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha6re4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:47:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G9lGgm45154628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:47:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9CED5205F;
 Wed, 16 Feb 2022 09:47:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.185.42])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9BF015204F;
 Wed, 16 Feb 2022 09:47:15 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [next-20220215] WARNING at fs/iomap/buffered-io.c:75 with xfstests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220216183919.13b32e1e@canb.auug.org.au>
Date: Wed, 16 Feb 2022 15:17:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF1506AF-E82B-412B-BD7B-A9F0B9971CB3@linux.ibm.com>
References: <5AD0BD6A-2C31-450A-924E-A581CD454073@linux.ibm.com>
 <20220216183919.13b32e1e@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NjCmUYVGpq2UjuWV_UIa2hlJvaZMqo1d
X-Proofpoint-ORIG-GUID: NjCmUYVGpq2UjuWV_UIa2hlJvaZMqo1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=842
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160054
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> While running xfstests on IBM Power10 logical partition (LPAR) booted
>> with 5.17.0-rc4-next-20220215 following warning was seen:
>>=20
>> The warning is seen when test tries to unmount the file system. This =
problem is seen
>> while running generic/475 sub test. Have attached captured messages =
during the test
>> run of generic/475.
>>=20
>> xfstest is a recent add to upstream regression bucket. I don=E2=80=99t =
have any previous data
>> to attempt a git bisect.=20
>=20
> If you have time, could you test v5.17-rc4-2-gd567f5db412e (the commit
> in Linus' tree that next-20220215 is based on) and if that OK, then a
> bisect from that to 5.17.0-rc4-next-20220215 may be helpful.

Unfortunately I cannot recreate the problem consistently. I tried same =
test run with both
mainline as well as linux-next20220215. In both attempts I wasn=E2=80=99t =
able to recreate it.


Thanks
-Sachin=
