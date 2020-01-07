Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 186ED132A0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 16:30:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sbsj5vP2zDqKS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 02:30:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=bertrand.dekoninck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ad52iUpB"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sbqR0QVRzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 02:28:00 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id j42so54368847wrj.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BaRBpcXoie2Hisr+U7joePnNZv6IJhH3QHYya5BCir8=;
 b=ad52iUpB5Q7dccOUXbzuUYZZoc+dX4YIFkpwQf2I8EQ7p4uUPZyHxkRzDGLxIGh15I
 Nj26iw/Xz8Y7NrWwBwD0FL8QCJDnFDy3h6Zx9lZ1lDCXVfhSVoVt7plQW7dc8YkOX/eP
 laZALJVHib2BF2BSq9I6H3/5OUuBuPyDcJgqqIKvdyLhpGmQuxx6ZVgcbttqC0ELFX6c
 IqXs3cYPyQ+GkFdMlkMN7KA7fKjbCe0kw0l/FeuK7JSHY05zVOf9A4cZE7fzk8LUFY3V
 0h8r/fbdnhAVHFBSUvgPz6unEFBKthYLA38SLNDfWfdOD9cvEdEYqhc8ehSD4wd0rSIq
 qkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BaRBpcXoie2Hisr+U7joePnNZv6IJhH3QHYya5BCir8=;
 b=Iv9sBAzjBto1qcWDoJOtB2DS9+jmu6JNlE6mfWT1Hcr7d5paUBqhouZNvjTF9tU+Rg
 m/xpWhuFuskqXn6ddWtVE7gXW8JwfjcWAtqs6dVGDF9ltzt0sBX+SrD742EqMEOg9/MY
 UXXbmodpgF1AuPjUpyQm6IkKXREpuaLxCtNIyYBosnnAxf838INT6upsxblrucok5Iy9
 TTkt8HYRX9WaZLEATr41GDG55tT9b/X65u0lCKU1XC3bAH/uH3Cf5dX8fccipPsFGYCQ
 zqziiGJjIuQUUtgz+UpepTlRoHbalB4TOXB4nF+SdY8NUOnXV8RU61KNVYchKEI61l0w
 2wNw==
X-Gm-Message-State: APjAAAVyQ6VOWXSjSVdWmb9N8RQQ8uJ9KfsRgVSXOlVp22NrXCMopduC
 N8iPFTk4DDfXy0dI16WKF18=
X-Google-Smtp-Source: APXvYqw+C17vNDvk6f4TzMRKICGZ4h/03csFRqZqaSZfVDEJclhtZcqVYEinnUzEzKr2aPWhc/2Z7w==
X-Received: by 2002:adf:dd51:: with SMTP id
 u17mr105671626wrm.290.1578410874779; 
 Tue, 07 Jan 2020 07:27:54 -0800 (PST)
Received: from ?IPv6:2a01:e35:2428:560:44f3:4b8f:b355:41c0?
 ([2a01:e35:2428:560:44f3:4b8f:b355:41c0])
 by smtp.gmail.com with ESMTPSA id w22sm26073006wmk.34.2020.01.07.07.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 07:27:54 -0800 (PST)
Subject: Re: PPC64: G5 & 4k/64k page size
To: Romain Dolbeau <romain@dolbeau.org>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
 <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <20191214103213.309bfbbb1f9c50fe47e733d9@zonnet.nl>
 <B661D5F4-575C-4E64-BC68-537223FFB5B6@gmail.com>
 <CADuzgbpiN-=VgmZCHOyXFDEuj2L+aVzJGfibkvgfnPD_atNZMw@mail.gmail.com>
From: Bertrand <bertrand.dekoninck@gmail.com>
Message-ID: <709f10b0-6b7f-8de2-3fac-1f4f6350afaf@gmail.com>
Date: Tue, 7 Jan 2020 16:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CADuzgbpiN-=VgmZCHOyXFDEuj2L+aVzJGfibkvgfnPD_atNZMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jeroen Diederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 06/01/2020 19:30, Romain Dolbeau wrote:
> Le dim. 5 janv. 2020 à 16:06, Bertrand Dekoninck
> <bertrand.dekoninck@gmail.com> a écrit :
>> I can now test on powermac 7,3 (with an ATI card)
>> How can I build a deb package of this kernel ? Or is there a package to download somewhere ?

I've tested the 5.5-rc package with the link you gave hereafter. When 
you said "working kernel", did you mean it would not crash ? It doesn't 
for me. I can boot successfully.


The only weirdness I could notice is that my swap space wasn't mounted. 
When I tried  to run swapon, I was given the following (roughly 
translated from french) :

swapon: /dev/sdb5 : pagesize doesn't fit with space space format

               unable to find swap-space signature

So I ran mkswap on the partition, I could then run swapon successfully.

But, when I boot the old kernel ( 5.3), I've got the same error again on 
swap and I have to format the swap space to mount it manually.

There's something wrong on swap page size between those two kernels.

> I usually cross-compile on x86-64 from upstream sources. On a Debian
> Buster with the powerpc tools installed,
> it's just:
>
> #####
> make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- oldconfig && nice
> -19 make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- -j56
> bindeb-pkg
> ####
>
> (alter the -j56 for your own build system). For the dependency, as far
> as I remember I only needed "gcc-powerpc64-linux-gnu" and
> dependencies. My '.config' is Debian's 5.3 plus default values for
> changes - with the exception of 4 KiB pages.I should use the same and the same config file also.
I'll try this later. Should I download the 5.5-rc1 kernel source or 
something else ?
>
> I've also uploaded the working kernel with 4 KiB pages DEB here:
> <http://dl.free.fr/otB1KMEMR>, as it might be easier for a quick test.
>
> Cordially,
>
Cheers,

Bertrand


