Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BB93F893
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXh6G2QWPz3dLl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:47:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXggZ55qnz3cjS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:27:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38AA21007;
	Mon, 29 Jul 2024 07:27:46 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7413F64C;
	Mon, 29 Jul 2024 07:27:16 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:27:11 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <Zqemv4YUSM0gouYO@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
 <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
 <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
 <ZqPLSRjjE+SRoGAQ@e133380.arm.com>
 <a52f1762-afd4-4527-88ac-76cdd8a59d5d@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a52f1762-afd4-4527-88ac-76cdd8a59d5d@sirena.org.uk>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024 at 06:39:27PM +0100, Mark Brown wrote:
> On Fri, Jul 26, 2024 at 05:14:01PM +0100, Dave Martin wrote:
> > On Thu, Jul 25, 2024 at 07:11:41PM +0100, Mark Brown wrote:
> 
> > > That'd have to be a variably sized structure with pairs of sysreg
> > > ID/value items in it I think which would be a bit of a pain to implement
> > > but doable.  The per-record header is 64 bits, we'd get maximal saving
> > > by allocating a byte for the IDs.
> 
> > Or possibly the regs could be identified positionally, avoiding the
> > need for IDs.  Space would be at a premium, and we would have to think
> > carefully about what should and should not be allowed in there.
> 
> Yes, though that would mean if we had to generate any register in there
> we'd always have to generate at least as many entries as whatever number
> it got assigned which depending on how much optionality ends up getting
> used might be unfortunate.

Ack, though it's only 150 bytes or so at most, so just zeroing it all
(or as much as we know about) doesn't feel like a big cost.

It depends how determined we are to squeeze the most out of the
remaining space.


> > > It would be very unfortunate timing to start gating things on such a
> > > change though (I'm particularly worried about GCS here, at this point
> > > the kernel changes are blocking the entire ecosystem).
> 
> > For GCS, I wonder whether it should be made a strictly opt-in feature:
> > i.e., if you use it then you must tolerate large sigframes, and if it
> > is turned off then its state is neither dumped nor restored.  Since GCS
> > requires an explict prctl to turn it on, the mechanism seems partly
> > there already in your series.
> 
> Yeah, that's what the current code does actually.  In any case it's not
> just a single register - there's also the GCS mode in there.

Agreed -- I'll ping the GCS series, but this sounds like a reasonable
starting point.

Cheers
---Dave
