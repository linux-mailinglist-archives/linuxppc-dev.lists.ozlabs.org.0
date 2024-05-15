Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A08C66BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:00:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEeTVv7C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfYHT25tsz3cYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEeTVv7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfYGl36DRz3cTr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 22:59:58 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44F9SrQx016508;
	Wed, 15 May 2024 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=utdxrJinQ3y3ssW67uY8/Vj2gKWk7dVKOdUrx/aByzo=;
 b=TEeTVv7CfS7LIh1J0XHjvyUbr/hk3lJtfWgJK0M0nTGdwCUknp1BqL+wceuIqAcU56rl
 i/w9NPn6fKdkLJFkVBhCc4gLIN0vMgeLJ3M3G4DtLfJxpW1DwiX5+myGBuvikgNIiF7Z
 xLF5VJNsE01TrfA5sVJk5Po/XT/L3Ha+QmJ6ERDvdP0W4zeH2i0QQbxsBTfWWAovEXXm
 DOnG1Z99Xy6ayDR3909a8HVMbG3dQZ9bExJuHp8YrMJI7DA1MCMZQjAo1YnNB0a+CnqZ
 sHCbE8sTSqejJCFKb+Se1wgar/krjASe0jHD39t9nFckKgzKaA9T8gTpTGtmcoL1sK3+ sA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4te9rgrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:59:44 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44FA70pQ006132;
	Wed, 15 May 2024 12:59:43 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq2u836-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:59:43 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44FCxeB450856216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 12:59:42 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 064FD58054;
	Wed, 15 May 2024 12:59:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C27A45805D;
	Wed, 15 May 2024 12:59:38 +0000 (GMT)
Received: from [9.67.88.41] (unknown [9.67.88.41])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 12:59:38 +0000 (GMT)
Message-ID: <3d857119-8eb4-4dc0-8543-f30922d53187@linux.ibm.com>
Date: Wed, 15 May 2024 07:59:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Andy Polyakov <appro@cryptogams.org>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com>
 <dc5aadc2-308d-4f24-8a59-45da21b8b2e5@cryptogams.org>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <dc5aadc2-308d-4f24-8a59-45da21b8b2e5@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DlR67ri-zm08JTzNj0Bkvc7vRlejwpzl
X-Proofpoint-ORIG-GUID: DlR67ri-zm08JTzNj0Bkvc7vRlejwpzl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405150090
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank you Andy.  Will fix this.

On 5/15/24 3:11 AM, Andy Polyakov wrote:
> Hi,
>
> Couple of remarks inline.
>
>> +# [1] https://www.openssl.org/~appro/cryptogams/
>
> https://github.com/dot-asm/cryptogams/ is arguably better reference.
>
>> +SYM_FUNC_START(x25519_fe51_mul)
>> +.align    5
>
> The goal is to align the label, not the first instruction after the 
> directive. It's not a problem in this spot, in the beginning of the 
> module that is, but further below it's likely to inject redundant nops 
> between the label and meaningful code. But since the directive in 
> question is not position-sensitive one can resolve this by changing 
> the order of the directive and the SYM_FUNC_START macro.
>
> Cheers.
>
