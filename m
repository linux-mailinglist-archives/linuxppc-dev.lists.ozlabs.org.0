Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43AA83D422
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 07:08:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXePnKwR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jv+AZBmE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLnLd4HvBz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 17:08:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXePnKwR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jv+AZBmE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLnKq197Yz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 17:07:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706249258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z72p/1NCFMOucyopgj4TN6714b15v6kjfWKT6hd64FE=;
	b=OXePnKwRnWqjAg2tkIgijCa3Aby18RqsbT/azQ+mw0MyP0qiE00Y7luB5k1jJ7BLpwASn6
	rNZEzdOsHnkE4rwD/SBGJ7gBo7X/zUxGILf0RENkyDeePiHep4Zg8SyadrV6bubTPpg71n
	AbFL3fdUEscdMYUZZHaV4bPKJU4dPPs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706249259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z72p/1NCFMOucyopgj4TN6714b15v6kjfWKT6hd64FE=;
	b=Jv+AZBmEgxSbs7CjzyYAFNQ6FsrTNVgp0BIZxZjwGCbBO5LKecoiWdCNa8SuAvbaO8Vke3
	OeBIG3XOhZbF7NK3Dsao+2Q28zV5y/MXtLWA7y1SzIFntEEW5Ih7gVNYsPg7J4pm8JistT
	Cl8WPKMK7WMucOvHtUAjj30oYbB+dE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-Dvx_BaF4N36KKDvV0yy-Nw-1; Fri, 26 Jan 2024 01:07:33 -0500
X-MC-Unique: Dvx_BaF4N36KKDvV0yy-Nw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19D621013664;
	Fri, 26 Jan 2024 06:07:32 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 925AD492BC6;
	Fri, 26 Jan 2024 06:07:30 +0000 (UTC)
Date: Fri, 26 Jan 2024 14:07:27 +0800
From: Baoquan He <bhe@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH linux-next v3 00/14] Split crash out from kexec and clean
 up related config items
Message-ID: <ZbNMHwVhWxMyvKH/@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240126045551.GA126645@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126045551.GA126645@dev-arch.thelio-3990X>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/25/24 at 09:55pm, Nathan Chancellor wrote:
...... 
> I am seeing a few build failures in my test matrix on next-20240125 that
> appear to be caused by this series although I have not bisected. Some
> reproduction steps:

Thanks for trying this, I have reproduced the linking failure on arm,
will work out a way to fix it.

It's weird, I remember I have built these and passed.

> 
> $ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.armv7
> $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- olddefconfig all
> ...
> arm-linux-gnueabi-ld: arch/arm/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
> machine_kexec.c:(.text+0x488): undefined reference to `vmcoreinfo_append_str'
> ...
> 
> $ curl -LSso .config https://github.com/archlinuxarm/PKGBUILDs/raw/master/core/linux-aarch64/config
> $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- olddefconfig all
> ...
> aarch64-linux-ld: kernel/kexec_file.o: in function `kexec_walk_memblock.constprop.0':
> kexec_file.c:(.text+0x314): undefined reference to `crashk_res'
> aarch64-linux-ld: kernel/kexec_file.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
> kexec_file.c:(.text+0x314): dangerous relocation: unsupported relocation
> aarch64-linux-ld: kexec_file.c:(.text+0x318): undefined reference to `crashk_res'
> aarch64-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
> kexec.c:(.text+0x580): undefined reference to `crashk_res'
> aarch64-linux-ld: drivers/of/kexec.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
> kexec.c:(.text+0x580): dangerous relocation: unsupported relocation
> aarch64-linux-ld: kexec.c:(.text+0x584): undefined reference to `crashk_res'
> aarch64-linux-ld: kexec.c:(.text+0x590): undefined reference to `crashk_res'
> aarch64-linux-ld: kexec.c:(.text+0x5b0): undefined reference to `crashk_low_res'
> aarch64-linux-ld: drivers/of/kexec.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_low_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
> kexec.c:(.text+0x5b0): dangerous relocation: unsupported relocation
> aarch64-linux-ld: kexec.c:(.text+0x5b4): undefined reference to `crashk_low_res'
> aarch64-linux-ld: kexec.c:(.text+0x5c0): undefined reference to `crashk_low_res'
> ...
> 
> $ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.x86_64
> $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- olddefconfig all
> ...
> x86_64-linux-ld: arch/x86/xen/mmu_pv.o: in function `paddr_vmcoreinfo_note':
> mmu_pv.c:(.text+0x3af3): undefined reference to `vmcoreinfo_note'
> ...
> 
> Cheers,
> Nathan
> 

