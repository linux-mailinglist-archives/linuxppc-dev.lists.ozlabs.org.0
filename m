Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE1442EBA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 14:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk9683h8Bz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 00:02:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uM2/yEc3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=uM2/yEc3; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk95b38Dmz2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 00:01:37 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id g14so13633185edz.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Nov 2021 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crOdWIptmZf8pxuA44UGy8HjdRzPcXaL0S7+PbsVXCw=;
 b=uM2/yEc3wJOV43Ww8NFzmRxkBvSIKHAodWe/j0cVfcMazlov7BrhSaTlO/49sD4yem
 eQkVMV2iqd81HkR+dR91e+wbft5u1Oksg7m0GOaaiMVgKVVTfWz9Ho2zoUj4nUPNqh6l
 /o3Bh4iRPaiWHi3NXXHYltpmRK0u6NXlntsCzeuLynZFYIKRGU4XXq3MqKiAYQYadSww
 sYS2wGNvTgum4l56kQD7OpFKYfkYuUtW8Gl/G8cZAlBSrgwbgQndAvxNIZcvfykNZkiA
 jik5G0bPKcmN+HWY1G0aALtVo4lOnE7EB1tNxYPOwUw/uQiMOfzJ+qW/VWM/Dx9i9jqK
 1FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crOdWIptmZf8pxuA44UGy8HjdRzPcXaL0S7+PbsVXCw=;
 b=isRomcQYOrbw2Ydo+LX1pWAstErU1M6i2oMh6sYypmkSpH5AvB0/D0S1hpYB6m2MDi
 q+EwOyRzrw6igGXcbvz8sSWkXEnKczq1eOMw315bWE+vnVebWYeiQRv8SfVPz0Us66De
 xM3WvY2OnjLN8ZZGjErxI2jRgrR3FBX2DjVqMxaHR5NK/vVBm57nig0ekoXiQ0CqPKQi
 uWHjdsciRStQyLsZGa8Wsu9kahiYO4rfcqlr0kjhoVinydiQTHKpsH3zfwHB6RNaRbwG
 2y8KthoSsJ8jRzdiGMefxrAEqu3dRoOOarde2qwUNcVzmpbO/fsUIHqAhfsVaH5sspUQ
 dpxg==
X-Gm-Message-State: AOAM53155axZJmzllCN7bGd1MHa0MWUaqAuGjSQhF8w0nmAIUnKKz2YY
 SqNURBbLoH/4PzHs0+DoeoomX7qtb+Bi/tlvJGkY
X-Google-Smtp-Source: ABdhPJwfePdaN+I1n/+fDRDVgSB4FkutIKTWIUcdi6y3Q8YAR349Lg21C8y1bXwdN/SMsY4c2WJKDKTVM3X2GC4+iXg=
X-Received: by 2002:a17:906:f90c:: with SMTP id
 lc12mr35950408ejb.104.1635858079376; 
 Tue, 02 Nov 2021 06:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <163584790624.1845480.1785827913484538939.b4-ty@ellerman.id.au>
In-Reply-To: <163584790624.1845480.1785827913484538939.b4-ty@ellerman.id.au>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Nov 2021 09:01:08 -0400
Message-ID: <CAHC9VhROvSQHVQ6Wo8zHND1rGm+r6dGJur69B65sJ9JwNvMDpQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: patch-notifications@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Paul Mackerras <paulus@samba.org>, Eric Paris <eparis@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 2, 2021 at 7:38 AM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Tue, 24 Aug 2021 13:36:13 +0000 (UTC), Christophe Leroy wrote:
> > Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
> > targets") added generic support for AUDIT but that didn't include
> > support for bi-arch like powerpc.
> >
> > Commit 4b58841149dc ("audit: Add generic compat syscall support")
> > added generic support for bi-arch.
> >
> > [...]
>
> Applied to powerpc/next.
>
> [1/1] powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC
>       https://git.kernel.org/powerpc/c/566af8cda399c088763d07464463dc871c943b54

Did the test failure discussed earlier in this thread ever get
resolved?  If not, this really shouldn't be in linux-next IMO.

-- 
paul moore
www.paul-moore.com
