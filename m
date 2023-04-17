Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76736E3EC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 07:07:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0FRl5Xpgz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:07:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HYmmkO3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HYmmkO3i;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0FQt0XQNz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 15:07:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H3VDU0017551;
	Mon, 17 Apr 2023 05:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=On403QDiwrmGRG2HEPjDgvmRtQ2TmngyMqCBlEBZjFs=;
 b=HYmmkO3ivTRp75Qsf/C7tdWWC7szNoQV7u+66ynXaYllers0/7XSAOAcc0QJ5uYT2v2q
 BX/W11G33OsfOAg5IKl7eXzbut2nHBsIooccQbswPE+Ea2J7f0buG0LmX4UGWwwn27NB
 4j7N1PtPwhm3yTcY6PQRY9a/r/IPqEm91r4YIsKfy2BL4+7S4NlWriJ+Q6ZwKmDO60B4
 yr2L9QnO3t69LRWS4CvypShmoyz0BV+D4KdMkez06upUUItYbaEh/rNncbL6GI7NE16j
 G67yyfmQKHbf8fNo36rmuDOUZ/SQM9Syg5iov224liSQSpq+CDbG5RgiCttjSDPgztn4 vg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0dvgptk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 05:06:53 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H0QHXK002180;
	Mon, 17 Apr 2023 05:06:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3pykj6gv3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 05:06:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33H56ndm32702966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 05:06:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AE8A20049;
	Mon, 17 Apr 2023 05:06:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE76220040;
	Mon, 17 Apr 2023 05:06:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Apr 2023 05:06:48 +0000 (GMT)
Received: from [9.192.255.36] (unknown [9.192.255.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 649E26016C;
	Mon, 17 Apr 2023 15:06:45 +1000 (AEST)
Message-ID: <9a98b835dee97b9f0811b988cf7a32c4416663a6.camel@linux.ibm.com>
Subject: Re: [PATCH 06/32] powerpc/configs/64s: Add secure boot options to
 defconfig
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 17 Apr 2023 15:06:44 +1000
In-Reply-To: <87o7nni3ee.fsf@mpe.ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
	 <20230414132415.821564-6-mpe@ellerman.id.au>
	 <00e463e1c414efb813e80c43bbe65db04cca4e2d.camel@linux.ibm.com>
	 <87o7nni3ee.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rt04DDjFFNhwTDPfSTqo0PZQJ_7wEe-b
X-Proofpoint-ORIG-GUID: rt04DDjFFNhwTDPfSTqo0PZQJ_7wEe-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_02,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=817 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170045
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
Cc: nayna@linux.ibm.com, gcwilson@linux.ibm.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-04-17 at 13:38 +1000, Michael Ellerman wrote:
> > Can we add CONFIG_PPC_SECVAR_SYSFS=3Dy as well?
>=20
> We can.
>=20
> But would it make more sense to just make PPC_SECVAR_SYSFS a hidden
> symbol? Is there really any reason someone would want to turn it off?

[+ Russell, Nayna, George]

I think it's conceivable that you may want to build a kernel that has
no ability for userspace to read/write to the key store at all as a
defence in depth measure in hardened environments, but I haven't
thought about this for more than 15 seconds, so opinions welcome.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
