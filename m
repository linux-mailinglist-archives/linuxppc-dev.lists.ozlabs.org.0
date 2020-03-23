Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBF19031D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:57:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mXsG4BQ0zDr0N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 11:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mXqP6SxPzDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 11:55:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=WkLFZ009; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48mXqP2FhXz9sSJ; Tue, 24 Mar 2020 11:55:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1585011345; bh=LoDPTy8hotXOVNxAbYYkoDWHTyQTtTLTM+W7YwaCFqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WkLFZ009uhYM/bD3ncmLk6wAuvUncEP6zj7yGZc+Ly5tPhpxlI/q8n0HkjPxIiLRl
 r8tvEKgm0zkkntTWtzip2lvRCduiVnXS/EInxK0Ab20OJPU+NMFOREJkOGHBmqnpZA
 710DKCqOZcYqE/o+zbYvF8sNhXd8wOXjqr7by/CX2r4SLQk4fwL07Uktw8QIe6tRKd
 aYitSdz9++x2M7fEArmKUIu8X+bLqzCdRp4q9m3f0O40bDQpaIMsEGis9oOo4hZ/y1
 QJo4PWmvAQFEqor4dl9ubPzD8FbYW/hJMEDVF4iu74c9NEt7dESqCGUiZyyv9wxYaL
 zyOaiUWTJhncg==
Date: Tue, 24 Mar 2020 10:43:23 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S HV: check caller of H_SVM_* Hcalls
Message-ID: <20200323234323.GA5604@blackberry>
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-2-ldufour@linux.ibm.com>
 <20200320132248.44b81b3b@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320132248.44b81b3b@bahia.lan>
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 01:22:48PM +0100, Greg Kurz wrote:
> On Fri, 20 Mar 2020 11:26:42 +0100
> Laurent Dufour <ldufour@linux.ibm.com> wrote:
> 
> > The Hcall named H_SVM_* are reserved to the Ultravisor. However, nothing
> > prevent a malicious VM or SVM to call them. This could lead to weird result
> > and should be filtered out.
> > 
> > Checking the Secure bit of the calling MSR ensure that the call is coming
> > from either the Ultravisor or a SVM. But any system call made from a SVM
> > are going through the Ultravisor, and the Ultravisor should filter out
> > these malicious call. This way, only the Ultravisor is able to make such a
> > Hcall.
> 
> "Ultravisor should filter" ? And what if it doesn't (eg. because of a bug) ?
> 
> Shouldn't we also check the HV bit of the calling MSR as well to
> disambiguate SVM and UV ?

The trouble with doing that (checking the HV bit) is that KVM does not
expect to see the HV bit set on an interrupt that occurred while we
were in the guest, and if it is set, it indicates a serious problem,
i.e. that an interrupt occurred while we were in the code that
transitions from host context to guest context, or from guest context
to host context.  In those cases we don't know how much of the
transition has been completed and therefore whether we have guest
values or host values in the CPU registers (GPRs, FPRs/VSRs, SPRs).
If we do see HV set then KVM reports a severe error to userspace which
should cause userspace to terminate the guest.

Therefore the UV should *always* have the HV bit clear in HSRR1/SRR1
when transitioning to KVM.

Paul.
