Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0951335DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 23:43:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47snV966LVzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 09:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=bertrand.dekoninck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LElyP1nv"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47scPd31n9zDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 02:54:13 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id q6so54430128wro.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=bzU8O9/ZxucxTMExS10L9SkS6Rz7poU8CPmVnCi+FHE=;
 b=LElyP1nvrQqO1Qt2gBTWzN58AHSoavQzfDKKRO6gqcGt5tIsA7aD8SeDLir/vkDCpk
 gigpcaiTn32S9OCNQ4tCgXQSS3ebkAWDOaRqhN+rGkKSdrRlleXDf/8tP0J+K6cL61k4
 yt0ptTDqcCd2e4vbEIuaI10ZeVDTPFKO+Er3TCVyh1wCpp2ERglhWWKDR4SDgKcsjbYS
 BkUxshhbip3UgeleLtM6WqHayDh4ggV0+CQiV5NE7DMoicvT+HQ0wWZcKhK4/Aj7nvv+
 Aw+lu4A4+nPwohRMoXNSxm6zH6O1drxSrjvNcU7wNcFvY4gvT3QExHenI1C1+N8AanAY
 xhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=bzU8O9/ZxucxTMExS10L9SkS6Rz7poU8CPmVnCi+FHE=;
 b=fEoZKMglsLUi9pW5dLd6T8KRG1FDkSiF80aVamaO65KXjtRd1ORFvjLKQOkkVuAMkw
 mJjPZ6MoQ3qrmtv2aKBbxhEYaxUtHumXKJBSR4L2IJa/fsznpnky/gMvXoRwSgpgfZYu
 +jLhPDFbMdPeyo4XVM7ptxIUt56BkDLk6HWcKVOKJAWvk5K6+Jy1BjbaLPYsWR3YoDCr
 qrqRKIgZxs6RSHE0l91/4skazJq8440YiRRJi817G9YI5iidL3kqFn3xZrHKr3D2YVjQ
 Jw6YKQVTyTyt6RsuA4sYZgvJMHh9N6E81/ZBZZcY//ABLreQ/CkwFT54Q5gpoEgNLKaV
 h/DA==
X-Gm-Message-State: APjAAAWPU5H9ZCn44uYGsRN/BWUgE30S1BESPnSVJPf9oD/157V0uqEG
 qNan4jfH5xKjBz6wJgQRfkPfLQ3Xck5d2iCs
X-Google-Smtp-Source: APXvYqxxAYWJNLUFlz5yP/dbGaxuL0X7f9ycx3A6ld4YDsohvl8ii7P2TU8+dZJkzNOZcWDl3yr/nw==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr106116012wra.36.1578412449458; 
 Tue, 07 Jan 2020 07:54:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2428:560:44f3:4b8f:b355:41c0?
 ([2a01:e35:2428:560:44f3:4b8f:b355:41c0])
 by smtp.gmail.com with ESMTPSA id y20sm37813wmi.25.2020.01.07.07.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 07:54:08 -0800 (PST)
Subject: Re: PPC64: G5 & 4k/64k page size
From: Bertrand <bertrand.dekoninck@gmail.com>
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
 <709f10b0-6b7f-8de2-3fac-1f4f6350afaf@gmail.com>
Message-ID: <e87bc830-176c-1bf0-fe1f-229dac343eb1@gmail.com>
Date: Tue, 7 Jan 2020 16:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <709f10b0-6b7f-8de2-3fac-1f4f6350afaf@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DD31F5C50A51D027045D9BF2"
Content-Language: en-US
X-Mailman-Approved-At: Wed, 08 Jan 2020 09:42:17 +1100
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

This is a multi-part message in MIME format.
--------------DD31F5C50A51D027045D9BF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Oups. Edit :

swapon: /dev/sdb5 : pagesize doesn't fit with _swap_ space format

On 07/01/2020 16:27, Bertrand wrote:
>
>
> swapon: /dev/sdb5 : pagesize doesn't fit with space space format
>
>

--------------DD31F5C50A51D027045D9BF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Oups. Edit : <br>
    </p>
    <p>swapon: /dev/sdb5 : pagesize doesn't fit with <u>swap</u> space
      format</p>
    <div class="moz-cite-prefix">On 07/01/2020 16:27, Bertrand wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:709f10b0-6b7f-8de2-3fac-1f4f6350afaf@gmail.com">
      <br>
      <br>
      swapon: /dev/sdb5 : pagesize doesn't fit with space space format
      <br>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------DD31F5C50A51D027045D9BF2--
