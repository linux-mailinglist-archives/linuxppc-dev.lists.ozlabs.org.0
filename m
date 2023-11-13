Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23F7E9CDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 14:16:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=syddjFCI;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=oZ+MRNb/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STVL94Cwrz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 00:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=syddjFCI;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=oZ+MRNb/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STVKD5ct5z3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 00:15:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699881125; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pl6qRniJynuyduCGedWh/QVs0QTDoTEuVD/XmIvGAepBt6jDanKlgkbIoG1LCgoAxM
    WJCxXJALgC9ECo0M8WoefyGGQ0d643asgbkLr3QLspXQX7hmRffov2l/d6mw8/TqgJEN
    KXdoc19Ejm8GaGyh9MjFHsdDgzwpE/SWpoVNAXAr5WmigwbbmFzRwSbosg5L+mkhZ5MA
    eitfcNcW8y3bCF7A2NmiA2kk2I3SJ6VlmRmr4rgIyQEWsXne8D8DhIHkxmAPmjbzAXTE
    0Ib91DZbVZDZCGNseDThiCH5FCFO09WwbAdsc/SQ53blQ5dkUg9sN/56ePycBweHMTm1
    6z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1699881125;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=lb65o+mTnZ3kNMGlV9mMbXogLgBhbRodOia1owMdsmI=;
    b=Y0YRk8OpC7v4mFkkEC69oSYZdEm0W9jAw02+ySX/lqU2lbUcXbgVIMp95bvr+J2PY5
    xTF+M/vBLr5Et1+12MJ4/2nsjgSS44EU/JQARCKrhpwaFDY/hU7tzriZwVs+ubJdvJ/f
    QjD1vYpv0gpmmvo4Kv4psl6P7ZYI5VHYlJ1+XLFj3zdrl39XhzOfYBwxbiha/WS0GIeC
    Hx4yV04lynBzhoxjJmFwmx2EP1jWv9DFCjPbvSzVMmq3gqHKr0bJFu3VcY3j4Y0aLbS0
    yJbGQ4G4KElUZ7KKIK+oyTe1ti7GqMRmyb55A8CHSqGuBLhUWCwazaIfeZ03IqYYmloB
    DB4A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1699881125;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=lb65o+mTnZ3kNMGlV9mMbXogLgBhbRodOia1owMdsmI=;
    b=syddjFCI6OsCNy2SlBzv8BjTTtE5rCyELkS1VdRbEK9rL+IF6qkvz9vxr2GFnpuEcW
    yEj9r5sGA41hz4ZMKnmH7zWvxuU4V0Gi7HN1K2VD/BX7BkFJn82U+ClimSypM4Wkq2zf
    98LfUJoBLWE5RJ2M3UOX5bQz6asaiwxeGnQ8tzXAHZE0K1yJH8ep/2Lj2z/8EFKZI3qe
    eGud41mRjsEuK/1MvVXTLW5S0lLluoLWZnkuReB8SIjThaFbxNxxsnmj5nzGCRgaLl4b
    jvmex5h77qVJPkn/kd+xfFmpJTewdz/o9KDmTesUZglilqcWRh3zDqO7BqYIJt7OvdMW
    OkUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1699881125;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=lb65o+mTnZ3kNMGlV9mMbXogLgBhbRodOia1owMdsmI=;
    b=oZ+MRNb/ffCIwl+E0nszYYQ2fw8gcZ2wLC2iqklbhlXC4wfN8tJZ2va4n5ifVlE3XT
    SUuj+6f0iIbR/x5+E0Dg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1yykKPrNF3HqKoSdKxg8PLRcSAog=="
Received: from [IPV6:2a02:8109:8984:5d00:1cfd:7f23:3d91:7ce8]
    by smtp.strato.de (RZmta 49.9.1 AUTH)
    with ESMTPSA id m61756zADDC4TCu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Nov 2023 14:12:04 +0100 (CET)
Message-ID: <c13fcf82-3bf0-447e-9ac5-b33db0e38f07@xenosoft.de>
Date: Mon, 13 Nov 2023 14:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
 <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
 <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, kraxel@cs.tu-berlin.de, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, airlied@gmail.com, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> Hi Christian,
>
> On Sun, Nov 12, 2023 at 3:23 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> On 07 November 2023 at 09:36 am, Christian Zigotzky wrote:
>>> I have found out that fbdev no longer works with virtio-gpu-pci and
>>> virtio-vga. It is not a problem with the penguin logos.
>>>
>>> Could you please check fbdev in QEMU virtual machines with
>>> virtio-gpu-pci and virtio-vga graphics?
>>> On 02 November 2023 at 03:45 pm, Christian Zigotzky wrote:
>>>> There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The
>>>> penguins are not displayed at boot time)
>>>>
>>>> Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR*
>>>> fbdev: Failed to setup generic emulation (ret=-2)
>>>>
>>>> The kernel 6.6 final doesn't have this issue.
>>>>
>>>> Please check the fbdev changes in the drm updates
>>>> 'drm-next-2023-10-31-1'.
> Thanks for your report!
>
> I can confirm there is no graphics output with m68k/virt, and
> bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
> drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...
>
> It turns out the old call to drm_mode_addfb() caused a translation
> from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
> quirk processing in drm_driver_legacy_fb_format().
> I.e. on m68k/virt, the original requested format was XR24, which was
> translated to BX24. The former doesn't work, the latter works.
>
> The following (gmail-whitespace-damaged) patch fixed the issue for me:
>
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
> drm_client_buffer *buffer,
>
>          fb_req.width = width;
>          fb_req.height = height;
> +       if (client->dev->mode_config.quirk_addfb_prefer_host_byte_order) {
> +               if (format == DRM_FORMAT_XRGB8888)
> +                       format = DRM_FORMAT_HOST_XRGB8888;
> +               if (format == DRM_FORMAT_ARGB8888)
> +                       format = DRM_FORMAT_HOST_ARGB8888;
> +               if (format == DRM_FORMAT_RGB565)
> +                       format = DRM_FORMAT_HOST_RGB565;
> +               if (format == DRM_FORMAT_XRGB1555)
> +                       format = DRM_FORMAT_HOST_XRGB1555;
> +       }
>          fb_req.pixel_format = format;
>          fb_req.handles[0] = handle;
>          fb_req.pitches[0] = buffer->pitch;
>
> However, I don't think we want to sprinkle more of these
> translations around... So perhaps we should (re)add a call to
> drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?
>
> Second, as I doubt you are using a big-endian system, you are probably
> running into a slightly different issue.
>
> Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
> big-endian machine?
>
> If not, please add
>
>      pr_info("%s: format = %p4cc\n", __func__, &format);
>
> to drivers/gpu/drm/drm_client.c:drm_client_buffer_addfb(), and,
> after reverting commit 6ae2ff23aa43a0c4, add
>
>      pr_info("%s: bpp %u/depth %u => r.pixel_format = %p4cc\n",
> __func__, or->bpp, or->depth, &r.pixel_format);
>
> to drivers/gpu/drm/drm_framebuffer.c:drm_mode_addfb(), so we know the
> translation in your case?
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
Hi Geert,

Thanks for your answer! I use a big-endian system.

Cheers,
Christian
