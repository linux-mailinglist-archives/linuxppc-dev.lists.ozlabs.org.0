Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C95FF94
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 04:52:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fzsK4xCxzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 12:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fzqf0GBkzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 12:50:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x652lAEZ022873
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 22:50:49 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2thr79repr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 22:50:49 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <arbab@linux.ibm.com>;
 Fri, 5 Jul 2019 03:50:48 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 5 Jul 2019 03:50:46 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x652oj5915336360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 02:50:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DBC5112062;
 Fri,  5 Jul 2019 02:50:45 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DBF9112061;
 Fri,  5 Jul 2019 02:50:45 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.85.182.131])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jul 2019 02:50:45 +0000 (GMT)
Received: from arbab-vm (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTP id 08944100235;
 Thu,  4 Jul 2019 21:50:42 -0500 (CDT)
Date: Thu, 4 Jul 2019 21:50:42 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-10-santosh@fossix.org>
 <1562047959.5y756f60wn.astroid@bobo.none>
 <20190703172008.aiyofnhqgbzi6ckw@arbab-vm>
 <1562207031.05iwu5t2xm.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1562207031.05iwu5t2xm.astroid@bobo.none>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19070502-2213-0000-0000-000003A993D7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011381; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01227588; UDB=6.00646368; IPR=6.01008826; 
 MB=3.00027593; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-05 02:50:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070502-2214-0000-0000-00005F1CCF68
Message-Id: <20190705025042.nnov5s45jc4jd5ld@arbab-vm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=835 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050036
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 04, 2019 at 12:36:18PM +1000, Nicholas Piggin wrote:
>Reza Arbab's on July 4, 2019 3:20 am:
>> Since the notifier chain is actually part of the decision between (1)
>> and (2), it's a hard limitation then that callbacks be in real address
>> space. Is there any way to structure things so that's not the case?
>
>If we tested for KVM guest first, and went through and marked (maybe
>in a paca flag) everywhere else that put the MMU into a bad / non-host
>state, and had the notifiers use the machine check stack, then it
>would be possible to enable MMU here.
>
>Hmm, testing for IR|DR after testing for KVM guest might actually be
>enough without requiring changes outside the machine check handler...
>Actually no that may not quite work because the handler could take a
>SLB miss and it might have been triggered inside the SLB miss handler.
>
>All in all I'm pretty against turning on MMU in the MCE handler
>anywhere.

Hey, fair enough. Just making sure there really isnt't any room to make 
things work the way I was trying.

>> Luckily this patch isn't really necessary for memcpy_mcsafe(), but we
>> have a couple of other potential users of the notifier from external
>> modules (so their callbacks would require virtual mode).
>
>What users are there? Do they do any significant amount of logic that
>can not be moved to vmlinux?

One I had in mind was the NVIDIA driver. When taking a UE from defective 
GPU memory, it could use the notifier to save the bad address to a 
blacklist in their nvram. Not so much recovering the machine check, just 
logging before the system reboots.

The other user is a prototype driver for the IBM Research project we had 
a talk about offline a while back.

We can make this patchset work for memcpy_mcsafe(), but I think it's 
back to the drawing board for the others.

-- 
Reza Arbab

