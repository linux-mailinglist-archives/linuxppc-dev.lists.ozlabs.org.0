Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.auug.org.au [IPv6:2401:3900:2:1::4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB658FBF00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:12:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8jr3ftXzF748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8dS1HkqzF6lq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="A85mzLCe"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47D8dR40m4z9s7T; Thu, 14 Nov 2019 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573708107; bh=kPRYQtgfmwdv40EbuZcqeYZToO/RlWVUa8XfGajWvEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A85mzLCe/m8AOIXYfoAJDqpK70LNQTu2NI6GpcGjIrL25sgnKF4HZRCR3kxRgBTf0
 G172C2juWrJytAFkuaI+uojelB+dtpIJod2mwqc6bXxz5pU2EbAwmg0m4QNXU2clFC
 RDi0G4X+NjFnbjSk0g0YYXLGkjQDO1DMhXRKTSKGoPtCi+ueh2/hkbx+89sDFfLkZ6
 HDL8rgIVAUeLPPowCl2fFbLv/u6yq0hhN57mTIl+TYgTxH3zcFaVwGlCWdBMs1vjn9
 PfySVcQ910QyGD55HBHYIqO6ldJ2Nk64IK6NM/MF46bZWK22t6sZrm8aU2Q9l2vR2y
 xs13pE6bm/PlA==
Date: Thu, 14 Nov 2019 16:08:25 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191114050825.GB28382@oak.ozlabs.ibm.com>
References: <20191111041924.GA4017@oak.ozlabs.ibm.com>
 <20191112010158.GB5159@oc0525413822.ibm.com>
 <20191112053836.GB10885@oak.ozlabs.ibm.com>
 <20191112075215.GD5159@oc0525413822.ibm.com>
 <20191112113204.GA10178@blackberry>
 <20191112144555.GE5159@oc0525413822.ibm.com>
 <20191113001427.GA17829@oak.ozlabs.ibm.com>
 <20191113063233.GF5159@oc0525413822.ibm.com>
 <20191113211824.GA20535@blackberry>
 <20191113215042.GG5159@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113215042.GG5159@oc0525413822.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, jglisse@redhat.com, Ram Pai <linuxram@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 01:50:42PM -0800, Ram Pai wrote:
> On Thu, Nov 14, 2019 at 08:18:24AM +1100, Paul Mackerras wrote:
> > On Tue, Nov 12, 2019 at 10:32:33PM -0800, Ram Pai wrote:
> > > On Wed, Nov 13, 2019 at 11:14:27AM +1100, Paul Mackerras wrote:
> > > > On Tue, Nov 12, 2019 at 06:45:55AM -0800, Ram Pai wrote:
> > > > > On Tue, Nov 12, 2019 at 10:32:04PM +1100, Paul Mackerras wrote:
> > > > > > On Mon, Nov 11, 2019 at 11:52:15PM -0800, Ram Pai wrote:
> > > > > > > There is subtle problem removing that code from the assembly.
> > > > > > > 
> > > > > > > If the H_SVM_INIT_ABORT hcall returns to the ultravisor without clearing
> > > > > > > kvm->arch.secure_guest, the hypervisor will continue to think that the
> > > > > > > VM is a secure VM.   However the primary reason the H_SVM_INIT_ABORT
> > > > > > > hcall was invoked, was to inform the Hypervisor that it should no longer
> > > > > > > consider the VM as a Secure VM. So there is a inconsistency there.
> > > > > > 
> > > > > > Most of the checks that look at whether a VM is a secure VM use code
> > > > > > like "if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)".  Now
> > > > > > since KVMPPC_SECURE_INIT_ABORT is 4, an if statement such as that will
> > > > > > take the false branch once we have set kvm->arch.secure_guest to
> > > > > > KVMPPC_SECURE_INIT_ABORT in kvmppc_h_svm_init_abort.  So in fact in
> > > > > > most places we will treat the VM as a normal VM from then on.  If
> > > > > > there are any places where we still need to treat the VM as a secure
> > > > > > VM while we are processing the abort we can easily do that too.
> > > > > 
> > > > > Is the suggestion --  KVMPPC_SECURE_INIT_ABORT should never return back
> > > > > to the Ultravisor?   Because removing that assembly code will NOT lead the
> > > > 
> > > > No.  The suggestion is that vcpu->arch.secure_guest stays set to
> > > > KVMPPC_SECURE_INIT_ABORT until userspace calls KVM_PPC_SVM_OFF.
> > > 
> > > In the fast_guest_return path, if it finds 
> > > (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_ABORT) is true, should it return to
> > > UV or not?
> > > 
> > > Ideally it should return back to the ultravisor the first time
> > > KVMPPC_SECURE_INIT_ABORT is set, and not than onwards.
> > 
> > What is ideal about that behavior?  Why would that be a particularly
> > good thing to do?
> 
> It is following the rule -- "return back to the caller".

That doesn't address the question of why vcpu->arch.secure_guest
should be cleared at the point where we do that.

Paul.
