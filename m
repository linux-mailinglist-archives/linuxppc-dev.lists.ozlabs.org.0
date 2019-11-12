Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC95F882F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:44:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BxWb6bMczDr5s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 16:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BxPD5mTGzDsV6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:38:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="hQVWmXDm"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47BxPD2xJtz9sP3; Tue, 12 Nov 2019 16:38:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573537120; bh=SZoRRTRm9ztAOpkmJzAzQX6odqFqiF8GoxUebpLCgpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hQVWmXDmoBI0+5xEt5CjywarL2yoySowzmAqTVwVg1xkSnDUgP/aU/UML3IcaW4O1
 0JC0EzBb7RM+zH9EvbepmZRmTR/OJaFv7mn9NDOpFncCFKJha5Ur6FigHCBoIxbIt2
 +l6CjnPsLU7W2Cmsgm5Ix3Hx20pHhHAMqRqxmBjU1TaxhW/UdZxiJuYSvRe1EZNNpa
 51XwLhASGKTEueiKLuNJElxxNM5Ye28r+nyJCqBju1dcp3PUuYi4Ne4aIE5HKFJ9KR
 rH1nu1co4WZywoaXY/Rx+ww2ZHRGl8nCb0OIVp/AQYJMVKrExItkOArcA7oQS+heg4
 wnpzJJGUtPlJg==
Date: Tue, 12 Nov 2019 16:38:36 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191112053836.GB10885@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-8-bharata@linux.ibm.com>
 <20191111041924.GA4017@oak.ozlabs.ibm.com>
 <20191112010158.GB5159@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112010158.GB5159@oc0525413822.ibm.com>
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

On Mon, Nov 11, 2019 at 05:01:58PM -0800, Ram Pai wrote:
> On Mon, Nov 11, 2019 at 03:19:24PM +1100, Paul Mackerras wrote:
> > On Mon, Nov 04, 2019 at 09:47:59AM +0530, Bharata B Rao wrote:
> > > From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > > 
> > > Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> > > abort an SVM after it has issued the H_SVM_INIT_START and before the
> > > H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> > > encounters security violations or other errors when starting an SVM.
> > > 
> > > Note that this hcall is different from UV_SVM_TERMINATE ucall which
> > > is used by HV to terminate/cleanup an SVM.
> > > 
> > > In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
> > > HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
> > > possibly including its text/data would be stuck in secure memory.
> > > Since the SVM did not go secure, its MSR_S bit will be clear and the
> > > VM wont be able to access its pages even to do a clean exit.
> > 
> > It seems fragile to me to have one more transfer back into the
> > ultravisor after this call.  Why does the UV need to do this call and
> > then get control back again one more time?  
> > Why can't the UV defer
> > doing this call until it can do it without expecting to see a return
> > from the hcall?  
> 
> Sure. But, what if the hypervisor calls back into the UV through a
> ucall, asking for some page to be paged-out?  If the ultravisor has
> cleaned up the state associated with the SVM, it wont be able to service
> that request.
> 
> H_SVM_INIT_ABORT is invoked to tell the hypervisor that the
> secure-state-transition for the VM cannot be continued any further.
> Hypervisor can than choose to do whatever with that information. It can
> cleanup its state, and/or make ucalls to get some information from the
> ultravisor.  It can also choose not to return control back to the ultravisor.
> 
> 
> > And if it does need to see a return from the hcall,
> > what would happen if a malicious hypervisor doesn't do the return?
> 
> That is fine.  At most it will be a denail-of-service attack.
> 
> RP
> 
> > 
> > Paul.
> 
> 
> 
> 
> 
> If the ultravisor cleans up the SVM's state on its side and then informs
> the Hypervisor to abort the SVM, the hypervisor will not be able to
> cleanly terminate the VM.  Because to terminate the SVM, the hypervisor
> still needs the services of the Ultravisor. For example: to get the
> pages back into the hypervisor if needed. Another example is, the
> hypervisor can call UV_SVM_TERMINATE.  Regardless of which ucall
> gets called, the ultravisor has to hold on to enough state of the
> SVM to service that request.

OK, that's a good reason.  That should be explained in the commit
message.

> The current design assumes that the hypervisor explicitly informs the
> ultravisor, that it is done with the SVM, through the UV_SVM_TERMINATE
> ucall. Till that point the Ultravisor must to be ready to service any
> ucalls made by the hypervisor on the SVM's behalf.

I see that UV_SVM_TERMINATE is done when the VM is being destroyed (at
which point kvm->arch.secure_guest doesn't matter any more), and in
kvmhv_svm_off(), where kvm->arch.secure_guest gets cleared
explicitly.  Hence I don't see any need for clearing it in the
assembly code on the next secure guest entry.  I think the change to
book3s_hv_rmhandlers.S can just be dropped.

Paul.
