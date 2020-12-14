Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA82D955B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 10:38:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvbtR0y3wzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 20:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jDRZ1tcY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvbrs1gLGzDqB7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 20:37:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BE9UvE8115948; Mon, 14 Dec 2020 04:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SMGwKNiIjJsSLpFJJvLVdjJnbI5L7cgDo0FDAfmnpRY=;
 b=jDRZ1tcYgvvzlGeDFe/zCdMREHl70xaCrIh5VFZ7sCwZAJWLavud2tRuV8T13CixF6RC
 QTgb02diMePBnFbq8YsUIZV/EbnKBWCx9nje1yepW0AuvQuzyqtWw/riX6iRur2pYp4G
 l+tdZLspQRwKuTg2q2aEvj6ikuzMXxbBZgTm5pEhd1oGeSWJDa1Jz1KaGLDeucakIpxi
 IrcfLMRDR7WTiVbHBrGQvt0K/dDBhYCnDleJ0CXgbDNEq4d173JEYRbiZAkVNH4Q+i5S
 lKaYYAmW27uE8K3e3GCp/zfK6B/YJpElOi69w4angrssbvHUVvoR7l0siMt+dqZM6oHL Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35e4fbswce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 04:36:37 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BE9VwDl118761;
 Mon, 14 Dec 2020 04:36:36 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35e4fbswbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 04:36:36 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BE9Wxuw002607;
 Mon, 14 Dec 2020 09:36:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 35cng890sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 09:36:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BE9aVNd29688154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 09:36:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F07D4C050;
 Mon, 14 Dec 2020 09:36:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 793874C046;
 Mon, 14 Dec 2020 09:36:29 +0000 (GMT)
Received: from pomme.local (unknown [9.145.29.158])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 09:36:29 +0000 (GMT)
Subject: Re: [PATCH v12 00/31] Speculative page faults
To: Joel Fernandes <joel@joelfernandes.org>,
 Chinwen Chang <chinwen.chang@mediatek.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
 <1594027500.30360.32.camel@mtkswgap22>
 <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
 <1594099897.30360.58.camel@mtkswgap22> <X9bIDHZbe4MB+BAg@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <b256e5ed-0d4c-4baf-16a6-f32f122e344f@linux.ibm.com>
Date: Mon, 14 Dec 2020 10:36:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X9bIDHZbe4MB+BAg@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_04:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140067
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
 zhong jiang <zhongjiang@huawei.com>, David Rientjes <rientjes@google.com>,
 paulmck@linux.vnet.ibm.com, npiggin@gmail.com, sj38.park@gmail.com,
 Jerome Glisse <jglisse@redhat.com>, dave@stgolabs.net, kemi.wang@intel.com,
 kirill@shutemov.name, Thomas Gleixner <tglx@linutronix.de>,
 Haiyan Song <haiyanx.song@intel.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 14/12/2020 à 03:03, Joel Fernandes a écrit :
> On Tue, Jul 07, 2020 at 01:31:37PM +0800, Chinwen Chang wrote:
> [..]
>>>> Hi Laurent,
>>>>
>>>> We merged SPF v11 and some patches from v12 into our platforms. After
>>>> several experiments, we observed SPF has obvious improvements on the
>>>> launch time of applications, especially for those high-TLP ones,
>>>>
>>>> # launch time of applications(s):
>>>>
>>>> package           version      w/ SPF      w/o SPF      improve(%)
>>>> ------------------------------------------------------------------
>>>> Baidu maps        10.13.3      0.887       0.98         9.49
>>>> Taobao            8.4.0.35     1.227       1.293        5.10
>>>> Meituan           9.12.401     1.107       1.543        28.26
>>>> WeChat            7.0.3        2.353       2.68         12.20
>>>> Honor of Kings    1.43.1.6     6.63        6.713        1.24
>>>
>>> That's great news, thanks for reporting this!
>>>
>>>>
>>>> By the way, we have verified our platforms with those patches and
>>>> achieved the goal of mass production.
>>>
>>> Another good news!
>>> For my information, what is your targeted hardware?
>>>
>>> Cheers,
>>> Laurent.
>>
>> Hi Laurent,
>>
>> Our targeted hardware belongs to ARM64 multi-core series.
> 
> Hello!
> 
> I was trying to develop an intuition about why does SPF give improvement for
> you on small CPU systems. This is just a high-level theory but:
> 
> 1. Assume the improvement is because of elimination of "blocking" on
> mmap_sem.
> Could it be that the mmap_sem is acquired in write-mode unnecessarily in some
> places, thus causing blocking on mmap_sem in other paths? If so, is it
> feasible to convert such usages to acquiring them in read-mode?

That's correct, and the goal of this series is to try not holding the mmap_sem 
in read mode during page fault processing.

Converting mmap_sem holder from write to read mode is not so easy and that work 
as already been done in some places. If you think there are areas where this 
could be done, you're welcome to send patches fixing that.

> 2. Assume the improvement is because of lesser read-side contention on
> mmap_sem.
> On small CPU systems, I would not expect reducing cache-line bouncing to give
> such a dramatic improvement in performance as you are seeing.

I don't think cache line bouncing reduction is the main sourcec of performance 
improvement, I would rather think this is the lower part here.
I guess this is mainly because during loading time a lot of page fault is 
occuring and thus SPF is reducing the contention on the mmap_sem.

> Thanks for any insight on this!
> 
> - Joel
> 

