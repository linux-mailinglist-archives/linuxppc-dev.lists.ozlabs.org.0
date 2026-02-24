Return-Path: <linuxppc-dev+bounces-17099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOB4LztonWnBPwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:58:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9351841EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKs881Lc2z3cJy;
	Tue, 24 Feb 2026 19:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::531" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771923512;
	cv=pass; b=SQkjM/tF/YZWRCfu5JSgCwrz0jO35KYri9dzbgcCAFxeJZZ9nwS8p2ic9k7A2kI6jAhREOTcycaEPfOlvGHm3W8o+V6DXrmRcp3OFXdRUto0K0sowSzfC4PmQvHP4yMf2SXedY6v3mysKfwI21Er1ar0mNS1NiK/6UIw8gQSpvxVJTtxqsG2LSiOr/oMF2YMlmHeNbGnWgte4rN3fwgMVkA1tOZW6pNLDKYdQZ88uiWGag9wYghL+O7BNpCLhG7HHZ2ZF9Hpv9wP82cOeEm4PBbcbpHYdImDkc26Zyrfu3n0eV3dGLQYciw9C94xPTTGlKQmkzf8aGwdRFERjAOTlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771923512; c=relaxed/relaxed;
	bh=faiZjMOkti3cU0i9Gy2EPz0ZebIZs9O9WnlPDsTpWAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVq78sexK96rCYVYPzgo/wl7C8ddRhnGDdIAbXheEt6vtltRfQjzaQH1GHLBo2/3j4J4B60gtl4LIiE6wpxsstTDVqbEE3zV8DbvNWA8sP+LrqAi3+jt2zEpadNWD3WtPIbz46eoMvCFNT8xWjlizkcdfn1hAQKN/97mcjGxPw0/ndpNLMd7SjnNTIYZRDUHeUAodq6DC5zIr9h69Ln5iwSiwleJL9IMptnssQyOjN4DR8+h5j32KvVPxh9+TAvijmglbZ0H8sTOVqeBOI/PPWeN3oHn+fPxPNdrF4kpZeKPCWGSwPVENk/CV9F7xST47vNElOcA5OTIg89x6KGIBg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kBBlPTgd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kBBlPTgd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKs864NBtz3cJj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 19:58:29 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-65b94e0a875so7511785a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771923507; cv=none;
        d=google.com; s=arc-20240605;
        b=V8Pgh08AmbGWTW0zMsSCnm8SnnD0BCKC9Nq+buVMwq1500w5fD0BAAgHm39sop0Orh
         XRvlecjL4g81FKnOa4VXj1GfJnuRHpO7F1KOhiCLkA1377W/uPdbWNv9Qf0EK6YBHF2+
         1Cy//7YLQHsjZGq+p46Pss4+E7tJ//SQ3xFPI7doE/BlRW/p1G4v45++KuxktPbGAoE0
         A1fskr2bF0yIQ+GX/vtPc9kb92a30ZJm/uO+ym1P+l/nHe0DXa1vonQctUB9iMDW6Yp/
         2GEfYh7MXfkE04Plvnu/Q7lbkFeH76jWDenLTtwIqlMtmQEyqwu833S9+zrhJoSZtkA4
         kRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faiZjMOkti3cU0i9Gy2EPz0ZebIZs9O9WnlPDsTpWAc=;
        fh=E3llIhXXBSsFYcX3sXtZbG5jcFm2U4Gh39b6Lj9rBKg=;
        b=c07L08W3POZCngRlP6Mdd1xALrl57gBUGqx9fmOGhy7IAG+a2ma/ucsVjdOl7Dkv82
         tVJwGe6uqsVXdFhjWysWAGog9g9vpgQCyy58Y2yFbpYlkC//SSAvYL4UWR28tQUafSSm
         tp8j+pfbiODNl7NjymEYCYYU5RZDVSe1qHzf1cF3WQ0uR+UzD/igwgRR5VQiUAyqfjIk
         GTf7f/ZedDGvkvLgyEU9s4NIb5u7aCZ1vtDWdWa7H6U4zIUFeYD7och5oHTJYRi/3LxJ
         y9DEM+XLcY7A5Cw/8y6MuwWA9J/dJz46q1uWoJ6P5A7sKvMQPxhj0/MQa9lHfbxWtlgV
         VflA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771923507; x=1772528307; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faiZjMOkti3cU0i9Gy2EPz0ZebIZs9O9WnlPDsTpWAc=;
        b=kBBlPTgdg2/85Zs70soE5F0hrLEtzC9Qv+dyNh9v24LEhh5eFaDEWQUbGYxN8Aoxmh
         oZlLm6RMoyhcu1ltsar1WqAUgcddtQq/dwjJgOnKnX+brSzwFZWpqEjdC+eQl2GiTGnB
         RGLQBOkqwIUpGotsFhGBAbc10wZXTrkmPmzTgqpDPk/SGkkc04P6vRedpCqep/R5bYJu
         vlb8KnO656lKapZYptZZVEl1B3FDqEdMNLW6VVYFnwKJPLRWvhkd8CAPuA7Fdpy7TOqQ
         18uQx4ZmCMSTzRMkQ3ZorUrYW9JYObKIC9Cxfs/fpBvcwQ/aYKvgLi7Qvjr82BdmOLl+
         UVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771923507; x=1772528307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faiZjMOkti3cU0i9Gy2EPz0ZebIZs9O9WnlPDsTpWAc=;
        b=iuwWEiQmrHEqBrM3jDfuFr6NUculB7xCZ9kATAbnmYXfw61VdQW79UpJs6SCqjGddc
         QeVpdFg+HxZ7t7827vAaVJhfzHl0UE4YjQRZy0IOs8AU1L2RGFqtlTJ3wwExDt89fgJl
         znmk0NRAqPxkSkI3rqERQxKE5pdVtmsJlazhCtuoSETNfViTijxpmvKyqfKWDXQibWt6
         CDP5nwiZ+le523x5kDxy7MuJBLoclkPxGapwfyx/tslnFdk5bR1QCyavTJP00Mnn4102
         OB+qq8T9A7H5f4t96VCk8BJhUpLyARouYnhBX52j0+DCb0dUNl2E6g8S6w1H/m1ztujT
         6MPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuyfnWkpzgMDZm1CghvskP1zEEP+IjP7zjewvSUrK+gQG6wBV2LOpG/yTdOXcKztgbccWgQrXpgzts2go=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx05DKut4KwpjhBBgQAFiBNd58dt83kw0nR/7h3er/b5YyZooqV
	5Cnd63rYRWd97xyF0Hxyr5Hk7wKF6P6/VGiRxaY3NbrDVAijWVBbWhwk8SdLxbxV/aAH59iT3AU
	pAoJgCrjz2iLKj+Hjfjve8c4QQHfbdxw=
X-Gm-Gg: AZuq6aIfsFu6uhB/PCOYBX9TchoVznPk5+zojNA+gDq/NNqU2qiDMVOk8SwPKq2PAUt
	02O4jWH2JT49hy+47ZGqNZozCptRLZkSVYN04Qf7WnpS1c7bAY3wUVIKRCY8HYyZys9Rtg5Dw7V
	LcXPCjZlgqFWSz58nAseKEFiCRuJ9f04zetTKvbGHhGl70CGZFG5ZdKJxAxzd6cDkmzaG+jPJaD
	fI/ufS0VcMS1DfcOW+S+HU0p9Q5bFVkv6PxBpMWEDwq85qVS5oQZ4TmUqgrMbLWkgNGJLkhErUC
	syRN7LEtx48bmqHRjQB6Wvw3DNItlSSpRKQvLb4wJRKY/0pAK0x9a3gNTbM+EWyflNNevHfIpQZ
	MwaPpHQ==
X-Received: by 2002:a17:906:2083:b0:b8e:7d43:edd9 with SMTP id
 a640c23a62f3a-b9081b403camr443962166b.34.1771923506344; Tue, 24 Feb 2026
 00:58:26 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260224014607.353378-1-rosenp@gmail.com> <ff1c77b9-bb29-48f8-b942-6ace8ea31dd1@kernel.org>
In-Reply-To: <ff1c77b9-bb29-48f8-b942-6ace8ea31dd1@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Feb 2026 00:58:14 -0800
X-Gm-Features: AaiRm50Bek9WP5Ws1AwhONIM9bVEBKCp-RC5r12jn8hk7U7EM-DczY17IsUaeCc
Message-ID: <CAKxU2N-Vr_cQBBwWd49j6U=WO3pFjLWos4A50AOnFTY1qhyNiQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: fs_enet: allow nvmem to override MAC address
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: netdev@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17099-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:netdev@vger.kernel.org,m:pantelis.antoniou@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:pantelisantoniou@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CC9351841EA
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:29=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 24/02/2026 =C3=A0 02:46, Rosen Penev a =C3=A9crit :
> > NVMEM typically loads after the ethernet driver and
> > of_get_ethdev_address returns -EPROBE_DEFER. return in such a case to
> > allow NVMEM to work.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/dr=
ivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > index 2cbcc29408e3..d3c772ed5fc9 100644
> > --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > @@ -951,7 +951,9 @@ static int fs_enet_probe(struct platform_device *of=
dev)
> >       spin_lock_init(&fep->lock);
> >       spin_lock_init(&fep->tx_lock);
> >
> > -     of_get_ethdev_address(ofdev->dev.of_node, ndev);
> > +     ret =3D of_get_ethdev_address(ofdev->dev.of_node, ndev);
> > +     if (ret =3D=3D -EPROBE_DEFER)
> > +             goto out_cleanup_data;
>
> What about other error cases ? Shouldn't it exit on all types of errors ?
For MAC acquisition? No. That would result in a non working interface
for no good reason.

The way other driver handle this is exit when probe is deferred, and
set a random MAC on other errors.
>
> >
> >       ret =3D fep->ops->allocate_bd(ndev);
> >       if (ret)
> > --
> > 2.53.0
> >
> >
>

