Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9619EF0B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:16:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXfx45GxzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:16:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bn2nl4eq; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wXc90nvfzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:13:45 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id x16so13113575ilp.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tr1Ryw65VhOvk3m5+ACJJuQ36awxae0foxLzvaXT+Rc=;
 b=Bn2nl4eq8BB2ZKi4J8DvgtFkJ49z9XvCgAAaHTOPnLupvspsxRYNrzbRxecgPvkh6J
 Ze74qBrszLcI/hFUVBNXqcyDiYc9nm4p/2y9W3/Dyz0JQdx6TLspNKb5httdYS97ocN5
 jbvNVkjaf2tvb6kcYC8vGwIQ89KWlYoFaiIneRC06yr4VIyGXSYKJ7rGeOjQ1RgMYqqo
 1weqXYO3aJs9K5aGXkTCHDPFyORPSs5xOHfD7YW3Dmy4LR8UqcMLth7YagAvyCn4oqYG
 LisuKL8NQcpH/vKi+KL1bEAL8DEmxe+iqCJegFycJOIBMFA9RAW9720LllOHnR8dukGm
 3RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tr1Ryw65VhOvk3m5+ACJJuQ36awxae0foxLzvaXT+Rc=;
 b=Csm4nqWkquTtQaX88H5BZsjgKtAyz2ugVsaJJsD534Pd9fnmAL5vmq263CTpnr5QGC
 NiwYwljErvUXh4R7evGIy6shSEgUwIiI8elevEFV1WSRZIKljgQb3n3YQ9WOsUGQnk0g
 qSx4TMmyfAZn8W6Sn9YdxIx1aLra90C7LINSafsDfltyOgNgG5x6mWkTe8+MedLIi0FR
 0UxuqqxUfTYu3Uo5pPFKyl6yybfbXfM3Ac3B+M1uWRDmqYFnaaXZbE51gboajTX7sxxo
 WOejVGSwlDFOWbWUERYldd9XmHSl7/QlvFtx0/jZzjSPVoFt9Xnhra/26D3ISFUJyzLN
 n5MA==
X-Gm-Message-State: AGi0PuZNpGXnqOMspON3+ltZDYCrJzmrAwL8RRTKxP/hrbgER+ttN6ez
 /mlPO1QzkJd6LGMqP4ULVbTrIhCNDe4cJ8oVw8KcY+AyKq0=
X-Google-Smtp-Source: APiQypLctLPWysDkyb6i/E2KOEUufZlwX841KcPj07wNMqkZtrKXqXFzHg1U9vo/hFePDp1ni4Sb3bHJDeI0jsVW2cs=
X-Received: by 2002:a92:ce51:: with SMTP id a17mr19598576ilr.263.1586135621955; 
 Sun, 05 Apr 2020 18:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
In-Reply-To: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Mon, 6 Apr 2020 09:13:28 +0800
Message-ID: <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> > Here needs a NULL check.
quite obvious?
>
> I find this change description questionable
> (despite of a reasonable patch subject).
>
>
> > Issue found by coccinelle.
>
> Would an information like =E2=80=9CGenerated by: scripts/coccinelle/null/=
kmerr.cocci=E2=80=9D
> be nicer?
Yeah, but I think It was enough.
>
>
> > ---
>
> Will a patch change log be helpful here?
I realized I should write some change log, and the change log was meaningle=
ss.
So I left it blank.
>
> Regards,
> Markus
