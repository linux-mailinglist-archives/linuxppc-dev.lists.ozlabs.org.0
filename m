Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D547B7657
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:39:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFuIzoM4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0cmn1Y5Hz3clw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 12:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFuIzoM4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0bgl2p1yz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 11:49:54 +1100 (AEDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1dc863efb61so1036239fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 17:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696380584; x=1696985384; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUvS75joHYsAicjUoDVxAK1yIuHU+VSql4f6gMgkWMs=;
        b=IFuIzoM4NMvCtL9RKc/aiYWj0TKK5KWWa3cKWp51g1T+m6coGVYc3Ur/5AebawVwsQ
         AQ8xVvb8aWLllnaMRsbPA1G3lkWLqr33z9zW+PN/6MaxXO5apipv2OgwJtFGa/yLpJry
         lnrFi02453k2vphh/E8Gyes0dxSs6OYPsKfKbHbiRlwnA3UvR0LHhEILE45DoZc2Jaqn
         KF23Y8DBh5WJUxCcoR02PlFt/JzgnxT1WiIJ+KYgpNyICO7ba85OaAa5vUojHWiAe0b4
         NGIeayvSLGLdl/Supa0joHFhcdP9xRT6ZNYi7G5qjU7DhxHr6enojDqIqgvKnMyylJqC
         5C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696380584; x=1696985384;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUvS75joHYsAicjUoDVxAK1yIuHU+VSql4f6gMgkWMs=;
        b=fMPrHYuO8b/t2yVUGwXAgLfosgNANnMqdJvvLsULHU2/VWM/7uoKdsKVjc+vGLHWbr
         ds7wrPh/iFo2Hd4osjFe4e0z7h0p3EPswJI17wfaVhGLm0GTk0n0c1VIgcMZ7sJLq2Si
         VlzzRzoBjc9tXB213E4Ztd3JOe8e0BcGW3e3g52Ex6CWrcnwyWFGIImWEScPEoevVHcy
         Z68osdKoTVuTtVflDuojfx7uh0FDfji545hVIcsPqEPjZutVGh9pY2jX7Zn1a5GkXGki
         h+cXmf9F2IcUtTkMywft1lLh340uZcLzZAZPwmSfQXxmhKExEX0o2eOH5mc8Q6x9asWZ
         hjoA==
X-Gm-Message-State: AOJu0YylTyBuaMW1iqJ/iL8cEGXniP8Iix/cy5QIAeUR0FU2BElCXovR
	NLplK2sgBGH7kmASipCn+D+GJufE3FXBKZWNEtI=
X-Google-Smtp-Source: AGHT+IFpnziMhSyZtMLg8jT772Rc3KhzYOZ1Q6cCjsj+YPYOx8xfo4yYsaVwypbWakxQeD3j3Fr+aK9SQ6q0TOTh/2k=
X-Received: by 2002:a05:6870:b622:b0:1dd:651a:74ac with SMTP id
 cm34-20020a056870b62200b001dd651a74acmr1375235oab.45.1696380584617; Tue, 03
 Oct 2023 17:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <169052340516.4355.10339828466636149348@legolas.ozlabs.org>
 <20230826165737.2101199-1-costa.shul@redhat.com> <87cyxvelnn.fsf@meer.lwn.net>
In-Reply-To: <87cyxvelnn.fsf@meer.lwn.net>
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Tue, 3 Oct 2023 19:49:10 -0500
Message-ID: <CAHrUA37reWJZ7QQzYGB71LY9H6=XENA+RysuXd4eckiwoiC6zw@mail.gmail.com>
Subject: Re: [PATCH] docs: move powerpc under arch
To: Jonathan Corbet <corbet@lwn.net>
Content-Type: multipart/alternative; boundary="000000000000266cd50606d9622c"
X-Mailman-Approved-At: Wed, 04 Oct 2023 12:38:37 +1100
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
Reply-To: linasvepstas@gmail.com
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Oliver O'Halloran <oohall@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Jiri Slaby <jirislaby@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Costa Shulyupin <costa.shul@redhat.com>, Yanteng Si <siyanteng@loongson.cn>, linux-scsi@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, linux
 -arm-kernel@lists.infradead.org, "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000266cd50606d9622c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Got the message; I'm not an active maintainer, haven't been for over a
decade, and cannot comment on style issues. But if all the other arches are
doing this, I see no reason why not. Feel free to interpret this as an
Acked-by: if that's appropriate.

-- linas

On Tue, Oct 3, 2023 at 11:05=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:

> Costa Shulyupin <costa.shul@redhat.com> writes:
>
> > and fix all in-tree references.
> >
> > Architecture-specific documentation is being moved into
> Documentation/arch/
> > as a way of cleaning up the top-level documentation directory and makin=
g
> > the docs hierarchy more closely match the source hierarchy.
> >
> > Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> So this patch appears to have not been picked up, and to have received
> no comments.  I'll happily carry it in docs-next, but it would be nice
> to have an ack from the powerpc folks...?
>
> Thanks,
>
> jon
>


--=20
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.

--000000000000266cd50606d9622c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jon,</div><div><br></div><div>Got the message; I&#=
39;m not an active maintainer, haven&#39;t been for over a decade, and cann=
ot comment on style issues. But if all the other arches are doing this, I s=
ee no reason why not. Feel free to interpret this as an Acked-by: if that&#=
39;s appropriate.</div><div><br></div><div>-- linas<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 3,=
 2023 at 11:05=E2=80=AFAM Jonathan Corbet &lt;<a href=3D"mailto:corbet@lwn.=
net">corbet@lwn.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Costa Shulyupin &lt;<a href=3D"mailto:costa.shul@redhat.=
com" target=3D"_blank">costa.shul@redhat.com</a>&gt; writes:<br>
<br>
&gt; and fix all in-tree references.<br>
&gt;<br>
&gt; Architecture-specific documentation is being moved into Documentation/=
arch/<br>
&gt; as a way of cleaning up the top-level documentation directory and maki=
ng<br>
&gt; the docs hierarchy more closely match the source hierarchy.<br>
&gt;<br>
&gt; Signed-off-by: Costa Shulyupin &lt;<a href=3D"mailto:costa.shul@redhat=
.com" target=3D"_blank">costa.shul@redhat.com</a>&gt;<br>
<br>
So this patch appears to have not been picked up, and to have received<br>
no comments.=C2=A0 I&#39;ll happily carry it in docs-next, but it would be =
nice<br>
to have an ack from the powerpc folks...?<br>
<br>
Thanks,<br>
<br>
jon<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Patrick: Are they laughing at us?</div><div>Sponge Bob: No, Patric=
k, they are laughing next to us.</div><div>=C2=A0<br></div><br></div></div>

--000000000000266cd50606d9622c--
