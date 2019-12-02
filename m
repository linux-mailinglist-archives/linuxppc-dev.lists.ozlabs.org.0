Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020B10E403
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 01:09:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R57Z2vvqzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 11:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47R55k0YvdzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 11:07:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB202HVf017837; Sun, 1 Dec 2019 19:06:23 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6s4dnbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Dec 2019 19:06:23 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB203gXj021217;
 Sun, 1 Dec 2019 19:06:23 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6s4dnay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Dec 2019 19:06:22 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB2054Vo028893;
 Mon, 2 Dec 2019 00:06:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2wkg261e9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 00:06:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB206JH152429162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2019 00:06:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 628D16A047;
 Mon,  2 Dec 2019 00:06:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 826696A057;
 Mon,  2 Dec 2019 00:06:08 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.75.73])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 Dec 2019 00:06:08 +0000 (GMT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-1 tag
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Mimi Zohar <zohar@linux.ibm.com>
References: <877e3hfxyq.fsf@mpe.ellerman.id.au>
 <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <b71e214d-6578-cead-6824-852e99e0edf9@linux.vnet.ibm.com>
Date: Sun, 1 Dec 2019 19:06:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-01_04:2019-11-29,2019-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=688 suspectscore=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912010217
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
Cc: tyreld@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, yanaijie@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, madalin.bucur@nxp.com,
 YueHaibing <yuehaibing@huawei.com>, krzk@kernel.org, debmc@linux.vnet.ibm.com,
 valentin@longchamp.me, alastair@d-silva.org, harish@linux.ibm.com,
 leonardo@linux.ibm.com, msuchanek@suse.de, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, thuth@redhat.com, ajd@linux.ibm.com,
 gwalbon@linux.ibm.com, linuxram@us.ibm.com, Nick Piggin <npiggin@gmail.com>,
 oss@buserror.net, chris.packham@alliedtelesis.co.nz, Qian Cai <cai@lca.pw>,
 clg@kaod.org, Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, hbathini@linux.ibm.com,
 asteinhauser@google.com, Mathieu Malaterre <malat@debian.org>,
 cmr@informatik.wtf, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sbobroff@linux.ibm.com, chris.smart@humanservices.gov.au,
 vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/30/19 5:42 PM, Linus Torvalds wrote:
> [ Only tangentially related to the power parts ]
>
> On Sat, Nov 30, 2019 at 2:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> There's some changes in security/integrity as part of the secure boot work. They
>> were all either written by or acked/reviewed by Mimi.
>    -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
>    +#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
>    + || defined(CONFIG_PPC_SECURE_BOOT)
>
> This clearly should be its own CONFIG variable, and be generated by
> having the different architectures just select it.
>
> IOW, IMA should probably have a
>
>     config IMA_SECURE_BOOT
>
> and then s390 would just do the select unconditionally, while x86 and
> ppc would do
>
>    select IMA_SECURE_BOOT if EFI
>
> and
>
>    select IMA_SECURE_BOOT if PPC_SECURE_BOOT
>
> respectively.
>
> And then we wouldn't have random architectures adding random "me me me
> tooo!!!" type code.


Thanks Linus for your feedback. I will do the patch for Kconfig cleanup.

Thanks & Regards,

        - Nayna

