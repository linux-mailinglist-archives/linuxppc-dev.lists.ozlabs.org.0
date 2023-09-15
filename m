Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C86C7A1D5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 13:24:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkEc/rho;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnBfw0dljz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 21:24:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkEc/rho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnBf26PzTz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 21:23:54 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FB8BH0027314;
	Fri, 15 Sep 2023 11:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7+tJ/KsIswTmNeKa3tLG1ExmR6SfnnZoUA5bR+lKBMU=;
 b=bkEc/rhonQfrChQKspzo6V0xCg5+tTPJuGHuTBhoZBuBPFNvRgMy1P5XRQL0Cz2nn8+v
 LnKIey2nwxwcZnA2YHTN0kOFa/keshp1ZNKDawssFKZWtKwISYfrCS5BkfnZFZ8qCIb9
 QYGz99nxHhzCG4xAcC0+grlcth5NrvjGsqgr9eYh1mjHxAPZ6UbwlDYQ6MfmDwFjXE01
 QQJ9hMZbCTRBuUadG+R0hsPIH+Alq0qeS3A8D/RL9EAZGT0nZd4iVPB3RnAkUxGR68j3
 V+BYcM31fUVohOxa/J2LA/iZvfImlrJqcuEl3dnVpP4vrF2OPl5wzMwv0lUV/XHTcI4H ew== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4nrg0yb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 11:23:31 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38FANkxP024039;
	Fri, 15 Sep 2023 11:23:30 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131tucsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 11:23:30 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38FBNTC951118478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 11:23:29 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2632158056;
	Fri, 15 Sep 2023 11:23:29 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9E0E58050;
	Fri, 15 Sep 2023 11:23:27 +0000 (GMT)
Received: from [9.67.12.83] (unknown [9.67.12.83])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Sep 2023 11:23:27 +0000 (GMT)
Message-ID: <6297a0bd-3101-d8cc-5a8f-24b3b82a92e6@linux.ibm.com>
Date: Fri, 15 Sep 2023 06:23:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2] crypto: vmx: Improved AES/XTS performance of 6-way
 unrolling for ppc.
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20230830134911.179765-1-dtsen@linux.ibm.com>
 <ZQQ06U7LEgoZMSY6@gondor.apana.org.au>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <ZQQ06U7LEgoZMSY6@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k1wFaZS8WDv_pgb1ahtL03Oaohp_mJzl
X-Proofpoint-GUID: k1wFaZS8WDv_pgb1ahtL03Oaohp_mJzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_08,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 mlxlogscore=678 spamscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309150098
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
Cc: dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Herbert.

-Danny

On 9/15/23 5:41 AM, Herbert Xu wrote:
> On Wed, Aug 30, 2023 at 09:49:11AM -0400, Danny Tsen wrote:
>> Improve AES/XTS performance of 6-way unrolling for PowerPC up
>> to 17% with tcrypt.  This is done by using one instruction,
>> vpermxor, to replace xor and vsldoi.
>>
>> The same changes were applied to OpenSSL code and a pull request was
>> submitted.
>>
>> This patch has been tested with the kernel crypto module tcrypt.ko and
>> has passed the selftest.  The patch is also tested with
>> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   drivers/crypto/vmx/aesp8-ppc.pl | 141 +++++++++++++++++++++-----------
>>   1 file changed, 92 insertions(+), 49 deletions(-)
> Patch applied.  Thanks.
