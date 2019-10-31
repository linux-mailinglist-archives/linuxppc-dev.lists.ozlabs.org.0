Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29EEB213
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:05:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473nCW0lLWzF5ns
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:05:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 791 seconds by postgrey-1.36 at bilbo;
 Fri, 01 Nov 2019 01:00:22 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473n5f3vtdzF5m9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:00:20 +1100 (AEDT)
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M8hMt-1iM43D2tY9-004lga for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct
 2019 14:47:02 +0100
Received: by mail-qk1-f171.google.com with SMTP id m125so7018629qkd.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 06:47:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXwVqM5ZYBWYJV0pineOIO32nH/Ipj1/Iycx92rL6Hx7Rp5CWc5
 ZSCDZj0+0MMqgbjPJ49FdBDNUTsEcknLr8Rqd6k=
X-Google-Smtp-Source: APXvYqwYoQTEthtnSTVFwt/kx2esJ5/VAbLAMZ9ee49FdSHuytOsmyxwwNYKV3cufux6mKtj2roQiWuAZmQk9D9c/Io=
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr586266qkb.286.1572529621308; 
 Thu, 31 Oct 2019 06:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
 <04799503-b423-6bc8-71cd-bee54e45883e@rasmusvillemoes.dk>
In-Reply-To: <04799503-b423-6bc8-71cd-bee54e45883e@rasmusvillemoes.dk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Oct 2019 14:46:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17NbSuWzvjKSJiUkxPLhKbqnAEzJLBKuHkPGGjDA6QtQ@mail.gmail.com>
Message-ID: <CAK8P3a17NbSuWzvjKSJiUkxPLhKbqnAEzJLBKuHkPGGjDA6QtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] powerpc: make iowrite32be etc. inline
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eP3H5OIoTr1tYd9PwEfmrUvEQANHBEX/u/SP8r5b/taupNQ91CK
 Fy7PuoRU7MLG73vXXo50lBjsm33LGIpHSy6XWzsSgE1AQf/FSHiYSmoNtQq3otM5CFCDV4T
 GcjCGdYufkAZ+Yj3aRGUTq56icUR9t/21170NVFVXXCUiqjkhF90ZIlwWCML36YsTejxA28
 RVfcFT99ZKNWvOj7kBcvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M36treOxLEk=:JG72xETODy0tbKmsNgGOUE
 M0lqWPO7nccPu79qKY1Wk4PJkpO/AVL0oZR5DNBYsV7x23KePn6fAJYqOXzkPQT8X6DYU++zf
 VyTaDW2uvRV1EKtqggEUxThHOtnNIVVLE69+roCD83NtcOcA5uDP7TtkYg+2n4+5EiN+HPi1t
 e4gJlefG6M6XhObDwLQrkYEQ05vqdZux39j8sGw42REo/U8fQ/zZ381lZ9E7vWeRwS5nzZe5o
 TbUMdCrZlxzaHn5R+RFGPg27ul3VBVHXrQuPEUHHDljUL3k+zNYN1S/UW2MiOwoM8pbRQ43LZ
 dPjJ5WhUKem5KWYoEsEWxuCeSZNbhppgVmQAQMACEFZa/8I1Dx7Al9t4Jif0U/2g1BiZpp387
 21J0mHsBTZ4H6/rE2f9SYJ7PGnVWPZM2JZJy4kKOsDsip0w4g0UpFf5jvahvsMyOumnMZxvJT
 wyj//boX5yZ8+PuXHrWbhEKcMJNyrFq89+1vVqpHLdJw2kbgkz4mFu+zBsBhicVNVgPP3mMiH
 9lUvqfw0JXJLF9/HRB/iOvCBkoPQOvctkqSUjPCMaFoXUgLztZ9EsiiBKLUTSvRgtH/EA40bY
 Honp4/JEdteEe4WwqZBzQ1JrF49wScYR2+rM8+SJTt5xke7/9ef+pCkqbeTvqsPKCxRKyfVdd
 Fd5Ttxufvsc+E1Cco/tc1gr1ipr32wtAcAagyB14P6UJVGSsxEf4XM7Pcrm2o/jHK3G8jR7Ca
 SFcNnm2x2j0pDYIRVODnnzQuhMT52/UYo4YUr9sCmdhAzKbYSNrcL19WHFM4u2L4UIUJ9LA0f
 s5apnItRFQi91KiH5VmND5wUOeqjdwBdKq5P4aFNJJPxYlpMZinyY6Xad+Dy5elwV/ACmqKyF
 9aMVxcbTNq3tcThq2aKA==
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 8:39 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> On 31/10/2019 01.31, Rasmus Villemoes wrote:
>
> So sorry for the noise. Maybe I'll just have to bite the bullet and
> introduce private qe_iowrite32be etc. and define them based on $ARCH.
> Any better ideas would be much appreciated.

We use that approach in a number of drivers already, I think it's ok to add it
to another driver. Just make the powerpc case use out_be32 and everything
else use iowrite32_be. You may also be able to enable the driver for
CONFIG_COMPILE_TEST after that.

     Arnd
