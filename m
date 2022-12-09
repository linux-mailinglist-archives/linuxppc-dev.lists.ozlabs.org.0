Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F96647E8E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 08:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NT2h44K7Qz3bbb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 18:28:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KKYi4Clp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KKYi4Clp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT2g325QYz3bSk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 18:27:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B972YbX033145;
	Fri, 9 Dec 2022 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ZovSt246CY/w7iCDgoDCzU29PGkYU975CgLk0RZzccU=;
 b=KKYi4ClpHLTcsT+NwPPvDsmY1kKC/ISerQXYRwJLvQUahaN15PoWOsgCKDmq1fyMxTiV
 sj8TeXWdTqQAcQNkncTZZlRLvvh9w06VKWxvpl4vDdnZ7di3/l6nq7gEYvlBcK6hqPHK
 SwJ90WwO6En8dNHyKPMjUaINjozBcxSxKoFyX0bKOrlI4ShzkI2qp/plJDVSGPq0fSsM
 01XDa0xZHKNqvZgYjRdTXqWx9b3O/zUbyY2iWQ2GNeou/zDBUhH/AO4RmAFaV+jGHPRc
 bf/itrAQJQWcoWpbWotrZgAMUaXCboDvtbLTNhRsX5ybPA+FTLXTtYi4e6NvAOLdIckE TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbk0gadce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Dec 2022 07:27:46 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B97H8XT021749;
	Fri, 9 Dec 2022 07:27:45 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbk0gadbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Dec 2022 07:27:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B8DnU8d018459;
	Fri, 9 Dec 2022 07:27:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7rc32k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Dec 2022 07:27:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B97RcrE22217354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Dec 2022 07:27:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C36C520049;
	Fri,  9 Dec 2022 07:27:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4370D20043;
	Fri,  9 Dec 2022 07:27:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.0.55])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  9 Dec 2022 07:27:36 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] perf test: Update event group check for support of uncore
 event
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <9c0ade1e-1c7b-90f5-0385-a568545567db@amd.com>
Date: Fri, 9 Dec 2022 12:57:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C59F3E6-B7DE-485B-9483-703EBDE9AC41@linux.vnet.ibm.com>
References: <20221207165815.774-1-atrajeev@linux.vnet.ibm.com>
 <9c0ade1e-1c7b-90f5-0385-a568545567db@amd.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oKrKF23C0F-EY_51NuFo0xQGfcp1tVoL
X-Proofpoint-ORIG-GUID: fe_Auwwm9Tj4313KUasvE77sgeijWQ0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090060
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Dec-2022, at 9:48 AM, Ravi Bangoria <ravi.bangoria@amd.com> =
wrote:
>=20
> On 07-Dec-22 10:28 PM, Athira Rajeev wrote:
>> Event group test checks group creation for combinations of
>> hw, sw and uncore PMU events. Some of the uncore pmus may
>> require additional permission to access the counters.
>> For example, in case of hv_24x7, partition need to have
>> permissions to access hv_24x7 pmu counters. If not, event_open
>> will fail. Hence add a sanity check to see if event_open
>> succeeds before proceeding with the test.
>>=20
>> Fixes: b20d9215a35f ("perf test: Add event group test for events in =
multiple PMUs")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Acked-by: Ravi Bangoria <ravi.bangoria@amd.com>

Thanks Ravi for checking the patch

Athira
>=20
> Thanks,
> Ravi

