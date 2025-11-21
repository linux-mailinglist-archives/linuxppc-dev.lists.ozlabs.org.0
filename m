Return-Path: <linuxppc-dev+bounces-14386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCBFC770CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:47:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKQC3zJtz2ySq;
	Fri, 21 Nov 2025 13:47:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763693267;
	cv=none; b=LqJiglkAQnr9pR0Y5AQ0AEkOwI78GMBFe8ro9799FubEhqr89aoJukgpQs8OywF0h03BPoAAiIPVQXJU8YtOSYXlCgvgM+zsWyRdCSoY+svuUD/WO5jgsm/VAhMlq8Ze/EReeRlXkzy74VrQGOVBF18MO5ggUs7NJJpIDCvLxgoYL7OX0+UB/JqbGMToqNexEp9QdhuE/zFxeqkbBymTHv2A/Xhbn7e/pHJR2dp+91r7E8OSm8n1qez51f9Kn3PTCjaODexaXuyFKb5uzm9tx4jdAJ9IBJraXih4r+R0ynkLwGg6MaT9GkkSaBBHDYExBqsChSIiJqT1xLJ3l8Untg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763693267; c=relaxed/relaxed;
	bh=7/+xC9VzlzEvb/9+gGLwhYCZZ6+xeKT68zJkKrNRvNo=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aYSmNtALxsan9GZFbokxqprrCNWJllk8fbgpycSAgSYJ/DgZwdVz8BBv8P2PhW0BYu5RhceS9GKEdxbSdOYSFvda+ypeSFn3gwM+UUsRORZOiholSFGiXsO9nBvmF4SDRr1xix4dn0fh+q7y5xzAL35uKzgvDiPQXoAEy1cmwkv9uVbfFaPINiXpDDEGhcRZeHvHaqmbVLk9o9GKbjPL09tfjPnGER4SU+jYT5duvjqoecIkAijB4UwswzPGD7Jr4/bJm31GGUkH8hfJvT1NEoz3GSm/HRLXUBumyDjLPpAMC4j9HhUz9h6+AdInohayh91HSe5FY9vSJioEx5zkoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=umciH1Kb; dkim-atps=neutral; spf=pass (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=umciH1Kb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKQ75kwPz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:47:40 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7/+xC9VzlzEvb/9+gGLwhYCZZ6+xeKT68zJkKrNRvNo=;
	b=umciH1KbToXmWnysWFcNx4N/28wNz0FN+EKeR71aSehD+o98NCvFpUht/EtqQYi3rjhCrLqTR
	xZWOX/pqi5WYvldwqLxNWtnxyvByw/QgBSrE2U/DUzmcqJSsN8KVn3UF364j5bCMoAEZ0h88/IF
	AVQ0DIPiG0E1xO56eb13KLQ=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dCKMx5vtWz1prL2;
	Fri, 21 Nov 2025 10:45:49 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 77BB314022D;
	Fri, 21 Nov 2025 10:47:35 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 10:47:33 +0800
Subject: Re: [PATCH RESEND v5] vmcoreinfo: Track and log recoverable hardware
 errors
To: Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, Tony Luck
	<tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Robert Moore
	<robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <osandov@osandov.com>,
	<xueshuai@linux.alibaba.com>, <konrad.wilk@oracle.com>,
	<linux-edac@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <kernel-team@meta.com>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <a4a34583-8f26-bb08-001f-a53715070c00@huawei.com>
Date: Fri, 21 Nov 2025 10:47:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/10/10 18:36, Breno Leitao wrote:
> Introduce a generic infrastructure for tracking recoverable hardware
> errors (HW errors that are visible to the OS but does not cause a panic)
> and record them for vmcore consumption. This aids post-mortem crash
> analysis tools by preserving a count and timestamp for the last
> occurrence of such errors. On the other side, correctable errors, which
> the OS typically remains unaware of because the underlying hardware
> handles them transparently, are less relevant for crash dump
> and therefore are NOT tracked in this infrastructure.
> 
> Add centralized logging for sources of recoverable hardware
> errors based on the subsystem it has been notified.
> 
> hwerror_data is write-only at kernel runtime, and it is meant to be read
> from vmcore using tools like crash/drgn. For example, this is how it
> looks like when opening the crashdump from drgn.
> 
> 	>>> prog['hwerror_data']
> 	(struct hwerror_info[1]){
> 		{
> 			.count = (int)844,
> 			.timestamp = (time64_t)1752852018,
> 		},
> 		...
> 
> This helps fleet operators quickly triage whether a crash may be
> influenced by hardware recoverable errors (which executes a uncommon
> code path in the kernel), especially when recoverable errors occurred
> shortly before a panic, such as the bug fixed by
> commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them
> when destroying the pool")
> 
> This is not intended to replace full hardware diagnostics but provides
> a fast way to correlate hardware events with kernel panics quickly.
> 
> Rare machine check exceptions—like those indicated by mce_flags.p5 or
> mce_flags.winchip—are not accounted for in this method, as they fall
> outside the intended usage scope for this feature’s user base.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
> Changes in v5:
> - Move the headers to uapi file (Dave Hansen)
> - Use atomic operations in the tracking struct (Dave Hansen)
> - Drop the MCE enum type, and track MCE errors as "others"
> - Document this feature better
> - Link to v4: https://lore.kernel.org/r/20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org
> 
> Changes in v4:
> - Split the error by hardware subsystem instead of kernel
>    subsystem/driver (Shuai)
> - Do not count the corrected errors, only focusing on recoverable errors (Shuai)
> - Link to v3: https://lore.kernel.org/r/20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org
> 
> Changes in v3:
> - Add more information about this feature in the commit message
>    (Borislav Petkov)
> - Renamed the function to hwerr_log_error_type() and use hwerr as
>    suffix (Borislav Petkov)
> - Make the empty function static inline (kernel test robot)
> - Link to v2: https://lore.kernel.org/r/20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org
> 
> Changes in v2:
> - Split the counter by recoverable error (Tony Luck)
> - Link to v1: https://lore.kernel.org/r/20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org
> ---
>   Documentation/driver-api/hw-recoverable-errors.rst | 60 ++++++++++++++++++++++
>   arch/x86/kernel/cpu/mce/core.c                     |  4 ++
>   drivers/acpi/apei/ghes.c                           | 36 +++++++++++++

For the APEI part,

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

