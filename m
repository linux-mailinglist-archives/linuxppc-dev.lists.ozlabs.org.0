Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98B53CA10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:35:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF2QZ1b5Qz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:35:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Fri, 03 Jun 2022 22:34:38 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF2Q62R9lz3blL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:34:37 +1000 (AEST)
Received: from mail-yw1-f177.google.com ([209.85.128.177]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MS4ab-1oLSne3cOR-00TW3a for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun
 2022 14:29:26 +0200
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2ff90e0937aso80706807b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 05:29:25 -0700 (PDT)
X-Gm-Message-State: AOAM531jo7GGtIg2iwV2QkAc3xM+t9OSlqbd4ZsfL15z9OLEPb/yxYKT
	9ZIs7AEnwj8/PB5bc00OMJan1xW5OVHQdSn/dSg=
X-Google-Smtp-Source: ABdhPJwPRDHayXMhzKVvfOBzB4bKOA9yDoqELtkL+X1dv1bUQP2eZEA4w7q/Ibq+/NpLoDg5jCofQwQ1d19kE6KBYqE=
X-Received: by 2002:a81:b03:0:b0:310:1375:fca9 with SMTP id
 3-20020a810b03000000b003101375fca9mr3711947ywl.135.1654259364450; Fri, 03 Jun
 2022 05:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220603121543.22884-1-linmq006@gmail.com>
In-Reply-To: <20220603121543.22884-1-linmq006@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jun 2022 14:29:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ayYJ4P8UKndaSUBH=5i6CBMeeerpz-GyHESgbteuSyg@mail.gmail.com>
Message-ID: <CAK8P3a1ayYJ4P8UKndaSUBH=5i6CBMeeerpz-GyHESgbteuSyg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xLFuoTUrHXwQAgEg/pjbgMv0aqNv0R9xQPJVWwRdEX0nTQkJcu0
 P/YyFQxC7O5HZY6BGiEUnhpHVYIYL3zS09GL7wG4oiYqHUMvQF7OZ+JGA6IpduU0bhCUeKy
 XUvoEahKKhdsDkUJs1GuYCxNMNmDsRgAgFQVER094wIyK41vc8kGoi+TSTWDugGRBgl70x9
 Uf6CrMJoCvMqL+sRdQD3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P/SMcGI+Qiw=:s7bdaO7LJTwCV07q28ycVp
 ssOS95xpeZrZtT6CWpGweLz6liPzSF3n4yJNwrKhOoX7GdK8/L5uLhAg3dNRr4g3M4ScRaouH
 4QrpoMsB8qDtLXuQHJ9fqsOsb+k0fqd8uzxsOgFyWpG8SbZAEg1KmaEn/8PUU7Z2uZDY+upmb
 YNw+iJnm8prH0bjdZlZPPjnS+xHyrn4utklRoLwz+BxutqTlxXP+FtQ/38ar2fj3moCUg36Fp
 i9qUZxvfLxMnHEewPzBagzA3KKeFJoz73VZE1AMdQQ2iTmOi35eiHYVr7ct5g+vwqADRsrbZY
 A4vOLwsryGZ2GvpbehNeeL63tM7HVgjZEaDcUq8tW2gkxd3jfDDA4ndn7XPerpMUVU8zNJf5i
 ocDKcKlY93vuYrXAbHZg5wPcM2z9kqJjnVag2fVoWFC2idaKaFw5QEAl35qpMdsGzqQSkjxYL
 IHvUmizZ4uHx3uTXPGwxbhoCaD0hkfeDn4YlAUAmR1c8oI9PezyUOnJdaDWvYnCFlvPOlbVJJ
 pjOC6b5s7fXsNCmKPJqDhd/q0PoNQUunrxYEN6LaYM1kjifBUXcNlSWTlOliKeCVwclB1vNbg
 qcwSoYv6LK2P7S6hQt0pR9UifZi7VUQmacRuCwfgN8phvK1Rb95m81KaU0FC2TTMpeAY8NfsG
 uU1xARZr7y+3gSTmLEkOyYOtObiMLKOMGf2ioaUMAzdKPE5Fzr3TbWMWBsBuE6aHPKbELKy10
 LfBffjKgkpCkZL8ccoqbkQWDZtr8hk5LNmuLOw4NYldjWPfyO36wFlR2JXsdSIcyjO856qBa3
 4k0Uz5ZUOIgLvSC0SSNxvbwytXY7+p2b++Veqo1ZkPTHw0VaHQbHk7126vaH7IjaGug67uJBp
 OI1hUxUT/u3/4635umqw==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 3, 2022 at 2:15 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_node_by_path() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 0afacde3df4c ("[POWERPC] spufs: allow isolated mode apps by starting the SPE loader")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>


Acked-by: Arnd Bergmann <arnd@arndb.de>
