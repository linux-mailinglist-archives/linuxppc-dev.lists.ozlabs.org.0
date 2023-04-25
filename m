Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9896EE1A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 14:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5LR42PR5z3cjL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 22:09:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6xxO31x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6xxO31x;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5LQ901dKz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:09:04 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PC2gNr025509;
	Tue, 25 Apr 2023 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TH94o3uLfhAefH5ZY8TRLk3tW/kGGXdx62MKv6/Gpis=;
 b=I6xxO31xwN/GRdY14ZoWJQO36QBjG9hDG+ZFJizpeOeUUxueI/hDDitm3xTOs+HbCPSw
 gMHwwW/nRJySZ5boTwujuaISdBOg7Gg7RxyehSmMCt1UdrxIUo1YZRv6YloNyAdYUDF/
 JCGj0OaoxpUeiLT58KxiTSFifszPrMfF84KCIFgyBPo0MGkbMlAsSPrForSkKrySrA7c
 ML1hlDgwnZ6ogAJnsrNE98kbxSS/0/Yb4kY8b0Cmt7jSlkltmBBEvH/TkASvRPCCz6yB
 BjKMgAIAjjG1z/5T8fW47ypADJjJDz/VUkDB27dzw8fjDY0bofcRfb26Xv7srHqtEQe9 bA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6ede0m3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 12:08:49 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P96IlJ015923;
	Tue, 25 Apr 2023 12:08:43 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3q477844sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 12:08:43 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33PC8f3W10945198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Apr 2023 12:08:41 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4ABB58054;
	Tue, 25 Apr 2023 12:08:41 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C0365803F;
	Tue, 25 Apr 2023 12:08:40 +0000 (GMT)
Received: from [9.160.16.18] (unknown [9.160.16.18])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Apr 2023 12:08:40 +0000 (GMT)
Message-ID: <582c9237-2b7d-27cb-f143-59a7f92e2ca6@linux.ibm.com>
Date: Tue, 25 Apr 2023 07:08:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        "Elliott, Robert (Servers)" <elliott@hpe.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-2-dtsen@linux.ibm.com>
 <MW5PR84MB1842E9D9F596D3928B415DBAAB679@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <a8239d13-a3ee-d6c6-13c5-7f668991489d@linux.ibm.com>
 <87a5ywyxtj.fsf@mail.concordia>
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <87a5ywyxtj.fsf@mail.concordia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I_w08SRmnoyOe4rxhGpJRTAggnTwzQjm
X-Proofpoint-ORIG-GUID: I_w08SRmnoyOe4rxhGpJRTAggnTwzQjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_04,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=700
 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "dtsen@us.ibm.com" <dtsen@us.ibm.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "appro@cryptogams.org" <appro@cryptogams.org>, "ltcgcw@linux.vnet.ibm.com" <ltcgcw@linux.vnet.ibm.com>, "leitao@debian.org" <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

It's in IBM repo.

Thanks.

-Danny

On 4/25/23 7:02 AM, Michael Ellerman wrote:
> Danny Tsen <dtsen@linux.ibm.com> writes:
>> This is recommended template to use for IBM copyright.
> According to who?
>
> The documentation I've seen specifies "IBM Corp." or "IBM Corporation".
>
> cheers
