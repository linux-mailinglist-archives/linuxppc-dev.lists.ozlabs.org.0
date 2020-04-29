Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0441BD65A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:44:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BrBj38qhzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Br853G57zDr1j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 17:42:29 +1000 (AEST)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N95Rn-1j9Ftp4Bzb-0165Yr for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr
 2020 09:42:23 +0200
Received: by mail-qt1-f174.google.com with SMTP id c23so1062587qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 00:42:21 -0700 (PDT)
X-Gm-Message-State: AGi0PubnLJSQ10YV3ArBKUCBWGdEh+Wa0m+z8zJM9DGeOx+1bZpjdgp2
 I7UxZrT7uIj3VcjbP8pss5nko9uhTKH/izb2iyA=
X-Google-Smtp-Source: APiQypJpUvYWo2LU3ZngNQ2JW3D6wR/VR7VqZhY2dctva2ZkWquiJEYUHe1E74mkf1lS1pWa7NroBC/zYcEQxa9gQho=
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr32009866qtv.142.1588146140928; 
 Wed, 29 Apr 2020 00:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200427200626.1622060-2-hch@lst.de>
 <20200428120207.15728-1-jk@ozlabs.org>
 <20200428171133.GA17445@lst.de>
 <e1ebea36b162e8a3b4b24ecbc1051f8081ff5e53.camel@ozlabs.org>
 <20200429061514.GD30946@lst.de>
 <2014678ca837f6aaa4cf23b4ea51e4805146c36d.camel@ozlabs.org>
In-Reply-To: <2014678ca837f6aaa4cf23b4ea51e4805146c36d.camel@ozlabs.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 09:42:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2s3SLw7qehipMCP2m4TG+S089nBiqFfY3c7M2qjVTHWw@mail.gmail.com>
Message-ID: <CAK8P3a2s3SLw7qehipMCP2m4TG+S089nBiqFfY3c7M2qjVTHWw@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:z7fQycAKXx5D5dw6A7SBWd5LlRmqOKeEx1d70AXFtCLEWQJaBLx
 KU/Kj5lTcIiKeFQUMCxMZVSp5k9rPNbh++lki7kyumwmZYWvfeRZEDHD0L8llBPFJmBLkML
 eO9yS0RPb3jqgbquHfN/Vzx/tqlXSaac0kI6aoit/+H9nZN239Iekz2Zi75uIaqD+rO7evC
 l0n/lzdqVUdRX8OtzFnPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1blXKvIgckg=:/6FVxq85G2rlsKZHiVvVUz
 32Gx/0l4rJXh8fnVx7NJA5Fd7b3EUX+YiELt5E4ILRhgQCd7XVFtcRAhtx2NE/UC3ZegXdjTb
 +aJVf/yLfFJC89L5ssqg332a5Mz3Ak/KiQVOizofJhoP9T8wUS42CyDnkyyM2X8VMQpoHTlwg
 1ewsCZFgm+c8IxzmL87oXRhH8ZY4tNZMtPNDUM+DJK0fcUSyC5fqYSUyvEaTZcURUwlh+Rm6a
 sSxyXCP3ij1LRphPKUj/LERQeT9AlhUwzlP+f9DTjjrXPuTOjewsOCuxIZaoIwEUKlevUh5bP
 ebPJB5FyVFF9BezxBs+Qn9zVuf+q9zia6vjA+cFfv1pqxFLNQMHNvMiouTh/uvLe4DirEnnEH
 YTPDY/snrJKZFs0KAuDbNW2ds8cYZ3lTKXUWHjip411565Y57EGu+LMELDqjqX0+G2PUvBzg3
 VUwpRWFe2vzd3Nk1ADMeIkJjC1etCGKxz+IxURaiNfQpWC8yU92QesKx6i50J/WTDEdlkELBu
 x131SeyRRKk17qyHjpEateOg7Z63lWyeu2+B8zFFv2feX4COflshQFlor2Pw3h790d7GkstcL
 VScC05gsd/GuR3UpyPwLlByey3MG8p7f1Z7rE93xTz1FAawV3CritIbg4AcUoNLzumPVXcy4E
 1ajqFSU/fGz/TiI/Eeub8M9BI+hBilGYCbbps0E8kFULvDVw3fcFsxWdny0FAU9RuuSAyHUjR
 V8pAoqIa0aespbnYYnmB4wC+VGrk9p02vJwPoyHMVb64k1ZCnpLBX3xF2zOD4B3LDDbNcLjpn
 cm2iWuY4sU3Wa6/eGNhFC7tn2AnaSZQQwwPx5K2t/IdEsfwdwM=
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 8:33 AM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Christoph,
>
> > And another one that should go on top of this one to address Al's other
> > compaint:
>
> Yeah, I was pondering that one. The access_ok() is kinda redundant, but
> it does avoid forcing a SPU context save on those errors.
>
> However, it's not like we really need to optimise for the case of
> invalid addresses from userspace. So, I'll include this change in the
> submission to Michael's tree. Arnd - let me know if you have any
> objections.

Sounds good. A lot of the access_ok() checks in the kernel are redundant
or wrong, I think it makes a lot of sense to remove these.

       Arnd
