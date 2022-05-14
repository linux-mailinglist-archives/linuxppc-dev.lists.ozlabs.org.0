Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA752718B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 16:05:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0nMb2R4Hz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 00:04:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LHg9QKXY;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Wccmxkq4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=LHg9QKXY; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=Wccmxkq4; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0nLy1kSkz3bbs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 00:04:26 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652537058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHOIys2lUf5zRjBsSOUOWEZGDpRLn7fWHLTsPdw7f4U=;
 b=LHg9QKXYPrV5G6DpjGAQUj+qfPDVnxCZetHDBfVfH+LeqCXHlJAbKb8WllnreP7S3bNkfN
 4KeQuJ7ASL57SIcHW5e0/ESjXmm27lFLndKPfS7ueia9+AnyVBizDI/I8cVvjyBodAV73C
 KuR6VX1IdjUZkcx7JJgKy1PXR652V3bzFUHb8gWx45QdbM32XdC1pSbLSU5kSVZNHK9CnN
 sYrvtcF6hGd4esjm7UwZp0Jjc3XOn+pTPW63vJAVYDRvjZI2qtcicolrLDuGi3y01KBsGF
 OHVzd6Qv0y0sYGOnTDmWoNHy2dKwZHGvbkDMdo4G48fllgMyGiB+2V0HQQZJAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652537058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHOIys2lUf5zRjBsSOUOWEZGDpRLn7fWHLTsPdw7f4U=;
 b=Wccmxkq4ead+q0uv0ac7dDXkCM4gzRqejs0vLHNPNyx0+CzSuVgKfK7pCPPycJh8YJUxj4
 LicVDTm3UgM/NtDA==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v6 22/29] x86/watchdog/hardlockup: Add an HPET-based
 hardlockup detector
In-Reply-To: <20220513221650.GA8691@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-23-ricardo.neri-calderon@linux.intel.com>
 <877d6uref8.ffs@tglx> <20220513221650.GA8691@ranerica-svr.sc.intel.com>
Date: Sat, 14 May 2022 16:04:17 +0200
Message-ID: <875ym8rz1a.ffs@tglx>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 13 2022 at 15:16, Ricardo Neri wrote:
> On Mon, May 09, 2022 at 04:03:39PM +0200, Thomas Gleixner wrote:
>> > +			/* If we are here, IPI shorthands are enabled. */
>> > +			apic->send_IPI_allbutself(NMI_VECTOR);
>> 
>> So if the monitored cpumask is a subset of online CPUs, which is the
>> case when isolation features are enabled, then you still send NMIs to
>> those isolated CPUs. I'm sure the isolation folks will be enthused.
>
> Yes, I acknowledged this limitation in the cover letter. I should also update
> Documentation/admin-guide/lockup-watchdogs.rst.
>
> This patchset proposes the HPET NMI watchdog as an opt-in feature.
>
> Perhaps the limitation might be mitigated by adding a check for non-housekeeping
> and non-monitored CPUs in exc_nmi(). However, that will not eliminate the
> problem of isolated CPUs also getting the NMI.

Right. It's a mess...
