Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D98011AB677
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 06:04:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492lwP4qJNzDrJp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492ltr6YR0zDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=AfiuIEeX; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 492ltr1fHTz9sSG; Thu, 16 Apr 2020 14:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1587009780; bh=RfMzDVHhSOkRGer9enMmRPIrJPGTabhenoE57XBRplo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AfiuIEeXFvIe8wFjG/xyTF+rwG4k8RcCcDd1KP5PjRIcTbDoPKzOi4VkoXYkLj3pL
 t6cIP1yCaTX98i03dU1zj9BG6hMVwzERjPSw8RpnkqtXTR4/Rz/beD4qmq3fQrZH2+
 ViLGsAIenrmjXCAUHZ/gC6wgL6wP3ZRBzcLesehMxIlFL81bfnluHLBQp99JSO0+hw
 VlmtMgNnsN6D9je7O3LTxZqfcSILCa3rm8G4HVwLgD7ztg6re2a+TgcS7xR6KNPXgP
 SeRgIT9r9RGzqYCRGC/V3OZ5KpsNoeUtOt6Uf1TKTR7cR5xexPpHAdUF8WeKnPaQSq
 QvVcGPc/4fyKg==
Date: Thu, 16 Apr 2020 14:02:57 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: CVE-2020-11669: Linux kernel 4.10 to 5.1: powerpc: guest can
 cause DoS on POWER9 KVM hosts
Message-ID: <20200416040257.GA10545@blackberry>
References: <2ff92392-30ec-d5c4-84c9-e6ba24f6b154@linux.ibm.com>
 <20200415140329.GC25468@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415140329.GC25468@kitsune.suse.cz>
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
Cc: oss-security@lists.openwall.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 04:03:29PM +0200, Michal Suchánek wrote:
> On Wed, Apr 15, 2020 at 10:52:53PM +1000, Andrew Donnellan wrote:
> > The Linux kernel for powerpc from v4.10 to v5.1 has a bug where the
> > Authority Mask Register (AMR), Authority Mask Override Register (AMOR) and
> > User Authority Mask Override Register (UAMOR) are not correctly saved and
> > restored when the CPU is going into/coming out of idle state.
> > 
> > On POWER9 CPUs, this means that a CPU may return from idle with the AMR
> > value of another thread on the same core.
> > 
> > This allows a trivial Denial of Service attack against KVM hosts, by booting
> > a guest kernel which makes use of the AMR, such as a v5.2 or later kernel
> > with Kernel Userspace Access Prevention (KUAP) enabled.
> > 
> > The guest kernel will set the AMR to prevent userspace access, then the
> > thread will go idle. At a later point, the hardware thread that the guest
> > was using may come out of idle and start executing in the host, without
> > restoring the host AMR value. The host kernel can get caught in a page fault
> > loop, as the AMR is unexpectedly causing memory accesses to fail in the
> > host, and the host is eventually rendered unusable.
> 
> Hello,
> 
> shouldn't the kernel restore the host registers when leaving the guest?

It does.  That's not the bug.

> I recall some code exists for handling the *AM*R when leaving guest. Can
> the KVM guest enter idle without exiting to host?

No, we currently never execute the "stop" instruction in guest context.

The bug occurs when a thread that is in the host goes idle and
executes the stop instruction to go to a power-saving state, while
another thread is executing inside a guest.  Hardware loses the first
thread's AMR while it is stopped, and as it happens, it is possible
for the first thread to wake up with the contents of its AMR equal to
the other thread's AMR.  This can happen even if the first thread has
never executed in the guest.

The kernel needs to save and restore AMR (among other registers)
across the stop instruction because of this hardware behaviour.
We missed the AMR initially, which is what led to this vulnerability.

Paul.
