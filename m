Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C76EE166
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 13:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5L5x4LQ8z3f6s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUSBuMmf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUSBuMmf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5L4k0Zncz3f4L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 21:53:57 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PBeqv7031308;
	Tue, 25 Apr 2023 11:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PYQw1s1UJ4ZCRX8T/hOdGvjUGWcyLQTuH++SIg+EMBA=;
 b=PUSBuMmfHRXh+xpkXntuoqa9ndYyrnPRRSx36solurRrh8yV6R25Jss8Xp14jOg8evO8
 hQNqgnx0Jrl9Wlo7gAWxsCPCyDTWZKXlB0zkOIHasrA5Y4Qa091qHq+H9e0PCml5U6IQ
 nmdgbAYXDD/DyhM2pqBzr4wVcaLQ48noJ3FBN39a52TyqY19w7TTABwdkCeHQCgEduWh
 S15ylVu9DejlX/1+MsBRVI3SnL+fAoKNV7b0ArJrE8haC0DApjSjhU57DhwNf+vsWR0E
 +t9nvmW89sCuCRADRA7T0tlzEHsSapSySpKVXf0MK3qtVfXOgVEMEGZkquSqkYXbEJmB rA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6d30u5ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 11:53:45 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P8lJji016566;
	Tue, 25 Apr 2023 11:53:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3q477842sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 11:53:44 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33PBrgGY27525864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Apr 2023 11:53:42 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8574B58054;
	Tue, 25 Apr 2023 11:53:42 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F5DB5804E;
	Tue, 25 Apr 2023 11:53:41 +0000 (GMT)
Received: from [9.160.16.18] (unknown [9.160.16.18])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Apr 2023 11:53:41 +0000 (GMT)
Message-ID: <841ea455-ef41-427c-7ce5-3c9c942abd14@linux.ibm.com>
Date: Tue, 25 Apr 2023 06:53:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] Glue code for optmized Chacha20 implementation for
 ppc64le.
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-3-dtsen@linux.ibm.com>
 <ZEdoFv4tS69ELyNo@gondor.apana.org.au>
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <ZEdoFv4tS69ELyNo@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zlHphbR6COsD9eRHL4IDo-_c0b1YBhGx
X-Proofpoint-GUID: zlHphbR6COsD9eRHL4IDo-_c0b1YBhGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_04,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250103
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

Got it.  Will fix it.

Thanks.

-Danny


On 4/25/23 12:41 AM, Herbert Xu wrote:
> On Mon, Apr 24, 2023 at 02:47:23PM -0400, Danny Tsen wrote:
>> +static int chacha_p10_stream_xor(struct skcipher_request *req,
>> +				 const struct chacha_ctx *ctx, const u8 *iv)
>> +{
>> +	struct skcipher_walk walk;
>> +	u32 state[16];
>> +	int err;
>> +
>> +	err = skcipher_walk_virt(&walk, req, false);
>> +	if (err)
>> +		return err;
>> +
>> +	chacha_init_generic(state, ctx->key, iv);
>> +
>> +	while (walk.nbytes > 0) {
>> +		unsigned int nbytes = walk.nbytes;
>> +
>> +		if (nbytes < walk.total)
>> +			nbytes = rounddown(nbytes, walk.stride);
>> +
>> +		if (!static_branch_likely(&have_p10) ||
> You don't need the static branch in the Crypto API code since
> the registration is already conditional.
>
> Cheers,
