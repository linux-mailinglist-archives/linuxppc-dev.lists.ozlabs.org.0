Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7612395A84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 14:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ftvjd04v1z2ykR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 22:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gWoQlUMf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::934;
 helo=mail-ua1-x934.google.com; envelope-from=linasvepstas@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gWoQlUMf; dkim-atps=neutral
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fts5657zkz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 20:30:48 +1000 (AEST)
Received: by mail-ua1-x934.google.com with SMTP id d14so6336129ual.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=V33iArN2REhN5vJJVGvHtEK16jy1yn/24WOcGkreL78=;
 b=gWoQlUMfUCsSHXNFHCCgcmvKr4l/Wo5NWjNjNwq7EF95jmJyyfkQp90geb6ep9iEpE
 Xe2sPiA8K7QSzrvPLdH0qD3DqHhCwzN9jqFXXZS60OGdlDPxZIjV6CA4iW+Cb3y7LqXU
 prZR07Cm/aeXj+L7E79WXk0YdayCDDgJMgJGWeDPrwrP9mVBPWVKzB205q1MNsgcBBFH
 nmFtiNqml8cinn0aNNgUM2XOfai2vRoZX/dryM7z9jqhhuA2hja/SuqEAf+5DcMM1p/B
 cqKiCw89N0xeeZYyZE4Lo1C5Dgd3QD701MXMuov8x0eQ7o7Sa7jhU6sUmIricFJ1RdEX
 RqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=V33iArN2REhN5vJJVGvHtEK16jy1yn/24WOcGkreL78=;
 b=asxHDm2atIS6ZW4sYPFgvAOAPo7JdTRPEnZK9tZnax9otgV8YQbiQFbHDxx9+zNBN0
 bYTstynDWlt/e236y0WhGmV9GhatU+kYIBRPJDSc6AJCVdSuMkWjSyh6FxKQZEzUaCGg
 8EI0wdZoKlm/7bNiJpZLm4qyrtdUYcZQeV+38NQe8O6OwWqmnYbmNyufEw5Z+ZZO3wOP
 SiQc39kFge8scWlUqB43Kt44V2kOfhKIXlQNAhXpZLeSglrR3LzhG8EXH80Oj3SFKOVt
 Bmy6f5OuAEqtOgyFS5GDnGIY4RrCcDvTNfFS8eP0YOa/gJgLZUa9Rj+mX2S/hTtQ05ds
 LFpg==
X-Gm-Message-State: AOAM530HTyS395Cjnevpfg0BFBJuWzK/ImfZNwyERfmTRDe6R1F0juqp
 Wn1cR4eMuqIsU55pu9tOsuST/WI5y96g9mc8e9Y=
X-Google-Smtp-Source: ABdhPJyTKnb1jzzsLdzQysDi9D9ncxgfGSQF+OQ6Ql10wcGlX8FTToVKYfe3a4TcIuwd7jzmWkVo/fKyn8aaZjs4/ig=
X-Received: by 2002:ac5:c5b8:: with SMTP id f24mr6097641vkl.14.1622457043272; 
 Mon, 31 May 2021 03:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210531081215.43507-1-wesley.sheng@amd.com>
In-Reply-To: <20210531081215.43507-1-wesley.sheng@amd.com>
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Mon, 31 May 2021 05:30:31 -0500
Message-ID: <CAHrUA36oJLxJXrQjxygCRztvkSF6bDodqiG1Uhnh5DKfyTDOfg@mail.gmail.com>
Subject: Re: [PATCH] Documentation PCI: Fix typo in pci-error-recovery.rst
To: Wesley Sheng <wesley.sheng@amd.com>
Content-Type: multipart/alternative; boundary="000000000000ba46d605c39db7e4"
X-Mailman-Approved-At: Mon, 31 May 2021 22:28:20 +1000
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
Cc: wesleyshenggit@sina.com, Jonathan Corbet <corbet@lwn.net>,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 oohall@gmail.com, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000ba46d605c39db7e4
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Linas Vepstas <linasvepstas@gmail.com>

On Mon, May 31, 2021 at 3:12 AM Wesley Sheng <wesley.sheng@amd.com> wrote:

> Replace "It" with "If", since it is a conditional statement.
>
> Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>
> ---
>  Documentation/PCI/pci-error-recovery.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/PCI/pci-error-recovery.rst
> b/Documentation/PCI/pci-error-recovery.rst
> index 84ceebb08cac..187f43a03200 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -295,7 +295,7 @@ and let the driver restart normal I/O processing.
>  A driver can still return a critical failure for this function if
>  it can't get the device operational after reset.  If the platform
>  previously tried a soft reset, it might now try a hard reset (power
> -cycle) and then call slot_reset() again.  It the device still can't
> +cycle) and then call slot_reset() again.  If the device still can't
>  be recovered, there is nothing more that can be done;  the platform
>  will typically report a "permanent failure" in such a case.  The
>  device will be considered "dead" in this case.
> --
> 2.25.1
>
>

-- 
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.

--000000000000ba46d605c39db7e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Linas Vepstas &lt;<a href=3D"mailto:linasve=
pstas@gmail.com">linasvepstas@gmail.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 31, 2021 at =
3:12 AM Wesley Sheng &lt;<a href=3D"mailto:wesley.sheng@amd.com">wesley.she=
ng@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Replace &quot;It&quot; with &quot;If&quot;, since it is a condit=
ional statement.<br>
<br>
Signed-off-by: Wesley Sheng &lt;<a href=3D"mailto:wesley.sheng@amd.com" tar=
get=3D"_blank">wesley.sheng@amd.com</a>&gt;<br>
---<br>
=C2=A0Documentation/PCI/pci-error-recovery.rst | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/p=
ci-error-recovery.rst<br>
index 84ceebb08cac..187f43a03200 100644<br>
--- a/Documentation/PCI/pci-error-recovery.rst<br>
+++ b/Documentation/PCI/pci-error-recovery.rst<br>
@@ -295,7 +295,7 @@ and let the driver restart normal I/O processing.<br>
=C2=A0A driver can still return a critical failure for this function if<br>
=C2=A0it can&#39;t get the device operational after reset.=C2=A0 If the pla=
tform<br>
=C2=A0previously tried a soft reset, it might now try a hard reset (power<b=
r>
-cycle) and then call slot_reset() again.=C2=A0 It the device still can&#39=
;t<br>
+cycle) and then call slot_reset() again.=C2=A0 If the device still can&#39=
;t<br>
=C2=A0be recovered, there is nothing more that can be done;=C2=A0 the platf=
orm<br>
=C2=A0will typically report a &quot;permanent failure&quot; in such a case.=
=C2=A0 The<br>
=C2=A0device will be considered &quot;dead&quot; in this case.<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Patrick: Are they laughing at us?</di=
v><div>Sponge Bob: No, Patrick, they are laughing next to us.</div><div>=C2=
=A0<br></div><br></div></div>

--000000000000ba46d605c39db7e4--
