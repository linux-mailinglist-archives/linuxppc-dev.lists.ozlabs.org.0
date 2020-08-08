Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF223F7F5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 16:39:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BP4c43djBzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 00:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C71n2JqC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BP4PT0VFWzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Aug 2020 00:29:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 078E2JkK154184; Sat, 8 Aug 2020 10:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TB/GwHNOMItG2HQhiXT9/d7rk1gNcUokCye1p22L314=;
 b=C71n2JqCUxQRjW54SBTYJr+rI+Ujump0XEmLZQZpMVwtDk0rDs3UcYfNfwjm1YptHwjv
 Kcd3bAXLITuVCg3tQoZtDLebuAgnZIVSQU9RYX2E82EsbBLYxXNqZHRUIqJ2hT5sjZyj
 xcO0eiVFTAkb/a1c3Q/db5q9WSnmLVuePIHQ3+n7fgs+E6okjVoyLYcNUTtgJKV32hrt
 53oYGsopjGr5FkzERIXcLEqnqyEMjoClH6bRbTV62IjqIpgKalCoO+x4/Yjf22H2myUO
 4M0uwMNrMRZ0u57TzAD7Wg4GQmB1D6h7CggsN7KJZ1vvogRyHmCEMIWYiVB5QnrO6JBx jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6q66h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Aug 2020 10:28:19 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 078E4at3159239;
 Sat, 8 Aug 2020 10:28:19 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6q66gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Aug 2020 10:28:18 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 078EPlRL008085;
 Sat, 8 Aug 2020 14:28:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 32skp808rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Aug 2020 14:28:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 078EQkAo56099176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 8 Aug 2020 14:26:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C05152051;
 Sat,  8 Aug 2020 14:28:13 +0000 (GMT)
Received: from [9.85.90.78] (unknown [9.85.90.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BACBC5204F;
 Sat,  8 Aug 2020 14:27:58 +0000 (GMT)
Subject: Re: [EXTERNAL] Re: [GIT PULL] Please pull powerpc/linux.git
 powerpc-5.9-1 tag
To: Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <87h7tey4xq.fsf@mpe.ellerman.id.au>
 <CAHk-=wif9A9Y1i1xbie5Qsr7e-YoTpv9O_YSF8NCHWksDPEa2Q@mail.gmail.com>
 <20200807191417.GU1236603@ZenIV.linux.org.uk>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <512eabe3-e448-e5fa-9d76-a451c7c96e7f@linux.ibm.com>
Date: Sat, 8 Aug 2020 19:57:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807191417.GU1236603@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-08_06:2020-08-06,
 2020-08-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008080101
X-Mailman-Approved-At: Sun, 09 Aug 2020 00:36:40 +1000
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 desnesn@linux.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 ego@linux.vnet.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
 bin.meng@windriver.com, psampat@linux.ibm.com, bala24@linux.ibm.com,
 msuchanek@suse.de, sathnaga@linux.vnet.ibm.com,
 Oliver O'Halloran <oohall@gmail.com>, fthain@telegraphics.com.au,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, equinox@diac24.net,
 leobras.c@gmail.com, santosh@fossix.org, maddy@linux.ibm.com,
 Nayna Jain <nayna@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 mahesh@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 anju@linux.vnet.ibm.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 weiyongjun1@huawei.com, alastair@d-silva.org, harish@linux.ibm.com,
 Waiman Long <longman@redhat.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, dyoung@redhat.com,
 vdronov@redhat.com, nathanl@linux.ibm.com, miltonm@us.ibm.com,
 palmerdabbelt@google.com, ajd@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 lirongqing@baidu.com, sandipan@linux.ibm.com, kjain@linux.ibm.com,
 muriloo@linux.ibm.com, Nick Piggin <npiggin@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Joe Perches <joe@perches.com>,
 chris.packham@alliedtelesis.co.nz, Vaibhav Jain <vaibhav@linux.ibm.com>,
 felix@linux.ibm.com, hbathini@linux.ibm.com,
 Christophe Leroy <christophe.leroy@c-s.fr>, atrajeev@linux.vnet.ibm.com,
 wenxiong@linux.vnet.ibm.com, sbobroff@linux.ibm.com,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, sourabhjain@linux.ibm.com,
 bharata@linux.ibm.com, Tejun Heo <tj@kernel.org>, miaoqinglang@huawei.com,
 Jeremy Kerr <jk@ozlabs.org>, grandmaster@al2klimov.de, fbarrat@linux.ibm.com,
 huntbag@linux.vnet.ibm.com, kaloz@openwrt.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/20 12:44 AM, Al Viro wrote:
> On Fri, Aug 07, 2020 at 10:46:13AM -0700, Linus Torvalds wrote:
>> On Fri, Aug 7, 2020 at 6:14 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>
>>> Just one minor conflict, in a comment in drivers/misc/ocxl/config.c.
>>
>> Well, this morning I merged the ptrace ->regset_get() updates from Al,
>> and that brought in a different conflict.
>>
>> I _think_ I resolved it correctly, but while the new model is fairly
>> readable, the old one sure wasn't, and who knows how messed up my
>> attempt to sort it out was. I don't know the pkey details on powerpc..
>>
>> So I'd appreciate it if both Al and Aneesh Kumar would check that what
>> I did to pkey_get() in arch/powerpc/kernel/ptrace/ptrace-view.c makes
>> sense and works..
> 
> Grabbing...
> 
> Looks sane and yes, 3 membuf_store() instead of membuf_write() + membuf_store()
> would make sense (might even yield better code).  Up to ppc folks...
> 
>> Side note - it might have been cleaner to just make it do
>>
>>          membuf_store(&to, target->thread.amr);
>>          membuf_store(&to, target->thread.iamr);
>>          return membuf_store(&to, default_uamor);

That will also allow to get rid of

	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));

I will followup with a cleanup patch.


>>
>> instead of doing that membuf_write() for the first two ones and then
>> the membuf_store() for the uamor field, but I did what I did to keep
>> the logic as close to what it used to be as possible.
>>
>> If I messed up, I apologize.
>>
>> And if you agree that making it three membuf_store() instead of that
>> odd "depend on the exact order of the thread struct and pick two
>> consecutive values", I'll leave that to you as a separate cleanup.
>>
>>                     Linus


-aneesh
