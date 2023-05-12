Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6EA700B36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 17:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHsq83V8nz3fXt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 01:18:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YLWU0PQI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YLWU0PQI;
	dkim-atps=neutral
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHspJ3YRTz306Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 01:17:59 +1000 (AEST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-190d4f2f943so7881979fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683904673; x=1686496673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctKppkhAw3uRkR+N6SWCnWkmJDaZRwXzqRl9zakaLVI=;
        b=YLWU0PQIt0qPnshnk+WbMGy0Px50gQSNPK19Vl1gUU7zWV9Qt9feSZsWdFyJljGwNp
         Pt3Wo4iGof6VXY2WMKUDcTX1qumZvKtzVag9kfo5TMvvrrVvbarlU3T972DPmK/cW8+1
         9R+/R+BFvC6v+cWe25ZFg5GfIe1quh72gYY027YCsTDIfMlvHIBnYvhzFmrX/DKVjq4X
         1ukeOs0d1iUr22XUMTUVB/Lhm692xVtglImstRg4rj7LIVdFBCrH0YCenDCCioxkPTvX
         cRMabkhh6IkgZXE3nXBjh5jSj4dB/NoEbhG3XnfC3MRp3Dd40HDWSGD5OW2wAi4HNpfR
         qy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683904673; x=1686496673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctKppkhAw3uRkR+N6SWCnWkmJDaZRwXzqRl9zakaLVI=;
        b=TRuQWBWCJ1I6OpqInNHom2N5mdWWc4MQslcXTwcjc5VD5zFWTooHVmHKjLVoasNd6h
         ge8FE9Y/IxIIUfMRjbaMLLPN2MMkuf63PReqZNOmPoWe3CRDNEIkISrN3vkbSFEzZY4l
         JdwOXX6W0VS+1HYhVP0UlLaxKb/YFeNPBMwXQKV3AnzvcZ3mfhaGxueVNtPRzUIy+8Rj
         qciM/kp2DMETEXhAABEsnMbUfWc+d7ZMlbIANoAtLGv5u8bqysFpPVT+9kBmWogyVFZc
         m8e8LElR7Sg7xN56mSfSbLQoY+t4+CkjPT2jtF5zMlFDWvnBJv+EelLvy6e7nGHZcato
         pIEg==
X-Gm-Message-State: AC+VfDyvH7ZoXlRsA6GjSrTk/3UKWafAvr6iqTJANeHyKIlVpTqQj7gW
	cTQK8hB5ltEd+S0IBRsDPWI40wivEvARjoKH0pA=
X-Google-Smtp-Source: ACHHUZ4rmrc0Ep+iH+w4WCG4PF2+BkLxKvQ+iN3CIt+pBpeBslZBk3HS6BqY26uH+Pwez3s2rEeG3bYwMR251ayxsCw=
X-Received: by 2002:a05:6870:4294:b0:187:be3c:28b6 with SMTP id
 y20-20020a056870429400b00187be3c28b6mr13338235oah.41.1683904672864; Fri, 12
 May 2023 08:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com> <a50537d1f1af34104793218acb954a61@linuxsystems.it>
 <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
In-Reply-To: <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 May 2023 11:17:41 -0400
Message-ID: <CADnq5_Nuu+Lvt8SdHmzRZ1eZcHzoSRocGjgwCHBqf9fFd9nubQ@mail.gmail.com>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sasha Levin <sashal@kernel.org>, Linux Regressions <regressions@lists.linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>, Hersen Wu <hersenxs.wu@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 12, 2023 at 11:16=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 11/05/2023 =C3=A0 19:25, Niccol=C3=B2 Belli a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de darkbasic@linuxsystems.it.
> > D?couvrez pourquoi ceci est important ?
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> >> #regzbot introduced: f4f3b7dedbe849
> >> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553
> >
> > It doesn't look like the aforementioned patch made its way into 6.3 yet=
:
> >
> > niko@talos2 ~/devel/linux-stable $ git branch
> > * linux-6.3.y
> >    master
> > niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
> > patching file
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > Hunk #1 succeeded at 227 (offset 15 lines).
> > Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
> > patching file
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).
>
> As far as I can see that patch has no Fixes: tag, so it will unlikely be
> automatically merged into stable.
>
> Has anybody requested greg/sasha to get it into 6.3 ?

This is no fix identified yet.

Alex
