Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E733FEF7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 16:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0k1z1mp9z2ywJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 00:33:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4UcL29f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k4UcL29f; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0k164yDmz2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 00:32:58 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 182EQd2Y195118; Thu, 2 Sep 2021 10:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aAVa1iMgsObqCCRrewhu6b9lpHRpplNatmoD++YDd94=;
 b=k4UcL29fcJxCWMcXvrqCiBVMtdlkeROlWbsPLp87vXBdI6NpRqxy++g6FnrI97XCXDbS
 IqxhdQqN35PXw3ZqnGyI/FoSezGrAyNkxttuNrN2s1r0MZ7JvuJEhfpAnPOF3Qir/I0H
 CIkpI7KbWhnogqXAjjoqkpVA2H0+ZjOfyMA9v9H2fzt69+nnZ2WGlvzR5py+3Ihg03sh
 wgulkfuwueDHm8c/WR2iXAsvOBFkJv5YOYf/r8w0WsC7HDrWFEfXVFBqgqZ92ZiaqRGV
 0as/yusEr1zToAc36iI98QuF3pNMRScwJSyMATtjidYf6NfzHGXJz4o4aRLTOs3Jpuz0 Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atyhytbe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 10:32:49 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 182E5gk7033611;
 Thu, 2 Sep 2021 10:32:48 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atyhytbd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 10:32:48 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 182EIpm1006353;
 Thu, 2 Sep 2021 14:32:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3atdxca7tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 14:32:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 182EWk0s42402180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Sep 2021 14:32:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BF4AC059;
 Thu,  2 Sep 2021 14:32:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02864AC06A;
 Thu,  2 Sep 2021 14:32:44 +0000 (GMT)
Received: from localhost (unknown [9.211.46.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Sep 2021 14:32:44 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/5] KVM: PPC: Book3S: Modules cleanup and unification
In-Reply-To: <YTAownlTy46X4jGV@yekko>
References: <20210901173357.3183658-1-farosas@linux.ibm.com>
 <YTAownlTy46X4jGV@yekko>
Date: Thu, 02 Sep 2021 11:32:41 -0300
Message-ID: <875yvjujxy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xdbtb5OlaprufF_i_COtlJX7Wr7giHQ3
X-Proofpoint-ORIG-GUID: RqosU1aBjPXLNTxvY8sBi-yAujJmdqW6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-02_04:2021-09-02,
 2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020086
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Sep 01, 2021 at 02:33:52PM -0300, Fabiano Rosas wrote:
>> This series merges our three kvm modules kvm.ko, kvm-hv.ko and
>> kvm-pr.ko into one kvm.ko module.
>
> That doesn't sound like a good idea to me.  People who aren't on BookS
> servers don't want - and can't use - kvm-hv.  Almost nobody wants
> kvm-pr.  It's also kind of inconsistent with x86, which has the
> separate AMD and Intel modules.

But this is not altering the ability of having only kvm-hv or only
kvm-pr. I'm taking the Kconfig options that used to produce separate
modules and using them to select which code gets built into the one
kvm.ko module.

Currently:

CONFIG_KVM_BOOK3S_64=m     <-- produces kvm.ko
CONFIG_KVM_BOOK3S_64_HV=m  <-- produces kvm-hv.ko
CONFIG_KVM_BOOK3S_64_PR=m  <-- produces kvm-pr.ko

I'm making it so we now have one kvm.ko everywhere, but there is still:

CONFIG_KVM_BOOK3S_64=m           <-- produces kvm.ko
CONFIG_KVM_BOOK3S_HV_POSSIBLE=y  <-- includes HV in kvm.ko
CONFIG_KVM_BOOK3S_PR_POSSIBLE=y  <-- includes PR in kvm.ko

In other words, if you are going to have at least two modules loaded at
all times (kvm + kvm-hv or kvm + kvm-pr), why not put all that into one
module? No one needs to build code they are not going to use, this is
not changing.


About consistency with x86, this situation is not analogous because we
need to be able to load both modules at the same time, which means
kvm.ko needs to stick around when one module goes away in case we want
to load the other module. The KVM common code states that it expects to
have at most one implementation:

        /*
         * kvm_arch_init makes sure there's at most one caller
         * for architectures that support multiple implementations,
         * like intel and amd on x86.
         (...)

which is not true in our case due to this requirement of having two
separate modules loading independently.

(tangent) We are already quite different from other architectures since
we're not making use of kvm_arch_init and some other KVM hooks, such as
kvm_arch_check_processor_compat. So while other archs have their init
dispatched by kvm common code, our init and cleanup happens
independently in the ppc-specific modules, which obviously works but is
needlessly different and has subtleties in the ordering of operations
wrt. the kvm common code. (tangent)
