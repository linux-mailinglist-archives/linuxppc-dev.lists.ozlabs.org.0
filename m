Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603986CA82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:42:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfU65f62;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlsqK00MVz3dy3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 00:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfU65f62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlspc0xfJz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 00:42:15 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41TDC4ju014621;
	Thu, 29 Feb 2024 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=CN8d9qs9bK2nBSe407YM+1QZygns9B32A4YL8wwARmw=;
 b=qfU65f62T5Jj9jBk1CeCH9rnOGWO77KEt8IeSJqWRpiXLPglBH/4LOh8Ke64KDVKTJLa
 I15NjmLVo+WeJzOfQoV+O+Irwy3UYzAQ8QNOrP/L5gwcbMVIgA3aM7UdFtHvlpRseuNo
 0YnKDnL7B34g+uVOTTP2BLi04tOOOrNbMBzrWcz33ONgn+XLqfiZ05MAlj7GCPxsBCu5
 smWc2ZYxSB6+z1tZoZ077wd0rvWfQM6FbtqQE7gzG0S1qASH7yXKLOQ5FcGJc+UQPB+e
 JHxLzwvBr1Y8R7SPSIF4VtaRSR0XiwukGv++9KpTaKZQIbLhBymk0RayHXZsl3JPJ2nX HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjtknrxr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:42:05 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41TDfh7o009472;
	Thu, 29 Feb 2024 13:42:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjtknrxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:42:05 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41TDDdJO008827;
	Thu, 29 Feb 2024 13:42:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstwwft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:42:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41TDfwUx21365328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 13:42:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CAA520043;
	Thu, 29 Feb 2024 13:41:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7723320040;
	Thu, 29 Feb 2024 13:41:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.80.238])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 13:41:56 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH 2/3] selftest/powerpc: Add flags.mk to support pmu
 buildable
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240229093711.581230-2-maddy@linux.ibm.com>
Date: Thu, 29 Feb 2024 19:11:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <320A6046-7D67-4A1B-B7D4-8BED007E487B@linux.ibm.com>
References: <20240229093711.581230-1-maddy@linux.ibm.com>
 <20240229093711.581230-2-maddy@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 24HvLJtOTm7l4y4xND14F5e61iSbrw_t
X-Proofpoint-ORIG-GUID: _zgUisSvMjgCMgUpRUqYCk_mLhSI0NUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290105
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
Cc: linuxppc-dev@lists.ozlabs.org, aneesh.kumar@kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, naveen.n.rao@linux.ibm.com, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Feb-2024, at 3:07=E2=80=AFPM, Madhavan Srinivasan =
<maddy@linux.ibm.com> wrote:
>=20
> When running `make -C powerpc/pmu run_tests` from top level selftests
> directory, currently this error is being reported
>=20
> make: Entering directory =
'/home/maddy/linux/tools/testing/selftests/powerpc/pmu'
> Makefile:40: warning: overriding recipe for target 'emit_tests'
> ../../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
> gcc -m64    count_instructions.c ../harness.c event.c lib.c ../utils.c =
loop.S  -o /home/maddy/selftest_output//count_instructions
> In file included from count_instructions.c:13:
> event.h:12:10: fatal error: utils.h: No such file or directory
> 12 | #include "utils.h"
>  |          ^~~~~~~~~
> compilation terminated.
>=20
> This is due to missing of include path in CFLAGS. That is, CFLAGS and
> GIT_VERSION macros are defined in the powerpc/ folder Makefile which
> in this case not involved.
>=20
> To address the failure incase of executing specific sub-folder test =
directly,
> a new rule file has been addded by the patch called "flags.mk" under
> selftest/powerpc/ folder and is linked to all the Makefile of =
powerpc/pmu
> sub-folders.
>=20
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---

Fixes the reported problem for me.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

While at it, FWIW I have also tested the remaining 2 patches and
no problems were seen.

For the other 2 patches in the series

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

=E2=80=94 Sachin=
