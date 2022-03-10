Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0134D4701
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 13:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDpLg082sz3bTh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 23:30:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L/9onr5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L/9onr5m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDpKy1j3dz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 23:29:57 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAooOD021462; 
 Thu, 10 Mar 2022 12:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TzToPHVNALCunRXh9JUk1SMieMaPtIuIU3Y1haC8P/g=;
 b=L/9onr5mIgNnd5LSoTrzSsKN7KWkiJqoyEUpId6xYf1SWKzMdmkBw6fj3vapjaj7Qn9u
 +rlIksPgpiVrTmbfGXz31dXzMkLg3Reo3xLCscXjbI1W2EBXmoPpi/flhBoGxoc7qZBn
 HGwJb11CmYenGhV1P2n2+g0gfZ3cVNUc+Woa3K0H1c0Zb775O30JOPvZtqBosmaHqJS2
 6LgKH1Ez8GbVYmmecl2tpRN7nskNHrAyBHL0UBwTAv5DIWmJdkHAGa7DwPJY/XUlRlwT
 xCE5EsSIKf2HM8Dfjj39q/RBwYB44AE8CgsVoG6xQpYAxAs3vm0l0ai1C5u4h8Xekvpj 5w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqfxfsy1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 12:29:48 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ACRquT012770;
 Thu, 10 Mar 2022 12:29:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3ekyg92ry5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 12:29:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ACThNf42270988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 12:29:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCEA942045;
 Thu, 10 Mar 2022 12:29:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0776F42041;
 Thu, 10 Mar 2022 12:29:37 +0000 (GMT)
Received: from [9.43.127.73] (unknown [9.43.127.73])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 12:29:36 +0000 (GMT)
Message-ID: <477b9bb3-a919-1ceb-28d8-89f4f02fd6a6@linux.ibm.com>
Date: Thu, 10 Mar 2022 17:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/20] selftest/powerpc/pmu/: Add selftest for mmcr1
 pmcxsel/unit/cache fields
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
 <20220127072012.662451-17-kjain@linux.ibm.com>
 <4c7785cf-3b92-c273-35ea-fc95131fac46@csgroup.eu>
 <87czium2h9.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87czium2h9.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dnlVsZHh6f8Nk0lxs8uGq4wA1_NRtW3e
X-Proofpoint-ORIG-GUID: dnlVsZHh6f8Nk0lxs8uGq4wA1_NRtW3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100065
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
 "maddy@linux.vnet.ibm.com" <maddy@linux.vnet.ibm.com>,
 "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/10/22 17:41, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 27/01/2022 à 08:20, Kajol Jain a écrit :
>>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>
>>> The testcase uses event code "0x1340000001c040" to verify
>>> the settings for different fields in Monitor Mode Control
>>> Register 1 (MMCR1). The fields include PMCxSEL, PMCXCOMB
>>> PMCxUNIT, cache. Checks if these fields are translated
>>> correctly via perf interface to MMCR1
>>>
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>
>> I see the series has been accepted but this patch has been left over.
>>
>> Any reason ?
> 
> Yeah it's flakey. It counts cache loads but the workload it runs doesn't
> necessarily cause any, so it sometimes fails. I've reported that
> privately to Kajol.
> 

Hi Christophe,
     As Michael mentioned, with the current workload we used in this
patch, the testcase was failing sometimes as required cache load not
happening everytime. We will send this patch separately with proper
workload in next version.

Thanks,
Kajol Jain

> cheers
