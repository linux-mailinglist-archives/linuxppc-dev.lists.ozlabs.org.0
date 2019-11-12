Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7AF9304
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 15:50:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C9dx2pvXzF4bn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 01:50:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C9Yt4bkSzF582
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 01:46:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xACEkV7d013023
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 09:46:54 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7w3y4rqd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 09:46:43 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 12 Nov 2019 14:46:05 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Nov 2019 14:46:03 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xACEk1Jw30343528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 14:46:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A0EAE05D;
 Tue, 12 Nov 2019 14:46:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28844AE045;
 Tue, 12 Nov 2019 14:45:58 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Nov 2019 14:45:57 +0000 (GMT)
Date: Tue, 12 Nov 2019 06:45:55 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-8-bharata@linux.ibm.com>
 <20191111041924.GA4017@oak.ozlabs.ibm.com>
 <20191112010158.GB5159@oc0525413822.ibm.com>
 <20191112053836.GB10885@oak.ozlabs.ibm.com>
 <20191112075215.GD5159@oc0525413822.ibm.com>
 <20191112113204.GA10178@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112113204.GA10178@blackberry>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19111214-0012-0000-0000-00000362FED2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111214-0013-0000-0000-0000219E6F81
Message-Id: <20191112144555.GE5159@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=967 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120132
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

On Tue, Nov 12, 2019 at 10:32:04PM +1100, Paul Mackerras wrote:
> On Mon, Nov 11, 2019 at 11:52:15PM -0800, Ram Pai wrote:
> > On Tue, Nov 12, 2019 at 04:38:36PM +1100, Paul Mackerras wrote:
> > > On Mon, Nov 11, 2019 at 05:01:58PM -0800, Ram Pai wrote:
> > > > On Mon, Nov 11, 2019 at 03:19:24PM +1100, Paul Mackerras wrote:
> > > > > On Mon, Nov 04, 2019 at 09:47:59AM +0530, Bharata B Rao wrote:
> > > > > > From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > > > > > 
> > > > > > Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> > > > > > abort an SVM after it has issued the H_SVM_INIT_START and before the
> > > > > > H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> > > > > > encounters security violations or other errors when starting an SVM.
> > > > > > 
> > > > > > Note that this hcall is different from UV_SVM_TERMINATE ucall which
> > > > > > is used by HV to terminate/cleanup an SVM.
> > > > > > 
> > > > > > In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
> > > > > > HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
> > > > > > possibly including its text/data would be stuck in secure memory.
> > > > > > Since the SVM did not go secure, its MSR_S bit will be clear and the
> > > > > > VM wont be able to access its pages even to do a clean exit.
> > > > > 
> > ...skip...
> > > > 
> > > > If the ultravisor cleans up the SVM's state on its side and then informs
> > > > the Hypervisor to abort the SVM, the hypervisor will not be able to
> > > > cleanly terminate the VM.  Because to terminate the SVM, the hypervisor
> > > > still needs the services of the Ultravisor. For example: to get the
> > > > pages back into the hypervisor if needed. Another example is, the
> > > > hypervisor can call UV_SVM_TERMINATE.  Regardless of which ucall
> > > > gets called, the ultravisor has to hold on to enough state of the
> > > > SVM to service that request.
> > > 
> > > OK, that's a good reason.  That should be explained in the commit
> > > message.
> > > 
> > > > The current design assumes that the hypervisor explicitly informs the
> > > > ultravisor, that it is done with the SVM, through the UV_SVM_TERMINATE
> > > > ucall. Till that point the Ultravisor must to be ready to service any
> > > > ucalls made by the hypervisor on the SVM's behalf.
> > > 
> > > I see that UV_SVM_TERMINATE is done when the VM is being destroyed (at
> > > which point kvm->arch.secure_guest doesn't matter any more), and in
> > > kvmhv_svm_off(), where kvm->arch.secure_guest gets cleared
> > > explicitly.  Hence I don't see any need for clearing it in the
> > > assembly code on the next secure guest entry.  I think the change to
> > > book3s_hv_rmhandlers.S can just be dropped.
> > 
> > There is subtle problem removing that code from the assembly.
> > 
> > If the H_SVM_INIT_ABORT hcall returns to the ultravisor without clearing
> > kvm->arch.secure_guest, the hypervisor will continue to think that the
> > VM is a secure VM.   However the primary reason the H_SVM_INIT_ABORT
> > hcall was invoked, was to inform the Hypervisor that it should no longer
> > consider the VM as a Secure VM. So there is a inconsistency there.
> 
> Most of the checks that look at whether a VM is a secure VM use code
> like "if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)".  Now
> since KVMPPC_SECURE_INIT_ABORT is 4, an if statement such as that will
> take the false branch once we have set kvm->arch.secure_guest to
> KVMPPC_SECURE_INIT_ABORT in kvmppc_h_svm_init_abort.  So in fact in
> most places we will treat the VM as a normal VM from then on.  If
> there are any places where we still need to treat the VM as a secure
> VM while we are processing the abort we can easily do that too.

Is the suggestion --  KVMPPC_SECURE_INIT_ABORT should never return back
to the Ultravisor?   Because removing that assembly code will NOT lead the
Hypervisor back into the Ultravisor.  This is fine with the
ultravisor. But then the hypervisor will not know where to return to.
If it wants to return directly to the VM, it wont know to
which address. It will be in a limbo.

> 
> > This is fine, as long as the VM does not invoke any hcall or does not
> > receive any hypervisor-exceptions.  The moment either of those happen,
> > the control goes into the hypervisor, the hypervisor services
> > the exception/hcall and while returning, it will see that the
> > kvm->arch.secure_guest flag is set and **incorrectly** return
> > to the ultravisor through a UV_RETURN ucall.  Ultravisor will
> > not know what to do with it, because it does not consider that
> > VM as a Secure VM.  Bad things happen.
> 
> If bad things happen in the ultravisor because the hypervisor did
> something it shouldn't, then it's game over, you just lost, thanks for
> playing.  The ultravisor MUST be able to cope with bogus UV_RETURN
> calls for a VM that it doesn't consider to be a secure VM.  You need
> to work out how to handle such calls safely and implement that in the
> ultravisor.

Actually we do handle this gracefully in the ultravisor :). 
We just retun back to the hypervisor saying "sorry dont know what
to do with it, please handle it yourself".

However hypervisor would not know what to do with that return, and bad
things happen in the hypervisor.

RP

