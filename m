Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C4FC0CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 08:33:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DCrY4kGYzF71p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 18:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DCpT0pNtzDrqZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 18:31:28 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAE7TGVQ132456
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 02:31:25 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w92hjr1ng-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 02:31:23 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Thu, 14 Nov 2019 07:31:18 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Nov 2019 07:31:16 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAE7UduX27394384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 07:30:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADC17A405F;
 Thu, 14 Nov 2019 07:31:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8009A4040;
 Thu, 14 Nov 2019 07:31:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.75.146])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Nov 2019 07:31:14 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Disable trace_imc pmu
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20191114071836.31209-1-maddy@linux.vnet.ibm.com>
 <CAOSf1CF=6GA_W3PZq4fP9hJrkxc=RuAYUWDpRrTUWjiGTK_Wcw@mail.gmail.com>
From: maddy <maddy@linux.vnet.ibm.com>
Date: Thu, 14 Nov 2019 13:01:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAOSf1CF=6GA_W3PZq4fP9hJrkxc=RuAYUWDpRrTUWjiGTK_Wcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19111407-0020-0000-0000-000003860DCF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111407-0021-0000-0000-000021DC2214
Message-Id: <0710f396-e1c5-3891-0ac1-640f282e112d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-14_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911140070
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/14/19 12:50 PM, Oliver O'Halloran wrote:
> On Thu, Nov 14, 2019 at 6:19 PM Madhavan Srinivasan
> <maddy@linux.vnet.ibm.com> wrote:
>> When a root user or a user with CAP_SYS_ADMIN
>> privilege use trace_imc performance monitoring
>> unit events, to monitor application or KVM threads,
>> may result in a checkstop (System crash). Reason
>> being frequent switch of the "trace/accumulation"
>> mode of In-Memory Collection hardware.
>> This patch disables trace_imc pmu unit, but will
>> be re-enabled at a later stage with a fix patchset.
>> ---
>>   arch/powerpc/platforms/powernv/opal-imc.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
>> index e04b20625cb9..5790f078771f 100644
>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>> @@ -285,7 +285,12 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
>>                          domain = IMC_DOMAIN_THREAD;
>>                          break;
>>                  case IMC_TYPE_TRACE:
>> -                       domain = IMC_DOMAIN_TRACE;
>> +                       /* Using trace_imc events to monitor
>> +                        * application or KVM thread performances
>> +                        * may result in a checkstop (system crash).
>> +                        * So disabling it for now.
>> +                        */
>> +                       domain = -1;
>>                          break;
>>                  default:
>>                          pr_warn("IMC Unknown Device type \n");
>> --
>> 2.21.0
>>
> Does this need a Fixes: tag?
I was thinking of adding this commit as a fixes tag for fix patchset. 
But if thats
not right, i can add the fixes tag along with a request to send to 
Stable and post a v2

Maddy

