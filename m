Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C71B48A2BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 23:30:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXpRx02q5z3cPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 09:30:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MH0jAjQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b;
 helo=mail-ua1-x92b.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MH0jAjQg; dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXYBr6l2Nz2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 23:33:07 +1100 (AEDT)
Received: by mail-ua1-x92b.google.com with SMTP id h11so1160431uar.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 04:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8wtp+4C35POrc+VUiMHsQrGqfzUrJfI9Qv6QZUZ8DW0=;
 b=MH0jAjQgj80s6cTJOnGRe6wIdkvEL1mh7IhQsb+6Zb3RpDstrKsUbFt+WWRt3i/Evr
 WKbGkZZDZQo7L1O5EG3/Y57kQXmbmmEttgGUootY/heHP4CKSt8UIRDtEtzcDXwXvP2o
 pCf7Wfjyt7fwlFAPaceDdzwONgBesdyWO5FxrznnNiunhKiqfSebf6u6mJT3v70qW44W
 Z+VxkEllfMMaphDO+g0gWAQnMaSuR4zHhxK4SIuhufyApSZLWfR/A5OwzABU9+o5cVIY
 NjFoltJUXk16gtqUYwK74nOMAw1YMbMOdkAdlRmwIi2sl5YQwh9Fygb8XXmS9tHG4OdQ
 iSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8wtp+4C35POrc+VUiMHsQrGqfzUrJfI9Qv6QZUZ8DW0=;
 b=2JxBcSmRaN89vPbuN1D+oHEj2CyxKTlqG3hbxgf1xZlD62jhw2d6DOcFkEvzkF7PCf
 A8aaNKwx3Ps7WI6S5VZsFg00HPZy8coIGqF2IOVaMJLVji3GcPHOaSb4IdlZ255H7mS7
 0MksTqZBtLoLNCIs9yyiD88F8JJIEfYG77N7g++dLcoUV8olVxfBCbmtpQOSxRXkXuUH
 XwAo8KU9Lmw5Bm/+B36h5MocXCzWRXoHuScSLey81jkdPiOvYNmpZ/O13uB5X9lP6MI8
 o8uyb8L8sRB8kvjAJz3sKR/brQFXQt14DB/hUENuBPBnsh6o1jJUuj+6h5YzPdyGc8k3
 Xf1A==
X-Gm-Message-State: AOAM533+Sh/yb7yG7oBVcfcVvXvz9xAzq3RzCgTD1qx9xIVI9VaQWECU
 SFjX8azIAICkMqYmI/G6HNlObYlYfACleulbvy/HjEKV9z0=
X-Google-Smtp-Source: ABdhPJxZEPYS2U7jR2WsTd7Cg//HhSI2eNF8PWCfXVDPm7YBR2XMOK6X9Gmk8Kpm2lpxf3Pe0O4/E/OfMo98NGojfd4=
X-Received: by 2002:ab0:77da:: with SMTP id y26mr11307226uar.68.1641817983768; 
 Mon, 10 Jan 2022 04:33:03 -0800 (PST)
MIME-Version: 1.0
From: Mike <michael.heltne@gmail.com>
Date: Mon, 10 Jan 2022 13:32:53 +0100
Message-ID: <CANtoAtPcRGHafb7LddtrY5g43m82txS_mY3WO_ZtJ+pfuLvKaw@mail.gmail.com>
Subject: [5.16.0] build error on unrecognized opcode: ptesync
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b55cb205d53989ce"
X-Mailman-Approved-At: Tue, 11 Jan 2022 09:28:57 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000b55cb205d53989ce
Content-Type: text/plain; charset="UTF-8"

Hey, so I originally sat down to compile the fast headers V2 patch, but
quickly discovered other things at play, and grabbed 5.16.0 a few hours
after it lifted off,  arch/powerpc/mm/mmu_context.c I had to specifically
say had to include -maltivec or it barfed on a 'dssall', I'm fine with
that, I've spent years in kernel land, I can deal with that, then came
arch/powerpc/lib/step.c with the ptesync. This seems like a totally normal
instruction that shouldn't need any extra flags or anything, yet the
assembler throws up, and no flag I can think of fixes it. This is a G4
7447. I reverted back to the Debian 5.15. defconfig before dropping this
mail as I had tweaked my config to be more G4.

Best regards.
Michael Heltne

--000000000000b55cb205d53989ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey, so I originally sat down to compile the fast headers=
 V2 patch, but quickly discovered other things at play, and grabbed 5.16.0 =
a few hours after it lifted off,=C2=A0 arch/powerpc/mm/mmu_context.c I had =
to specifically say had to include -maltivec or it barfed on a &#39;dssall&=
#39;, I&#39;m fine with that, I&#39;ve spent years in kernel land, I can de=
al with that, then came arch/powerpc/lib/step.c with the ptesync. This seem=
s like a totally normal instruction that shouldn&#39;t need any extra flags=
 or anything, yet the assembler throws up, and no flag I can think of fixes=
 it. This is a G4 7447. I reverted back to the Debian 5.15. defconfig befor=
e dropping this mail as I had tweaked my config to be more G4.<div dir=3D"a=
uto"><br></div><div dir=3D"auto">Best regards.</div><div dir=3D"auto">Micha=
el Heltne</div></div>

--000000000000b55cb205d53989ce--
