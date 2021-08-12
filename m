Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E163EA111
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 10:55:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlgVx5RJWz3cSW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 18:55:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlgVW20L7z2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 18:54:42 +1000 (AEST)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLA6k-1mWBZ61ttS-00IA4T for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug
 2021 10:54:38 +0200
Received: by mail-wr1-f41.google.com with SMTP id f5so7132975wrm.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 01:54:38 -0700 (PDT)
X-Gm-Message-State: AOAM533WhIEqCyenXxuZG4DJv4I0spBOX7TWNlgv2UgYrgVRSG6VLuYZ
 1aIccJlapqAGL8REHlHQ5/wOgWA2jdZ2r5hXxzY=
X-Google-Smtp-Source: ABdhPJzZv/5OPQVMV4X72DNrEeILwE4MD89RT2+33mM5oD+u5NtsqZPGmxrUuRpkUtjSdyCe45aXAKV0gko4m0wLh/Y=
X-Received: by 2002:adf:fd89:: with SMTP id d9mr701787wrr.361.1628758477814;
 Thu, 12 Aug 2021 01:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210806030138.123479-1-xianting.tian@linux.alibaba.com>
 <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
 <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
 <f18d017b-d6f7-cf87-8859-8d6b50c7c289@linux.alibaba.com>
In-Reply-To: <f18d017b-d6f7-cf87-8859-8d6b50c7c289@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 Aug 2021 10:54:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ykLvJkhX+wDAOHdyLHjPFAfhOxi5BNM9kTKv_8F7VQg@mail.gmail.com>
Message-ID: <CAK8P3a2ykLvJkhX+wDAOHdyLHjPFAfhOxi5BNM9kTKv_8F7VQg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Xianting TIan <xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/mferhiGQ9/wsp7ZU3+TE3U52DvgWypbevqmReBgQ86YED8cDey
 dPO8ZUJB/pR54JhrYjbihPsf07vX/qHkF3ugYK6fc8INzRJcC/1DDZ1UK0eu6o5jOSbpPX2
 CpTDM+35KFPyhDPNXXPf5gkI9WfO0g3O+4yA7KCssRVd2s1U0x2ru6PC43IUMRCjhOLlFLk
 VY9gNH9RoWtwQsD5MSu4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JSrFp1MrTug=:3kvC5unjxxEFW30SWVhClY
 AhDE66Qn9xo0OIii2xY6N5GYi4vyLf8KjPeYueSQv+7mJ20pqikgBuyZYGgLinjGGoMtBnVAV
 HBwdziWTNqCDkGKozU3COPiVSqP1KEMgD7gC4mPfnP/+xzWuh26KRt2aFK3MQe9RxyJCyXlGB
 jZWUnACd0mvqP/ULqkp+Adc3YLvD+awF7yGkWcfSUr318og1erL/lfgiWre92Z4i8A8OTaFLB
 ApjGdSnvpZ/y4GQ4TbVbbR6PeDCj1UOv3njZrE5xcStgCE/xZv8NyIBnSuOA19fjCE7I5fILf
 95pe6Iyhr9w78uI1KNavZF1+aeX0UjZNCEM9LykUiMjygiyB6vtxyiRGHpnTQuALs6TITXMU5
 bKD3AnbA+WZ6MUFEYRt2YlRlUece6/+NjEtZPzJDAcBkOvciKxWZspaPe1QR9i/yaHYr+dzu9
 e/6dpnQn7pzG6uP6PST/JFCaKnFlhBA3Hlqz71EkLBqqDc2JpDDc4VcyAJp2279ubUokUXXSO
 3dUHAanjCaSFVyhvF/APlXDhzirlf8hffDbdlDzEN68W0hjxi8Ryie69kPCBgFCz9kQA2xqoF
 hUL4Hf773PPYTdR77PBKRSh7g9XQ/agEjYtRei6DLmo0Gc76a2M8oWj2YzHDTai8BPX++vWqZ
 fEYJ5t+PZDh9vBCLw1neJDS0YFL7LeW2G3MWnvu+aeG1ic8T18mpNmPo4fXFXr0CN2qhFVBas
 ZCO/uM8QuCfnZzEqNbkpurYHX2LDbwirWn57JDpndX5mOqupcfbW9cpSI4Xmk8PCh3px0QoDJ
 q5lmmby6a4MI5xUaNmLvMeUd3twKDHRELMTKEW5weMVgT95wzoHXXcQixT79q9KGe9rDf4H
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>,
 Amit Shah <amit@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Omar Sandoval <osandov@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 10:08 AM Xianting TIan
<xianting.tian@linux.alibaba.com> wrote:
> =E5=9C=A8 2021/8/6 =E4=B8=8B=E5=8D=8810:51, Arnd Bergmann =E5=86=99=E9=81=
=93:
> > On Fri, Aug 6, 2021 at 5:01 AM Xianting Tian
> >> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
> > I think you need a higher alignment for DMA buffers, instead of sizeof(=
long),
> > I would suggest ARCH_DMA_MINALIGN.
>
> As some ARCH(eg, x86, riscv) doesn't define ARCH_DMA_MINALIG, so i think
> it 's better remain the code unchanged,
>
> I will send v5 patch soon.

I think you could just use "L1_CACHE_BYTES" as the alignment in this case.
This will make the structure slightly larger for architectures that do not =
have
alignment constraints on DMA buffers, but using a smaller alignment is
clearly wrong. Another option would be to use ARCH_KMALLOC_MINALIGN.

Note that there is a patch to add ARCH_DMA_MINALIGN to riscv already,
as some implementations do not have coherent DMA. I had failed to
realized though that on x86 you do not get an ARCH_DMA_MINALIGN
definition.

       Arnd
