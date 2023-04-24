Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C46ED854
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 01:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q515B2S4Yz3f7Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 09:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PH0Ubasg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PH0Ubasg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q514G4qY3z30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 09:07:26 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ON6Vqq015808;
	Mon, 24 Apr 2023 23:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fExAxKLVcSTqPhkI6VxZk6pSQLPZPhLetOrek+2+AFI=;
 b=PH0Ubasgb5J396r2jXQ4GFI6TODc/t0DJE76T6NzAUK9Ttt/Dll8H4RmUzN+WPE0To/L
 iao4FQBMujMCJ4baka4RzhjOKtfs6lMX/KTlRwCRoVPJqDOwTjPMXi4USmBvocC6spsO
 wkN/4VpuWosgOwgyxlPw/B7luMO+P7y+O4WzOEnlmL2MvJccml8aGzBwdHlT9WDiCMUS
 7Iq9d/uaUJldxu1SnMiwi3nqs7pJAsmnTlwVQUT3+jqeTTQn6LaG41rra28eqP0/e0an
 IZJFVusgyaE4AdXpiHfJSfAFU6STdf5Kel6ch1i5SYAOrujLHXewozYGZwjcP8oMm3Hn dA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q617dkp1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 23:07:11 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33OMRbQb001323;
	Mon, 24 Apr 2023 23:07:05 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q4778ddx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 23:07:05 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33ON74eT2818628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 23:07:04 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C14D5806F;
	Mon, 24 Apr 2023 23:07:04 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8987458067;
	Mon, 24 Apr 2023 23:07:03 +0000 (GMT)
Received: from [9.160.84.113] (unknown [9.160.84.113])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 23:07:03 +0000 (GMT)
Message-ID: <a8239d13-a3ee-d6c6-13c5-7f668991489d@linux.ibm.com>
Date: Mon, 24 Apr 2023 18:07:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Content-Language: en-US
To: "Elliott, Robert (Servers)" <elliott@hpe.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-2-dtsen@linux.ibm.com>
 <MW5PR84MB1842E9D9F596D3928B415DBAAB679@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <MW5PR84MB1842E9D9F596D3928B415DBAAB679@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3ToIx2cMVqsNRfwcrV9RUxtMw79fqZgI
X-Proofpoint-GUID: 3ToIx2cMVqsNRfwcrV9RUxtMw79fqZgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 phishscore=0 adultscore=0 mlxlogscore=694 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240209
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
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "dtsen@us.ibm.com" <dtsen@us.ibm.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "appro@cryptogams.org" <appro@cryptogams.org>, "ltcgcw@linux.vnet.ibm.com" <ltcgcw@linux.vnet.ibm.com>, "leitao@debian.org" <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is recommended template to use for IBM copyright.

Thanks.

-Danny

On 4/24/23 3:40 PM, Elliott, Robert (Servers) wrote:
>> +# Copyright 2023- IBM Inc. All rights reserved
> I don't think any such entity exists - you probably mean IBM Corporation.
