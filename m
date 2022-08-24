Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D259F0DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 03:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC7hc1QYYz3c5x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:25:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgMbDAoh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgMbDAoh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC7gw06Ggz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 11:25:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1IbTG000434;
	Wed, 24 Aug 2022 01:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ISw/n/vi6jJYTtUVP8BxYUtE1wQYI+YYzvcXcFiddQk=;
 b=QgMbDAohSPlTLBCWwVCjdoxqh3mvnk48cEzrFhVHVW6oeC30krUZYChqEuuOCJ7OZUGj
 1+2yyLul7zSqpHzxQwpVsyHiXQjUbT855IBZMf/cT1YxlUEyHydMRWJz7Mk1WWs4RWu/
 qvDpBXhYSFroPvPZMqexmRB8RAVxQtdUssGoYO4oKHFYkpKaGIxKf4dt78lzEEn1YT8M
 yzWA6vd7qlTf1P5mmNEtpk+W1419JNIpiWN9VOvHn/Xm60jbPAmi1HsAPyGHaxYpS+9k
 MQQ5/3LdmVO+ooO/4KD9LGp1khp5ZUjfRWIkP+ne0UMNrWk2nK25hX5LO/aDNwnZthez gw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5a7ar3jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 01:25:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O1KmSk003305;
	Wed, 24 Aug 2022 01:25:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma02fra.de.ibm.com with ESMTP id 3j2q88u8su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 01:25:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O1P3kh23331322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 01:25:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E34CC11C052;
	Wed, 24 Aug 2022 01:25:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D46111C04C;
	Wed, 24 Aug 2022 01:25:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 01:25:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE76960151;
	Wed, 24 Aug 2022 11:24:58 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 18/18] powerpc/64s: Clear gprs on interrupt routine
 entry
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <ad40b56f-7a0d-9619-53e9-6ca8a8ae9b84@csgroup.eu>
Date: Wed, 24 Aug 2022 11:24:53 +1000
Content-Transfer-Encoding: 7bit
Message-Id: <91C7009B-3A97-4053-9153-23C19B279499@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-19-rmclure@linux.ibm.com>
 <ad40b56f-7a0d-9619-53e9-6ca8a8ae9b84@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5fIbkjBptYYeZ_izay2du8d5hVI0ko0X
X-Proofpoint-ORIG-GUID: 5fIbkjBptYYeZ_izay2du8d5hVI0ko0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=862 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240001
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> What about arch/powerpc/kernel/exceptions-64e.S, no change required 
> inside it ? As interru_64.S applies to both 64s and 64e, I would have 
> expected changes in exceptions_64e too.

As it stands the changes in interrupt_64.S cause non-volatiles to be
unconditionally restored. This may lead to a performance regression on
Book3E, as previously interrupt_return_srr would restore non-volatiles
only after handling a signal, otherwise assuming nvgprs to be intact.

As some Book3E systems do feature speculation, it makes sense to perform
the same mitigation on these systems as performed on Book3S systems.
