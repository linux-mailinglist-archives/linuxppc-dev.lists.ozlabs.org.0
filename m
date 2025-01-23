Return-Path: <linuxppc-dev+bounces-5520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581AA1A5A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 15:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf35L3kCMz2ykf;
	Fri, 24 Jan 2025 01:20:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737642054;
	cv=none; b=GAQtBmKaPjkCMfPPHqthEadLZh5MXNXP2FYAhT1hb+uH7pBuPRtKb1AfDgQkYIzbwtE6QanfteVOQQcHs26opoWlig287oV7XHZ183LqXHUEcWNyDlfjccZxOquPPlLuKURY3bzvS6O3y+4yTtuQpJR8RUsy9sGp1G6wMOlnMuw4GfQYRCt7jiJBbgjTD+FfMzl3WxiTIEs6z7pEb5KR8j46h9SUSMKJ+Cao2bIRoxrlRyKRFKgg3nKjdjfYSgbEnxmhojuJ0VNoMZIUhkIbLsmGeP8jXGZVLNxgFdbYBk5YVbczSt2fj65HEsa8Tnjv50H3vBU7+Y5xH66lXn6l3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737642054; c=relaxed/relaxed;
	bh=FkXlfcSI2XFp1hBUuxM8W6o5JSnEatBKX8wVyO9+q5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db1+JYUcJpdLNnizUjKM9lnNo29wG1p1uF1eZwKuxqGLuwMf9bYb73i8QV7OxATzNWwiWSWt+FAP292HPxKLfL1MjFk2WL/nGqRPSlnoi4aYRuIjcByFKSwVFchEX6iJZL21cfjuVU1vc20kI14ihuM6bCSxgxLqMROsZaSwmQ7+zuHK7tjSEhmBmiW21l1DIyzPw3C2O6ChhLnajHZuE4qc0njq2DHUvdHQXYqhZg/jIt7C/nvyi84kRq+IJaMp25BzrBhtHJ4cd4FOB3/qJIy0coICj8HVbNxu7VljBe/5RElMuda5f6jCDQHY/sWlZK8jvJYLZEDXe36eZJGudQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf35K2V9Wz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 01:20:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3FE41063;
	Thu, 23 Jan 2025 06:20:45 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 547893F694;
	Thu, 23 Jan 2025 06:20:14 -0800 (PST)
Date: Thu, 23 Jan 2025 14:20:07 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default
 arguments for kvmtool
Message-ID: <Z5JQF38bJQFeWrbJ@raptor>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-13-alexandru.elisei@arm.com>
 <20250121-16510b161f5b92ce9c5ae4e1@orel>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-16510b161f5b92ce9c5ae4e1@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Thu, Jan 23, 2025 at 03:07:18PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:10PM +0000, Alexandru Elisei wrote:
> > kvmtool, unless told otherwise, will do its best to make sure that a kernel
> > successfully boots in a virtual machine. Among things like automatically
> > creating a rootfs, it also adds extra parameters to the kernel command
> > line. This is actively harmful to kvm-unit-tests, because some tests parse
> > the kernel command line and they will fail if they encounter the options
> > added by kvmtool.
> > 
> > Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> > line argument") addded the --nodefaults kvmtool parameter which disables
> 
> added
> 
> > all the implicit virtual machine configuration that cannot be disabled by
> > using other parameters, like modifying the kernel command line. Always use
> > --nodefaults to allow a test to run.
> > 
> > kvmtool can be too verbose when running a virtual machine, and this is
> > controlled with parameters. Add those to the default kvmtool command line
> > to reduce this verbosity to a minimum.
> > 
> > Before:
> > 
> > $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> >   Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> > Unknown subtest
> > 
> > EXIT: STATUS=127
> >   Warning: KVM compatibility warning.
> > 	virtio-9p device was not detected.
> > 	While you have requested a virtio-9p device, the guest kernel did not initialize it.
> > 	Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
> >   Warning: KVM compatibility warning.
> > 	virtio-net device was not detected.
> > 	While you have requested a virtio-net device, the guest kernel did not initialize it.
> > 	Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
> >   Info: KVM session ended normally.
> > 
> > After:
> > 
> > $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> 
> On riscv I've noticed that with --nodefaults if I don't add parameters
> with --params then kvmtool segfaults. I have to add --params "" to
> avoid it. Does that also happen on arm? Anyway, that's something we
> should fix in kvmtool rather than workaround it here.

This should fix it:

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 85c8f95604f6..f6a702533258 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -256,9 +256,10 @@ static int setup_fdt(struct kvm *kvm)
                if (kvm->cfg.kernel_cmdline)
                        _FDT(fdt_property_string(fdt, "bootargs",
                                                 kvm->cfg.kernel_cmdline));
-       } else
+       } else if (kvm->cfg.real_cmdline) {
                _FDT(fdt_property_string(fdt, "bootargs",
                                         kvm->cfg.real_cmdline));
+       }

        _FDT(fdt_property_string(fdt, "stdout-path", "serial0"));


Looking at the timestamp on the commit, the patch that added --nodefaults
came before the patch that added riscv to kvmtool (by about a month). Just
in case you want to add a Fixes tag.

Thanks,
Alex

