Return-Path: <linuxppc-dev+bounces-16248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKoiD/PRc2kCywAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 20:54:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D957A56F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 20:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyTCd3tB2z2xdY;
	Sat, 24 Jan 2026 06:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::236" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769198061;
	cv=pass; b=hIG4p0jX04MH5UqNHW8wV1ZtPc5DqoAc26ozoFuiIzj6Os97Iu9pN3fBZ/0oTFKK3JUMoA+j092SMr/tBLVX+5JkGUiGAZy9px7miJcVUDVu9f4NOIapeGlnXGcIV/2YVXbfwcw/lCruodn4gxrcmxYPU4g0UcTxzoEIBRnTzO7hlIJCq5qGZagWFGgMrH5fAkbWq1phNrgIF7DaJPVKr7R1cNY5kFXMjsiKVsiwckFWaVlJHO/KjEPbgml/RR0gjb9DeEwK8zPrBgokx+1Pxl1pxfBBd31sLt2Z26+oMKtlLzWwsEcrM73CYa2UewW2/jtsZCeiGYgHMpbTtzg85Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769198061; c=relaxed/relaxed;
	bh=zO3VrxRnWGj97aVRX3jnUzfNVbMorwa3LMbAwfEOSe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZxozrQc1I4gPJvKBMulCVERpX3AvUMLRz+CZk8UzW4CVeQIADQ2OBpm+LWTUerYSeh8/+DMIG6dbGefJcQWQJ0pbL6nNSkaIauyLk+nytNrSh3uMXyNQCcRJct83/UP2DwVC0Y5T+NQ4MO2jSC1OmQkFkblyYWEJGFgiiiAKzAcSsqZErjv7dutgt/tHP7+3hAJXPPVbDxUfh5rO5eOXU58i01zcnA8nHYjSbNpWNfDiuVCa18Vi4zi7U4NyZTF/gv574GJ0/xP2AkjtIdwmRPGQVc1BV2csO2vQkekDVNUxF581XNMOLQR0ZKZ2/Sm2J7/911QfEPq1GjAzmBtdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LkkKuZ7I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=sohammetha01@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LkkKuZ7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=sohammetha01@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyTCZ71h9z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 06:54:17 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-382fe06aa94so20836421fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 11:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769198052; cv=none;
        d=google.com; s=arc-20240605;
        b=g6gMpE9VubXyRaOwRMvkmjJUtih6kwbEK6cu/o9jMlThovd5Mo27RLi6opAUFuEWxu
         xDYebkYFH/35MwGElvu3Xjy7rx1Ir+dmVTKFq0SWRbf7OW6nYlOth+2b5zUCnG44+iV6
         eEMi3SMfULgg0G5jqZwlfsHidBP2kqqBLZFGkwuKTIqJLNj/ZWs6Umn13ib5A/oiqGMA
         j1M0vtrVtykkb6qwFEq+Jzy6OYd7DtpNr7qHjlVejU7s4iGgm0/+HWJoAL9iBzR0TfYS
         GPkVeo2BGLlsJyzjVudRBnrxbzeVO4JVXDGo4ZbC48xdLztj33WTN4quGYP962zIabG5
         wNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zO3VrxRnWGj97aVRX3jnUzfNVbMorwa3LMbAwfEOSe4=;
        fh=VAEim9C/js+seQ5daArnQPs12vO/Fgf3vSPwDqV3BnY=;
        b=GXFkGr4fTavt5xTHlmrJXLzkPWtlKFNXh8JMZ5lOq+trvZkuF1DkTDk63SWBBaKHjC
         /Ubg2D7njrcZKOhddW9V7DKDBR7xWBiUdi+6ZCczUoyX5j9/X9YlfHeKaJP7EMNGvFCm
         mFK3sopUXmNtvMyIPF2YocbEROVVJGaMMlVB5Vpv/4cY+ZgrjOtlme4CA33envTR0IP2
         FLLOzwVkHmHVC3IAJ5dqYRhqRfeZ02zTWq6GxVp/fQ3gH0mf1zjAcnz8N8j8r8VYbFmX
         BzRTiYrKRrTeqyL64M7umifkBCeesb0bzkpXipq04mQMYF1/rtsO6x5bh1aMZbYLLSqf
         8qQA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198052; x=1769802852; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3VrxRnWGj97aVRX3jnUzfNVbMorwa3LMbAwfEOSe4=;
        b=LkkKuZ7IYet1EgFUqZ/4JZjKaToWBj40Atcdgil3AWYBrMMCXcvWB4rc5wLVpGcl64
         s8hXdc9spjYdca3InzoTbSrriIlmNg9We+LodNbLR3PQMrQZt/WSILknza1HmP1CtxhD
         r0eSX9tmQMA16lfNj4b7OJwXUjOBE2+ABMZ1wrhELLATFeopYjVHagIOp3DBrYsnuzzx
         XBlKtT01MvoIivnQIwVC/aQf1YmojntOQb+o1lWTFxO0F8utKvzmwTlcZJehwVvwCcjo
         PmJwyDR8NMWd+vld3gNFpey0hVtWnuRuA5mFsfPHeANUNJVt0C+Wb91vWK1MWJx/vNmC
         5QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198052; x=1769802852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO3VrxRnWGj97aVRX3jnUzfNVbMorwa3LMbAwfEOSe4=;
        b=tBB3+gI5f4LGBx8xRx/EPrXFclHvp1g5Crl+6aPVFEdbsDDeEqKLM4kQfYFl9mOGvE
         INkAYTDEGmq/Fne0rxa/SOsin57W6CvdaMx4QR8wAi6J0ZLwKBiDSfkkW9AX/ghSoKpA
         2qWKaFFNKTQ/Lh96sNy4z2OsLjQCduX0yL8d7C8lCBUBcD3JqCmutFROK/LxSoBZ7sGd
         KnSGhcZeyvy5ay5MZQAvlxfexMg01oSvCbP0XiTUu+fyU1yrwUkhCJp9x5rw8wfz3fsZ
         Y43MOag4XI2fGW7tZG43bszk3rrjlWLX4Tq78RX/GXYDriI1q/NUPlc1yFr+/vCGQuSe
         y3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0KdhOu7ix544/07DSpe5XddIGuxkL+VqnYIONKJDC264sEt+aZ6aO5T0HwcWudG9J6u+6Fvip1BxQk/c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJ4QKsNavNd+CqQpIDDq3FRRo8UsmrUm5vJ1hOE7QkCnpZygVT
	sKahM1NUGWfF+RkBkXHDY8HqTlcVmMv8P/5nyfWr+pzhdOnb3zyYWihAMvNU2ruMW3oIMExNfA0
	28f5MaCm4vYzVyNfkmNchNwUoGVD0abY=
X-Gm-Gg: AZuq6aJoDs4aogERRbG3NMb6b5tI997ZIF3Zsez7t6BIikm71gKqRbBvw/MSJK/eEax
	LMq1guIs6rZ2MYqmAbZp59Cwffa+fpdkkt0mDU3rTRtgxi0H5b1fm9jkpnCPvZ5MmIO6U5dIWr0
	tVu1pNeCv4A5wRaZ172LEYzRsVZXQOPkaZXqmQm2/V6H+5A9wV2VgoVgr4UYZEeEvkPQC/+DIz8
	urLyvK7hvJM5Y8WyzlymzX4e5uXD8Mnmv7+zSUJZESvf1vFUXWBImHOy9WHFkGrofwGzG3UxA==
X-Received: by 2002:a05:651c:4189:b0:385:bb79:77a9 with SMTP id
 38308e7fff4ca-385da117091mr11428681fa.41.1769198051944; Fri, 23 Jan 2026
 11:54:11 -0800 (PST)
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
References: <20251203191706.58901-1-sohammetha01@gmail.com>
In-Reply-To: <20251203191706.58901-1-sohammetha01@gmail.com>
From: Soham Metha <sohammetha01@gmail.com>
Date: Sat, 24 Jan 2026 01:23:59 +0530
X-Gm-Features: AZwV_Qg-yzjlXVxw7ViCOQhehAY55UrAcA_f3p4sSjNNUB2_reibOKbPTg7ueWk
Message-ID: <CAPZAGA-jkWXnAWqWzLQ7DEac9n4cPe8+NVzxQbWF0WMej4V+1A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mpic: Fix dead link to fsl/mpic.txt
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>, 
	Thorsten Blum <thorsten.blum@linux.dev>, linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006c6d6806491385cc"
X-Spam-Status: No, score=0.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16248-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sohammetha01@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel-mentees@lists.linuxfoundation.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:tglx@linutronix.de,m:jirislaby@kernel.org,m:ricardo@marliere.net,m:thorsten.blum@linux.dev,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,linutronix.de,marliere.net,linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.508];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sohammetha01@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 72D957A56F
X-Rspamd-Action: no action

--0000000000006c6d6806491385cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a gentle ping on this documentation patch in case it was missed.
Please let me know if any changes are needed.

Thanks!
Soham

On Thu, 4 Dec 2025, 12:47=E2=80=AFam Soham Metha, <sohammetha01@gmail.com> =
wrote:

> Update the reference to the old 'fsl/mpic.txt' binding, which was removed
> in
> commit 326d25198112 ("dt-bindings: powerpc: Drop duplicate fsl/mpic.txt")=
.
>
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
>
>  arch/powerpc/sysdev/mpic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index ad7310bba00b..b6c7b7dc1622 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -1105,7 +1105,7 @@ static int mpic_host_xlate(struct irq_domain *h,
> struct device_node *ct,
>                  * First two cells are as usual.  Third specifies
>                  * an "interrupt type".  Fourth is type-specific data.
>                  *
> -                * See
> Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
> +                * See
> Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
>                  */
>                 switch (intspec[2]) {
>                 case 0:
> --
> 2.34.1
>
>

--0000000000006c6d6806491385cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Just a gentle ping on this documentation patch in case it w=
as missed.</div><div dir=3D"auto">Please let me know if any changes are nee=
ded.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div d=
ir=3D"auto">Soham</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 4 Dec 2025, 12:47=E2=
=80=AFam Soham Metha, &lt;<a href=3D"mailto:sohammetha01@gmail.com">sohamme=
tha01@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upda=
te the reference to the old &#39;fsl/mpic.txt&#39; binding, which was remov=
ed in<br>
commit 326d25198112 (&quot;dt-bindings: powerpc: Drop duplicate fsl/mpic.tx=
t&quot;).<br>
<br>
Signed-off-by: Soham Metha &lt;<a href=3D"mailto:sohammetha01@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">sohammetha01@gmail.com</a>&gt;<br>
---<br>
No functional changes.<br>
<br>
=C2=A0arch/powerpc/sysdev/mpic.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c<br>
index ad7310bba00b..b6c7b7dc1622 100644<br>
--- a/arch/powerpc/sysdev/mpic.c<br>
+++ b/arch/powerpc/sysdev/mpic.c<br>
@@ -1105,7 +1105,7 @@ static int mpic_host_xlate(struct irq_domain *h, stru=
ct device_node *ct,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* First two c=
ells are as usual.=C2=A0 Third specifies<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* an &quot;in=
terrupt type&quot;.=C2=A0 Fourth is type-specific data.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * See Documentatio=
n/devicetree/bindings/powerpc/fsl/mpic.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * See Documentatio=
n/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (intspec[2])=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000006c6d6806491385cc--

