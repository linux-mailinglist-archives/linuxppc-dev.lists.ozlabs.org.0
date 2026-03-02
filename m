Return-Path: <linuxppc-dev+bounces-17548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAoVE87JpWnEFgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:33:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39A1DDD9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:33:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPmGy0z60z3bn7;
	Tue, 03 Mar 2026 04:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772472778;
	cv=none; b=eMRkNZrHxPP1JhOPJo9NIAfFLTUHRimOOIgRLRhx2UZwas3pv7gpHahWe0HMMmzqYSFX4aU9YcpHs3a7wbBTq/mSguCk8y11Zo0w/edRPx16YS2QjYJblkVYZpmV2iJ8CLhrO8LplVnr+hJhK4FFWhqz8njrV1GIYc+YOJZ7wHW/CkneR0cdroQomDJF9LBrn7GcMsqduEIgPCF8wlOZKdi9hm7Q6PqqwOSq2fayfw+fs8SrK8G7DELhvs4VRAhS2vbwVxxZx/yTHdN/63/5RY+RRMIi82DUwMdbQi3CAJIDv/6NuW/ahN27i2+v7WdyLGUod0oZa2TD6VfV5d0/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772472778; c=relaxed/relaxed;
	bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTmB3+TVYq2nBTxUvfuRPGdeYKEi8F5U7oFCNYyOJ6kuS8EiyOl1vFRUDySxnZhyEAE7fS+8g/zr85I5Oy3L0f4iDiHL1eZg2oizWpDWhhOjMh9uplb8+FxsgUOh7HqpV5PaLtFCz4KNHPwB8bIuxNrCBZKpnsrmqsbrMfvRgHpoHSAWkRUAamfidiFQC6eUWKO3FstYML669kOH6yMTivGOwyUh7JQwJEYk4uE66Gf1AW6ZZZlQrSDYBNgSzePlpxS7FOdQddto3KMQzVS8LRC+g85kndymi6eJhEBCMWGADqua4pxcNSaB/1a8hmTX376fRzw1WktnFgQEgRcFdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O8Z8UEhe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O8Z8UEhe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPmGw61Fsz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 04:32:56 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b904e1cd038so632150266b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472773; x=1773077573; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=O8Z8UEheB1W3+THYwf1jJ4dYo5N3Bc19wFi8UHgw0brGn4HOdZYaVLAhGPmx+bDqiF
         wZQfepbNstGBqSNp27flLoEHuKzY7kBQI+dEksGKWeg8vDAWLFIiB/FJVryy0RG2jiBN
         NN1A2hTPiFKg+6Mle3qB8qljwsSSoqVWWC3tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472773; x=1773077573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=TGx9omKlkaXdnYwBs1Zjx1jwl+WNWXebA78+FghE+fh4Saynnq7kMu+gmEniCgi+SB
         SgwBg2Vx6aqG37vejx8eL/CqGUCh8o5agmJEZTDj+vJF0fnyaIppa9iCvnArrm/g2Juo
         YCEETYGyGiq0tdzxQMxoIvhCzKioZFis65G+NT1nYNUYkUxvzcAZ4ee3UVknH/gIUPUZ
         gKkcnVRdL9K8SIA8TLe5wrVHC1zTIfcTmrtZebdetc5IZHNIBiLyYmwkqKFsz4DTpbSh
         e7xvPzXsXL5dFiPgvMe19DHMISNcReMFuyFqvWcoOF3jHLIzPtigt2nUaVLFb/nJuvQ2
         +DjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUudWAI8MO7Am7xrpv/36ozGBGrqaOgV6B8G2WmKWnB0YeJA/wZ+/2NFZRg4oqjlVRnzjIv9SsEOdtVfbE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0aZiyFcnN+4PKLFNnss2ZND9uYCVM6/nfi7/eXWEXGJFx+oub
	75bd4JHjzDbSf+IB43I6h33k6n+0HLhQEdAlCjhL0oZC3gBqOu7DHOYLMygKg5hPrMVPYgTcsVn
	ewt3U9yyJVA==
X-Gm-Gg: ATEYQzyQ3pBGsEkpydGGv9JlI6qEXyXLWRKTt57m50c35xo6EXzoJiVXk3z9cJ71D39
	m+DAGHVGYBz65mvtTFYl1sv8BTf0x9MpEjBtLI2alABrEePwXFSQj+5zq/XzZrzMP/Unwmi8HNG
	UoAcJW7QgtTnTZWrEQWypYOy+d33o2OTOgq7wuTpHfHp0AWC9W/3fm0uA7lIB+jm3ear3mtN9X5
	q28CwSFbUNhd8m39MvamSDvR+9JfMdALfm0gzUPWwc99EhzLVeqMqyC2IsOns5shLVcbpdvqhF1
	ChUWj4j1WutUEXHjqn1ON9tYCqfW6kFMlgzn4rt+m0wz7uTwc9Pmhysi+O1WSl6D7DqcmQE2d22
	fpxkZoa/qZ+XYlHtZ/MXdPa4lGwdMpRHdiz8bbJubsJHxDqvD6zETwg8d1qR7PXnvfAdwbtJK0K
	KjEGKQXlYc3YDVIQ+JhnAL2ugg7FrfyBXX4MpwcI+LDv3P2peiCierIXWsrmfdgbMM7FSKKzze
X-Received: by 2002:a17:907:84d:b0:b8f:a32d:b90e with SMTP id a640c23a62f3a-b93764c8c23mr873391066b.34.1772472773438;
        Mon, 02 Mar 2026 09:32:53 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93973d3ec4sm290905566b.66.2026.03.02.09.32.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:32:53 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b78b638eso1255330f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 09:32:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXX+tixPDuQGiTAfg8fhZI9gDkZGaSPRXqEv5Ou5WFwVzeWwt0UuvlNxh+w/1efMW8XrUk5oL+Kcdwz0kI=@lists.ozlabs.org
X-Received: by 2002:a17:906:6a17:b0:b83:1326:7d45 with SMTP id
 a640c23a62f3a-b937b42886emr757779066b.32.1772472407269; Mon, 02 Mar 2026
 09:26:47 -0800 (PST)
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
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-2-david.laight.linux@gmail.com> <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
In-Reply-To: <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:26:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
X-Gm-Features: AaiRm52zcwSKl-2ZFc2XJ2K-Xgcl3ar6vYfBBv7z9Nop6yBvMYBvRXM6loWQHmg
Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] uaccess: Fix scoped_user_read_access() for
 'pointer to const'
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3B39A1DDD9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17548-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:david.laight.linux@gmail.com,m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:dvhart@infradead.org,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,stgolabs.net,suse.cz,inria.fr,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de,linux-foundation.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-foundation.org:dkim]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 at 06:59, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Can we get this fix merged in 7.0-rc3 so that we can start building 7.1
> on top of it ?

Applied this first patch. I'm not so convinced about the others in the
series, although people can always try to argue for them..

              Linus

