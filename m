Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C695F0D21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:11:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfBwN2nG9z3cFT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 00:11:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MoqT3g8G;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=obRIeQeZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MoqT3g8G;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=obRIeQeZ;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfBvd6Jplz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Oct 2022 00:10:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 21B082B06ACF;
	Fri, 30 Sep 2022 10:10:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 30 Sep 2022 10:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664547016; x=1664550616; bh=2yQinLJc44
	ZVtJNu+szTyOIpmfTuVxVL2LMZsA1lz7Q=; b=MoqT3g8Gl8h17kPMwmShioZtHD
	wwlk/uvdesIW9c5LqKH/HbN3Mx4SU4kLVYsMc7e/tj2jNB/Z+rIB9KLnLHv27RiM
	uVvIsMnmPxUXKDYng5N9UuoxgHVqZbN5YIVxh19psHsAim47/q6qYQSaAnurO4yR
	sbgtkha7iUltEdEEU+mWMQ2ABk1xsF96nHRt1Gfo84l4Qh93F/yN95JJA72eDXWO
	Njw6Tv186o7zCyyJALOhxnXX1WnE+xAZKBCKO2Io+23Z04MVfBmR+ABqLfXr5vOF
	+tgdBbYlGuzjQkCqlZOqecEV659d9TWDFmi08NxajwAGoTw77XcmuGPmLz9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664547016; x=1664550616; bh=2yQinLJc44ZVtJNu+szTyOIpmfTu
	VxVL2LMZsA1lz7Q=; b=obRIeQeZclC4D1PdpFAOLmOJCQVKZogicCAAq5aOmavC
	qVFl4h4yDOMuhjZ1AmEmfNUdPfQIU0+U0N2bj4qVBtbIc8l5qMODPXPT7nKuPkFk
	X8zV1L+RxNRTMs3B/EkFYr2WVxVC5wlXQjCGahC1POC0ASVRem0+hCgGXD5W84Mb
	46jsFL3AMCt+FTC0DisvQeyjWbP03/MG7YTV3HlUXH1ya7lxHC9/+WCkQ4bcsgde
	HBXE2GF/fSzw225OmHuT5fr2sOK5NinDGgUFg5AwEh3y3SVuWJl6gF4Rt/rI8+FU
	seYJ66MFUOv8AMIYFa7P7HGNTObZalO8/t0+WYk/ZA==
X-ME-Sender: <xms:x_g2Y3YaaE_TyovNWfSCY8uKDniM0bpIV41twm-wfdmOIOd7_13TbQ>
    <xme:x_g2Y2Zk11ewRmxdp5wEwxhjAxmcj31jY1HDaq5M92Qjwpcbd2lej3c-pC25a-htO
    e-MTLT5dG4epBnXcrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:x_g2Y5-7UeRe69sPeo0lUtHMUvyVufYzsoQmDLbZS-HbRYhy-XJDlg>
    <xmx:x_g2Y9oo1cIQwKjy28KoSqiduRO7Fsr_9w1wPqs2zRVY8jeAiDL4ZA>
    <xmx:x_g2YyoFsmineLM2gLvpzPCdDfQ2BOp9XVKPG4AaGE_tBmiuzAwiPQ>
    <xmx:yPg2Y3C1suoWAfKdtk1P_Sos7P5jLCToGYFw6PQ6nrJPI-uRv1E2ViYb4RM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C40F3B60089; Fri, 30 Sep 2022 10:10:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <dfeda168-c22b-4c4e-87d7-7b28e5fbd881@app.fastmail.com>
In-Reply-To: <87h70pov7x.fsf@mpe.ellerman.id.au>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-14-rmclure@linux.ibm.com>
 <87k05ng0fq.fsf@mpe.ellerman.id.au>
 <2be2c0f2-9b4b-46e7-a10e-1c17026e8f79@www.fastmail.com>
 <87h70pov7x.fsf@mpe.ellerman.id.au>
Date: Fri, 30 Sep 2022 16:09:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>,
 "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 13/25] powerpc: Remove direct call to mmap2 syscall handlers
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 30, 2022, at 3:19 PM, Michael Ellerman wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>>
>> While sys_mmap_pgoff() was meant to replace the various sys_mmap2()
>> implementations, I think it was ultimately a mistake, and we later
>> converged on the sys_mmap2() calling conventions with 12 bits
>> offset for almost all 32-bit architectures.
>
> I only see 3 compat mmap2s:
>
>   $ gg "COMPAT_SYSCALL.*mmap2"
>   arch/arm64/kernel/sys32.c:COMPAT_SYSCALL_DEFINE6(aarch32_mmap2, 
> unsigned long, addr, unsigned long, len,
>   arch/powerpc/kernel/syscalls.c:COMPAT_SYSCALL_DEFINE6(mmap2, unsigned 
> long, addr, size_t, len,
>   arch/s390/kernel/compat_linux.c:COMPAT_SYSCALL_DEFINE1(s390_mmap2, 
> struct mmap_arg_struct_emu31 __user *, arg)

They are all inconsistently named, and some are shared with the 64-bit
implementation on architectures that provide mmap2 for both 32-bit
and 64-bit mode, rather than only for 32-bit.

arch/mips/kernel/syscall.c:SYSCALL_DEFINE6(mips_mmap2, unsigned long, addr, unsigned long, len,
arch/sparc/kernel/sys32.S:      .globl          sys32_mmap2
arch/parisc/kernel/sys_parisc.c:asmlinkage unsigned long sys_mmap2(unsigned long addr, unsigned long len,

> s390 is weird.

Right, they used to be limited to 5 register arguments

> The arm64 one and ours are similar, but we have the additional call to
> arch_validate_prot(prot, addr). arm64 does implement arch_validate_prot().
>
> Similar with mmap2, we call arch_validate_prot() but no one else does 
> (why not?).

This looks like it was added in ef3d3246a0d0 ("powerpc/mm: Add Strong
Access Ordering support"), which is powerpc specific. It looks like
this should correspond to a custom arch_calc_vm_prot_bits()
implementation, which exists on arm64, powerpc, sparc and x86.

I suppose it should be there for those four.

    Arnd
