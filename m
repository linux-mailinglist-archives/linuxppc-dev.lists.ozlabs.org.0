Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF17EAF83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 12:51:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rCL7ggrb;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=wuUZV4Zb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV4Ps3Yymz2yhT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 22:51:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rCL7ggrb;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=wuUZV4Zb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV1d41dKYz2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 20:45:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699955121; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oUZHu9iE3MTMP74eroBFI32PCxX0MwUphyyK34IjmM1i+Fd1z5sHQqT5zFFnktJKc1
    6mPeTLdFV0Gl4KPhTUf3gfTFBNoGCYYJWyz+u2Z0adtT+1K0R07nrE6JDhWr91sJHbPd
    s3v2Xrx45VqKuym4Mtk14tQ7z9KLJAjtgCmDhLfjr7S741mLG+nAs8Ao7hx+wkzAvjEB
    pTenU/GZxub8cTWu0qjF1yS72z9Mn41L86gyqgnxUEqZVfjM4+JXCkwfhzD2+PyUKwWA
    KM8dAG46s5uVvMdJFLfKNMpNiOFm6jKxJmuSVziaQm1+GfnDvn/EeLmvHkZA18y5+KTT
    wYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1699955121;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=b7HB0jBajeaA5BfhxFNAl9BTTJLtYJJvNImSGj9VvcQ=;
    b=lnRAjKVMKMaIEq8gcPjgD7r8qT29FmJpKekqF6y4lYZ959Mg0oK0nGgJhlz4CDTj+4
    WMuEdDU0K9SQsA+d6QTZ1bCguguIdpH7b2QJEyGwR5/pVFMYXc0PC10SjyuqlJ5iyKUD
    JCfHcSALr2XacLoEHLLlyTwsskCPV3IcjtZM+OPzFM2lo5MAOZ3rFL/oEE4QAHU4w8fJ
    zYqqQ+fFxuobBxZ4Vps2f4xZ68AO6XUwUQ+Hs/aigAnMwyv+9uoLzlk9PlyYRvtlvjyp
    ohtM4a5r/CszyJ9iQoFNks/XbdqS6iHe/X/QJCfWMi3BEfYFbfBuak6TrJX9SxIVyJre
    jciw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1699955121;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=b7HB0jBajeaA5BfhxFNAl9BTTJLtYJJvNImSGj9VvcQ=;
    b=rCL7ggrbNUM3YD1PdroxjFNvNuM4AjIgvGa4Eo/sr7JkgN8A3A/PLF+u607L51d3ep
    ybXqNXBo/gK6Qys4VGstc7Ww0JaVesn5rOKT3ipSn43vwkjT1rTNfDyfANvdIf3Qrm3y
    hfTnrQCb3DSHJg+yTC5zuHjpq31wRtYqY5lS4d0jncc5j35er3Mjf6IaYEePEpzaaZIq
    V8NqY5HV2ZFdyMWId74z92q7VCGa4LHA++Hz8CqwkzkgbQnss2yB5wefX3DoZIUVvrru
    d7NaK3JnS8u6759FgBNzRHwHgFucl3G5stiXARrCFpT5eyND2/c5ZK7S71Jpfb/vyeKl
    4qqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1699955121;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=b7HB0jBajeaA5BfhxFNAl9BTTJLtYJJvNImSGj9VvcQ=;
    b=wuUZV4Zbz2EOkUfefaWF+iEkrZr5uaA0JM6TbzqyOF14Je5bc598CI/4yOOd3LgjmO
    g/Zu2QcW5JNPav2HMlCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY0nyspvHBW+bMFpsqR8Nd7C0p+pAA=="
Received: from [IPV6:2a02:8109:8984:5d00:dc13:526a:ee52:d26e]
    by smtp.strato.de (RZmta 49.9.1 AUTH)
    with ESMTPSA id Y0b8e9zAE9jK4NO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 14 Nov 2023 10:45:20 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------hEBARUboc0LJupBCdRXDbinK"
Message-ID: <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
Date: Tue, 14 Nov 2023 10:45:19 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 Nov 2023 22:50:28 +1100
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, airlied@gmail.com, deller@gmx.de, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------hEBARUboc0LJupBCdRXDbinK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> Thanks for your report!
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
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
Geert,

Your patch works! :-) Thanks a lot!

I tested it with the virtio-vga and with the virtio-gpu-pci device in a 
virtual ppce500 QEMU/KVM HV machine with an e5500 CPU today.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Cheers,
Christian
--------------hEBARUboc0LJupBCdRXDbinK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13 November 2023 at 01:48 pm, Geert
      Uytterhoeven wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com"><span
      style="white-space: pre-wrap">Thanks for your report!</span>
      <pre class="moz-quote-pre" wrap="">
I can confirm there is no graphics output with m68k/virt, and
bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...

It turns out the old call to drm_mode_addfb() caused a translation
from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
quirk processing in drm_driver_legacy_fb_format().
I.e. on m68k/virt, the original requested format was XR24, which was
translated to BX24. The former doesn't work, the latter works.

The following (gmail-whitespace-damaged) patch fixed the issue for me:

--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
drm_client_buffer *buffer,

        fb_req.width = width;
        fb_req.height = height;
+       if (client-&gt;dev-&gt;mode_config.quirk_addfb_prefer_host_byte_order) {
+               if (format == DRM_FORMAT_XRGB8888)
+                       format = DRM_FORMAT_HOST_XRGB8888;
+               if (format == DRM_FORMAT_ARGB8888)
+                       format = DRM_FORMAT_HOST_ARGB8888;
+               if (format == DRM_FORMAT_RGB565)
+                       format = DRM_FORMAT_HOST_RGB565;
+               if (format == DRM_FORMAT_XRGB1555)
+                       format = DRM_FORMAT_HOST_XRGB1555;
+       }
        fb_req.pixel_format = format;
        fb_req.handles[0] = handle;
        fb_req.pitches[0] = buffer-&gt;pitch;

However, I don't think we want to sprinkle more of these
translations around... So perhaps we should (re)add a call to
drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?

Second, as I doubt you are using a big-endian system, you are probably
running into a slightly different issue.

Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
big-endian machine?

If not, please add

    pr_info("%s: format = %p4cc\n", __func__, &amp;format);

to drivers/gpu/drm/drm_client.c:drm_client_buffer_addfb(), and,
after reverting commit 6ae2ff23aa43a0c4, add

    pr_info("%s: bpp %u/depth %u =&gt; r.pixel_format = %p4cc\n",
__func__, or-&gt;bpp, or-&gt;depth, &amp;r.pixel_format);

to drivers/gpu/drm/drm_framebuffer.c:drm_mode_addfb(), so we know the
translation in your case?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- <a class="moz-txt-link-abbreviated" href="mailto:geert@linux-m68k.org">geert@linux-m68k.org</a>

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
</pre>
    </blockquote>
    Geert,<br>
    <br>
    Your patch works! :-) Thanks a lot!<br>
    <br>
    I tested it with the virtio-vga and with the virtio-gpu-pci device
    in a virtual ppce500 QEMU/KVM HV machine with an e5500 CPU today.<br>
    <br>
    Tested-by: Christian Zigotzky <a class="moz-txt-link-rfc2396E" href="mailto:chzigotzky@xenosoft.de">&lt;chzigotzky@xenosoft.de&gt;</a><br>
    <br>
    Cheers,<br>
    Christian<br>
  </body>
</html>

--------------hEBARUboc0LJupBCdRXDbinK--
