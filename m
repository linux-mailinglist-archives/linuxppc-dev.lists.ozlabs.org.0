Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6B33EADE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 08:55:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0jBS2SpVz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 18:55:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0jB567nbz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 18:55:07 +1100 (AEDT)
Received: from mail-oo1-f48.google.com ([209.85.161.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1YtP-1lOv3n16CJ-0039Bo for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar
 2021 08:55:00 +0100
Received: by mail-oo1-f48.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so346759oor.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:54:59 -0700 (PDT)
X-Gm-Message-State: AOAM530FiCMKSb9KcmZh5qHVYzl5A2uNUswX8WZzDylx+U4rAW68M2x+
 Igz3ohPyoMFe+Ux9qlaIkvNxzvVUfpsXTHc4uYc=
X-Google-Smtp-Source: ABdhPJzZdnCKyGkix2AX1KZ8MvuG4J0YDH/ajg643LqQK/un1mnEh1NJMcHZybuhM8IY5iaf1gLAfwPJHLlkz96pFRA=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr2259266ood.15.1615967698408;
 Wed, 17 Mar 2021 00:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <1615966419-20549-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615966419-20549-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Mar 2021 08:54:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3V=nhE9o6qvmjAHzakQesT9SWniRHW3mCe6Q+kd9J2PQ@mail.gmail.com>
Message-ID: <CAK8P3a3V=nhE9o6qvmjAHzakQesT9SWniRHW3mCe6Q+kd9J2PQ@mail.gmail.com>
Subject: Re: [PATCH v2] sched: replace if (cond) BUG() with WARN_ON()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:H42Cwy0O7Bqon4LJNtG7M6hWYmbkaaf0Wwburu6ldTPw1jKOAYl
 9wVwQ3bkFTeuv9Xl7eqIJVoALhyQc97d/hqGDHcpUu7tU3jWNZNrgRT6fJkJPTBpxlykMWP
 nbdXyj0jURJ343mkv26Z9lHHXB1o50zZ6LafW6GEHa6QZx4nFDNG65rMJn0X3DQ/hZcY6Sb
 U0uzzLAQWQInEHI94i2Tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GttH1sGfsXQ=:KELTSEWtWVkgJGjLoSVuMt
 xb5Lhk+/PkU0/xynSEicZfqMRi0efG9A0jBneiwHXOkFW4uq6KRaJ91z2eI3WoblAVjMf99nS
 +yynVo//qB3W4HfQZe9hmFib8jQvA7Sto7pNrp3JThke1M4sB6DZ8F4GIys7RoqEH2TcyjirQ
 GFkI2wD/tl6igor4jPxukYHwInJ5iUzfPaOnXUhUtFUoeioBXGdB/veR4+W5IyMpOn2hbepaI
 ddq/K0woeSWXpNEjjtSZhMgDJOCwPgWBl6pelURDFSEKj4uJ1UPbJxtp24XfLdVgR6AZkDq6C
 SnPFlXJ5gw02PiDad2oKwgx+Y3nXliH8xYlZRNLtm2noqENu5sndd+0XrEn23JoJegaN0cw8Q
 880n+QM3zDMAEW+I0fyISY+wkBi5NjM4G+h6u/i9UpRATm4hK+822bdLHBr97HgTi1KTqZKMX
 x5Mk6rqIegOCS5hXTNaTCZfvMTy3NW95PgqHqYwNXpsldJ6j0cWWOZBMXGS83XU4MlHxV6s4P
 cQv00k5pABm1L8ny4S5Iy2Bh2KBI7/LwtDSSKnMteiUVU1cCnRMSPKcD3OdyCv3Cg==
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 8:35 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./arch/powerpc/platforms/cell/spufs/sched.c:908:2-5: WARNING: Use BUG_ON
> instead of if condition followed by BUG.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

If you change it from BUG() to WARN_ON(), you should explain why it's safe to
do that in this case. Here it is not, since the following spu_release() will
end up making things worse if the acquire failed. Also if there was a signal
pending, then spusched_tick() will just get called again and constantly
print these warnings.

There is probably a way to use WARN_ON_ONCE() here, in combination
with a way to terminate the thread safely, but this has to be done carefully.

       Arnd
