Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A497EBF61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 10:23:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlF0nPZe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlF0nPZe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVd4W1Cx3z3cTH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 20:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlF0nPZe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlF0nPZe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=kraxel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVd3b2G8dz303d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 20:22:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700040134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jB1CvYOkCkHMxZfFOkHOZeMADsl4bD5nT6AyVfy5BX0=;
	b=JlF0nPZedbTLXuMnn4x3nVt54tNvbOD2uvv6ga5WxJrT+6jbT7FAG/nIjfkIWV663rnTLV
	ZWUSrCl2GUOyRRs4weNKdmyKRvEq9I1JuCzJSVOyLrmUTUIIF5LvN1V9IwLTYK8Olrq2Ts
	FecKbheFjTMG179gPB9JZc6pYu20qYU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700040134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jB1CvYOkCkHMxZfFOkHOZeMADsl4bD5nT6AyVfy5BX0=;
	b=JlF0nPZedbTLXuMnn4x3nVt54tNvbOD2uvv6ga5WxJrT+6jbT7FAG/nIjfkIWV663rnTLV
	ZWUSrCl2GUOyRRs4weNKdmyKRvEq9I1JuCzJSVOyLrmUTUIIF5LvN1V9IwLTYK8Olrq2Ts
	FecKbheFjTMG179gPB9JZc6pYu20qYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-t453yyLMMAmonuabQryWOQ-1; Wed, 15 Nov 2023 04:22:08 -0500
X-MC-Unique: t453yyLMMAmonuabQryWOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43711185A782;
	Wed, 15 Nov 2023 09:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD5B2026D66;
	Wed, 15 Nov 2023 09:22:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BBF81180AC06; Wed, 15 Nov 2023 10:22:04 +0100 (CET)
Date: Wed, 15 Nov 2023 10:22:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
Message-ID: <uxr4sf6kirv32tfbd6qjzxqd53zpoknjfa4ucr4zs5ktkks2re@spgj4j64raaa>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
 <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
 <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
 <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
 <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>, virtualization@lists.linux.dev, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <chzigotzky@xenosoft.de>, airlied@gmail.com, deller@gmx.de, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 15, 2023 at 09:33:28AM +0100, Geert Uytterhoeven wrote:
> Hi Christian,
> 
> CC virtgpu
> 
> On Tue, Nov 14, 2023 at 10:45 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
> > On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> > > I can confirm there is no graphics output with m68k/virt, and
> 
> Before the error message you reported:
> 
>     virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup
> generic emulation (ret=-2)
> 
> it also prints:
> 
>     virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not supported
>     virtio-mmio virtio-mmio.125: [drm] No compatible format found
> 
> Upon closer look, it turns out virtgpu is special in that its main
> plane supports only a single format: DRM_FORMAT_HOST_XRGB8888, which
> is XR24 on little-endian, and BX24 on big-endian.  I.e. on big-endian,
> virtgpu does not support XR24.

Driver and device support both XR24 and BX24 on both little endian and
big endian just fine.

Problem is both fbdev interfaces and the ADDFB ioctl specify the format
using bpp instead of fourcc, and advertising only one framebuffer format
-- in native byte order -- used to worked best, especially on bigendian
machines.

That was years ago though, IIRC predating the generic fbdev emulation,
so maybe it's time to revisit that.  Changing it should be as simple as
updating the format arrays:

--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -30,11 +30,13 @@
 #include "virtgpu_drv.h"
 
 static const uint32_t virtio_gpu_formats[] = {
-       DRM_FORMAT_HOST_XRGB8888,
+       DRM_FORMAT_XRGB8888,
+       DRM_FORMAT_BGRX8888,
 };
 
 static const uint32_t virtio_gpu_cursor_formats[] = {
-       DRM_FORMAT_HOST_ARGB8888,
+       DRM_FORMAT_ARGB8888,
+       DRM_FORMAT_BGRA8888,
 };
 
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)

HTH,
  Gerd

