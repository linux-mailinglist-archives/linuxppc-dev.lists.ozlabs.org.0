Return-Path: <linuxppc-dev+bounces-2131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F2C99AEA5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 00:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQLqG2CHXz3c1g;
	Sat, 12 Oct 2024 09:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728685674;
	cv=none; b=lJ7MiAN64K8Qnn9L/t7vnAf9mAfSRChLe3ezcbvZtCNZVBE2x+gikwocu2yXcQgku1LNfRf2Wq17F2NUmKk48446ZNqr/OmYFcDTaZqXuZ40qVgULW1lhMg6XVGnq44UoqB87O3VyC4tVODlraVeOwW7yuXDXjz3YSRtVb0u3UN6EFX5dGvRfj/DfOdEBP1tQN5OzP0kUZgUZPcvxRTMBsWD9ho9SjxdttCdPOprvwm9aqjdACDrqMX10jiUWl2/1Qj3jwgb71+7YGwAD3NT0lJVa8+Lc74Y16pNDV43TgEMgXTmRHx1JdmWy5f4MyXyHZ1Qr9r5EPT5p31ux1pedw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728685674; c=relaxed/relaxed;
	bh=8+gUxSDkWsGEMXOFebQ5Xw/lGRc6XJ08PqAablVeqL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSJgYbCGsGO7Qd+WPouZvlaL/SmchSN/JIUVsJ88k+J8j2InAHAFQOOpSzVNFwwlidXhfqxWQ+w+iXsyMMKdfjOIYK7x/i/lN9YRMj42jgr4EpK8rlVFe50LoAJVUjRI4CVSmo/fLPiFLjGaXiJjq0YHjmMhX2QtXMkHPy3xREFAT/xgVvauAPyvFOAA8Q367HAIUtYhCLC5p01RsQPtp12zlWH8B2aH4RGZpjq6cO71TRAMFg1P08xnVEP2RfyvrC4eYv+8MLkThK2eavbIgDg8RUCe5jGuMnZHr7FiL0f0g18q4mKvU+ERMs5325+r/R2Wx70JJd/mIi2pphqgHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KPa3NKCZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KPa3NKCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQLqC3Nrvz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 09:27:50 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539e617ef81so2766e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 15:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728685662; x=1729290462; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+gUxSDkWsGEMXOFebQ5Xw/lGRc6XJ08PqAablVeqL4=;
        b=KPa3NKCZkrBitfpXyX0HlHpBtlE1Aw+pWn+YluKy1AzQ9uZovLUeyWvAFbKDzCWJha
         6D53HHoqAMYhqYU9Qd9iD67qzQL9pjFx5h7gyfh0VFaELwy7Rvu31c6JKLEzgD3LUOTq
         tt2dCvrh7Zq/HpuBwky+6VFMsckCv5Yo6Fl480wCv59r9/6yJsG7ZhfDVITBwhq4r8sB
         m0iBJ9m5jpRagqZqlYpxfjpmmNO9fbHnlROjC3wxVLRdjzVhVToYV4hKQZq2DYELBR/o
         +7I6S07YotjpsEBL2iRB+SzCuH9NcDJGpSyNp8kJpCjUaX4423kHBrmP9zJGwzsFnlcc
         6+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728685662; x=1729290462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+gUxSDkWsGEMXOFebQ5Xw/lGRc6XJ08PqAablVeqL4=;
        b=cG6c9bhNgwP55kAl3czHqBQNYTylJ16w1INemUC+NIDsIyXGVM5w1uwyeIyq3TDvUr
         2/uEagoX9IVF0jqeaNgWyra4WRVyyE3cRDZiFk3XeL4RrBFygqQ+2HJNbjTWSA4dbe6k
         0QYDLML2JodnoRxj2vmbH8lLfqFD53p2LVUGPrDXXvJ7yT9Nn55bR1IklMOMPLyeevCh
         hg0C4Qix1/I3LA4rDAlKOHqbyZ2A/Q2JQ8Ev24Xa54rG9S+Me7EoBa+xSVUo63yTGVhb
         MGjrKXmCweVnqvvwWZCKGqwwM7MOrjEOelS80GnwNRuTVdNlWqD2c/fskRD6qQOucbd3
         1bFw==
X-Forwarded-Encrypted: i=1; AJvYcCVexqUEKQP9eRotK3vPVUuQuZgVVRY+AzzrZxJI4J1DPHzyKdTNcti7fzTSXRYo46otk/5A+PSByZhxWic=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTulU1Lgwv1Q48ThOWY2YApoCVAxSKjbe/wPV3LyS1g211M0hD
	pMGavA26L41OezSA/xC6uRCBA1AcxIlsJFHGfsjv5E3uSnJPaLvcCAzltg3ku/HIjZn7hQvb83E
	Gc22+Op68R0QTQ2oqdJyQu9JBQPGZGhMDulwY
X-Google-Smtp-Source: AGHT+IGXZUm50H+t70ubPlGJraz2/HksPndIYC+fI6Hrd+oxzT344/Iv2iwsY7fhvWCT2jXrm4nAx6oX34CJ6qkR/Wc=
X-Received: by 2002:a05:6512:3d05:b0:535:68b2:9589 with SMTP id
 2adb3069b0e04-539e5f0b82cmr146927e87.2.1728685661778; Fri, 11 Oct 2024
 15:27:41 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
In-Reply-To: <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 11 Oct 2024 15:27:30 -0700
Message-ID: <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 3:22=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> I'm all for the ELF validation work so far, all that was nice, thanks
> for all that tidying up. This however is not considering when we really
> need all this at all, and not making it specific to the build times when
> such things are needed. That is, yes I'd like to see the need for this
> clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
> when this is needed. No need to extend a module with bloat if we don't
> need it, likewise if a kernel was built without needing those things,
> why bloat the modules with the extra information?

To make sure I understand what you're asking for, are you suggesting:
1. A config flag for supporting parsing the extended format
2. A config flag for supporting parsing the existing format
3. A config flag for putting the extended format into produced modules
4. A config flag for putting the existing format into produced modules
or some combination of the above?

I'm currently reading this as #3, but figured I'd ask to be certain.

>
>   Luis

