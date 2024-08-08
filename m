Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA27694BC3C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 13:25:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=u575P61E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfl816329z2y8X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 21:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=u575P61E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tesarici.cz (client-ip=37.205.15.56; helo=bee.tesarici.cz; envelope-from=petr@tesarici.cz; receiver=lists.ozlabs.org)
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfl7L14kqz2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 21:24:29 +1000 (AEST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 477831D4DE1;
	Thu,  8 Aug 2024 13:24:24 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1723116264; bh=oxYbYN2Mz8ixrMDkxJac4yjjhQ3W1I56nPlRCKBOi98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u575P61E87M/BWliYygQAQzNdqCpWX5mQfndINSrY9sqCM6Ih+NlOCPeUzzJ7LY9D
	 Guxqb0VT3HvrWgzxbA2zWw9CZ4UxMjVhJZII6HiRDG6DiTukh4FmZqTzGPtBMfrPCG
	 a5nkkuFSFNrSxmHgfKxA7PQJECNgHHin2ViNz/lIbhVmQZ7U+Jfc60tnQPzbzidTS4
	 DwQelkG0R9+71o6d4RuCUwFWLenWl+MOuHV7QiUV3SvbmH7zd/u8gcvEDPLYDtYpjR
	 w2lg8pOVlgsFNqOXDS8PF6mXg0itfu8eae9hVqFa6w1rraU9c8wS3jyhneU4NbRQ6a
	 Jnn1H/Cw4qzag==
Date: Thu, 8 Aug 2024 13:24:23 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH] Document/kexec: Generalize crash hotplug description
Message-ID: <20240808132423.0f313ffe@meshulam.tesarici.cz>
In-Reply-To: <20240805050829.297171-1-sourabhjain@linux.ibm.com>
References: <20240805050829.297171-1-sourabhjain@linux.ibm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: bhe@redhat.com, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

sorry for late reply, was on vacation and then catching up...

On Mon,  5 Aug 2024 10:38:29 +0530
Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Commit 79365026f869 ("crash: add a new kexec flag for hotplug support")
> generalizes the crash hotplug support to allow architectures to update
> multiple kexec segments on CPU/Memory hotplug and not just elfcorehdr.
> Therefore, update the relevant kernel documentation to reflect the same.
> 
> No functional change.
> 
> Cc: Petr Tesarik <petr@tesarici.cz>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> 
> Discussion about the documentation update:
> https://lore.kernel.org/all/68d0328d-531a-4a2b-ab26-c97fd8a12e8b@linux.ibm.com/
> 
> ---
>  .../ABI/testing/sysfs-devices-memory          |  6 ++--
>  .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>  .../admin-guide/mm/memory-hotplug.rst         |  5 ++--
>  Documentation/core-api/cpu_hotplug.rst        | 10 ++++---
>  kernel/crash_core.c                           | 29 ++++++++++++-------
>  5 files changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
> index a95e0f17c35a..421acc8e2c6b 100644
> --- a/Documentation/ABI/testing/sysfs-devices-memory
> +++ b/Documentation/ABI/testing/sysfs-devices-memory
> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for memory hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel update of kexec
> +		segments on memory hot un/plug and/or on/offline events,
> +		avoiding the need to reload kdump kernel.

This sentence somehow lacks a verb. My suggestion:

  (RO) indicates whether or not the kernel updates relevant kexec
  segments on memory hot un/plug and/or on/offline events, avoiding the
  need to reload kdump kernel.

> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 325873385b71..f4ada1cd2f96 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel update of kexec
> +		segments on CPU hot un/plug and/or on/offline events,
> +		avoiding the need to reload kdump kernel.

Same as above.

Otherwise LGTM.

Petr T
