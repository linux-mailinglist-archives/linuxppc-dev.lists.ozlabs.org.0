Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20627421645
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNTXr6xPNz3c66
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 05:20:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FWkbo9zL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FWkbo9zL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNTX41z94z3056
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:19:47 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194IC5Y0018588; 
 Mon, 4 Oct 2021 14:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ekKTIQuKNrnPUnLvNkg5HynRW75Tqau2TGwO+Qzs+4s=;
 b=FWkbo9zLNdRhaiAX/aZFOW+lak+r9lKTD8ziKD0dgo01ukw6QcsYBqAMn+zw3ZiIDndw
 ixNdmTmrCNKzgheQXVUbWeUMQ6m60eLTh76bQXdfy/Kw007KPEkNRhim3IUZIhSRlooC
 kM8Nc0mK6+84wA4XlyOY5EwPcz+5WnHfowgWlyZ/MW7ub9dzblECn3Ff97CwrzBNiQ31
 7jWRoHw0UZ0YCK0byKdU8tw++OylpwOs/65rF//ifjCt8Cn5PKfCC2ciHGTYpreY3z6r
 nwohBjYQ+3bpk9AClWom8bGrZ5DKVqP9DQOUU6opy3dUzWU26oKz9Yj0uEzSi+hlDxT0 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg6p2r50e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:19:34 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 194IDnSE026145;
 Mon, 4 Oct 2021 14:19:34 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg6p2r502-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:19:34 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194ICXpd019180;
 Mon, 4 Oct 2021 18:19:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3bef29ru4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 18:19:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194IJTNK35455436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 18:19:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5CE04204B;
 Mon,  4 Oct 2021 18:19:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0611942041;
 Mon,  4 Oct 2021 18:19:29 +0000 (GMT)
Received: from localhost (unknown [9.43.21.28])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 18:19:28 +0000 (GMT)
Date: Mon, 04 Oct 2021 23:49:27 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/9] powerpc/bpf: Various fixes
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <CAM1=_QSrOZBk+_h224cdxrZw7djqUqO9jytYNV--9V-KTJmt9Q@mail.gmail.com>
In-Reply-To: <CAM1=_QSrOZBk+_h224cdxrZw7djqUqO9jytYNV--9V-KTJmt9Q@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1633371533.g2nx7rum38.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kZhlMTUZAHrrdBPWIBUYWzNcs4Do6cds
X-Proofpoint-GUID: xJBsZPqvGVzL6NLcP9x8V5qyTPSDWVFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=888 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040125
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
Cc: bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Johan,

Johan Almbladh wrote:
> On Fri, Oct 1, 2021 at 11:15 PM Naveen N. Rao
> <naveen.n.rao@linux.vnet.ibm.com> wrote:
>>
>> Various fixes to the eBPF JIT for powerpc, thanks to some new tests
>> added by Johan. This series fixes all failures in test_bpf on powerpc64.
>> There are still some failures on powerpc32 to be looked into.
>=20
> Great work! I have tested it on powerpc64 in QEMU, which is the same
> setup that previously triggered an illegal instruction, and all tests
> pass now. On powerpc32 there are still some issues left as you say.

Thanks for the review, and the test!


- Naveen

