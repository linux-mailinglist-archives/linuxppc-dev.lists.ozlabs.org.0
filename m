Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBB10EA45
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 13:58:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RQCT57t8zDqNs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 23:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RQ7P1ZJrzDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 23:54:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB2ClFZs057658
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 07:54:44 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wm6c0b1sq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 07:54:43 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <zohar@linux.ibm.com>;
 Mon, 2 Dec 2019 12:54:41 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Dec 2019 12:54:33 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB2CsWXc47251894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2019 12:54:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E074AE045;
 Mon,  2 Dec 2019 12:54:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4401FAE051;
 Mon,  2 Dec 2019 12:54:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.147.107])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Dec 2019 12:54:28 +0000 (GMT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-1 tag
From: Mimi Zohar <zohar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Mon, 02 Dec 2019 07:54:27 -0500
In-Reply-To: <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
References: <877e3hfxyq.fsf@mpe.ellerman.id.au>
 <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120212-0028-0000-0000-000003C36428
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120212-0029-0000-0000-00002486796C
Message-Id: <1575291267.4793.371.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_02:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=864
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912020117
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

On Sat, 2019-11-30 at 14:42 -0800, Linus Torvalds wrote:
> [ Only tangentially related to the power parts ]
> 
> On Sat, Nov 30, 2019 at 2:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > There's some changes in security/integrity as part of the secure boot work. They
> > were all either written by or acked/reviewed by Mimi.
> 
>   -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
>   +#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
>   + || defined(CONFIG_PPC_SECURE_BOOT)
> 
> This clearly should be its own CONFIG variable, and be generated by
> having the different architectures just select it.
> 
> IOW, IMA should probably have a
> 
>    config IMA_SECURE_BOOT
> 
> and then s390 would just do the select unconditionally, while x86 and
> ppc would do
> 
>   select IMA_SECURE_BOOT if EFI
> 
> and
> 
>   select IMA_SECURE_BOOT if PPC_SECURE_BOOT
> 
> respectively.
> 
> And then we wouldn't have random architectures adding random "me me me
> tooo!!!" type code.

Agreed, but the naming is a bit off.  The flag somehow needs to take
into account "trusted boot" as well.  On s390, only secure boot is
enabled, at least for the time being.  On x86, both secure and trusted
boot are enabled.  On powerpc, the architecture properly enables
secure and/or trusted boot based on OPAL flags.

It's a bit long, but could the flag be named
IMA_SECURE_AND_OR_TRUSTED_BOOT?

thanks,

Mimi

