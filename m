Return-Path: <linuxppc-dev+bounces-6953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB74A5EF7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 10:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD2CP1jlVz30Vm;
	Thu, 13 Mar 2025 20:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741857905;
	cv=none; b=bI9ABJQIQUyFulSMMVBPo2GnS92x6jMhy9xD+9iqQ3OK9iD8z1LvwmxnjLoVtmKb89OkuFd4shS4hLqfXrylJ/on6fjyViP4S1OKa/oeTQ3G3BB/2L7aCLtYIZrkBArBaF35C1Jv48S5S+gvrr2dlwtujjjlFiMcsCStPOnvzHLKAnnK83Wlw9sA3i1h3ddyvwOqG0tZQ9/QDU2dtiOuBKi0ykKkt6NZmyXgb5U1+Q34HPhpFp2tj0N5Mk2gB3xaSpsrrG8fL/USYxWRI5K4CeqBmjSD/lczbi65O7GEvGV2916T7fM+dQCbfLFN4mplvlKKcO8HjWJcpmYAduEhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741857905; c=relaxed/relaxed;
	bh=Pilag2znkjIk4UPDdmSrDSzG1dL350jsjUFlH6gACu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCzQuVC2faW//CWwtwPgtWR3SGwvFPm2TBnP04c38bd5hbrt2eZjbI9F2MFqOKMVs6KWfz59r4SjIHHVpiSt3vl8zHMtQuqYQTAVztyYEujokQaJrX7+rWl0OEqfQ7k6zfFMCUxLklr1xNFxcQ2EhKLz7580w5PP9iddSaA2jyRcJnldp88Kpdp7vEAvOXgbDLA8Dd0EOcnToQyY8NF71qY7IBr+8am5gxwsqbplXV/bKyynJVCb0zfYCCwiOKjELyJ+D2/snLTp8iraH+34WobB0mrEtaoaA++nxc5/oWXrJ/0755Kf5lWnUTD7dSgn/RrW6McKxwEHZ44/i2CIbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.54; helo=mail-ua1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.54; helo=mail-ua1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD2CM3RD7z2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 20:25:02 +1100 (AEDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d36e41070so323039241.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 02:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857897; x=1742462697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pilag2znkjIk4UPDdmSrDSzG1dL350jsjUFlH6gACu8=;
        b=sS27yIg0vVN1u/crbP3x+jfuACpGSzPA8ZbxqfiJJlXbUaMbkPWVHwS857NjOanlYf
         S218c6SDfU3IQlCgONwPFHkGKvOocumgRgQYNrFprVtlh563dKoNLEwT4s3Bxz4Qr/Uy
         fXYsW+TF6Q5iPkrvqC167SoOCqJ7tfPzsg7mpCam4gPmbwtFhg5gwdBU+oFIObUc1a0Q
         Xbz3UGLDz2A9Y4PmETsc9EoZb4Xsk/LzD2RUY80BmVoNdZ6dNCLk5aYWEYrkcoFjSb+s
         VSoP6PyWMMg+HNkaOv8D9QOMvXeFNLbBrB/5OcM+bHnJXeybwqgRKbLgqYkFY4J5DWoV
         KFWw==
X-Forwarded-Encrypted: i=1; AJvYcCVHjU52wORMQB4ijjpuyreXX2d0i07EmFTbc8moIuqVPOAnll+8HtCUwW3Jk/z5fKgL3zhkgHLrQ8uLFuY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwX2s96I3HdTm0Ac0Z5h82l0PgPqpgeU6NwPlSWLyUiOMYqXWuq
	GRZNcY/lTvn+Qvgts4Q69KkoJlukMPnx4rvA59ENonVJvA4UukWwpR8KPi0lxKM=
X-Gm-Gg: ASbGncvkD2GU0f2egJb176gWgAlXKLeN93IhDlGVFTuoWv/llpQF80cbv4/dx6STvF7
	sRkayUD2Xp/I+Jm0+DZTn0Gfj+Xn7oSScTuCvqfGavugvm9qwns5IlxgMRtaX+OFnN7Jbek5Z7e
	U+kCGXvtFbqWea4lAx8tWuMd2BY8pvVuO1BWELhGUiUcnoZOKSiNIwRD/EYHIqIPR0CpnWoAMFF
	kZubpl2TTH+6qotork0dEBtIMRZcol4UQY4S9XMFnfERh/w7MBxRHe6/WWenu9GEAjhVJuMcaF9
	To6J4VFiDbS01prP/kVRqs1OpUK9XlB4GgbqslDuXcVeYRSUQS2CzfKW8JFZ30GDs84NHUJt5oK
	Z4pN4zcc=
X-Google-Smtp-Source: AGHT+IHsHNslmmhxmFgCixSXnDx2ImiMA1skiGkL8VbLfC7V+gYmnl7QySyuixxQhQ/bvbIkSnO/Tw==
X-Received: by 2002:a05:6102:578f:b0:4c1:90ee:ab2 with SMTP id ada2fe7eead31-4c30a5ecc5cmr19141120137.14.1741857897526;
        Thu, 13 Mar 2025 02:24:57 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e748fbsm130418241.22.2025.03.13.02.24.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:24:56 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d6976f768so324378241.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 02:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzJ5KUXGxs7j2vLADbWXIkSualU6F5L2JVxmeLW6s3BypF2ug1AMKAz0hSlzz6ey/9Ivum55SOb4Wm/sI=@lists.ozlabs.org
X-Received: by 2002:a05:6102:50a0:b0:4bb:c9bd:8dc5 with SMTP id
 ada2fe7eead31-4c30a52a041mr20328667137.3.1741857895543; Thu, 13 Mar 2025
 02:24:55 -0700 (PDT)
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
References: <20250313080219.306311-1-make24@iscas.ac.cn>
In-Reply-To: <20250313080219.306311-1-make24@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 10:24:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC90pwMqbVzgjXiCdQhHPNCn7H63qpLR_gnkd_KnmX6w@mail.gmail.com>
X-Gm-Features: AQ5f1JqQ_oaKDsBDau4ePq88smh-AvPy8WWYdFpV0xoJTZrekkZ3xtkqYb-jFaQ
Message-ID: <CAMuHMdWC90pwMqbVzgjXiCdQhHPNCn7H63qpLR_gnkd_KnmX6w@mail.gmail.com>
Subject: Re: [PATCH] [POWERPC] ps3: fix error handling in ps3_system_bus_device_register()
To: Ma Ke <make24@iscas.ac.cn>
Cc: geoff@infradead.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	arnd.bergmann@de.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ma,

On Thu, 13 Mar 2025 at 09:03, Ma Ke <make24@iscas.ac.cn> wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
>
> As comment of device_register() says, 'NOTE: _Never_ directly free
> @dev after calling this function, even if it returned an error! Always
> use put_device() to give up the reference initialized in this function
> instead.'
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: a3d4d6435b56 ("[POWERPC] ps3: add ps3 platform system bus support")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Thanks for your patch!

> --- a/arch/powerpc/platforms/ps3/system-bus.c
> +++ b/arch/powerpc/platforms/ps3/system-bus.c
> @@ -769,6 +769,9 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
>         pr_debug("%s:%d add %s\n", __func__, __LINE__, dev_name(&dev->core));
>
>         result = device_register(&dev->core);
> +       if (result)
> +               put_device(&dev->core);

Good catch!

> +
>         return result;
>  }

However, there is an issue with that:
ps3_system_bus_device_register() sets

    dev->core.release = ps3_system_bus_release_device;

and:

    static void ps3_system_bus_release_device(struct device *_dev)
    {
            struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
            kfree(dev);
    }

As the ps3_system_bus_device is typically embedded in another struct,
which is allocated/freed separately, releasing the device will cause
a double free?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

