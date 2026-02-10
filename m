Return-Path: <linuxppc-dev+bounces-16755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPkNNG6himniMQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 04:09:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A4116AE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 04:09:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f963t1WDrz2xqm;
	Tue, 10 Feb 2026 14:09:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1030" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770692970;
	cv=pass; b=NSzY/gYgxCBy+u+PD+xHdgqDUna1GyvDUFEhvTCKBaMex4hBRN3EMfBqjnooRrIg+qJ871uGAT2+gcPFItqxvvyzeizD/1IRpdwpx24nEiZiDVrAjTofTXXfW9XGC2YAmRXNLyQiilUQF/myPgX601tGlo0FF/z+vmcxXC7tQkHWk0PFK592G6S/Y2q5SJPyyhTp4Q9d526rnPDTM3nSrEdf7lETkBI5BrfabD21dszFTij9spDTbIQpO+fGFymWLycvxcMVJckY32Ixwr9nMsOJwHqoMCiW50l5NMwMMAFQ1cVYTI0YYAHVGxwKD2e40pcdloooJihRkPJO/d9fVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770692970; c=relaxed/relaxed;
	bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiswfkecHUAjnC/0neC/LdLgmLYg0BkjSjz+S5hW3aj3HFWQYdaZX9ciKriHXNGIcshdojvbWJiUTwgoWcaPVvbyz9a/5BeL5WsPZXIIl5pdy0XTiNcUZAOVmRa8Xzb06GhgSUpBeNb8LwPEQGTsifdddauSxmN3NZfx8MesWftmqPvvEeSXK7eYw1W6ZjPOgVjs0mz90MhA80ziXzqacDxoLc/KNYkeNpDRZ/z+XU+3O8zB/5XfbXMrFEwuwprGDwHcZW+CJzJEW1XlZT0yF5EQpQ6bR2uzPbYt0r9qXtfIHHOvzD2GQz3hyRZKE9o+EMwGm1nFjKJ2DGYxsHFVFQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYFysNtz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYFysNtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f963r6KWhz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 14:09:28 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-352f60d6c2fso2488624a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770692965; cv=none;
        d=google.com; s=arc-20240605;
        b=PwhuRI422bk+fbKjw5pU4zmwnMcuAxq8KV/J6SOm/ucW7/vvLLfp3rJRAyVAGd7foA
         9KUBgNPLCRmL0ZrTMXfYG7nlZsKPqQN/gqd3imq8/ut1MCltgcjvpgx2e1ETdwc/P7Au
         Bs6t0DK+FVutBla0vopFvJW8ZeBbp5OW2WtpauEP6r+eixoGq7mu6yre7jn/hvUAJzOq
         nAgXZpZjT15/3D90ffzU12GWO5pfKNNagQ9rvJWDOAg3WZFpXEFI0J8aaDEp4xVnxawi
         iAJQ92UcLNN1wQUDW5uri1CANAmepxcl30IY33oJ1XQ3H4hoWC+w71ngJRNSJrBZv1y6
         05Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        fh=bfRrJzL9U97SGw4+PARdoUTUC7RodvJ0ufyrWWTOxbQ=;
        b=BPAYudZLl+8RenJH5UIeESQOS4eQpf6BJtoITaD/UA3uxcBXNDw/oOZiogUbIuUV/5
         99i1VbwGhxS7XMSzU+Ldc5YcP5iS80DMlroXm2sFHj+1Wo4IlOej3++kl70l+gBM0lSu
         HjS5ef+sN3W8ei26UxBigFGJmllJ2VJBQZwKMtix77zq/B+/WrMdYS+DvM+cISxJzOCm
         hZBo0grCrZsAu79KNyvQjSeJ1yrSRX0OKmD1uQdQor1LmV+CH7ecE1iSb5YQSSJxJaiH
         jMWqE7AefuFUpoD8kZUvKMBwDvDM1+vRRYE/V8Hb/xe6GHNa0nU0hjTWKn7LF/e28X3F
         M9xA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692965; x=1771297765; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        b=WYFysNtzmHAwBdtY5QG4LFoB80gLrO6wUn8qz1tDVYGYawlWX5hPJX2uPm5pzRJlQx
         LEk2rPE/tP2jV7s+pWrOnYSZ7j51hHjr924cYZEW8vpv5O6PLStiMijOPzDXYCxPzECo
         exLbDveXeI6wvKB4mUpp/2TZL84yPpj5OJB9bf+hWnKfCI2ZvOdXUJmv3ru2z/kM9ZsL
         flH5MpYFhTV6GVva9OvGR6E+xEhuLOMxWvWpjQ6bB01oCyA7XIPPVMR38LbXydpEkppQ
         m2AzeTVhV9YBHzENQH/jjZCT3Bgz0j+MM6qHXYSed70Qh99lYxNK1RsyRgaYxfLTE4bm
         tr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692965; x=1771297765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        b=cSB+AgVIm50JUyh7dOy6ZQRXRABpO3V4bTVVhmpdH8dT8kBGJsKIkOmOKjNaSfBm8u
         a4YczE3+OMKtrc0eVW1XIGqB1HidlWyk/cAHx1pw846hK8SUhJiHvih8/IJis3L7bZjZ
         DCYbPs5TVHSONjH435kyUogxkZwISm3RrNvkzbTf2WP0D/tGGW/crTBKFe5rTnwB/pbh
         6Z80Zl3i07lktcGqaBa67yQxI1TUY90X4izON0i+OHuB5+fTEwSyXRNk13pZgX0dFpaV
         6paIKurnP8tJvGgiXhiCNXH+V/s+fq8FQN/lb1ay1Q/9lcY1fD6HPkKEyQp+zgLb8H2i
         IO/g==
X-Forwarded-Encrypted: i=1; AJvYcCXpF8sm/yG1dLboYUY/Qz0Pslugijd6aXuk7FL9qHKECfRzU/9Rr2LX36FvtsheFro+H52g75qwuDxfYMc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSXeHfdN7oL4EG8ga+sKbGjQUr4hBIAEbLvheMzi6jBxVaKKN8
	K41HrUXU+c2Wj8iB1Sr3Ojs+nfC2mANrI7lbqsW9Vr5Z2q6maxeqHAOS6EXo0/jevM5oVEsX1l0
	Z0Avz2IdLLeG6Nqqcd2GABRMmZR5gKR8=
X-Gm-Gg: AZuq6aKw9/oYZ7Va11Rqmmz9ItDTci+bNM5fg9tl8+4pdGKr4hv7W09P2cvAKtAxKF/
	Xu9EmitHfAEhAS8K5woiYZ3XUXA7iH+WVg2a/J0GAbk5sYAbZ5l/beKAzwjItV1c63kn7DXY7QK
	WiBruiO9FdF9Cg1y5Pte34uFLvPtv8A375kzFLEdodiEd6CVD0eaVhiIT0S4fNPuZ9YCvJ8AmOD
	Tl70U9nmrmX1K4kxBDcfeL6vdSLwHhW8uhaI1Fl0Ps04zPpnWncQXDfbohFveUIvIkhPCuJTi6D
	w0/EI7Y=
X-Received: by 2002:a17:90b:2f85:b0:354:a5eb:a64b with SMTP id
 98e67ed59e1d1-354b3c81d39mr14250683a91.12.1770692965280; Mon, 09 Feb 2026
 19:09:25 -0800 (PST)
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
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
 <20260206084334.483404-2-shengjiu.wang@nxp.com> <aYX8qnKiPxHej-Xo@sirena.co.uk>
 <CAA+D8ANHrwN_vL_JmC8ZUQ_FPUcOqvBof=Wrzkmpbexi5iFMQw@mail.gmail.com>
In-Reply-To: <CAA+D8ANHrwN_vL_JmC8ZUQ_FPUcOqvBof=Wrzkmpbexi5iFMQw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 10 Feb 2026 11:09:12 +0800
X-Gm-Features: AZwV_QieFcNU6th1bBV0E2BOZPRwudjIeb-yLtK5EAu3GiRWTXfMqQcIoeeC55s
Message-ID: <CAA+D8ANherWa0p1fw--OkNedyb+Be-PMOC5mLHrD0fjC6L=2qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16755-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:shengjiu.wang@nxp.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1A8A4116AE0
X-Rspamd-Action: no action

Hi Mark

On Mon, Feb 9, 2026 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Feb 6, 2026 at 10:37=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > On Fri, Feb 06, 2026 at 04:43:33PM +0800, Shengjiu Wang wrote:
> >
> > > +     SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),
> >
> > Don't have arrays of enums with magic indexes into them - this is just
> > error prone and hard to follow.  The normal thing is to declare a
> > separtae variable for each enum, or if you *must* use an array use
> > named constants at both ends to index into it (but that's not
> > meaningfully different to just having multiple variables...).
>
> Thanks for the comments.  I will update it.
>
> >
> > > +     SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(=
FSL_SAI_xTCTL_RTSC), 1, 0),
> > > +     SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_sh=
f(FSL_SAI_xTCTL_RBC), 1, 0),
> >
> > __bf_shf()?
>
> Can we use the __bf_shf() to get the shift of the mask?

Shall I use the definition FSL_SAI_xTCTL_RBC_SHIFT to replace
__bf_shf(FSL_SAI_xTCTL_RBC)?

Best regards
Shengjiu Wang

>
> best regards
> Shengjiu Wang

