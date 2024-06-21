Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC81912C2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 19:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5NwH6Htmz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 03:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Nvw2G5qz3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 03:02:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10AC9CE2D6D;
	Fri, 21 Jun 2024 17:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF7FC2BBFC;
	Fri, 21 Jun 2024 17:02:43 +0000 (UTC)
Date: Fri, 21 Jun 2024 18:02:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 05/29] arm64: cpufeature: add Permission Overlay
 Extension cpucap
Message-ID: <ZnWyMvu0HCKajrXP@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-6-joey.gouly@arm.com>
 <ZnWyAJb63XjZiEqf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWyAJb63XjZiEqf@arm.com>
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
Cc: szabolcs.nagy@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 06:01:52PM +0100, Catalin Marinas wrote:
> On Fri, May 03, 2024 at 02:01:23PM +0100, Joey Gouly wrote:
> > This indicates if the system supports POE. This is a CPUCAP_BOOT_CPU_FEATURE
> > as the boot CPU will enable POE if it has it, so secondary CPUs must also
> > have this feature.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

One ack is sufficient, ignore this one ;)

-- 
Catalin
