Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0F83B647
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 01:57:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kbbqTVLP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL2Vc38c5z3cRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 11:57:44 +1100 (AEDT)
X-Original-To: Linuxppc-dev@lists.ozlabs.org
Delivered-To: Linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kbbqTVLP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=sombat3960@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKcqz5C5Tz3bT8
	for <Linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 19:41:18 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-42a35c720b8so18847651cf.3
        for <Linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706085673; x=1706690473; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gvq+ttDVPHi4+fI5hSo5QJaJa4G/QgEunTiJqZDVMQg=;
        b=kbbqTVLPvyXE2eNanp9VEnBiaiHDPIGNVppfPlNDERCqh9J/g5wsRP3esjSzm+r9X1
         9ME0z96vn0Y+Zo16flXCbcWTa1X6pKOgcT5THok12+UZBWHemsVsQxBxKL0U/ut7fPbs
         nNaRgS3tB7m4rCC0HtbqvmWarYIZXGyvEarY1/uBljgtGDytdnyfI7ndDQc2sQcSfene
         PUwoLw/EhNg0FYNgrhi2/4ebaCGLz0+iC8SYyEhY/qmhdPporfhQeAM4pXFwdo4RC7Jo
         Gdcqh/ms3BQa6VsYrlwIoJ+2CAVElGdvo3A19K//k6yZG9MT5s/o3eQxpTgvyfZozrEV
         NN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706085673; x=1706690473;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvq+ttDVPHi4+fI5hSo5QJaJa4G/QgEunTiJqZDVMQg=;
        b=B2yrIb9Liu8U28HeWDuZXqvDzL2QKLf/SZg2FlUeMFYZub5r4SlBC/MKNDiDhw3GG/
         g8fNWLExZyLbjWp2SID7XwgmUdefzdC6V/MiaAt1CwBZVI+dCNH1Ca7qiH/FgWedAU1U
         xsLbgIb/qWwUwHXrybXpuO/jM5a+5e0/cF0RAxQy592dA55Ym4kwj/N0Pa0MDSV3V9Oy
         wIUUIHf35E0EqW63Z+7dL689Zx7rn1ekuR5h8ruMIuSU2aSsQ+sg/niV29YPwyVuepGT
         7naAQ5/H+UBT2rvp12dQ/UDAn7vmBHKmqbquC5eOKSUIpNSCY7aAAAjAE9AjojsVFpHi
         dZeQ==
X-Gm-Message-State: AOJu0YwdW2Doz++aVGno4CtXzmAORcjkvsBe5nD2zYOPrZ+sEq4D7Yw+
	hUO8j7TWKrab6u4d0+fATL5wPMUocjGttXY2RbVNJU7uZmy58VHHhHvobDVsng/AhPE/9zEAwxe
	4jopDXb4R/PmlYkkKUkb8oR7rVKMzUXbeiBU=
X-Google-Smtp-Source: AGHT+IHLFwyf2KGHMjf1jnPmJIJlt8LoN470IYLY4AO1WoU8D6eGBWKbJhA2625PCqCjVl4/G56Kml0VKeKGXrNOYQY=
X-Received: by 2002:ac8:5bca:0:b0:42a:632a:e676 with SMTP id
 b10-20020ac85bca000000b0042a632ae676mr33389qtb.122.1706085673123; Wed, 24 Jan
 2024 00:41:13 -0800 (PST)
MIME-Version: 1.0
From: sambat goson <sombat3960@gmail.com>
Date: Wed, 24 Jan 2024 15:41:02 +0700
Message-ID: <CAC1vu61dspNPx7eVSsV1htnC0d+p4m3pzuv+9jQcyAFJEF4Y3w@mail.gmail.com>
Subject: ps3_gelic_net.c issue (linux kernel 6.8-rc1)
To: Linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="00000000000081061a060fad069a"
X-Mailman-Approved-At: Thu, 25 Jan 2024 11:57:05 +1100
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
Cc: Geoff Levand <geoff@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000081061a060fad069a
Content-Type: multipart/alternative; boundary="000000000000810618060fad0698"

--000000000000810618060fad0698
Content-Type: text/plain; charset="UTF-8"

Hi,
I've just test it and find below code not proper in function
"gelic_descr_prepare_rx", line 398.
it causes error as my attached file.

descr->skb = netdev_alloc_skb(*card->netdev, rx_skb_size);
if (!descr->skb) {
descr->hw_regs.payload.dev_addr = 0; /* tell DMAC don't touch memory */
return -ENOMEM;
}
descr->hw_regs.dmac_cmd_status = 0;
descr->hw_regs.result_size = 0;
descr->hw_regs.valid_size = 0;
descr->hw_regs.data_error = 0;
descr->hw_regs.payload.dev_addr = 0;
descr->hw_regs.payload.size = 0;
descr->skb = NULL;                     ---->line 398

Best regards,
Sombat T.

--000000000000810618060fad0698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I&#39;ve just test it and find below co=
de not proper in function &quot;gelic_descr_prepare_rx&quot;, line 398.</di=
v><div>it causes error as my attached file.</div><div>=C2=A0<br></div><div>=
	descr-&gt;skb =3D netdev_alloc_skb(*card-&gt;netdev, rx_skb_size);<br>	if =
(!descr-&gt;skb) {<br>		descr-&gt;hw_regs.payload.dev_addr =3D 0; /* tell D=
MAC don&#39;t touch memory */<br>		return -ENOMEM;<br>	}<br>	descr-&gt;hw_r=
egs.dmac_cmd_status =3D 0;<br>	descr-&gt;hw_regs.result_size =3D 0;<br>	des=
cr-&gt;hw_regs.valid_size =3D 0;<br>	descr-&gt;hw_regs.data_error =3D 0;<br=
>	descr-&gt;hw_regs.payload.dev_addr =3D 0;<br>	descr-&gt;hw_regs.payload.s=
ize =3D 0;<br>	descr-&gt;skb =3D NULL;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ----&gt;line 398<br></div><div><br></div><div>Best regards,</div>=
<div>Sombat T.<br></div><div><br></div><div><br></div></div>

--000000000000810618060fad0698--

--00000000000081061a060fad069a
Content-Type: text/plain; charset="US-ASCII"; name="dmesg-6.8-rc1.txt"
Content-Disposition: attachment; filename="dmesg-6.8-rc1.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lrrj94xr0>
X-Attachment-Id: f_lrrj94xr0

WyAgIDE0Ljg1MTI2MF0gQkUgUEFHRV9TSVpFPTRLIE1NVT1IYXNoIFNNUCBOUl9DUFVTPTIgTlVN
QSBQUzMKWyAgIDE0Ljg1MTM2NF0gTW9kdWxlcyBsaW5rZWQgaW46IHBzM19nZWxpYygrKSBwczNm
YiBwczNyb20gc291bmRjb3JlIHBzM19scG0gdXNiX2NvbW1vbiBzcHVmcyBmdXNlIGNvbmZpZ2Zz
IGF1dG9mczQKWyAgIDE0Ljg1MTY2M10gQ1BVOiAxIFBJRDogNTc4IENvbW06ICh1ZGV2LXdvcmtl
cikgTm90IHRhaW50ZWQgNi44LjAgIzEKWyAgIDE0Ljg1MTc3OV0gSGFyZHdhcmUgbmFtZTogU29u
eVBTMyBDZWxsIEJyb2FkYmFuZCBFbmdpbmUgMHg3MDIxMDAgUFMzClsgICAxNC44NTE4OTJdIE5J
UDogIGMwMDAzZDAwMDAwN2VjNDAgTFI6IGMwMDAzZDAwMDAwN2ViZmMgQ1RSOiAwMDAwMDAwMDAw
MDAwMDAwClsgICAxNC44NTIwMjFdIFJFR1M6IGMwMDAwMDAwMDRmM2VmODAgVFJBUDogMDMwMCAg
IE5vdCB0YWludGVkICAoNi44LjApClsgICAxNC44NTIxNDBdIE1TUjogIDgwMDAwMDAwMDIwMGEw
MzIgPFNGLFZFQyxFRSxGUCxJUixEUixSST4gIENSOiA4NDIyMjgyMCAgWEVSOiAwMDAwMDAwMApb
ICAgMTQuODUyMzg3XSBEQVI6IDAwMDAwMDAwMDAwMDAwYzAgRFNJU1I6IDQwMDAwMDAwIElSUU1B
U0s6IDAgCiAgICAgICAgICAgICAgIEdQUjAwOiBjMDAwM2QwMDAwMDdlYmZjIGMwMDAwMDAwMDRm
M2YyMjAgYzAwMDNkMDAwMDA5MTEwMCBjMDAwMDAwMDAyM2ZmNDAwIAogICAgICAgICAgICAgICBH
UFIwNDogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwOTA4IDAwMDAwMDAwMDAwMDAwMDIg
ZmZmZmZmZmZmZmZmZmZmZiAKICAgICAgICAgICAgICAgR1BSMDg6IDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMCBjMDAwMDAwMDA2N2M3ZTgwIDAwMDAwMDAwMDAwMDAwMDIgCiAgICAg
ICAgICAgICAgIEdQUjEyOiAwMDAwMDAwMDQ0MjIyODI4IGMwMDAwMDAwMDdmZmZiODAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIAogICAgICAgICAgICAgICBHUFIxNjogMDAwMDAw
MDAwMjJkOWU4MCAwMDAwMDAwMGZmOWFkNjE0IDAwMDAwMDAwZmY5YWQ2MTggMDAwMDAwMDAwMjJk
OWU4MCAKICAgICAgICAgICAgICAgR1BSMjA6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDBm
NDI0MCAwMDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwMDY3YjgxYzAgCiAgICAgICAgICAgICAgIEdQ
UjI0OiBjMDAwMDAwMDAxNjc3NjQwIDAwMDAwMDAwMDAwMDAwMDAgYzAwMDNkMDAwMDA4YWIwMCBj
MDAwMDAwMDA2N2JiM2EwIAogICAgICAgICAgICAgICBHUFIyODogMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwMDY3YjgwMDAgYzAwMDAwMDAwNjdiYjNhMCAKWyAgIDE0
Ljg1MzgxM10gTklQIFtjMDAwM2QwMDAwMDdlYzQwXSAuZ2VsaWNfZGVzY3JfcHJlcGFyZV9yeCsw
eGEwLzB4MTM0IFtwczNfZ2VsaWNdClsgICAxNC44NTM5OTNdIExSIFtjMDAwM2QwMDAwMDdlYmZj
XSAuZ2VsaWNfZGVzY3JfcHJlcGFyZV9yeCsweDVjLzB4MTM0IFtwczNfZ2VsaWNdClsgICAxNC44
NTQxNTddIENhbGwgVHJhY2U6ClsgICAxNC44NTQxOThdIFtjMDAwMDAwMDA0ZjNmMjIwXSBbYzAw
MDNkMDAwMDA3ZWJmY10gLmdlbGljX2Rlc2NyX3ByZXBhcmVfcngrMHg1Yy8weDEzNCBbcHMzX2dl
bGljXSAodW5yZWxpYWJsZSkKWyAgIDE0Ljg1ODY0Ml0gW2MwMDAwMDAwMDRmM2YyYjBdIFtjMDAw
M2QwMDAwMDgwMjQ0XSAucHMzX2dlbGljX2RyaXZlcl9wcm9iZSsweDY5MC8weDdhYyBbcHMzX2dl
bGljXQpbICAgMTQuODYzMTEzXSBbYzAwMDAwMDAwNGYzZjNjMF0gW2MwMDAwMDAwMDAwNDM3MWNd
IC5wczNfc3lzdGVtX2J1c19wcm9iZSsweDVjLzB4NmMKWyAgIDE0Ljg2Nzc0OV0gW2MwMDAwMDAw
MDRmM2Y0NDBdIFtjMDAwMDAwMDAwM2Y3ZjI4XSAucmVhbGx5X3Byb2JlKzB4MThjLzB4MzMwClsg
ICAxNC44NzIxOTZdIFtjMDAwMDAwMDA0ZjNmNGQwXSBbYzAwMDAwMDAwMDNmODFmOF0gLmRyaXZl
cl9wcm9iZV9kZXZpY2UrMHgzNC8weGFjClsgICAxNC44NzY4NjldIFtjMDAwMDAwMDA0ZjNmNTYw
XSBbYzAwMDAwMDAwMDNmODQ2NF0gLl9fZHJpdmVyX2F0dGFjaCsweDExMC8weDEyMApbICAgMTQu
ODgxNTMxXSBbYzAwMDAwMDAwNGYzZjVmMF0gW2MwMDAwMDAwMDAzZjViNzBdIC5idXNfZm9yX2Vh
Y2hfZGV2KzB4ODgvMHhjMApbICAgMTQuODg2MTgwXSBbYzAwMDAwMDAwNGYzZjY5MF0gW2MwMDAw
MDAwMDAzZjc2MjBdIC5kcml2ZXJfYXR0YWNoKzB4MjQvMHgzOApbICAgMTQuODg2MjE5XSBbYzAw
MDAwMDAwNGYzZjcwMF0gW2MwMDAwMDAwMDAzZjZkODhdIC5idXNfYWRkX2RyaXZlcisweGU4LzB4
MjQ4ClsgICAxNC44ODYyNDVdIFtjMDAwMDAwMDA0ZjNmN2IwXSBbYzAwMDAwMDAwMDNmOGRlY10g
LmRyaXZlcl9yZWdpc3RlcisweGVjLzB4MTQwClsgICAxNC44OTkwNjVdIFtjMDAwMDAwMDA0ZjNm
ODMwXSBbYzAwMDAwMDAwMDA0M2MwMF0gLnBzM19zeXN0ZW1fYnVzX2RyaXZlcl9yZWdpc3Rlcisw
eDIwLzB4MzQKWyAgIDE0LjkwMzc3N10gW2MwMDAwMDAwMDRmM2Y4YTBdIFtjMDAwM2QwMDAwMDgz
MzcwXSAucHMzX2dlbGljX2RyaXZlcl9pbml0KzB4MTgvMHgyYyBbcHMzX2dlbGljXQpbICAgMTQu
OTA3NjUzXSBbYzAwMDAwMDAwNGYzZjkxMF0gW2MwMDAwMDAwMDAwMGRhODhdIC5kb19vbmVfaW5p
dGNhbGwrMHhhYy8weDIyOApbICAgMTQuOTExNjM1XSBbYzAwMDAwMDAwNGYzZmEwMF0gW2MwMDAw
MDAwMDAwZDZmMDRdIC5kb19pbml0X21vZHVsZSsweDgwLzB4MjY4ClsgICAxNC45MTU1MjVdIFtj
MDAwMDAwMDA0ZjNmYWEwXSBbYzAwMDAwMDAwMDBkOGUwMF0gLmluaXRfbW9kdWxlX2Zyb21fZmls
ZSsweGE0LzB4YTgKWyAgIDE0LjkxODk3NF0gW2MwMDAwMDAwMDRmM2ZiYzBdIFtjMDAwMDAwMDAw
MGQ4ZjUwXSAuaWRlbXBvdGVudF9pbml0X21vZHVsZSsweDE0Yy8weDI2MApbICAgMTQuOTIyNDI3
XSBbYzAwMDAwMDAwNGYzZmNmMF0gW2MwMDAwMDAwMDAwZDkwYmNdIC5fX3NlX3N5c19maW5pdF9t
b2R1bGUrMHg1NC8weDc4ClsgICAxNC45MjU4MTVdIFtjMDAwMDAwMDA0ZjNmZDgwXSBbYzAwMDAw
MDAwMDAxYzllY10gLnN5c3RlbV9jYWxsX2V4Y2VwdGlvbisweDE4MC8weDFlNApbICAgMTQuOTI5
MzQyXSBbYzAwMDAwMDAwNGYzZmUxMF0gW2MwMDAwMDAwMDAwMGIzNTRdIHN5c3RlbV9jYWxsX2Nv
bW1vbisweGY0LzB4MjU4ClsgICAxNC45MzM3NjldIC0tLSBpbnRlcnJ1cHQ6IGMwMCBhdCAweDQ2
YmYwYwpbICAgMTQuOTM4NDQ5XSBOSVA6ICAwMDAwMDAwMDAwNDZiZjBjIExSOiAwMDAwMDAwMDAw
NTdiNzA4IENUUjogMDAwMDAwMDAwMDAwMDAwMApbICAgMTQuOTM4NDY1XSBSRUdTOiBjMDAwMDAw
MDA0ZjNmZTgwIFRSQVA6IDBjMDAgICBOb3QgdGFpbnRlZCAgKDYuOC4wKQpbICAgMTQuOTM4NDc3
XSBNU1I6ICAwMDAwMDAwMDAwMDBjMDMyIDxFRSxQUixJUixEUixSST4gIENSOiAyNDIyMjQ4OCAg
WEVSOiAwMDAwMDAwMApbICAgMTQuOTM4NTI3XSBJUlFNQVNLOiAwIAogICAgICAgICAgICAgICBH
UFIwMDogMDAwMDAwMDAwMDAwMDE2MSAwMDAwMDAwMGZmOWFkNDQwIDAwMDAwMDAwZjdlNDA1MjAg
MDAwMDAwMDAwMDAwMDAwNiAKICAgICAgICAgICAgICAgR1BSMDQ6IDAwMDAwMDAwMDA1ODczNTQg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDA2IDAwMDAwMDAwMDAwMDAwMDAgCiAgICAg
ICAgICAgICAgIEdQUjA4OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIAogICAgICAgICAgICAgICBHUFIxMjogMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwYWVmNzM0IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCAKICAgICAgICAgICAgICAgR1BSMTY6IDAwMDAwMDAwMDIyZDllODAgMDAwMDAwMDBmZjlh
ZDYxNCAwMDAwMDAwMGZmOWFkNjE4IDAwMDAwMDAwMDIyZDllODAgCiAgICAgICAgICAgICAgIEdQ
UjIwOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwZjQyNDAgMDAwMDAwMDAwMjJiYzAyMCAw
MDAwMDAwMDAwMDAwMDAwIAogICAgICAgICAgICAgICBHUFIyNDogMDAwMDAwMDAwMjJkOWU4MCAw
MDAwMDAwMDAwMDAwMDA3IDAwMDAwMDAwMDIyZGIwYTAgMDAwMDAwMDAwMDU4NzM1NCAKICAgICAg
ICAgICAgICAgR1BSMjg6IDAwMDAwMDAwMDAwMjAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwNWE3Y2I0IDAwMDAwMDAwMDIyZDllODAgClsgICAxNC45NTE1OTddIE5JUCBbMDAwMDAwMDAw
MDQ2YmYwY10gMHg0NmJmMGMKWyAgIDE0Ljk1MTYxMl0gTFIgWzAwMDAwMDAwMDA1N2I3MDhdIDB4
NTdiNzA4ClsgICAxNC45NTE2MjVdIC0tLSBpbnRlcnJ1cHQ6IGMwMApbICAgMTQuOTUxNjM1XSBD
b2RlOiAzODYwZmZmNCA0ODAwMDA2NCAzYmEwMDAwMCAzOTIwMDAwMCBmYmJmMDAxMCAzOGMwMDAw
MiA5MTNmMDAwYyAzOGEwMDkwOCA5M2JmMDAxYyBmYmJmMDAwMCBmYmJmMDAzMCBlODdlMDFiMCA8
ZTg5ZDAwYzA+IDM4NjMwMDU4IDRiZmZmYjk1IDJjMjNmZmZmIApbICAgMTQuOTUxNzU5XSAtLS1b
IGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KCg==
--00000000000081061a060fad069a--
