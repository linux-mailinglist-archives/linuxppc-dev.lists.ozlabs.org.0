Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E8287318
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 13:05:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6SzD4Qx6zDqWL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 22:05:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Sx02lFNzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 22:03:16 +1100 (AEDT)
Received: from gaia (unknown [95.149.105.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9362215A4;
 Thu,  8 Oct 2020 11:03:10 +0000 (UTC)
Date: Thu, 8 Oct 2020 12:03:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201008110307.GH7661@gaia>
References: <20201007073932.865218-1-jannh@google.com>
 <20201007123544.GA11433@infradead.org>
 <CAG48ez3kjTeVtQcjQerYYRs7sX5qq3O7SU-FEaYLNXisFmAeOg@mail.gmail.com>
 <87o8ld0zwt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8ld0zwt.fsf@mpe.ellerman.id.au>
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
Cc: Dave Kleikamp <shaggy@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>,
 Jann Horn <jannh@google.com>, kernel list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 08, 2020 at 09:34:26PM +1100, Michael Ellerman wrote:
> Jann Horn <jannh@google.com> writes:
> > So while the mprotect() case
> > checks the flags and refuses unknown values, the mmap() code just lets
> > the architecture figure out which bits are actually valid to set (via
> > arch_calc_vm_prot_bits()) and silently ignores the rest?
> >
> > And powerpc apparently decided that they do want to error out on bogus
> > prot values passed to their version of mmap(), and in exchange, assume
> > in arch_calc_vm_prot_bits() that the protection bits are valid?
> 
> I don't think we really decided that, it just happened by accident and
> no one noticed/complained.
> 
> Seems userspace is pretty well behaved when it comes to passing prot
> values to mmap().

It's not necessarily about well behaved but whether it can have security
implications. On arm64, if the underlying memory does not support MTE
(say some DAX mmap) but we still allow PROT_MTE driven by user, it will
lead to an SError which brings the whole machine down.

Not sure whether ADI has similar requirements but at least for arm64 we
addressed the mmap() case as well (see my other email on the details; I
think the approach would work on SPARC as well).

-- 
Catalin
