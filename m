Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC8726AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:32:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjBc42CwzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="lkpXTEO6"; 
 dkim-atps=neutral
X-Greylist: delayed 320 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Jul 2019 07:36:10 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tWxk6hZ8zDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 07:36:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1563917767;
 bh=ToULRC4irrsdH84boQnpkm5KiZJ47FZlgR9fRYxOddQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=lkpXTEO6408I3LRONym3SM1Hxm1dWIXmGVBslx1kkpMPhpbyHwqazbMpnA1cg1pZA
 nZw7bMjosbE66gRlVXpB3Ylz9+4B1hlUU+hkdNflHwNU1RAorsFnuQwF6M4WlTz7ee
 auPbN/N9ahm9zAoySJbK3TElItsuoSB+AsNZqCv4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.17.9.180] ([87.191.208.243]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LtVLE-1iWxrd16mq-010plk; Tue, 23
 Jul 2019 23:30:21 +0200
Subject: Re: Build regressions/improvements in v5.3-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190723080441.19110-1-geert@linux-m68k.org>
 <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Message-ID: <738c1891-6ef3-8cd1-d25e-b9a36255e3e7@gmx.de>
Date: Tue, 23 Jul 2019 23:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T+b1tb8faTODi5y7+U6ZeYg349SPA/Fh6VMkO4Lv68DcHiqWs38
 yMSq6plB/gXOGf08wjD9XUjitvj8jKdC/8/JaMSNHP9vDAOO7Co7tl7rnvZFkj9FzwyC3he
 Osdq0XH55YVvzrSSpZfz5GyKiXcltMbOZz4gbER+z1VPvO52/fBz44TmPn60QnwkG/uiNZp
 Qd7uZwcF8lw5s0lW1uARg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TXYv2EWKI54=:UXWuozBLZfhgnmr7WUXwgG
 inyi6xYUy+8BCUcuO6XhXBgNBYmCxSqer4AZYOV3+oPVGLQKFnv6ZCyF/X5e9c0rYM0JnfZFe
 HPlUMRIJptD0sBBDo1SyTWyFUhmP+MNDaL5IRe1f8B2HTicbYs9l50Zne3TGmgJvi6q3bqRP9
 1/MF1ujBRl55hCDRS/OisHyOcHGj/GVcanm+Z3aD+aLuzAbV9q5guOT8Zy4o30rGUGqGIBnAc
 jqODRY8zIqQAkBWMDTM5vVX/VbTuHmHAV3j7fgaGLR4JQxQuBdxF0dP8hbqXqnhrzHzufGJmh
 EgRLUdzP60tWOD677vUSRSx8gk8tsgn1VDoNNiJWhd1/wZdc5xMv9vIVpdwAxT6MGWrZQXM5u
 cxRjWaseqLyDU9wG/nfcZwV9Sc4mPdeq4kxHYuvUU+3IeYJWuheQ7LjBb+KzJsLUeneyDur2L
 zyYb8BLNx9s+BL5xv3RK8OnUReOArsirYdAzVWhcOoBP+lqysh0bDXD3j+sy1cs5ZAFHCrcBK
 JOSuvCZ0o4UewdBYACZFywn8mNjAr1hU3MFB5IULr96+hGBOWp+JCSAc1Doar9A7PJPl3Xb7e
 pOwJ9k7vHMn1R9TitGxevurhE8q0D1o9nWtw379GfggStZBDgM6DpeCiLJ530IfdD5HplkREj
 7Jr6BK2t6cIAcp0iZyHk3UuK7oerG0YQ6AVw4MRrfVOlPCo5C5hLiUOVjjHxY6IJk9S9Ayju5
 KXfUNK8bYO4Ip8lwzUQ48FWo8P6wlSLiOfqPBTryJUscuP/SfgYZfBvip9LwOD6xbKk4JHgOt
 xdd+bgmXYP8iWK6GRS8Z2YcrTy+upoWPUaE4r4cgZng9AFzRKIdnZTs048M1glVfxODFOVO5P
 HS1TvpfFG/nj48cr1UsyHiRopf06H5ICSBM1jViovemvOVCvD8AXjN+BgV7tj5Y46fRIksQYy
 dn+PKPSFhY5pM7MOsMc7hJ8ZmIAs3Zq3nZMbTH5UFDafwr3Is4b/c8BnDPxcFTMLR/q/4jZlb
 wJh0YC7NwZ9zuU7nedKQbfp1YO74OSYPZduFOXMagjvb2+3HuqOUcfm/Vj1fVN/jtg+DIB4hi
 dmqLjLR8x1O6Co=
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.07.19 17:39, Geert Uytterhoeven wrote:
> On Tue, Jul 23, 2019 at 5:22 PM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.3-rc1[1] compared to v5.2[2].
>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/5f9e832c13707=
5045d15cd6899ab0505cfb2ca4b/ (241 out of 242 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0ecfebd2b5240=
4ae0c54a878c872bb93363ada36/ (all 242 configs)
>>
>>
>> *** ERRORS ***
>> ...
>>    + /kisskb/src/include/linux/kprobes.h: error: implicit declaration o=
f function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Wer=
ror=3Dimplicit-function-declaration]:  =3D> 477:9
>
> parisc-allmodconfig

I've a patch queued up for the next pull request (in the parisc git tree) =
to fix this:

https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3Df5e03d3a04978d2866f82cb11cc7a6b808c8ce07

Helge
