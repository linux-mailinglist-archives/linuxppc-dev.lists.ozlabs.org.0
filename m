Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8295FC42A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 13:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnVNZ0HGKz3cfR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 22:12:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3/M+TrI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3/M+TrI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3/M+TrI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3/M+TrI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnVMX3bVBz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665573075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8YiAlVcyacuAF1cXPKHrDiH+rQYQoNsO4NEHWDYYi14=;
	b=Q3/M+TrIeRpFKLA1bOdRlHyfHw/8+/6/gz3Q8d+WT6Kcs8bZt7Hp+og7mOeAEsmf04Rn5e
	nN0ckTyQFNkf6zrlU8x0prXmBY6jNrYrDUQbOQnQRwds7BlUFhc+0uF0K63SjTC/mrAy6/
	Syh0ZUe3P3L/BAhBHQ6sRaUMD8MP83s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665573075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8YiAlVcyacuAF1cXPKHrDiH+rQYQoNsO4NEHWDYYi14=;
	b=Q3/M+TrIeRpFKLA1bOdRlHyfHw/8+/6/gz3Q8d+WT6Kcs8bZt7Hp+og7mOeAEsmf04Rn5e
	nN0ckTyQFNkf6zrlU8x0prXmBY6jNrYrDUQbOQnQRwds7BlUFhc+0uF0K63SjTC/mrAy6/
	Syh0ZUe3P3L/BAhBHQ6sRaUMD8MP83s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-4n04EqmcNpOS1oOGBt1z5g-1; Wed, 12 Oct 2022 07:11:13 -0400
X-MC-Unique: 4n04EqmcNpOS1oOGBt1z5g-1
Received: by mail-wm1-f69.google.com with SMTP id g8-20020a05600c4ec800b003b4bcbdb63cso9830776wmq.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 04:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YiAlVcyacuAF1cXPKHrDiH+rQYQoNsO4NEHWDYYi14=;
        b=ySBZd3FaN9AYfLZ3l84D/Dbp41hemjbxXGCEhH/yEscE5ZkF30mbLxl5bOtmoreB53
         wX5eR+62ElymYjKDvpqBgf90pbqImBzy/iEVItT5t0d+E8sgogUnEi99RTgoxG3k9cRt
         cxc6IxReI3lj331nbp11newEz4+gL94uRIoLe+CAxSVOfUYvMgNqk0qAuh6ZD5Y9sGof
         uGV5EKX8EFEpOe7/7Bb6cy/cWe3ehCy7FdmRFT/c/CNke9pl6vd+w8ZVqk47S27JRpxw
         1e6kqtnWZBo6KNjWHSx18RafqzwNBVTOEh+DWJY9qxLC/m6DcuLFfpqoexTTPMovquKc
         iWxA==
X-Gm-Message-State: ACrzQf15yEk65DmyuS35wLcIOef3UQ3iJ7IowYJf4uIjDVgt1pOgNglR
	LaUbmm26nkSdpVusp0X1ncKmueL6/F0uvhuxVGQeZYJxhJW5LygbmXLu/zVy+ww95Ek7J3wxxUR
	hwMaOJ6Nd+vcFKjs6TIv46RF/Ag==
X-Received: by 2002:a5d:4581:0:b0:228:a8e5:253c with SMTP id p1-20020a5d4581000000b00228a8e5253cmr16709127wrq.506.1665573072676;
        Wed, 12 Oct 2022 04:11:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4M2UeBQqsLu/YgEb0FS7XO2FtVoGI+qgl10zlKDVC740GbGZGoVVc16JkgQ8fSzCwcytvnSw==
X-Received: by 2002:a5d:4581:0:b0:228:a8e5:253c with SMTP id p1-20020a5d4581000000b00228a8e5253cmr16709111wrq.506.1665573072445;
        Wed, 12 Oct 2022 04:11:12 -0700 (PDT)
Received: from redhat.com ([2.54.162.123])
        by smtp.gmail.com with ESMTPSA id y8-20020a05600c364800b003c6bd91caa5sm1493777wmq.17.2022.10.12.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 04:11:11 -0700 (PDT)
Date: Wed, 12 Oct 2022 07:11:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] virtio: fixes, features
Message-ID: <20221012070532-mutt-send-email-mst@kernel.org>
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
In-Reply-To: <87r0zdmujf.fsf@mpe.ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, alvaro.karsz@solid-run.com, netdev@vger.kernel.org, jasowang@redhat.com, wangdeming@inspur.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, angus.chen@jaguarmicro.com, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 05:21:24PM +1100, Michael Ellerman wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> > The following changes since commit 4fe89d07dcc2804c8b562f6c7896a45643d34b2f:
> >
> >   Linux 6.0 (2022-10-02 14:09:07 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> >
> > for you to fetch changes up to 71491c54eafa318fdd24a1f26a1c82b28e1ac21d:
> >
> >   virtio_pci: don't try to use intxif pin is zero (2022-10-07 20:00:44 -0400)
> >
> > ----------------------------------------------------------------
> > virtio: fixes, features
> >
> > 9k mtu perf improvements
> > vdpa feature provisioning
> > virtio blk SECURE ERASE support
> >
> > Fixes, cleanups all over the place.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> > Alvaro Karsz (1):
> >       virtio_blk: add SECURE ERASE command support
> >
> > Angus Chen (1):
> >       virtio_pci: don't try to use intxif pin is zero
> 
> This commit breaks virtio_pci for me on powerpc, when running as a qemu
> guest.
> 
> vp_find_vqs() bails out because pci_dev->pin == 0.
> 
> But pci_dev->irq is populated correctly, so vp_find_vqs_intx() would
> succeed if we called it - which is what the code used to do.
> 
> I think this happens because pci_dev->pin is not populated in
> pci_assign_irq().
> 
> I would absolutely believe this is bug in our PCI code, but I think it
> may also affect other platforms that use of_irq_parse_and_map_pci().
> 
> cheers

How about fixing this in of_irq_parse_and_map_pci then?
Something like the below maybe?

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 196834ed44fe..504c4d75c83f 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -446,6 +446,8 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
 	if (pin == 0)
 		return -ENODEV;
 
+	pdev->pin = pin;
+
 	/* Local interrupt-map in the device node? Use it! */
 	if (of_get_property(dn, "interrupt-map", NULL)) {
 		pin = pci_swizzle_interrupt_pin(pdev, pin);

