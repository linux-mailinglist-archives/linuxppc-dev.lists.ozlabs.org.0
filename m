Return-Path: <linuxppc-dev+bounces-4112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A369F1046
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 16:07:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8t3l0pBfz30hf;
	Sat, 14 Dec 2024 02:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734102435;
	cv=none; b=L6l/nGObxi9C/cLisyOcJVqHRNgWeZ/F/9a6iDPMnNSJ4kbawUEsT4w0tEKazb2HDTd32g0yX4ibJK8W+WpMhfHyp3Rk9qb2jP7vTL7Jk1wufYamARFzJBU/Cp7dKpgIBRnmt+yQQjavmjb3628ShibSh8nwkn1S9zF46rXOV60rLinJYlVFteWhMc5IOdPu2zDMk624KH+ckeQ76w5T9gNl9GznkVqOkBEOvrR+91/OZpa9rdpREc2LepF7QVtI5JDahc3LqnCiPyVV3MNNhRs2s91ATtrpz695cXQVnJrfjlm/hpC6wqbvWNogPSmzt/f86KXKsVStnGhYYyWPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734102435; c=relaxed/relaxed;
	bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8z7xZl8WRADtMEVNWUbNyXsQHg6U4ROoqgJ+XOAJVUr8tdjML6IOGOGBpjMGlhd4JO6c9jvEGkyM3eecB5UtCLjOo5ID2nOvWPyr1NJylIcOYUZ9r3+GiDs56bOa8ztCRW6yHTmsjW/d9Pb1q4YOV5wDND5j9WwDmYGDHcOgD5xjjQAd6CVl1NgiNmYVQtsDUFWIRb1rTaoAAjQS2gOxxZt3jTmcAoa8NWcnfIXhIJoVjpdjQBymaBfZ6T0aUBTtTJceAU3Ov/pDDp3U9a+kOq9gAoIddPPXunwQhJsVPZoXOClEBKT4H0WP70/IRhehcv31xrmjGo/DoyAiUWRQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cWVnsu87; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cWVnsu87;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8t3j2gJCz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 02:07:12 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163affd184so114885ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 07:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734102428; x=1734707228; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=cWVnsu877E/L9DK6UjW4vwKdwnAJtIVRLR7a80uUkbhT+pNPxOq0PuCxEDq5b2qufw
         p1uu7GaABACY1/h+P0iJPO8cFBmJhbBu0aM2C8Vc+Of8CYJ/ar8e3/bpiz7wM741iyzE
         YD2AF39WdTb8hRvIbCL2qCB7KFozH2xt5T8o4KciCPe4M0be33lu1qEjMYgLscuRZX5g
         BOY7K+9wGSJfetNBPuD1l53T7OC1OZUe2SmEgKFCJgl4/HBFrBgzceCwzhj30FudliC0
         qV3OUFX9l1hGj20AZYtFKCSLED7O/mtLYNWYwC7qYp3ToTxCnM+Yc3SqRRkboJzhrI6V
         D9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102428; x=1734707228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=YejncyvVZu0i7MK4M9dM9wKzVR45IMaNF/+YpLy3o45mybt/FjxzzcFp9KgB0/sBvU
         Rg3XZjQ512kL+j73CaHWLVntehlBAWUjq8PN0JTsJIB4j/3aW2O4hgQX7zwGuugxaNPZ
         Q/Q6N0xg+haThb5bRugDZ/v1wP3p0+lJdoeSgZlfAsJTBLNOezgs447coQBDoz6Ctw9Y
         Z0iiCc6LCLIhASBy4pOPPEouZMDCktGJuXS3B/QUkYRMMWjs3HH0KTHgP7OzOD9Fm4lG
         Pomna9o/dU0AK4mAQxj+3nYabqL/6c4hQk5k9FUQN1B7YU6NTe4mW4P0QnQGYpHUoUV2
         TIFA==
X-Forwarded-Encrypted: i=1; AJvYcCXtwAMpkSmuB4xe7DOw6g2lybWkDni8i1w3/JsIJQD1TXUQIOyS1C8hpT2UEnmMNO3P9W66JXFDDFU4t7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJ1HgAdrKgxeb/1Pq+GhJcE0LZ3fUMBZfaOW/kigM5ZQJsTxwq
	uAE165IOkUjpkEeW1hxMsrb0XfuNkx2It/AoP072TnG3U9c59D0JjgyjbqWX3BnNJCjrnKcNBY3
	V3FJUoCxmroovyyrnVj1jwLQbPAFlR2uuvXcP
X-Gm-Gg: ASbGncvvnaIYgA3NCWWu6fu/hO12w1d73Nn+K8HAOO9IL2KVJrmBa3i/KajmsugfsBr
	bKyzQBsj4FTiswQY5JCBhu8Y95WyLzUEXs/4Qyg==
X-Google-Smtp-Source: AGHT+IEFkkLrbUVuE/cQvOQQfUpzDKI51xwKn+aUa2wuLKN/e2/s4qkcLn7DHuV9QVymd56Ir4cx8C6BN8kJhz8qssU=
X-Received: by 2002:a17:902:da82:b0:215:44af:313b with SMTP id
 d9443c01a7336-21891d3ead6mr2786695ad.0.1734102427757; Fri, 13 Dec 2024
 07:07:07 -0800 (PST)
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
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
In-Reply-To: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 10:06:55 -0500
Message-ID: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> > On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@ora=
cle.com> wrote:
> >
> > > You've fundamentally violated kernel process and etiquette. I'd be mo=
re
> > > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. T=
his is
> > > totally unacceptable. See [0] if you are unsure of how to do so.
> >
> > This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> > and it seems reasonable to assume that key people are spending their 5
> > minutes to scroll through the email subjects.
>
> In practice we did all miss it, and I don't think it's unreasonable to as=
k
> people to run get_maintainers.pl to avoid this.
>
> In any case, I truly do think this series works better as RFC, I mean Lia=
m
> has already voiced the kind of disagreements I share with it, and we need
> to rethink how to approach it in general.
>
> So if this is simply sent as RFC with the correct cc's (and ideally with
> some review feedback applied - a better cover letter, etc.) then it makes
> everything easier.
>
> As mentioned the timing is unfortunate here, this is a series we really
> want to make sure is properly reviewed before any chance of merge so agai=
n
> this points to RFC being the way forward.

Hi everyone,

Sorry for the delayed response -- I was traveling and didn=E2=80=99t have
access to email.

Thank you for the feedback. I realize I missed some key reviewers in
the CC list for this patch.
When I ran get_maintainer.pl, it returned a large list of recipients.
To avoid over-CC=E2=80=99ing people (which has been an issue for me in the
past), I tried to trim it down to maintainers and a few others I
thought would be interested. Clearly, I got it wrong and missed some
key folks. That was not my intention, and I=E2=80=99ll make sure to fix it
when I resend the patch as an RFC.

On the technical side, Liam is right that the copy-pasted arch code
has inconsistencies (missing checks, order of checks, ...). I agree
there=E2=80=99s room for further consolidation. I=E2=80=99ll take another s=
tab at it
and resend it as an RFC with an updated cover letter, as Lorenzo and
others suggested.

Thanks,
Kalesh

