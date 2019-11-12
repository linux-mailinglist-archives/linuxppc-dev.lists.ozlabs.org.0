Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B6F8EA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 12:34:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C5J94hDnzF4g0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 22:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C5F46yYJzF4xW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 22:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="h0zEXLzW"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47C5F426Bfz9sP4; Tue, 12 Nov 2019 22:32:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573558328; bh=CteJvhytr8GvNmzvXPbVfE7X8aVmeoFKuE9dom2erYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0zEXLzWwSDADKnohNSdZIBtN/qtib9FGWnpD3tFiqrFMAzdYLKOTYc64p2Q7uq/R
 e619wed9Mb9R4bchJVwVnY1/aWSe5GCG48SV4IDZlANMCPd+LqZGplpd+R4IuLWFzj
 /z4ZxShboE8G2g4ZLQEcF2xsoLYeEZ3VHUqTsikPRPgIKt3Jd3ZutOPNnD3DSidWLx
 uoFkWCJXczvEJ54tFzkMK77HZBjbCjCNTlXzwcNvXg3OT0RQL3dYzB7EPSF6RPePj+
 qXO9ar+9zQzyajz831k1qTzagFZhar03v8exXGk/J8mopMtPg/93KSfqLaQJ/aSwsf
 NQzc4VRrpPnWw==
Date: Tue, 12 Nov 2019 22:32:04 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191112113204.GA10178@blackberry>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-8-bharata@linux.ibm.com>
 <20191111041924.GA4017@oak.ozlabs.ibm.com>
 <20191112010158.GB5159@oc0525413822.ibm.com>
 <20191112053836.GB10885@oak.ozlabs.ibm.com>
 <20191112075215.GD5159@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112075215.GD5159@oc0525413822.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Mon, Nov 11, 2019 at 11:52:15PM -0800, Ram Pai wrote:
> On Tue, Nov 12, 2019 at 04:38:36PM +1100, Paul Mackerras wrote:
> > On Mon, Nov 11, 2019 at 05:01:58PM -0800, Ram Pai wrote:
> > > On Mon, Nov 11, 2019 at 03:19:24PM +1100, Paul Mackerras wrote:
> > > > On Mon, Nov 04, 2019 at 09:47:59AM +0530, Bharata B Rao wrote:
> > > > > From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > > > > 
> > > > > Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> > > > > abort an SVM after it has issued the H_SVM_INIT_START and before the
> > > > > H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> > > > > encounters security violations or other errors when starting an SVM.
> > > > > 
> > > > > Note that this hcall is different from UV_SVM_TERMINATE ucall which
> > > > > is used by HV to terminate/cleanup an SVM.
> > > > > 
> > > > > In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
> > > > > HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
> > > > > possibly including its text/data would be stuck in secure memory.
> > > > > Since the SVM did not go secure, its MSR_S bit will be clear and the
> > > > > VM wont be able to access its pages even to do a clean exit.
> > > > 
> ...skip...
> > > 
> > > If the ultravisor cleans up the SVM's state on its side and then informs
> > > the Hypervisor to abort the SVM, the hypervisor will not be able to
> > > cleanly terminate the VM.  Because to terminate the SVM, the hypervisor
> > > still needs the services of the Ultravisor. For example: to get the
> > > pages back into the hypervisor if needed. Another example is, the
> > > hypervisor can call UV_SVM_TERMINATE.  Regardless of which ucall
> > > gets called, the ultravisor has to hold on to enough state of the
> > > SVM to service that request.
> > 
> > OK, that's a good reason.  That should be explained in the commit
> > message.
> > 
> > > The current design assumes that the hypervisor explicitly informs the
> > > ultravisor, that it is done with the SVM, through the UV_SVM_TERMINATE
> > > ucall. Till that point the Ultravisor must to be ready to service any
> > > ucalls made by the hypervisor on the SVM's behalf.
> > 
> > I see that UV_SVM_TERMINATE is done when the VM is being destroyed (at
> > which point kvm->arch.secure_guest doesn't matter any more), and in
> > kvmhv_svm_off(), where kvm->arch.secure_guest gets cleared
> > explicitly.  Hence I don't see any need for clearing it in the
> > assembly code on the next secure guest entry.  I think the change to
> > book3s_hv_rmhandlers.S can just be dropped.
> 
> There is subtle problem removing that code from the assembly.
> 
> If the H_SVM_INIT_ABORT hcall returns to the ultravisor without clearing
> kvm->arch.secure_guest, the hypervisor will continue to think that the
> VM is a secure VM.   However the primary reason the H_SVM_INIT_ABORT
> hcall was invoked, was to inform the Hypervisor that it should no longer
> consider the VM as a Secure VM. So there is a inconsistency there.

Most of the checks that look at whether a VM is a secure VM use code
like "if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)".  Now
since KVMPPC_SECURE_INIT_ABORT is 4, an if statement such as that will
take the false branch once we have set kvm->arch.secure_guest to
KVMPPC_SECURE_INIT_ABORT in kvmppc_h_svm_init_abort.  So in fact in
most places we will treat the VM as a normal VM from then on.  If
there are any places where we still need to treat the VM as a secure
VM while we are processing the abort we can easily do that too.

> This is fine, as long as the VM does not invoke any hcall or does not
> receive any hypervisor-exceptions.  The moment either of those happen,
> the control goes into the hypervisor, the hypervisor services
> the exception/hcall and while returning, it will see that the
> kvm->arch.secure_guest flag is set and **incorrectly** return
> to the ultravisor through a UV_RETURN ucall.  Ultravisor will
> not know what to do with it, because it does not consider that
> VM as a Secure VM.  Bad things happen.

If bad things happen in the ultravisor because the hypervisor did
something it shouldn't, then it's game over, you just lost, thanks for
playing.  The ultravisor MUST be able to cope with bogus UV_RETURN
calls for a VM that it doesn't consider to be a secure VM.  You need
to work out how to handle such calls safely and implement that in the
ultravisor.

Paul.
