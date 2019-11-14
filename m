Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12143FC075
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 08:04:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DCCQ2pT1zF5Xw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 18:04:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DC9G4vMPzF52X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 18:02:42 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAE6vkdB065168
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 02:02:37 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w91m78ynv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 02:02:37 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Thu, 14 Nov 2019 07:02:33 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Nov 2019 07:02:30 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAE72SfB53411984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 07:02:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D13F711C06F;
 Thu, 14 Nov 2019 07:02:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A994111C050;
 Thu, 14 Nov 2019 07:02:25 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Nov 2019 07:02:25 +0000 (GMT)
Date: Wed, 13 Nov 2019 23:02:22 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
References: <20191112010158.GB5159@oc0525413822.ibm.com>
 <20191112053836.GB10885@oak.ozlabs.ibm.com>
 <20191112075215.GD5159@oc0525413822.ibm.com>
 <20191112113204.GA10178@blackberry>
 <20191112144555.GE5159@oc0525413822.ibm.com>
 <20191113001427.GA17829@oak.ozlabs.ibm.com>
 <20191113063233.GF5159@oc0525413822.ibm.com>
 <20191113211824.GA20535@blackberry>
 <20191113215042.GG5159@oc0525413822.ibm.com>
 <20191114050825.GB28382@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114050825.GB28382@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19111407-0008-0000-0000-0000032EE21E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111407-0009-0000-0000-00004A4DEF1E
Message-Id: <20191114070222.GH5159@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-14_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911140065
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

On Thu, Nov 14, 2019 at 04:08:25PM +1100, Paul Mackerras wrote:
> On Wed, Nov 13, 2019 at 01:50:42PM -0800, Ram Pai wrote:
> > On Thu, Nov 14, 2019 at 08:18:24AM +1100, Paul Mackerras wrote:
> > > On Tue, Nov 12, 2019 at 10:32:33PM -0800, Ram Pai wrote:
> > > > On Wed, Nov 13, 2019 at 11:14:27AM +1100, Paul Mackerras wrote:
> > > > > On Tue, Nov 12, 2019 at 06:45:55AM -0800, Ram Pai wrote:
> > > > > > On Tue, Nov 12, 2019 at 10:32:04PM +1100, Paul Mackerras wrote:
> > > > > > > On Mon, Nov 11, 2019 at 11:52:15PM -0800, Ram Pai wrote:
> > > > > > > > There is subtle problem removing that code from the assembly.
> > > > > > > > 
> > > > > > > > If the H_SVM_INIT_ABORT hcall returns to the ultravisor without clearing
> > > > > > > > kvm->arch.secure_guest, the hypervisor will continue to think that the
> > > > > > > > VM is a secure VM.   However the primary reason the H_SVM_INIT_ABORT
> > > > > > > > hcall was invoked, was to inform the Hypervisor that it should no longer
> > > > > > > > consider the VM as a Secure VM. So there is a inconsistency there.
> > > > > > > 
> > > > > > > Most of the checks that look at whether a VM is a secure VM use code
> > > > > > > like "if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)".  Now
> > > > > > > since KVMPPC_SECURE_INIT_ABORT is 4, an if statement such as that will
> > > > > > > take the false branch once we have set kvm->arch.secure_guest to
> > > > > > > KVMPPC_SECURE_INIT_ABORT in kvmppc_h_svm_init_abort.  So in fact in
> > > > > > > most places we will treat the VM as a normal VM from then on.  If
> > > > > > > there are any places where we still need to treat the VM as a secure
> > > > > > > VM while we are processing the abort we can easily do that too.
> > > > > > 
> > > > > > Is the suggestion --  KVMPPC_SECURE_INIT_ABORT should never return back
> > > > > > to the Ultravisor?   Because removing that assembly code will NOT lead the
> > > > > 
> > > > > No.  The suggestion is that vcpu->arch.secure_guest stays set to
> > > > > KVMPPC_SECURE_INIT_ABORT until userspace calls KVM_PPC_SVM_OFF.
> > > > 
> > > > In the fast_guest_return path, if it finds 
> > > > (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_ABORT) is true, should it return to
> > > > UV or not?
> > > > 
> > > > Ideally it should return back to the ultravisor the first time
> > > > KVMPPC_SECURE_INIT_ABORT is set, and not than onwards.
> > > 
> > > What is ideal about that behavior?  Why would that be a particularly
> > > good thing to do?
> > 
> > It is following the rule -- "return back to the caller".
> 
> That doesn't address the question of why vcpu->arch.secure_guest
> should be cleared at the point where we do that.

Ok. here is the sequence that I expect to happen.

-------------------------------------------------------------------
1) VM makes a ESM(Enter Secure Mode) ucall.

  1A) UV does the H_SVM_INIT_START hcall... the chit-chat between UV and HV happens
	and somewhere in that chit-chat, UV decides that the ESM call
	cannot be successfully completed.  Hence it calls
	H_SVM_INIT_ABORT to inform the Hypervisor.

    1A_a) Hypervisor aborts the VM's transition and returns back to the ultravisor.

  1B) UV cleans up the state of the VM on its side and returns
    	back to the VM, with failure.  VM is still in a normal VM state.
	Its MSR(S) is still 0.

2) VM gets a HDEC exception.

   2A) Hypervisor receives that HDEC exception. It handles the exception
   	and returns back to the VM.
-------------------------------------------------------------------

If you agree with the above sequence than, the patch needs all the proposed changes.


At step (1A_a) and step (2A),  the hypervisor is faced with the question
	--  Where should the control be returned to?

  for step 1A_a it has to return to the UV, and for step 2A it has to
  return to the VM. In other words the control has to **return back to
  the caller**.


It certainly has to rely on the vcpu->arch.secure_guest flag to do so.
If any flag in vcpu->arch.secure_guest is set, it has to return to 
UV.  Otherwise it has to return to VM.

This is the reason, the proposed patch in the fast_guest_return path
looks at the vcpu->arch.secure_guest. If it finds any flag set, it
returns to UV. However before returning to UV, it also clears all the
flags if  H_SVM_INIT_ABORT is set. This is to ensure that HV does not
return to the wrong place; i.e to UV, but returns to the VM at step 2A.

RP

