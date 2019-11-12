Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685BF85E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 02:09:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BqQw6QD0zF3jl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 12:09:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BqGJ2sjHzF3Jr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 12:02:14 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAC0qFJv106068
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:02:11 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5syw9xv9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:02:11 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 12 Nov 2019 01:02:08 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Nov 2019 01:02:05 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAC1248x66846720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 01:02:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3631A11C054;
 Tue, 12 Nov 2019 01:02:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 245B411C052;
 Tue, 12 Nov 2019 01:02:01 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Nov 2019 01:02:00 +0000 (GMT)
Date: Mon, 11 Nov 2019 17:01:58 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-8-bharata@linux.ibm.com>
 <20191111041924.GA4017@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111041924.GA4017@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19111201-0020-0000-0000-0000038558DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111201-0021-0000-0000-000021DB5DF7
Message-Id: <20191112010158.GB5159@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120005
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, jglisse@redhat.com, Ram Pai <linuxram@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 03:19:24PM +1100, Paul Mackerras wrote:
> On Mon, Nov 04, 2019 at 09:47:59AM +0530, Bharata B Rao wrote:
> > From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > 
> > Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> > abort an SVM after it has issued the H_SVM_INIT_START and before the
> > H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> > encounters security violations or other errors when starting an SVM.
> > 
> > Note that this hcall is different from UV_SVM_TERMINATE ucall which
> > is used by HV to terminate/cleanup an SVM.
> > 
> > In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
> > HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
> > possibly including its text/data would be stuck in secure memory.
> > Since the SVM did not go secure, its MSR_S bit will be clear and the
> > VM wont be able to access its pages even to do a clean exit.
> 
> It seems fragile to me to have one more transfer back into the
> ultravisor after this call.  Why does the UV need to do this call and
> then get control back again one more time?  
> Why can't the UV defer
> doing this call until it can do it without expecting to see a return
> from the hcall?  

Sure. But, what if the hypervisor calls back into the UV through a
ucall, asking for some page to be paged-out?  If the ultravisor has
cleaned up the state associated with the SVM, it wont be able to service
that request.

H_SVM_INIT_ABORT is invoked to tell the hypervisor that the
secure-state-transition for the VM cannot be continued any further.
Hypervisor can than choose to do whatever with that information. It can
cleanup its state, and/or make ucalls to get some information from the
ultravisor.  It can also choose not to return control back to the ultravisor.


> And if it does need to see a return from the hcall,
> what would happen if a malicious hypervisor doesn't do the return?

That is fine.  At most it will be a denail-of-service attack.

RP

> 
> Paul.





If the ultravisor cleans up the SVM's state on its side and then informs
the Hypervisor to abort the SVM, the hypervisor will not be able to
cleanly terminate the VM.  Because to terminate the SVM, the hypervisor
still needs the services of the Ultravisor. For example: to get the
pages back into the hypervisor if needed. Another example is, the
hypervisor can call UV_SVM_TERMINATE.  Regardless of which ucall
gets called, the ultravisor has to hold on to enough state of the
SVM to service that request.

The current design assumes that the hypervisor explicitly informs the
ultravisor, that it is done with the SVM, through the UV_SVM_TERMINATE
ucall. Till that point the Ultravisor must to be ready to service any
ucalls made by the hypervisor on the SVM's behalf.


And if the ultravisor has cleaned-up the state of the SVM on it side,
any such ucall requests by the hypervisor will return with error. 

In summary -- for the hypervisor to cleanly terminate an SVM, it needs the
services of the ultravisor.  Only the hypervisor knows, when it would
NOT anymore need the services of the ultravisor for a SVM. Only after
the hypervisor communicates that through the UV_SVM_TERMINATE ucall,
the ultravisor will be able to confidently clean the state of the SVM
on its side.


The H_SVM_INIT_ABORT is a mechanism for the UV to inform the HV
to do whatever it needs to do to cleanup its state of the SVM; which
includes making ucalls to the ultravisor.


-- 
Ram Pai

