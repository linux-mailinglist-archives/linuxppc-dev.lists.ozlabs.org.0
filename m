Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A993AC47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 07:39:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjX6EqFc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTNB15jD6z3d4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 15:39:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjX6EqFc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTN9J2x5Kz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 15:38:43 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O5TtKp012286;
	Wed, 24 Jul 2024 05:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=y
	KeNXOFqy5g6jqxiUJsZ8uQo5fk6656MZM9jPDJC63U=; b=mjX6EqFcHHQSzsFSS
	pN+jAtjCe7OocWo4RfiPqmyU44Lyo7ZDjI6+sy4JHvGPRBEBwskpWBst531VErJi
	5IDosVg3NswRzY1PS2P1+wtUrcfquZNEQFz4gFJVDn1HeQIoqKAdiYjmRFMcDlv0
	Mo1YN0RnE+4YB0oaExg86br8sCmTPnbwHdr646261EmIpv99VhEf49qMjTU1FoZL
	6qDzD37lH1B8i2WrkZB1n9zPjDAmIImbi20QStNmeOGWLQPCa4o5pKoPVCxy7XRd
	AX4TNgfQKJ2vNK9V86t/K6O/NE9XeSCIEpokf4Z/8ZNhC/rSSeoFBk1N4/UcRrDR
	xGPag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40jugj80du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:38:25 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46O5cOoN028714;
	Wed, 24 Jul 2024 05:38:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40jugj80dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:38:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46O5Gghw007084;
	Wed, 24 Jul 2024 05:38:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40gx72p658-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:38:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46O5cI7F51184052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:38:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8EA420043;
	Wed, 24 Jul 2024 05:38:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A89B20040;
	Wed, 24 Jul 2024 05:38:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.99.114])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 24 Jul 2024 05:38:14 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V8 03/15] tools/perf: Update TYPE_STATE_MAX_REGS to
 include max of regs in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Zp__NN2SrLvqn423@x1>
Date: Wed, 24 Jul 2024 11:08:02 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDC1FE3A-5513-4EE0-8656-EF388B99D24D@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
 <20240718084358.72242-4-atrajeev@linux.vnet.ibm.com> <Zp__NN2SrLvqn423@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iPjqfZzVbuW1qVoBJIy8ox7Ti3gFWMEj
X-Proofpoint-GUID: XgydcZ4057_P2ByQwLwu5cYCCmw3RMWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_03,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407240038
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24 Jul 2024, at 12:36=E2=80=AFAM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Thu, Jul 18, 2024 at 02:13:46PM +0530, Athira Rajeev wrote:
>> TYPE_STATE_MAX_REGS is arch-dependent. Currently this is defined
>> to be 16. While checking if reg is valid using has_reg_type,
>> max value is checked using TYPE_STATE_MAX_REGS value. Define
>> this conditionally for powerpc.
>=20
> So what would happen if I get a perf.data file on a powerpc system and
> then try to do data-type profiling on a x86 system?
>=20
> I'm processing this now, but please consider fixing this up in some
> other fashion, I think we have support for collecting registers in a =
way
> that perf.data has all that is needed for us to print them in a cross
> arch way, no?
>=20
> I see there is the FIXME there, ok.
>=20
> - Arnaldo
>=20

Hi Arnaldo

Sure,  thanks.
>> Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/annotate-data.h | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/tools/perf/util/annotate-data.h =
b/tools/perf/util/annotate-data.h
>> index 6fe8ee8b8410..992b7ce4bd11 100644
>> --- a/tools/perf/util/annotate-data.h
>> +++ b/tools/perf/util/annotate-data.h
>> @@ -189,7 +189,11 @@ struct type_state_stack {
>> };
>>=20
>> /* FIXME: This should be arch-dependent */
>> +#ifdef __powerpc__
>> +#define TYPE_STATE_MAX_REGS  32
>> +#else
>> #define TYPE_STATE_MAX_REGS  16
>> +#endif
>>=20
>> /*
>>  * State table to maintain type info in each register and stack =
location.
>> --=20
>> 2.43.0

