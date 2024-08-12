Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9F94E653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 07:58:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzrCMVPe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj3jV1KMGz2xgw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 15:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzrCMVPe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=ptesarik@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj3LP18jHz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 15:42:03 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so411883266b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2024 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723441315; x=1724046115; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6CTGoNaTe2XWjeAV+ihoGUgx18k2VPP6Soz43dQHSQ=;
        b=MzrCMVPe3xio4wPCd7o3FML3meoQOqrh/UIt5Lp9f0d8JmXBhpc2P+VMT728KxHWa4
         v+ZDjGOTlWTwo3dM2Bc/LDw3H3XCcJITs6XfhGrBTkoJMx9dORxP7RATC2Qc4ecHp4wU
         8MBDauDZUcUwCM8IEGAjSwLLhDTahmshobnFu/k89EaJv0x7xyOtHG3WdUBi31NAAvry
         D+c6xFUMvXPh5p/rL9KKckGd2NlZFfnbizchjTofJnCvORQO96hO5997m28NR30lrY43
         ZM1pE3sdzbwteHvOpxh9W1fx/wxlmO3fCsR0EI+RBVoMsb7cOxzx7EgW1JapRfUYqVZi
         IYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723441315; x=1724046115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6CTGoNaTe2XWjeAV+ihoGUgx18k2VPP6Soz43dQHSQ=;
        b=Yf/7GG4dpza8Xscznd9tbG6PLa2WkcyA9HAEYZllxFrCyFED9cXN9+JOwTLLVnfh/C
         maxPF0jMrY+fKMS4d/An5ln7z1aR/29HmFXwk+QQVE4trw8irzmmFH9SAILXKS306h+1
         zxYBvHP2ydhQZdbuHBAletILavJ6WOF59zcTuc9zTB7awS+9b8mom5YuN8lBaP2oiw46
         SVrc8bEoflH5bUfC1EKVnRx3PSwhEaqWjqPqqkivIJXbtuDcNGkfVd5hhWfxR6wK8/k4
         U0gCFUGh+0nD35fcYq2ZFmw7ky0CXO6YRLBvGP9YvbqQDkUblAQbL96MqKe1lXTPQPcz
         VJRg==
X-Forwarded-Encrypted: i=1; AJvYcCUJq51YQMCdVeFiiMiPG7TnNWeMVKDbmLH+kWQnk9sa+HUMwXD5XNjurV5uDULCP7MsvrrkgHL/cbE/CoxR7q6ozzs4RCIT8yGNS+DIXA==
X-Gm-Message-State: AOJu0YxiDETNohJtpGn6swia8Y3a4slKIjq9UCu0G6q6NdV/jng8KPps
	FUnn2T/7A7x0wR9SZSZpMPzhIxxFsjrqPgZH2tUgJgsDMcfUxYwgY1e0XhKNx2w=
X-Google-Smtp-Source: AGHT+IGoauMHKJ2VwPdWETVSbpWk0FENKo/8XPyLz6nP7e203aXrsJPM4FhHzcZITRY1Du0txiAk8g==
X-Received: by 2002:a17:906:d247:b0:a72:6375:5fc4 with SMTP id a640c23a62f3a-a80aa55409amr560097366b.11.1723441315427;
        Sun, 11 Aug 2024 22:41:55 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb0e1334sm198172066b.79.2024.08.11.22.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:41:55 -0700 (PDT)
Date: Mon, 12 Aug 2024 07:41:52 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
Message-ID: <20240812074152.321febe5@mordecai.tesarici.cz>
In-Reply-To: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 12 Aug 2024 15:58:03 +1000
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
Cc: bhe@redhat.com, Petr =?UTF-8?B?VGVzYcWZ?= =?UTF-8?B?w61r?= <petr@tesarici.cz>, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Aug 2024 09:46:51 +0530
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

It's perfect now.

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
> 
> Changelog:
> 
> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>   - Update crash_hotplug sysfs document as suggested by Petr T
>   - Update an error message in crash_handle_hotplug_event and
>     crash_check_hotplug_support function.
> 
> ---
>  .../ABI/testing/sysfs-devices-memory          |  6 ++--
>  .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>  .../admin-guide/mm/memory-hotplug.rst         |  5 +--
>  Documentation/core-api/cpu_hotplug.rst        | 10 +++---
>  kernel/crash_core.c                           | 33 +++++++++++--------
>  5 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
> index a95e0f17c35a..cec65827e602 100644
> --- a/Documentation/ABI/testing/sysfs-devices-memory
> +++ b/Documentation/ABI/testing/sysfs-devices-memory
> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for memory hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel updates relevant kexec
> +		segments on memory hot un/plug and/or on/offline events, avoiding the
> +		need to reload kdump kernel.
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 325873385b71..1a31b7c71676 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel updates relevant kexec
> +		segments on memory hot un/plug and/or on/offline events, avoiding the
> +		need to reload kdump kernel.
>  
>  What:		/sys/devices/system/cpu/enabled
>  Date:		Nov 2022
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index 098f14d83e99..cb2c080f400c 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -294,8 +294,9 @@ The following files are currently defined:
>  ``crash_hotplug``      read-only: when changes to the system memory map
>  		       occur due to hot un/plug of memory, this file contains
>  		       '1' if the kernel updates the kdump capture kernel memory
> -		       map itself (via elfcorehdr), or '0' if userspace must update
> -		       the kdump capture kernel memory map.
> +		       map itself (via elfcorehdr and other relevant kexec
> +		       segments), or '0' if userspace must update the kdump
> +		       capture kernel memory map.
>  
>  		       Availability depends on the CONFIG_MEMORY_HOTPLUG kernel
>  		       configuration option.
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index dcb0e379e5e8..a21dbf261be7 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -737,8 +737,9 @@ can process the event further.
>  
>  When changes to the CPUs in the system occur, the sysfs file
>  /sys/devices/system/cpu/crash_hotplug contains '1' if the kernel
> -updates the kdump capture kernel list of CPUs itself (via elfcorehdr),
> -or '0' if userspace must update the kdump capture kernel list of CPUs.
> +updates the kdump capture kernel list of CPUs itself (via elfcorehdr and
> +other relevant kexec segment), or '0' if userspace must update the kdump
> +capture kernel list of CPUs.
>  
>  The availability depends on the CONFIG_HOTPLUG_CPU kernel configuration
>  option.
> @@ -750,8 +751,9 @@ file can be used in a udev rule as follows:
>   SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
>  
>  For a CPU hot un/plug event, if the architecture supports kernel updates
> -of the elfcorehdr (which contains the list of CPUs), then the rule skips
> -the unload-then-reload of the kdump capture kernel.
> +of the elfcorehdr (which contains the list of CPUs) and other relevant
> +kexec segments, then the rule skips the unload-then-reload of the kdump
> +capture kernel.
>  
>  Kernel Inline Documentations Reference
>  ======================================
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..c1048893f4b6 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>  	crash_hotplug_lock();
>  	/* Obtain lock while reading crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>  		crash_hotplug_unlock();
>  		return 0;
>  	}
> @@ -520,18 +520,25 @@ int crash_check_hotplug_support(void)
>  }
>  
>  /*
> - * To accurately reflect hot un/plug changes of cpu and memory resources
> - * (including onling and offlining of those resources), the elfcorehdr
> - * (which is passed to the crash kernel via the elfcorehdr= parameter)
> - * must be updated with the new list of CPUs and memories.
> + * To accurately reflect hot un/plug changes of CPU and Memory resources
> + * (including onling and offlining of those resources), the relevant
> + * kexec segments must be updated with latest CPU and Memory resources.
>   *
> - * In order to make changes to elfcorehdr, two conditions are needed:
> - * First, the segment containing the elfcorehdr must be large enough
> - * to permit a growing number of resources; the elfcorehdr memory size
> - * is based on NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES.
> - * Second, purgatory must explicitly exclude the elfcorehdr from the
> - * list of segments it checks (since the elfcorehdr changes and thus
> - * would require an update to purgatory itself to update the digest).
> + * Architectures must ensure two things for all segments that need
> + * updating during hotplug events:
> + *
> + * 1. Segments must be large enough to accommodate a growing number of
> + *    resources.
> + * 2. Exclude the segments from SHA verification.
> + *
> + * For example, on most architectures, the elfcorehdr (which is passed
> + * to the crash kernel via the elfcorehdr= parameter) must include the
> + * new list of CPUs and memory. To make changes to the elfcorehdr, it
> + * should be large enough to permit a growing number of CPU and Memory
> + * resources. One can estimate the elfcorehdr memory size based on
> + * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
> + * excluded from SHA verification by default if the architecture
> + * supports crash hotplug.
>   */
>  static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>  {
> @@ -540,7 +547,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  	crash_hotplug_lock();
>  	/* Obtain lock while changing crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>  		crash_hotplug_unlock();
>  		return;
>  	}

