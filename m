Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96447AF683
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 01:03:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EAvZ3vNy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwFfQ4DLwz3c2G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 09:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EAvZ3vNy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwFdV06dbz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 09:02:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DF70B81240;
	Tue, 26 Sep 2023 23:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD1EC433C7;
	Tue, 26 Sep 2023 23:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695769369;
	bh=je6g4sK4peKsh1qGI9bWWT/XBfOKZh3dIb4/VXqVR94=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EAvZ3vNy2vbk5wk/qfuZFLTEzYgxPC0IYYVZYNR1ywjJCc/PknMAGU9l9YgkeUC0D
	 IuCC0cbREtDSWvQO/d+8xxXF+rvW+7sIJh4gkPkycF0XSKWoHqOd8kzk10XbDgzylE
	 y6loJllN6SBw6Lqj3JNsIraIOGu+Q1prRZTdWYcFyEXnYtiHcGW/Nbdv9wpENKYprW
	 3Zt76Rn69EOBuO3S/HiKtmJg9qR2z4o6HsIVeHe3BhsCs8hvQWo1SEXbnScSnTsI0w
	 bLtk+MvKaBJqKNx4vERctWe0Lk/crpGPtb3oigWZknhckvTcDY3fmVO5ShaLZpfJxG
	 5z1iuIuI0PrsA==
Date: Tue, 26 Sep 2023 18:02:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
Message-ID: <20230926230247.GA429368@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdc7a4ee-250f-7ec8-ca15-32cbd480bd3e@linux.alibaba.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, Linux PCI <linux-pci@vger.kernel.org>, mahesh@linux.ibm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "tanxiaofei@huawei.com" <tanxiaofei@huawei.com>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, bhelgaas@google.com, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 10:46:36AM +0800, Shuai Xue wrote:
> ...

> Actually, this is a question from my colleague from firmware team.
> The original question is that:
> 
>     "Should I set CPER_SEV_FATAL for Generic Error Status Block when a
>     PCIe fatal error is detected? If set, kernel will always panic.
>     Otherwise, kernel will always not panic."
> 
> So I pull a question about desired behavior of Linux kernel first :)
> From the perspective of the kernel, CPER_SEV_FATAL for Generic Error
> Status Block is not reasonable. The kernel will attempt to recover
> Fatal errors, although recovery may fail.

I don't know the semantics of CPER_SEV_FATAL or why it's there.
With CPER, we have *two* error severities: a "native" one defined by
the PCIe spec and another defined by the platform via CPER.

I speculate that the reason for the CPER severity could be to provide
a severity for error sources that don't have a "native" severity like
AER does, or for the vendor to force the OS to restart (for
CPER_SEV_FATAL, anyway) in cases where it might not otherwise.

In the native case, we only have the PCIe severity and don't have the
CPER severity at all, and I suspect that unless there's uncontained
data corruption, we would rather handle even the most severe PCIe
fatal error by disabling the specific device(s) instead of panicking
and restarting the whole machine.

So for PCIe errors, I'm not sure setting CPER_SEV_FATAL is beneficial
unless the platform wants to force the OS to panic, e.g., maybe the
platform knows about data corruption and/or the vendor wants the OS to
panic as part of a reliability story.

Presumably the platform has already logged the error, and I assume the
platform *could* restart without even returning to the OS, but maybe
it wants the OS to do a crashdump or shutdown in a more orderly way.

Bjorn
