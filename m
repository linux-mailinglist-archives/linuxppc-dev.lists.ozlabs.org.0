Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B1199973
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:21:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCjb0NbYzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 307 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Apr 2020 02:19:46 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sCg65VfyzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 02:19:45 +1100 (AEDT)
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3DBb-1jMJOx2QBB-003hgp for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar
 2020 17:14:34 +0200
Received: by mail-qv1-f48.google.com with SMTP id ef12so8961629qvb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 08:14:33 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0Iwb6+RTlruyzXRbmMkI8U18VVI5kjG+i/QFnBQc75gobkOh5Q
 qbO+Wkd+y02h9Oe6sYhH6O9zsbkz85DlKHDnMws=
X-Google-Smtp-Source: ADFU+vtTtXExWagKN6fS5j5yvDDyyCE4ZLiUO7VBKSTqzOXDQQPyix7FtQaVbGVOLp5dhnbRWBA6qiR5PaNOWFkiOk8=
X-Received: by 2002:a0c:a602:: with SMTP id s2mr17309984qva.222.1585667672757; 
 Tue, 31 Mar 2020 08:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
In-Reply-To: <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 Mar 2020 17:14:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
Message-ID: <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6Alqs62iPi17JYfPBl9KA2mW4ll2PU4QZDQ1S3+R8RWyhHb/Hpw
 y+dJpV73g1NBL8dCYQQuMoC5N5OycKuRCjrl0gSowbVSDOiXVeDZCkTOIxGZXWSBXzcbmfM
 WWXp1KxCOzZyjW3EXvxflysAw1g/sGhlsvSehEW7cWKLiLQZDJv1cB4knTCj3eXPD0UyXtE
 6HppVTwj/dWHHmpcEcI5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+xMoVpb7E7s=:JwLFhW3/NF02K1TfuX2G4+
 Px69g07NgWYoCi1ASK8x7fdU8uciB5uu7wOrinsL4a3zyKFjqDc9//yxUNE3wpQam2k5Wsaif
 KlNOL2YVcbdcq/HPKGgfas7wwV0cR2F4Aj0H8ozihhho0tLddNb22shTkmB+rFzQ4DhQpdZTe
 5MG+zQpCY2KQQybM99+59/ADvYDWRApTmXhi55Ig3R/vxp4j+JDyH/Vd29gGrL00dwjynBaKT
 a/wgqXbp6l+xcJ3P4WD6xt8VgyDVx/f5b7dS94jv5FpUYu8ipZ8v/DkSXnkMP3F8ZNb7JdfAf
 eJ4OyUMbr8yx4JsLziIX9KBJL6VBxcTCtMq1U8YCYCwdgFo18r/FQmgs93H2whwa2jlQoyYjy
 /ILdJOiju/dULOvtAkSMXRpBxayA3Q8j14LK/960B2cm/YnrWNxKX3ZP6/Zjd0Kl3EomLnyPb
 4I3F69wcV0QnP68e2caqhXljs/1U15f/Ibifmn0YzUOoKk6tcbhJ6r6JCwF206BJRvNTM9cKA
 UYCbuIX2S9FTAWBx96DwaYLWMuoblreg+pI/DNJNgfAOly+i4Q+FzfWSA+seVeDp3JVCpYiAP
 65t+leNg0CJEqTIz0p5xXlDw8iFRvSza/1cQecvqBdtXLGX8C61nXo/CntSNQefYAa62bMNkk
 0Rle24aDp5iuOLUn82uH8QYwu3QArcJZ3XkU/XsTbeiX9qSO+odjRTjaWtonQ0ZKh7nDJS6x2
 zfxPgeoZEpfOBp78zEA47GyrwMB+aPXrk7Do8FSKMmlOHNjElBLobNw5cCNpJWDYyzOpy2/sU
 VObJLXj7nla6xbohzR2WrOx8aIi6IngEzDWRV8/4sGi8elo014=
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

On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Only 44x uses 4xx now, so only keep one directory.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/platforms/44x/Makefile           |  9 +++++++-
>  arch/powerpc/platforms/{4xx => 44x}/cpm.c     |  0

No objections to moving everything into one place, but I wonder if the
combined name should be 4xx instead of 44x, given that 44x currently
include 46x and 47x. OTOH your approach has the advantage of
moving fewer files.

       Arnd
