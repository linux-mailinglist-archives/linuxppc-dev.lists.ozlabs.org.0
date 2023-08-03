Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB876E13D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 09:25:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N4n4DDN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGgNK5SyPz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 17:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N4n4DDN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGgMQ5LnQz2yhL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 17:24:18 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3737CHr6020247;
	Thu, 3 Aug 2023 07:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=mQnhgyER8GBgfYUBL8z7TlFGJvwgG0B8IuItlBiT9ps=;
 b=N4n4DDN8rwPKRH84PLe7qFu3drAoHgrwS/7AJNPYb5FD4CTNZTImNirwZrS+LgISfrsA
 maIdH5zvnMFMTwluMqEcxX3T/AzxKjRLKfFJFQ/gjEpB2PvH6c+ZVYnqC1zaA1FMAW1H
 IQ0dSEafXqFoqM8FyTtSmwhuXrmrK9gPDpetonn3a5RVz3FSLFlncuUc3QfrD3HIS6OE
 pZ+rbel48Wq7DvRSTfN2S43ajaOGMWAmfRkc0KM2nVivp+meHLR+aCc5jglLdwXu/ugm
 vhwdIBbwI6qGWVhpqUzfNO7Eb1RL7DWdwM3AXq2ylLY7JwcCMNPzRPyQ9rJ3aXh2vPWa EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s87n20bwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 07:24:11 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3737DNws025675;
	Thu, 3 Aug 2023 07:24:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s87n20bvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 07:24:11 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37356u2Y006099;
	Thu, 3 Aug 2023 07:23:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3suyg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 07:23:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3737N74v43712786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Aug 2023 07:23:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1056A2004B;
	Thu,  3 Aug 2023 07:23:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B113120049;
	Thu,  3 Aug 2023 07:23:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.51.166])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  3 Aug 2023 07:23:03 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <4qqzt2g2iuo2kri54jyr7tspfxfod4nzsuzajxk3butoxs2rww@rj4quuzpoeg3>
Date: Thu, 3 Aug 2023 12:52:50 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD9DB9F2-B277-4CAC-8FA5-9B8F970A2F88@linux.vnet.ibm.com>
References: <20230725061649.34937-1-adityag@linux.ibm.com>
 <ZMPWk5K63tadmDlU@kernel.org>
 <CAP-5=fW1zkpJ4zr4ngz=6bZQuE6hOHo4AtXwUsVJK9oiDSc_mg@mail.gmail.com>
 <ZMQJKmV3XtwtZJtO@kernel.org>
 <4qqzt2g2iuo2kri54jyr7tspfxfod4nzsuzajxk3butoxs2rww@rj4quuzpoeg3>
To: Aditya Gupta <adityag@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CmvHsLTZrtxyX6UJU0ojm84U5aqh6M3O
X-Proofpoint-GUID: Jxt5LV32kCn4XDz3-m4Onv9wELHGeeNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_05,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030062
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 03-Aug-2023, at 8:33 AM, Aditya Gupta <adityag@linux.ibm.com> =
wrote:
>=20
> Hi Arnaldo,
> I am working on a patch for 'perf version --has', and will send a =
patch next

Hi Aditya,

I believe, it will be =E2=80=9Cperf build =E2=80=94has=E2=80=9D option. =
And not =E2=80=9Cperf version =E2=80=94has=E2=80=9D  ?

Thanks
Athira
> week using that instead of 'perf version --build-options'.
>=20
> You can skip this patch if not needed.
>=20
> Thanks,
> - Aditya G

