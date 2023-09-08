Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C8E798190
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 07:35:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFD9zNUy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhlFW4YkNz3cCK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 15:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFD9zNUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhlDd2wr2z2ytr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 15:34:56 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3884dFNv030246;
	Fri, 8 Sep 2023 05:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=IojGGN4k9PhjOTjGTzYF5mBqzccJUXOLnP6JomWQxyY=;
 b=SFD9zNUy+cgxSbXtBnR9nuY36hbHjyvV4TyV7GzJP4bzzwV1egU36P/t1DHr3IUcMNou
 r/CsJpLysyC1drxN0plmYUXtLXKQIj/AAnRmG69/UHikulmk5jOFcf73vdPW3ALyUT2x
 PLPM60P3r6COonKFaup8vTTysjS1GEBeIDNIBEEJeshEnZur2jIJw8i18U0pBDicZhoq
 gUG+GDEsX26WZeFCFd7D36r6GwWbKC/RE5igg5kvBTmAcIDIh6HmGC9Z1mg90yMEO5Se
 H/TNA4w6vZf6FhqCdFwZYSk/ceEOXxa8duf6Q7T7n4bBuzo8+E9FDkHSa9jWHVo8UGjo Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sys0j4u14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:34:32 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3885GKaQ026040;
	Fri, 8 Sep 2023 05:34:32 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sys0j4u09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:34:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3883mVSk001624;
	Fri, 8 Sep 2023 05:34:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfct9rpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:34:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3885YSe846334228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 05:34:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA33B2004B;
	Fri,  8 Sep 2023 05:34:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CE1720040;
	Fri,  8 Sep 2023 05:34:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.220])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 05:34:26 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V2] perf test: Fix parse-events tests to skip parametrized
 events
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
Date: Fri, 8 Sep 2023 11:04:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F3D650F-91B5-4570-85D2-A925320BE7AE@linux.ibm.com>
References: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ncwsrs04b4s9ZRI7YTYEROvyP4bbozc5
X-Proofpoint-ORIG-GUID: 6YcKZ6TZ9YDNIE33NRW5NF3B0g7Xvwaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080046
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
Cc: irogers@google.com, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Sep-2023, at 10:29 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Testcase "Parsing of all PMU events from sysfs" parse events for
> all PMUs, and not just cpu. In case of powerpc, the PowerVM
> environment supports events from hv_24x7 and hv_gpci PMU which
> is of example format like below:
>=20
> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
> - hv_gpci/event,partition_id=3D?/
>=20
> The value for "?" needs to be filled in depending on system
> configuration. It is better to skip these parametrized events
> in this test as it is done in:
> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
> parametrized events")' which handled a simialr instance with
> "all PMU test".
>=20
> Fix parse-events test to skip parametrized events since
> it needs proper setup of the parameters.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v1 -> v2:
> Addressed review comments from Ian. Updated size of
> pmu event name variable and changed bool name which is
> used to skip the test.
>=20

The patch fixes the reported issue.

6.2: Parsing of all PMU events from sysfs                          : Ok
6.3: Parsing of given PMU events from sysfs                        : Ok

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin=
