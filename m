Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902C71023E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 03:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRVXx1kQYz3fDH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 11:17:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R/m+hqrl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=doru.iorgulescu1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R/m+hqrl;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRBRS3rqjz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 23:12:03 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3b337e842so882374e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684933914; x=1687525914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xPDZOoMRtA9vLoer76WBtYg4ydGY9G19anBSPJJ4rc=;
        b=R/m+hqrlNVCjAETKy5V86lyw5jCVBLs62CPgCNXjZw2yox0+U+ZJ0BHHoZnpYA0O51
         vZ9IE8HKPKL8vKAvqnkGWmQZ+oTCyS8pIztErbW23wWRGHuFx85QSCHextzlBbITnNua
         DvTqqBultxsMHmO7plBMTB/+EFmP8XG4ijLW+iv+wROTx053aZ81nZ1lUESs6iPLQYLP
         MGIDCHpRuC4YCymWKU3CLelfY38zXsaJJR4BFH6fVYLiUuEUqieklYJnHWZDcPUkiLvs
         9xxT5GlYaa/ti8WtRmHbWhUydW2x5LoRgxqYanOQeYmJiecqaFl0PgIjbyGxURLjWTi3
         En1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933914; x=1687525914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xPDZOoMRtA9vLoer76WBtYg4ydGY9G19anBSPJJ4rc=;
        b=JbbL/mswKIFOHfszm53x8scl5LEpyd5HkOd81gCuaYvxE9csqCSNpUXEL4/7WkGZjm
         FMdYT6l16oNNyHfcSwxRBpIKLhDslRzRRWl53qAzmeo/AQhmgyMYxkkyBJ5uTbVi//8k
         4l83eUeF1iIt53ElTESPRKj0+/wSnYdUvAhbbRd62jXKCKrgsAhXnoxio+r2qA3/Eu9X
         JKiMzpG4TfsiXAqXxxv7ovVPyl4Wlx2JOoLHolI3812N1RR+naCck/O7wC5m8VqnP7Ce
         M1HjEnLDooAWmgabECsedtyFfwGwr/ptIdjZ/M5Q3TYK4CoRHSuLC84407VzpjLofjgU
         3Izg==
X-Gm-Message-State: AC+VfDzT1SJC6k1o0dy5+RWmQc0d+yt0xHNugP+aPnvnllgyULoEN8M0
	rqYWNlsE3ePyZxRwf/u1GV0f/CCeXga5LtKdea0=
X-Google-Smtp-Source: ACHHUZ6s9uP+2goOdHsMmJlSY9Tpeioqz8dzhix648D9+BrQz8YQppTcjlO2PMCtWnjj7Asu+etx922sG4lSQFKGXPQ=
X-Received: by 2002:ac2:5dfc:0:b0:4ef:f583:ee16 with SMTP id
 z28-20020ac25dfc000000b004eff583ee16mr5598512lfq.57.1684933914012; Wed, 24
 May 2023 06:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com> <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
In-Reply-To: <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
From: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
Date: Wed, 24 May 2023 16:11:41 +0300
Message-ID: <CA+39qUjOA53UO4oYOzrUJqdYq8A3hbnnxpSV8nfqh0T5KiNL9A@mail.gmail.com>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006a320805fc703f6b"
X-Mailman-Approved-At: Thu, 25 May 2023 11:17:11 +1000
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Linux Regressions <regressions@lists.linux.dev>, Fabiano Rosas <farosas@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000006a320805fc703f6b
Content-Type: text/plain; charset="UTF-8"

Glad to hear it!
Thank you

On Wed, May 24, 2023, 3:58 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 5/24/23 17:58, Bagas Sanjaya wrote:
> > Anyway, I'm adding it to regzbot:
> >
> > #regzbot introduced: 23baf831a32c04f
> https://bugzilla.kernel.org/show_bug.cgi?id=217477
> > #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by
> MAX_ORDER redefinition
> >
>
> From bugzilla [1], the reporter had successfully tried the proposed
> kernel config fix, so:
>
> #regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the
> regression
>
> Thanks for all who participates in this regression report!
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217477#c8
>
> --
> An old man doll... just what I always wanted! - Clara
>
>

--0000000000006a320805fc703f6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Glad to hear it!=C2=A0<div dir=3D"auto">Thank you</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, May 24, 2023, 3:58 PM Bagas Sanjaya &lt;<a href=3D"mailto:bagasdotme@=
gmail.com">bagasdotme@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 5/24/23 17:58, Bagas Sanjaya wrote:<br>
&gt; Anyway, I&#39;m adding it to regzbot:<br>
&gt; <br>
&gt; #regzbot introduced: 23baf831a32c04f <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D217477" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bugzilla.kernel.org/show_bug.cgi?id=3D217477</a><br>
&gt; #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX=
_ORDER redefinition<br>
&gt; <br>
<br>
From bugzilla [1], the reporter had successfully tried the proposed<br>
kernel config fix, so:<br>
<br>
#regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the re=
gression<br>
<br>
Thanks for all who participates in this regression report!<br>
<br>
[1]: <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D217477#c8" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.kernel.org/s=
how_bug.cgi?id=3D217477#c8</a><br>
<br>
-- <br>
An old man doll... just what I always wanted! - Clara<br>
<br>
</blockquote></div>

--0000000000006a320805fc703f6b--
