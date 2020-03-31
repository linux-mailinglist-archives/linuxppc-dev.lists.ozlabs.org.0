Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C83199E3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:41:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sJ826G6bzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 05:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sJ4z5xzPzDqrs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 05:38:58 +1100 (AEDT)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M2fQ9-1jLoMF2ktL-004Cj3 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar
 2020 20:38:52 +0200
Received: by mail-qv1-f41.google.com with SMTP id q73so11427297qvq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 11:38:52 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1TkBJCwetTsTs6GEAisATog9URN7FwkVZlg1Be6y6GPldQitDY
 QL/RVaeSvM4UqdrhFI5+/iG+jFNF+Bk52OQH5T8=
X-Google-Smtp-Source: ADFU+vuTGFGpCxNIh+cobymgdpMJ4evVMQiQmSWM3uw7oyUk1XxgrJtQG+HV5AiOi7nmMntLNw37psCO8HP1MAfYp7o=
X-Received: by 2002:a0c:f647:: with SMTP id s7mr18334119qvm.4.1585679931041;
 Tue, 31 Mar 2020 11:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
 <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
 <833d63fe-3b94-a3be-1abb-a629386aa0dd@c-s.fr>
 <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
 <74e76b4e-5e4f-f3de-96a8-f6a451b3243a@c-s.fr>
In-Reply-To: <74e76b4e-5e4f-f3de-96a8-f6a451b3243a@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 Mar 2020 20:38:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1jM8W72iH0qmMLRBRsv8ANYdL0xro0iWty3FvM6HTd0A@mail.gmail.com>
Message-ID: <CAK8P3a1jM8W72iH0qmMLRBRsv8ANYdL0xro0iWty3FvM6HTd0A@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SIhrRDuS33eKD/Z3qB7PNdOCYEZ8r5Sv3VBGwoM8cor4v9B96SF
 nrjZUB89362dXs/q7dL1oERIz1AqogboXrhaxOmiBW4hhk0/IE8JKb/lNeO+oQ3DLLWDmg5
 /eFdM6nSZy4HqK0DrWmTc5vL+OlX/w9jn85hqJar2EwDiOpctouTwoUZE6AHM/p63A6Q4U1
 w6eswMm5S8mN0kNUYVKfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gs09WVkaaTw=:Dh7MWDqC+B7VfrPNo6G/Rz
 m68mDMcVtBlBgZj0vFXlJxxHg7laeWjpOev05fjmQmfG0XXBBgDEtbIrqRt2u9arboYVEmI/l
 Mu7e2L0pSw/rPa8PJ6hrIOkgVzGNm7M4ygWTZWNZmf11v/I2xca0H520Z7i7g0Tn7R5EuQUHe
 jzhTjf9/TPBaOVeg7H0Odm0LLvjTJvT8M0CA1hkNTbUJWHs/UgkyAkWngR+tLugPecj7VhsRm
 eXi9DnMlspvL71ScRxbt7JMg538fHmetBXgRSVmEHBbyk4GDJsjAPnv589X7UczDcBv83Pakj
 xepvyws0aJQ7qqnG6T4LUriiF9wcr2kTX5hluH2pAL1viuzq2KwWsDkfS3TGJ2O34tAfqJ4PP
 Pw6JGiPrpwY/79wtLnCNPbjj/7108/SlQY38PVXQDa9GVx9tM1l614dXuXKVVr1mcuL0n4jf+
 hJm6dT28lgn1b8rd+Y6AmW/1dwrnjE/BcG3xHbVv3pnRnbsVuUjOJnVu/1jeo+C0aWbzc8+64
 EVuF5fC6BHgWEzWffD2qfvOOgc9H5uSfYP9pD2WGRs9HuGPwp9fQGwdEb0WKjsu/mOWqwQEcO
 WSmElOAjWi7+BXo43zF9OGBgL/NCS6l70pGfKSm/KU9VGS7fkUY5aA4xs4Po1SDDX+6Ew1MQN
 VphX8FFoASpl8Zrhaj6xK8J3GngQA5XfbhbVK1QUhbPiWDnHE5qpm9SjuDB0p0ds5UQlk/qoV
 TqR/lh+krxZYdPDyRAMFNGdZ7WxnBURgoLKA1qV9wZ9EoPOondSGb+0SshFzgOqU1LSCO4ZbS
 VnFFAC8NOJlroUlWlDeEs7gvfzB5ev0GRB+8Iuy2Hss4mAbcyU=
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 6:19 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 31/03/2020 =C3=A0 18:04, Arnd Bergmann a =C3=A9crit :
> > That has the risk of breaking user's defconfig files, but given the
> > small number of users, it may be nicer for consistency. In either
> > case, the two symbols should probably hang around as synonyms,
> > the question is just which one is user visible.
> >
>
> Not sure it is a good idea to keep two synonyms. In the past we made our
> best to remove synonyms (We had CONFIG_8xx and CONFIG_PPC_8xx being
> synonyms, we had CONFIG_6xx and CONFIG_BOOK3S_32 and
> CONFIG_PPC_STD_MMU_32 being synonyms).
> I think it is a lot cleaner when we can avoid synonyms.

Ok, fair enough.

> By the way I already dropped CONFIG_4xx in previous patch (8/11). It was
> not many 4xx changed to 44x. It would be a lot more in the other way
> round I'm afraid.

Right. Maybe stay with 44x for both then (as in your current patches), as i=
t
means changing less in a part of the code that has few users anyway.

      Arnd
