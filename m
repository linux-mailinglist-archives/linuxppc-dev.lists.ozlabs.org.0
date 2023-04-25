Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B07D6EE199
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 14:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5LLP1CQCz3fRM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 22:05:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olL/tHMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olL/tHMn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5LKS6Swdz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:05:00 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PBqFac007063;
	Tue, 25 Apr 2023 12:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/8ly7NB0EZiI9RE6wDMPvrgIWMIFuN3yFNswmt8ospk=;
 b=olL/tHMn1R50/Qy/51hfVODQtkWyG0ReUdGDWOuwbuC4otXgrxfiBPIMh2IUpWTzXFsD
 i0kpN5o4gmRXZI5IvJc+U/BRnETgsph9TdCE9kcBWjndeRLphabWDVN3x0YJcTP3Uo97
 siWMW/s42pbGFA1mP512GMcLRJEjUogAiLUqtyLK66HiNrnDyNgQWDoAArhxChT8z+4M
 q/RwbH2P6wJlUHf6ELFre5htcfgvwO3NcdTqaeLqUfwZMe6Mjbc56ZzFh+rq/ka1KXC7
 cRBRviBYcy9lUfqhTyLeuUdRDBQ8NFgIcHumn2WA7gMQzAY/SJln6T4IDPOjQwpHgFDM TA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6ec98ew4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 12:04:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P8oQ9V006400;
	Tue, 25 Apr 2023 12:04:13 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3q4778v2rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 12:04:13 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33PC4B1j15663732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Apr 2023 12:04:12 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBB8F58056;
	Tue, 25 Apr 2023 12:04:11 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813635803F;
	Tue, 25 Apr 2023 12:04:10 +0000 (GMT)
Received: from [9.160.16.18] (unknown [9.160.16.18])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Apr 2023 12:04:10 +0000 (GMT)
Message-ID: <1202328d-de94-7e9d-c0e8-bb1bd3e9a988@linux.ibm.com>
Date: Tue, 25 Apr 2023 07:04:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] Update Kconfig and Makefile.
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-6-dtsen@linux.ibm.com>
 <ZEdpHDpm19XwN3dG@gondor.apana.org.au>
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <ZEdpHDpm19XwN3dG@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JOMv6Qr3aSMatP0sBxYQFbwXkjutJ7Bu
X-Proofpoint-GUID: JOMv6Qr3aSMatP0sBxYQFbwXkjutJ7Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_05,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=979 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250108
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

I was not sure at the time when I use IS_REACHABLE.  Will fix it in init 
code.

Thanks.

-Danny

On 4/25/23 12:46 AM, Herbert Xu wrote:
> On Mon, Apr 24, 2023 at 02:47:26PM -0400, Danny Tsen wrote:
>> +config CRYPTO_CHACHA20_P10
>> +	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
>> +	depends on PPC64 && CPU_LITTLE_ENDIAN
>> +	select CRYPTO_SKCIPHER
> I thought your IS_REACHABLE test was so that you could build this
> without the Crypto API? Colour me confused.
>
> Cheers,
