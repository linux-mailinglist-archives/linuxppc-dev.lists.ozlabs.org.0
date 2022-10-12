Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F55FC093
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 08:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnMy66f9gz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 17:22:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hi74EGX3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnMxB1WlXz2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 17:21:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hi74EGX3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MnMx31PJ1z4wgr;
	Wed, 12 Oct 2022 17:21:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665555688;
	bh=YzBdtZALMPvevfqLcejSWQcfLQIXVl+Gp0Tn+SPwIqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hi74EGX3EywL/sADHCKfoPX61U5045pExe4Gpp8z3AbtcA/xv5uAJ6K95LyJ2pWlW
	 jkcHE9uN3Nt0MjBgwmLihG8oM7P9FDR3geA8ZOadOMK0o5xep22cTFe8GP7XMQA/NL
	 JyHAfz3zsqV5g4QmKSX0bx2Vm4GeuhuW7ONzdTmyVbXqjeW4Ur8YzNCn0sPagdL5eu
	 5xnEM6372wNMxbuX0kvDTD5dJC0zkyRW1gMVbDOQTjaVEdd+VprV0C0DMBWXeQPgT0
	 SlNvjimItgAL6+wEIx+/ViUGDEpj1ty2GS+dgdkjy3Qt5JJBH8WiTLUdIBbCn8MdX7
	 cRZBm1/NS/Mvw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [GIT PULL] virtio: fixes, features
In-Reply-To: <20221010132030-mutt-send-email-mst@kernel.org>
References: <20221010132030-mutt-send-email-mst@kernel.org>
Date: Wed, 12 Oct 2022 17:21:24 +1100
Message-ID: <87r0zdmujf.fsf@mpe.ellerman.id.au>
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, mst@redhat.com, alvaro.karsz@solid-run.com, netdev@vger.kernel.org, jasowang@redhat.com, wangdeming@inspur.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, angus.chen@jaguarmicro.com, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:
> The following changes since commit 4fe89d07dcc2804c8b562f6c7896a45643d34b2f:
>
>   Linux 6.0 (2022-10-02 14:09:07 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
>
> for you to fetch changes up to 71491c54eafa318fdd24a1f26a1c82b28e1ac21d:
>
>   virtio_pci: don't try to use intxif pin is zero (2022-10-07 20:00:44 -0400)
>
> ----------------------------------------------------------------
> virtio: fixes, features
>
> 9k mtu perf improvements
> vdpa feature provisioning
> virtio blk SECURE ERASE support
>
> Fixes, cleanups all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------
> Alvaro Karsz (1):
>       virtio_blk: add SECURE ERASE command support
>
> Angus Chen (1):
>       virtio_pci: don't try to use intxif pin is zero

This commit breaks virtio_pci for me on powerpc, when running as a qemu
guest.

vp_find_vqs() bails out because pci_dev->pin == 0.

But pci_dev->irq is populated correctly, so vp_find_vqs_intx() would
succeed if we called it - which is what the code used to do.

I think this happens because pci_dev->pin is not populated in
pci_assign_irq().

I would absolutely believe this is bug in our PCI code, but I think it
may also affect other platforms that use of_irq_parse_and_map_pci().

cheers
