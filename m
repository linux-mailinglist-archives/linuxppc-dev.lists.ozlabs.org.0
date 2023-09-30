Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BEC7B3E91
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 08:05:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FBvHYcQr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RyGsC5N0tz3clN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 16:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FBvHYcQr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RyGrK3vtgz3byy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 16:04:17 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38U5HbvW007809;
	Sat, 30 Sep 2023 06:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LRyiDaOSj9T42Z5Yf3CPckOsk9KqcULp1tuqimTRsMQ=;
 b=FBvHYcQrGh14mCpxfxitsX6svGU1PBe5x7pMte1DrvhHVHRanyd+SebmQpsZhi84AWMC
 K65hJ/WPD3Shi8MeueIAzhxbYsbFZ4cN4pz7HsG/STxeOoXosPeLMfyrUT5Sa136G+WZ
 l6HIb4otZrJiS8dXsI4M7FDCihtdDQDeQmepucmyBWmGxjCK3Uw+XF53PM9qtSMq4js1
 /689GrO57tsK/nFo0fO00SxjWPIYG6GZKPtox5rMBGvoAAZo6mzyVHGnqNN7Ts2rRnaS
 RyrjlTXfvn/4KWeyo2aCirjESgQ6MK+v7ZCFdXAzR96/dD6LraFfFEcmpGd9FQGw+1pu bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tedd90qps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Sep 2023 06:04:09 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38U5qwfZ025492;
	Sat, 30 Sep 2023 06:04:09 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tedd90qp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Sep 2023 06:04:09 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38U4Unsw008130;
	Sat, 30 Sep 2023 06:04:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taar0ajn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Sep 2023 06:04:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38U62nVu21889724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Sep 2023 06:02:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D795020043;
	Sat, 30 Sep 2023 06:02:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1878A20040;
	Sat, 30 Sep 2023 06:02:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.118.116])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 30 Sep 2023 06:02:46 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7cgtBCHZWt1h8jZj1k1VuJUvGXjmXuXBmE-4sZXW_inzPA@mail.gmail.com>
Date: Sat, 30 Sep 2023 11:32:36 +0530
Message-Id: <19515993-8065-412A-BBD8-75F6A9EF2EA5@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
 <e5e806c3-da4a-8672-9c8e-6c341c6bd27d@linux.ibm.com>
 <11B32809-962E-4632-95FD-EAF07EE04D1D@linux.vnet.ibm.com>
 <CAM9d7cgtBCHZWt1h8jZj1k1VuJUvGXjmXuXBmE-4sZXW_inzPA@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D-8-FGUrXmHePizSImFoIL5qKf6hGO1s
X-Proofpoint-GUID: J11NZVQ7VczxpHof5I2chjietUaOQePq
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-30_04,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309300048
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, root <root@ltcden13-lp4.aus.stglabs.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28-Sep-2023, at 9:24 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> On Tue, Sep 26, 2023 at 9:29=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 25-Sep-2023, at 1:34 PM, kajoljain <kjain@linux.ibm.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 9/7/23 22:45, Athira Rajeev wrote:
>>>> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
>>>>=20
>>>> shellcheck was run on perf tool shell scripts s a pre-requisite
>>>> to include a build option for shellcheck discussed here:
>>>> https://www.spinics.net/lists/linux-perf-users/msg25553.html
>>>>=20
>>>> And fixes were added for the coding/formatting issues in
>>>> two patchsets:
>>>> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atraje=
ev@linux.vnet.ibm.com/
>>>> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atraje=
ev@linux.vnet.ibm.com/
>>>>=20
>>>> Three additional issues are observed with shellcheck "0.6" and
>>>> this patchset covers those. With this patchset,
>>>>=20
>>>> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellche=
ck -S warning $F; done
>>>> # echo $?
>>>> 0
>>>>=20
>>>=20
>>> Patchset looks good to me.
>>>=20
>>> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
>>>=20
>>> Thanks,
>>> Kajol Jain
>>>=20
>>=20
>> Hi Namhyunbg,
>>=20
>> Can you please check for this patchset also
>=20
> Sure, it's applied to perf-tools-next, thanks!

Thanks Namhyung

Athira


