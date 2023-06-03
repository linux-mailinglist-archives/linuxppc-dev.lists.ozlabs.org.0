Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D17213B2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 00:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYZSm5SDlz3cds
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 08:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=soghk3Eh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=mirimmad17@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=soghk3Eh;
	dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYMnH2ZD7z3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 00:33:54 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-558a79941c6so152802eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jun 2023 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685802829; x=1688394829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VqN/Cc43meDsfCoFH2RDmQekbZeIEiHB84/yvFErx6U=;
        b=soghk3EhGicini6WykbdCmbI1n6uHBbqq9W77HJd9a7XV0rYXvGmCD/9g6EoOLdVOO
         htYi98d9wMy4TScovrXnLUbjnYiEkXdw8mnJo/W9qiag8ZJn4c5BTHF/smN1w9bXQ0aN
         I9dgYYknNWs7vj5b3bpNWZMSwZg+jA04BTBR6cCg6KXFJexwQi0BtJSMvr2Lx910LDI0
         xqQeOWmNeTkqBLz+x7vBecYMv0ZtKnEcWcwu6S8YNjKu59152DUV7kmJmfDd4HmHDNdh
         Pc2DOHl0FPq9+buxmOq9OjX0mLaPJbEYkCrXjBmptKL/qCpq0HykDWQPsdLqnmbPP5Hf
         Mn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685802829; x=1688394829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqN/Cc43meDsfCoFH2RDmQekbZeIEiHB84/yvFErx6U=;
        b=kVv32cQ/Cs/PlnfeXlA4TwKWyVgdpUpwzt4l85yOLO8xVqA3/bigf4kUEEP6SZccQH
         6WHQtdDZUDKnaEYsOWZQufUu473AVsCjKUi485ROExK+UIQYCCrK1hYZnKOsvqjSgEzv
         tZytzVH4vJ2Mz4MGMXIr6dkMBDEhiOcA+8NTGkXGmf4ulScdZVPsKhu6QP8VXwuOXXIg
         RGySjbZduHO7N4PsE8GM4qiSARoZVK5UmiOzIxOapU4HTbXyN6iY0FaPPtBwlxA2NklW
         WINH8FdMU0axkTL7IU1j4bb2IBIOIkQcSiHI4Bjt67fPUeLa+vv3TMZ47lFgZ61gz6so
         nttw==
X-Gm-Message-State: AC+VfDwLdsBn0N0wzYF+aRvysRw+wolDsm9A5n0idgV6Mz/JZ1gvoxiG
	PN+AqiqonglTg2/QB/s+jPR3ftm6w6qw9bV3QOI=
X-Google-Smtp-Source: ACHHUZ6FfpI3WQwqrBxXpue9Y0Mig/aUvPVUiEsoYRmLue8TS/SK9CAoA5MabvpTHq1Agaqj7AA1GhWDsPVt6aL27+s=
X-Received: by 2002:a4a:4548:0:b0:555:7c8b:910e with SMTP id
 y69-20020a4a4548000000b005557c8b910emr9771069ooa.1.1685802829092; Sat, 03 Jun
 2023 07:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
 <2023052835-oxidant-doily-404f@gregkh> <87zg5mrt8m.fsf@mail.lhotse>
In-Reply-To: <87zg5mrt8m.fsf@mail.lhotse>
From: Immad Mir <mirimmad17@gmail.com>
Date: Sat, 3 Jun 2023 20:03:37 +0530
Message-ID: <CAJfv2=BRCQVce4DYAtbcs+c_CT+eCHQeG1LWmcme-1bj=tnMJw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix debugfs_create_dir error checking
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000ca1c1305fd3a8e97"
X-Mailman-Approved-At: Sun, 04 Jun 2023 08:34:39 +1000
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, mirimmad@outlook.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000ca1c1305fd3a8e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Still I think this patch is an improvement so I'll plan to merge it.

Please let me know when you commit it.

Thanks
Immad.

On Tue, May 30, 2023 at 4:17=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:

> Greg KH <gregkh@linuxfoundation.org> writes:
> > On Sun, May 28, 2023 at 01:16:44PM +0530, mirimmad@outlook.com wrote:
> >> From: Immad Mir <mirimmad17@gmail.com>
> >>
> >> The debugfs_create_dir returns ERR_PTR incase of an error and the
> >> correct way of checking it by using the IS_ERR inline function, and
> >> not the simple null comparision. This patch fixes this.
> >>
> >> Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
> >> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
> >> ---
> >>  arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c
> b/arch/powerpc/platforms/powernv/opal-xscom.c
> >> index 6b4eed2ef..262cd6fac 100644
> >> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
> >> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
> >> @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root=
,
> struct device_node *dn,
> >>      ent->path.size =3D strlen((char *)ent->path.data);
> >>
> >>      dir =3D debugfs_create_dir(ent->name, root);
> >> -    if (!dir) {
> >> +    if (IS_ERR(dir)) {
> >>              kfree(ent->path.data);
> >>              kfree(ent);
> >>              return -1;
> >
> > Why is this driver caring if debugfs is working or not at all?  It
> > should just ignore the error and keep moving forward.
>
> It's creating directories and then creating files in those directories.
> So I think it makes sense that it checks that the directory was created
> successfully. It doesn't check whether the files were created.
>
> > And -1 is not a valid error number :(
>
> It's EPERM :) - but yeah probably not really the right error in this
> case.
>
> Still I think this patch is an improvement so I'll plan to merge it.
>
> cheers
>

--000000000000ca1c1305fd3a8e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; Still I think this patch is an improvement so I&=
#39;ll plan to merge it.</div><div><br></div><div>Please let me know when y=
ou commit it.</div><div><br></div><div>Thanks</div><div>Immad.<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, May 30, 2023 at 4:17=E2=80=AFPM Michael Ellerman &lt;<a href=3D"mailto=
:mpe@ellerman.id.au">mpe@ellerman.id.au</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Greg KH &lt;<a href=3D"mailto:gregkh=
@linuxfoundation.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt; =
writes:<br>
&gt; On Sun, May 28, 2023 at 01:16:44PM +0530, <a href=3D"mailto:mirimmad@o=
utlook.com" target=3D"_blank">mirimmad@outlook.com</a> wrote:<br>
&gt;&gt; From: Immad Mir &lt;<a href=3D"mailto:mirimmad17@gmail.com" target=
=3D"_blank">mirimmad17@gmail.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; The debugfs_create_dir returns ERR_PTR incase of an error and the<=
br>
&gt;&gt; correct way of checking it by using the IS_ERR inline function, an=
d<br>
&gt;&gt; not the simple null comparision. This patch fixes this.<br>
&gt;&gt; <br>
&gt;&gt; Suggested-By: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmai=
l.com" target=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Immad Mir &lt;<a href=3D"mailto:mirimmad17@gmail.co=
m" target=3D"_blank">mirimmad17@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/po=
werpc/platforms/powernv/opal-xscom.c<br>
&gt;&gt; index 6b4eed2ef..262cd6fac 100644<br>
&gt;&gt; --- a/arch/powerpc/platforms/powernv/opal-xscom.c<br>
&gt;&gt; +++ b/arch/powerpc/platforms/powernv/opal-xscom.c<br>
&gt;&gt; @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *=
root, struct device_node *dn,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ent-&gt;path.size =3D strlen((char *)ent-&gt;p=
ath.data);<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 dir =3D debugfs_create_dir(ent-&gt;name, root)=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (!dir) {<br>
&gt;&gt; +=C2=A0 =C2=A0 if (IS_ERR(dir)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(ent-&gt;path=
.data);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(ent);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;<br>
&gt; Why is this driver caring if debugfs is working or not at all?=C2=A0 I=
t<br>
&gt; should just ignore the error and keep moving forward.<br>
<br>
It&#39;s creating directories and then creating files in those directories.=
<br>
So I think it makes sense that it checks that the directory was created<br>
successfully. It doesn&#39;t check whether the files were created.<br>
<br>
&gt; And -1 is not a valid error number :(<br>
<br>
It&#39;s EPERM :) - but yeah probably not really the right error in this<br=
>
case.<br>
<br>
Still I think this patch is an improvement so I&#39;ll plan to merge it.<br=
>
<br>
cheers<br>
</blockquote></div>

--000000000000ca1c1305fd3a8e97--
