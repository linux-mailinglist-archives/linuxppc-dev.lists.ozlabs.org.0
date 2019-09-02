Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F09A528F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 11:11:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MPT60d6DzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 19:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46MPQZ0Y09zDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 19:08:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED91028;
 Mon,  2 Sep 2019 02:08:49 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 CD7C33F246; Mon,  2 Sep 2019 02:08:48 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:08:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
Message-ID: <20190902090846.GA15118@arrakis.emea.arm.com>
References: <20190902094711.2625ba31@canb.auug.org.au>
 <87lfv7tqt0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfv7tqt0.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Collingbourne <pcc@google.com>, Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 11:44:43AM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the powerpc tree got a conflict in:
> >
> >   arch/Kconfig
> >
> > between commit:
> >
> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
> >
> > from the arm64 tree and commit:
> >
> >   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
> >
> > from the powerpc tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks.
> 
> That conflict seems entirely trivial, but Catalin/Will if it bothers you
> I have the conflicting commit in a topic branch based on rc2 which you
> could merge to resolve it:

It's a trivial conflict, easy to resolve. I don't think it's worth
trying to avoid it (Linus normally doesn't mind such conflicts).

-- 
Catalin
