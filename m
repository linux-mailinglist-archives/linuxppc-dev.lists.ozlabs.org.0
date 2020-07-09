Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94216219D15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 12:09:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2X2w66QFzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 20:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2X0N04h5zDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 20:07:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=AxDdTwnP; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B2X0M4TJ3z9sSn; Thu,  9 Jul 2020 20:07:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594289235; bh=BmqapbAxcPw7d2zoeQ9P3HK6zqK/QShIaRzUdVUueHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AxDdTwnPeYgWw58dmekGMZublU5kFAsvyG1J2q1UrG5l3LB6RU5Dr8zF11y+gUAVi
 gE+2SdW/AufV1xj8AblcSs8+G0p50e+iuxLv2e+OvHNV1j/l4TzILFQhxL7KciSoHq
 5l0+IFVtg6iqef7jErk5uEx+9A2q8zhqMuV+6Y741Wl5enlEqAVGqxHp3rzVJEnIkH
 2igv6Sr7VEO4GEF5pnVDRy9Ei8L+BM+IidVzn1ZIrhiDo8H7Yh8vQx9JTS+Fhh5cmJ
 DMovbCbi3FAbc4Hg2iU1il3W031Sw7Kcm/VvM+FvYhqk5egiwgGm+ceftl7w0JSwE5
 hz+T3z6Zu4IQw==
Date: Thu, 9 Jul 2020 20:07:11 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 2/2] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in
 nested KVM
Message-ID: <20200709100711.GA2961345@thinks.paulus.ozlabs.org>
References: <20200703104420.21349-1-bharata@linux.ibm.com>
 <20200703104420.21349-3-bharata@linux.ibm.com>
 <20200709051803.GC2822576@thinks.paulus.ozlabs.org>
 <20200709090851.GD7902@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709090851.GD7902@in.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 09, 2020 at 02:38:51PM +0530, Bharata B Rao wrote:
> On Thu, Jul 09, 2020 at 03:18:03PM +1000, Paul Mackerras wrote:
> > On Fri, Jul 03, 2020 at 04:14:20PM +0530, Bharata B Rao wrote:
> > > In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
> > > H_RPT_INVALIDATE if available. The availability of this hcall
> > > is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
> > > DT property.
> > 
> > What are we going to use when nested KVM supports HPT guests at L2?
> > L1 will need to do partition-scoped tlbies with R=0 via a hypercall,
> > but H_RPT_INVALIDATE says in its name that it only handles radix
> > page tables (i.e. R=1).
> 
> For L2 HPT guests, the old hcall is expected to work after it adds
> support for R=0 case?

That was the plan.

> The new hcall should be advertised via ibm,hypertas-functions only
> for radix guests I suppose.

Well, the L1 hypervisor is a radix guest of L0, so it would have
H_RPT_INVALIDATE available to it?

I guess the question is whether H_RPT_INVALIDATE is supposed to do
everything, that is, radix process-scoped invalidations, radix
partition-scoped invalidations, and HPT partition-scoped
invalidations.  If that is the plan then we should call it something
different.

This patchset seems to imply that H_RPT_INVALIDATE is at least going
to be used for radix partition-scoped invalidations as well as radix
process-scoped invalidations.  If you are thinking that in future when
we need HPT partition-scoped invalidations for a radix L1 hypervisor
running a HPT L2 guest, we are going to define a new hypercall for
that, I suppose that is OK, though it doesn't really seem necessary.

Paul.
