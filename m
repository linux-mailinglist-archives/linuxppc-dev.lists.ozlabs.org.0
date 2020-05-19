Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6541D98AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 15:57:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RHW13z6lzDq9Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 23:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RHQN5dVVzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 23:53:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JDVbgX048260; Tue, 19 May 2020 09:52:46 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c64g1wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 09:52:46 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JDo74X024853;
 Tue, 19 May 2020 13:52:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 313wh3mynt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 13:52:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JDqidS30998992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 13:52:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ACB4BE051;
 Tue, 19 May 2020 13:52:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCDF5BE053;
 Tue, 19 May 2020 13:52:42 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.68.132])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 May 2020 13:52:42 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
In-Reply-To: <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
Date: Tue, 19 May 2020 19:22:39 +0530
Message-ID: <87d070f2vs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_04:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 cotscore=-2147483648
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190117
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
Cc: alistair@popple.id.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Mon, May 18, 2020 at 10:30 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:

...

>> Applications using new instructions will behave as expected when running
>> on P8 and P9. Only future hardware will differentiate between 'dcbf' and
>> 'dcbfps'
>
> Right, this is the problem. Applications using new instructions behave
> as expected, the kernel has been shipping of_pmem and papr_scm for
> several cycles now, you're saying that the DAX applications written
> against those platforms are going to be broken on P8 and P9?

The expecation is that both kernel and userspace would get upgraded to
use the new instruction before actual persistent memory devices are
made available.

>
>> > I'm thinking the kernel
>> > should go as far as to disable DAX operation by default on new
>> > hardware until userspace asserts that it is prepared to switch to the
>> > new implementation. Is there any other way to ensure the forward
>> > compatibility of deployed ppc64 DAX applications?
>>
>> AFAIU there is no released persistent memory hardware on ppc64 platform
>> and we need to make sure before applications get enabled to use these
>> persistent memory devices, they should switch to use the new
>> instruction?
>
> Right, I want the kernel to offer some level of safety here because
> everything you are describing sounds like a flag day conversion. Am I
> misreading? Is there some other gate that prevents existing users of
> of_pmem and papr_scm from having their expectations violated when
> running on P8 / P9 hardware? Maybe there's tighter ecosystem control
> that I'm just not familiar with, I'm only going off the fact that the
> kernel has shipped a non-zero number of NVDIMM drivers that build with
> ARCH=ppc64 for several cycles.

If we are looking at adding changes to kernel that will prevent a kernel
from running on newer hardware in a specific case, we could as well take
the changes to get the kernel use the newer instructions right?

But I agree with your concern that if we have older kernel/applications
that continue to use `dcbf` on future hardware we will end up
having issues w.r.t powerfail consistency. The plan is what you outlined
above as tighter ecosystem control. Considering we don't have a pmem
device generally available, we get both kernel and userspace upgraded
to use these new instructions before such a device is made available.

-aneesh
