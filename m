Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2076215747
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:32:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0lLs2pjhzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 22:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0lGV4b0PzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 22:28:17 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066C1hhb040143; Mon, 6 Jul 2020 08:27:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322jptmtgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 08:27:44 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 066C1iLG040297;
 Mon, 6 Jul 2020 08:27:44 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322jptmtfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 08:27:44 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066CQXFi013527;
 Mon, 6 Jul 2020 12:27:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 322hd82ad3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 12:27:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 066CRcCP33292372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 12:27:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C26D04C044;
 Mon,  6 Jul 2020 12:27:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518814C040;
 Mon,  6 Jul 2020 12:27:37 +0000 (GMT)
Received: from pomme.local (unknown [9.145.43.127])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 12:27:37 +0000 (GMT)
Subject: Re: [PATCH v12 00/31] Speculative page faults
To: Chinwen Chang <chinwen.chang@mediatek.com>,
 Haiyan Song <haiyanx.song@intel.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
 <1594027500.30360.32.camel@mtkswgap22>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
Date: Mon, 6 Jul 2020 14:27:36 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594027500.30360.32.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_09:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 cotscore=-2147483648 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060090
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
Cc: jack@suse.cz, sergey.senozhatsky.work@gmail.com, peterz@infradead.org,
 Will Deacon <will.deacon@arm.com>, mhocko@kernel.org, linux-mm@kvack.org,
 paulus@samba.org, Punit Agrawal <punitagrawal@gmail.com>, hpa@zytor.com,
 Michel Lespinasse <walken@google.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, ak@linux.intel.com,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 David Rientjes <rientjes@google.com>, paulmck@linux.vnet.ibm.com,
 npiggin@gmail.com, sj38.park@gmail.com, Jerome Glisse <jglisse@redhat.com>,
 dave@stgolabs.net, kemi.wang@intel.com, kirill@shutemov.name,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 06/07/2020 à 11:25, Chinwen Chang a écrit :
> On Thu, 2019-06-20 at 16:19 +0800, Haiyan Song wrote:
>> Hi Laurent,
>>
>> I downloaded your script and run it on Intel 2s skylake platform with spf-v12 patch
>> serials.
>>
>> Here attached the output results of this script.
>>
>> The following comparison result is statistics from the script outputs.
>>
>> a). Enable THP
>>                                              SPF_0          change       SPF_1
>> will-it-scale.page_fault2.per_thread_ops    2664190.8      -11.7%       2353637.6
>> will-it-scale.page_fault3.per_thread_ops    4480027.2      -14.7%       3819331.9
>>
>>
>> b). Disable THP
>>                                              SPF_0           change      SPF_1
>> will-it-scale.page_fault2.per_thread_ops    2653260.7       -10%        2385165.8
>> will-it-scale.page_fault3.per_thread_ops    4436330.1       -12.4%      3886734.2
>>
>>
>> Thanks,
>> Haiyan Song
>>
>>
>> On Fri, Jun 14, 2019 at 10:44:47AM +0200, Laurent Dufour wrote:
>>> Le 14/06/2019 à 10:37, Laurent Dufour a écrit :
>>>> Please find attached the script I run to get these numbers.
>>>> This would be nice if you could give it a try on your victim node and share the result.
>>>
>>> Sounds that the Intel mail fitering system doesn't like the attached shell script.
>>> Please find it there: https://gist.github.com/ldu4/a5cc1a93f293108ea387d43d5d5e7f44
>>>
>>> Thanks,
>>> Laurent.
>>>
> 
> Hi Laurent,
> 
> We merged SPF v11 and some patches from v12 into our platforms. After
> several experiments, we observed SPF has obvious improvements on the
> launch time of applications, especially for those high-TLP ones,
> 
> # launch time of applications(s):
> 
> package           version      w/ SPF      w/o SPF      improve(%)
> ------------------------------------------------------------------
> Baidu maps        10.13.3      0.887       0.98         9.49
> Taobao            8.4.0.35     1.227       1.293        5.10
> Meituan           9.12.401     1.107       1.543        28.26
> WeChat            7.0.3        2.353       2.68         12.20
> Honor of Kings    1.43.1.6     6.63        6.713        1.24

That's great news, thanks for reporting this!

> 
> By the way, we have verified our platforms with those patches and
> achieved the goal of mass production.

Another good news!
For my information, what is your targeted hardware?

Cheers,
Laurent.

