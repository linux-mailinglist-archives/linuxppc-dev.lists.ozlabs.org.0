Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E36C712A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:40:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjFzr0zfCz3f8S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hr9F7fll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hr9F7fll;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjFyr4trmz3cjR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 06:39:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NI7rQk037016;
	Thu, 23 Mar 2023 19:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dYJ1b3z1QIjJUEXpivXu5+zowkB8PummjWgSxkl1pkg=;
 b=hr9F7fllanzBYK/2iL0xiWQzcaiLm/88Qn5OdEs3HAkiRE9OsulnwCqlDRaBMHEFEFpq
 3yzHLOdRgyBZ2qZHm+3w1OH8c+uhBRQ+p43U1kIQu3Uq8hey42FV5uCjGHiULgdHJC53
 9/X+Ffk/1ftzMRmF/UzUCNHFIiba/5UGHVT+GWjwc9K8HI57uy1wrXcXUvj58V2L/bF0
 HQLg9KErvBfdlusIv+WyIHhhJ0q0DyDmyeu2SyZVKj9vEk7bE0M4XCBI2OcFMBIq63Hk
 L0zhLY/hUuQCQVdDC7Vd1XnfBnrAUr5LxSYGJZ5KsGYS/cUu7OfkDQOGPQmtMA4HYeTr WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pggv7uy5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:39:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NJb6eP016038;
	Thu, 23 Mar 2023 19:39:07 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pggv7uy5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:39:07 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NHdQ5D021504;
	Thu, 23 Mar 2023 19:39:07 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x7fqjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:39:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NJd5TF30605922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 19:39:05 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EFD75805B;
	Thu, 23 Mar 2023 19:39:05 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F3E558059;
	Thu, 23 Mar 2023 19:39:05 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 19:39:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
In-Reply-To: <35f3e3c9486fe2a841bbf590349e8386c1bba390.camel@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
 <35f3e3c9486fe2a841bbf590349e8386c1bba390.camel@linux.ibm.com>
Date: Thu, 23 Mar 2023 14:39:05 -0500
Message-ID: <874jqb6yw6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8m-HHAep1IT7bTpXuT1xkqg8mJ1Lep2d
X-Proofpoint-GUID: J7ICT0tdXM2aVmblsLWjqtyOJdjjorHX
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=925 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230139
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On Mon, 2023-03-06 at 15:33 -0600, Nathan Lynch via B4 Relay wrote:
>> * We can expect performance improvements for existing sys_rtas()
>> =C2=A0 users, not only because of overall reduction in the number of
>> system
>> =C2=A0 calls issued, but also due to the better handling of -2/990x in t=
he
>> =C2=A0 kernel. For example, librtas still sleeps for 1ms on -2, which is
>> =C2=A0 completely unnecessary.
>
> Would be good to see this fixed on the librtas side.

Filed an issue: https://github.com/ibm-power-utilities/librtas/issues/30
