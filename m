Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D73C464D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 11:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNf0L6cK3z3bW3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 19:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TjmIEYSN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TjmIEYSN; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNdzt57ydz2yLh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 19:40:42 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C9XfNx130319
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 05:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=0g2OAdBAfSiQTHH3eH+6NzsJ8RXigOJMNnZCOM2Lmfo=;
 b=TjmIEYSNMQ633kSjAMoctTritsQxnSc/F9v1jULlaVWrpdeLKGNd+Thbsy6fn+srbyV3
 Z7JmGDrLGLEKssEUJYJWgPXEQtoR0poDXtp7gl8FEiM4IQRn3Vt3veMSwNItBubKkEC2
 mGY3GlCP7T2QRgYINBw9cMt8ZbNRGRBkxlFmWok6aFglGu2ByuolohgZ3RCuJlm82/lo
 pkCYraN1VLK0a/SjQV7DDnlwUsQNxPa5PT1GBDlJTNH+PmiQumMsCvJ/Rih3y9XqQaCB
 oZg9Jxg7urRRsOMrt2UTqj9mH8hgKDbWVHu7K7pL7SkkFNSNAxwFH/pNDRsoFgzILv1o Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrsxm1k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 05:40:38 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C9YfeG137309
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 05:40:38 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrsxm1jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 05:40:37 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C9W5uY000399;
 Mon, 12 Jul 2021 09:40:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 39q368gc20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 09:40:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16C9eXT225559544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 09:40:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4936211C04C;
 Mon, 12 Jul 2021 09:40:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34FB411C052;
 Mon, 12 Jul 2021 09:40:32 +0000 (GMT)
Received: from [9.195.47.54] (unknown [9.195.47.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Jul 2021 09:40:31 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [PATCH] powerpc/perf: Fix cycles/instructions as
 PM_CYC/PM_INST_CMPL in power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210708154352.GA11710@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Date: Mon, 12 Jul 2021 15:10:29 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <60A25057-1C93-4EDE-9504-DBC77EB5F28B@linux.vnet.ibm.com>
References: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1625748771.problnjoqz.astroid@bobo.none>
 <20210708154352.GA11710@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
To: "Paul A. Clarke" <pc@us.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YDJdcuGIfDZagqjgGQExdE-oMMHQQkSU
X-Proofpoint-GUID: 2iO81ly82izOWN4AsUx0LNH_p8_t5lOU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_05:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120074
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Jul-2021, at 9:13 PM, Paul A. Clarke <pc@us.ibm.com> wrote:
>=20
> On Thu, Jul 08, 2021 at 10:56:57PM +1000, Nicholas Piggin wrote:
>> Excerpts from Athira Rajeev's message of July 7, 2021 4:39 pm:
>>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
>>>=20
>>> Power10 performance monitoring unit (PMU) driver uses performance
>>> monitor counter 5 (PMC5) and performance monitor counter 6 (PMC6)
>>> for counting instructions and cycles. Event used for cycles is
>>> PM_RUN_CYC and instructions is PM_RUN_INST_CMPL. But counting of =
these
>>> events in wait state is controlled by the CC56RUN bit setting in
>>> Monitor Mode Control Register0 (MMCR0). If the CC56RUN bit is not
>>> set, PMC5/6 will not count when CTRL[RUN] is zero.
>>=20
>> What's the acutal bug here, can you explain a bit more? I thought
>> PM_RUN_CYC is supposed to be gated by the runlatch.
>=20
> Would this renaming break compatibility with existing tools that
> presume PM_RUN_CYC and PM_RUN_INST_CMPL exist generically?


Hi Paul,

Thanks for checking the patch.

No, this does not break compatibility with existing tools. Since the =
change is only for PMC5 and PMC6. Events PM_RUN_CYC and PM_RUN_INST_CMPL =
still behaves the same way since they are programmed in different =
PMC=E2=80=99s.

Thanks
Athira
>=20
> PC

