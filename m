Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0D296C99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 12:16:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHg9j71TLzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 21:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UwdWn5sm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHg7w1vYLzDqkm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 21:14:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09NA3PF3051700; Fri, 23 Oct 2020 06:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a15mbW8zcVXI+rhGsoIDbWwxSp3qUqC7/Pc2aj8IvZU=;
 b=UwdWn5smR7pe1i7cZ6eG5X+gjbtWe2jy6wRSuDw7LGddRKHIbxCuKvRiEd5GI4m8dgcW
 9DYk0QE1L7/dmdQsP12KtKxS72xMQ30FO3ssCRZBhovP6g+uL0OoxyTw1ni5OjCgf7pN
 zoaLXIQkqoPp+8NKMBhaXPmCNvLk6q5ccpXZcUMoCg4F4bGngHmy16Yzori6xrCUlD1Q
 yNQYxTeB963zrzUrdCNF4FzPVoZm8EB2xvVm2z2pmFoHqoK7v9qzArmHoJ3Ymvbi7qEh
 vIHVFcJBiCdt28rSWOK6B4i+10m4O1LqF85fM5EtdHOFWLgVrWrcmT3PkVPlEYXh8Vc+ TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b4d35mhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 06:14:24 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09NA45pd054838;
 Fri, 23 Oct 2020 06:14:24 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b4d35mh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 06:14:24 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NA7wEi026596;
 Fri, 23 Oct 2020 10:14:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 347r88bawb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 10:14:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09NAEIMi29032824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Oct 2020 10:14:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95F9A4040;
 Fri, 23 Oct 2020 10:14:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66736A4055;
 Fri, 23 Oct 2020 10:14:16 +0000 (GMT)
Received: from [9.199.37.152] (unknown [9.199.37.152])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 23 Oct 2020 10:14:16 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: Introduce POWER10_DD1 feature
To: Jordan Niethe <jniethe5@gmail.com>
References: <20201022034039.330365-1-ravi.bangoria@linux.ibm.com>
 <CACzsE9q2nYN88bupu5Ce4Eb6r5c-_8wRciWx6qZg2RdF3Ar8Yw@mail.gmail.com>
 <883e5c02-de09-72a2-21f4-c23075d08ae5@linux.ibm.com>
 <CACzsE9rqopXj37vrOcyM3sisomeYzxbeR6V4o5K3_Y8xqo5hHw@mail.gmail.com>
Message-ID: <a5f84290-0343-fed6-6421-dd1b41084335@linux.ibm.com>
Date: Fri, 23 Oct 2020 15:44:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9rqopXj37vrOcyM3sisomeYzxbeR6V4o5K3_Y8xqo5hHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-23_04:2020-10-23,
 2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230069
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 maddy@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>>> +static void __init fixup_cpu_features(void)
>>>> +{
>>>> +       unsigned long version = mfspr(SPRN_PVR);
>>>> +
>>>> +       if ((version & 0xffffffff) == 0x00800100)
>>>> +               cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>>>> +}
>>>> +
>>> I am just wondering why this is needed here, but the same thing is not
>>> done for, say, CPU_FTR_POWER9_DD2_1?
>>
>> When we don't use DT cpu_features (PowerVM / kvm geusts), we call
>> identify_cpu() twice. First with Real PVR which sets "raw" cpu_spec
>> as cur_cpu_spec and then 2nd time with Logical PVR (0x0f...) which
>> (mostly) overwrites the cur_cpu_spec with "architected" mode cpu_spec.
>> I don't see DD version specific entries for "architected" mode in
>> cpu_specs[] for any previous processors. So I've introduced this
>> function to tweak cpu_features.
>>
>> Though, I don't know why we don't have similar thing for
>> CPU_FTR_POWER9_DD2_1. I've to check that.
>>
>>> And should we get a /* Power10 DD 1 */ added to cpu_specs[]?
>>
>> IIUC, we don't need such entry. For PowerVM / kvm guests, we overwrite
>> cpu_spec, so /* Power10 */ "raw" entry is sufficient. And For baremetal,
>> we don't use cpu_specs[] at all.
> I think even for powernv, using dt features can be disabled by the
> cmdline with dt_cpu_ftrs=off, then cpu_specs[] will then be used.

Ok... with dt_cpu_ftrs=off, we seem to be using raw mode cpu_specs[] entry on
baremetal. So yeah, I'll add /* Power10 DD1 */ raw mode entry into cpu_specs[].
Thanks for pointing it out.

-Ravi
