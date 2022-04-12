Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6444FE5F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 18:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBBV5GZ3z3blK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 02:34:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FHG1G18B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FHG1G18B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdB9q4dqhz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 02:33:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CGPGkJ012260; 
 Tue, 12 Apr 2022 16:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=c9kdWw+POzaQW+fleidcvusNLGMoZpz2IqM3kYRaRSg=;
 b=FHG1G18Bs+P8aVfQEPV5AOxQ0Kp+5HIFLBoKAXJl7UfdS6MHzxFJVkZoqaoK+6AaamE3
 j4fNq1sILZ8AsrMYmj7rwMsGSlc41949zI/nZldEo5Tl69yoMAA9BdbO9cgtC/vyjTE2
 gbrXHJvO+9o/YqqUuYh0Ybol8YGhCga50F4NLxNCk5nMz431wFng4HBrZ9AbUg5b/RFR
 jqdvhxecLOymI6BDlUgCHnZ5eBlt9jAxYANwkvZb5AIPk69eI6tm/YeAQHLvUKiaetsA
 W3KOLH2fTKslTF1GQfkW5/QuisTNLeaprgYq555+SlNSJ2GHdoURXyX1JysqxGyaRr0m fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcx786us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:33:29 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGPY5R012890;
 Tue, 12 Apr 2022 16:33:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcx786tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:33:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGGDri006815;
 Tue, 12 Apr 2022 16:33:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3fb1dj582r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:33:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGXN3O43974992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:33:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8D57AE04D;
 Tue, 12 Apr 2022 16:33:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 442C6AE045;
 Tue, 12 Apr 2022 16:33:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.3.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Apr 2022 16:33:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 0/4] Fix perf bench numa, futex and epoll to work with
 machines having #CPUs > 1K
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YlG/1cegJ3Fh/zj/@kernel.org>
Date: Tue, 12 Apr 2022 22:03:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <64B99006-B94E-485E-8382-91E50244A5E4@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <YlGmAd3LEh9He6Pg@kernel.org> <YlG/1cegJ3Fh/zj/@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iBl1BFr_njItt3Pb-ald9kpXGlfMjtih
X-Proofpoint-ORIG-GUID: wPH9ZGI864VHPwR9yJmIplFR6L0lQuno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120079
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Apr-2022, at 10:48 PM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> Em Sat, Apr 09, 2022 at 12:28:01PM -0300, Arnaldo Carvalho de Melo =
escreveu:
>> Em Wed, Apr 06, 2022 at 11:21:09PM +0530, Athira Rajeev escreveu:
>>> The perf benchmark for collections: numa, futex and epoll
>>> hits failure in system configuration with CPU's more than 1024.
>>> These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
>>> in the code to work with affinity.
>>=20
>> Applied 1-3, 4 needs some reworking and can wait for v5.19, the first =
3
>> are fixes, so can go now.
>=20
> Now trying to fix this:
>=20
>  26     7.89 debian:9                      : FAIL gcc version 6.3.0 =
20170516 (Debian 6.3.0-18+deb9u1)
>    bench/numa.c: In function 'alloc_data':
>    bench/numa.c:359:6: error: 'orig_mask' may be used uninitialized in =
this function [-Werror=3Dmaybe-uninitialized]
>      ret =3D sched_setaffinity(0, size, mask);
>      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    bench/numa.c:409:13: note: 'orig_mask' was declared here
>      cpu_set_t *orig_mask;
>                 ^~~~~~~~~
>    cc1: all warnings being treated as errors
>    /git/perf-5.18.0-rc1/tools/build/Makefile.build:139: recipe for =
target 'bench' failed
>    make[3]: *** [bench] Error 2
>=20
>=20
> Happened in several distros.

Hi Arnaldo

Thanks for pointing it. I could be able to recreate this compile error =
in Debian.
The reason for this issue is variable orig_mask which is used and =
initialised in =E2=80=9Calloc_data"
function within if condition for "init_cpu0=E2=80=9D. We can fix this =
issue by initialising it to NULL since
it is accessed conditionally. I also made some changes to CPU_FREE the =
mask in other error paths.
I will post a V3 with these changes.

Athira

>=20
> - Arnaldo

