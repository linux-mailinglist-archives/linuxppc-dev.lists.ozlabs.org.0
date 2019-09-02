Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF0A53F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 12:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MR8f3jP5zDqVs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 20:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MR6f5Nw5zDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 20:25:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MR6c6x1gz9sDB;
 Mon,  2 Sep 2019 20:25:12 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
In-Reply-To: <20190902090846.GA15118@arrakis.emea.arm.com>
References: <20190902094711.2625ba31@canb.auug.org.au>
 <87lfv7tqt0.fsf@mpe.ellerman.id.au>
 <20190902090846.GA15118@arrakis.emea.arm.com>
Date: Mon, 02 Sep 2019 20:25:12 +1000
Message-ID: <87y2z7ro53.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:
> On Mon, Sep 02, 2019 at 11:44:43AM +1000, Michael Ellerman wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Hi all,
>> >
>> > Today's linux-next merge of the powerpc tree got a conflict in:
>> >
>> >   arch/Kconfig
>> >
>> > between commit:
>> >
>> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
>> >
>> > from the arm64 tree and commit:
>> >
>> >   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
>> >
>> > from the powerpc tree.
>> >
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your tree
>> > is submitted for merging.  You may also want to consider cooperating
>> > with the maintainer of the conflicting tree to minimise any particularly
>> > complex conflicts.
>> 
>> Thanks.
>> 
>> That conflict seems entirely trivial, but Catalin/Will if it bothers you
>> I have the conflicting commit in a topic branch based on rc2 which you
>> could merge to resolve it:
>
> It's a trivial conflict, easy to resolve. I don't think it's worth
> trying to avoid it (Linus normally doesn't mind such conflicts).

Yep, I agree.

cheers
