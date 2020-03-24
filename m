Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A3190D31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 13:19:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mr0H12SyzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 23:19:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.36.172; helo=3.mo177.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 932 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Mar 2020 23:16:53 AEDT
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mqxK67R8zDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 23:16:50 +1100 (AEDT)
Received: from player697.ha.ovh.net (unknown [10.110.103.180])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id B45AA11C3BE
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:01:11 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 1D7B110BE91A8;
 Tue, 24 Mar 2020 12:00:53 +0000 (UTC)
Date: Tue, 24 Mar 2020 13:00:52 +0100
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S HV: check caller of H_SVM_* Hcalls
Message-ID: <20200324130052.373fdf89@bahia.lan>
In-Reply-To: <20200323234323.GA5604@blackberry>
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-2-ldufour@linux.ibm.com>
 <20200320132248.44b81b3b@bahia.lan>
 <20200323234323.GA5604@blackberry>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17764167258308712891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Mar 2020 10:43:23 +1100
Paul Mackerras <paulus@ozlabs.org> wrote:

> On Fri, Mar 20, 2020 at 01:22:48PM +0100, Greg Kurz wrote:
> > On Fri, 20 Mar 2020 11:26:42 +0100
> > Laurent Dufour <ldufour@linux.ibm.com> wrote:
> > 
> > > The Hcall named H_SVM_* are reserved to the Ultravisor. However, nothing
> > > prevent a malicious VM or SVM to call them. This could lead to weird result
> > > and should be filtered out.
> > > 
> > > Checking the Secure bit of the calling MSR ensure that the call is coming
> > > from either the Ultravisor or a SVM. But any system call made from a SVM
> > > are going through the Ultravisor, and the Ultravisor should filter out
> > > these malicious call. This way, only the Ultravisor is able to make such a
> > > Hcall.
> > 
> > "Ultravisor should filter" ? And what if it doesn't (eg. because of a bug) ?
> > 
> > Shouldn't we also check the HV bit of the calling MSR as well to
> > disambiguate SVM and UV ?
> 
> The trouble with doing that (checking the HV bit) is that KVM does not
> expect to see the HV bit set on an interrupt that occurred while we
> were in the guest, and if it is set, it indicates a serious problem,
> i.e. that an interrupt occurred while we were in the code that
> transitions from host context to guest context, or from guest context
> to host context.  In those cases we don't know how much of the
> transition has been completed and therefore whether we have guest
> values or host values in the CPU registers (GPRs, FPRs/VSRs, SPRs).
> If we do see HV set then KVM reports a severe error to userspace which
> should cause userspace to terminate the guest.
> 
> Therefore the UV should *always* have the HV bit clear in HSRR1/SRR1
> when transitioning to KVM.
> 

Indeed... thanks for the clarification. So I guess we'll just assume
that the UV doesn't reflect these SVM specific hcalls if they happened
to be issued by the guest then.

Cheers,

--
Greg

> Paul.

