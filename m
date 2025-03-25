Return-Path: <linuxppc-dev+bounces-7329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E15A70BDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 22:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMj5y53WVz2yDk;
	Wed, 26 Mar 2025 08:01:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742914811;
	cv=none; b=NzsQqCYe1ONZP7ToeBqAW3FDDSCfeMW2qYqEgQOkGJIfBvWEjNWzxlcPcDAyWj2PrAcMJ+yugXx+oDqFbfggwVqbuY9WFW5mXt9HHqb+ux4LZQUvvSfAo9GfY1tYuVzLvIgVThW//IW8RsadDQ/hiP/orYr8hERgSFtaG4xe1Evd46M/+wdXIf3Tpe71BqCf30g64Z63ogooKGtcK7EaW2Po5/xpvyYj0++w+mOtzWQYKjgIPIXG8XTMw4sh+yKbQhAJR9b6LzX1U3KcPEhPW/3ON1wJl1dXmhwKlivogAxPpI02oiRedbRDZkZCdZnKau3NI76d2IARZ4FfiBAaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742914811; c=relaxed/relaxed;
	bh=GPD56TsPvi3UfQl0ryL3JUmt+MmqXDPi65xi8w44GI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKuQboh0/jODSbJiKsTsAyoj+qGU9lVZjlFV3jq0eww8M87skPqW8oCp43W/XHZe3M1rS9TVOWHTTTYIpi7qYRhW2NVXyRw3Rc916u6BDF1QDVlsryA1c2v+K+7ZpnV+r9xuH/dZLNRe4Nsg/W4fB4xjVB6uKvd0ukQ+chDUyxFEwNMQUBKnNl12tXa6GCVBBnrltTUT0vNe40t6OTJqy1UNbu/N3WRSxcGxTvBP/SUldTQYqiLoibOFWE7Kwc8JWZB/nYonRlFzmNaxbEoexBfoYdtHVihu7nEOhFXkvRqfWPwxNeioPE0yAWiX53M6jOKxomtA7ND9HPVbDe81kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jo4lS6nb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jo4lS6nb; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jo4lS6nb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jo4lS6nb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMY4T6yFVz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 02:00:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742914802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPD56TsPvi3UfQl0ryL3JUmt+MmqXDPi65xi8w44GI8=;
	b=Jo4lS6nbSPFUZqQ/YRSzh47wyg/MiAFjBkkpBci2pLWgaKT9Y0MlnvS2QXsy4X13l2R9H4
	ejad+NTAGfILpWnDfHsPYE9rfUrsJ48bNnjHrxRlHMbIcOef087NLrzcrDxTgE8nYrV14E
	ZHrDxSnDbOH5rrYMnmX+a3mea471IEE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742914802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPD56TsPvi3UfQl0ryL3JUmt+MmqXDPi65xi8w44GI8=;
	b=Jo4lS6nbSPFUZqQ/YRSzh47wyg/MiAFjBkkpBci2pLWgaKT9Y0MlnvS2QXsy4X13l2R9H4
	ejad+NTAGfILpWnDfHsPYE9rfUrsJ48bNnjHrxRlHMbIcOef087NLrzcrDxTgE8nYrV14E
	ZHrDxSnDbOH5rrYMnmX+a3mea471IEE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-cNDcgyZnMmWFiYzRPL2kBQ-1; Tue, 25 Mar 2025 11:00:00 -0400
X-MC-Unique: cNDcgyZnMmWFiYzRPL2kBQ-1
X-Mimecast-MFC-AGG-ID: cNDcgyZnMmWFiYzRPL2kBQ_1742914799
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac31adc55e4so489094466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 08:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914799; x=1743519599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPD56TsPvi3UfQl0ryL3JUmt+MmqXDPi65xi8w44GI8=;
        b=IenlN02cgT9LzRN+Fsep+r8kf6yv5kJkFEBLX2IUTH8NJIF2hwy0GexMXCVndKgnnc
         u3kP7R5SDHwfhyouKZicvU/CNEhthKeKsQoTdFsdK5I8Jre5TDbELah3mhuID4xPqmw0
         /g5OhfFqSdzjLM+onL8wBFvKtbugfoh63WqmWCtuqCikbQHzQPUJVWvHNmSgnN/g3iln
         DkmE7whyUe6nSFfxyuIzBu/tHlM3kJ2nFacV0zcrWjbB91cd5qHPFxKXoogJgyF8jAJe
         Oa6c/Il4d/d7GnscnlCGe87WIYj4mPW7nUxpfRPt1dW121zfLQgK/MtvA4uIrjHjwIye
         1gWg==
X-Forwarded-Encrypted: i=1; AJvYcCWF844NfP7HUrEvvOJK2zwS+5TL70DpNrXfesoPiFvN8+T7qm4akBG/k770sZTJnCJDLMoDeDQPRROjuPQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxwIJMMf4U4peudi53yqrp3dLqLr63hePuCikCrx/iJw+3mGAyY
	s2tmsm94tzr91p5fWrNDg9lukQu+9Me/Xk6LUoSIHR9dDZcbFTWSwfe/QmaFyOd1lpwOncleKvy
	gqfp+y7cLuPW0cDgGq2MYaT51KgciqXld05jxH3/q4AUehlI99lU6XRWybzfoPOXmVV9uL4cMCh
	kU+BWH2FTZibJQ3tB0x+cEfDAFmy+GU/N/EN99QQ==
X-Gm-Gg: ASbGnctShdnvld0EB2uoxJzMaTZuOMEb+pekT/1yag4I1Glz10kvMluZNh0Iyi1hhxf
	tIx/WjfTUI5DxydzGRlftsxlFI0HIPyI/cTC4ot8ijaNN+i6YQuDJ5PDxmrYBxnymgzBxA4E/CA
	==
X-Received: by 2002:a17:907:1b05:b0:ac3:8626:607 with SMTP id a640c23a62f3a-ac3f251fbd3mr1795389466b.38.1742914799287;
        Tue, 25 Mar 2025 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+YUjGVWtfpyBwCFBLJ1QlJAEWsiUBcgZ5CATDRVTkA/NPywRDWZDxKGd2LtWzuRZROP8MS1zhzDRVTnbwctU=
X-Received: by 2002:a17:907:1b05:b0:ac3:8626:607 with SMTP id
 a640c23a62f3a-ac3f251fbd3mr1795382466b.38.1742914798382; Tue, 25 Mar 2025
 07:59:58 -0700 (PDT)
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
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
 <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net> <Z+KXN0KjyHlQPLUj@linux.ibm.com>
 <15370998-6a91-464d-b680-931074889bc1@kernel.org>
In-Reply-To: <15370998-6a91-464d-b680-931074889bc1@kernel.org>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 25 Mar 2025 15:59:44 +0100
X-Gm-Features: AQ5f1JoiLoJo4ZTpZl2aK1T1MfyI1PFI0KWuUJogAG7QL32ZnjVnpgltDvnuL14
Message-ID: <CAP4=nvQ23pcQQ+bf6ddVWXd4zAXfUTqQxDrimqhsrB-sBXL_ew@mail.gmail.com>
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on linux-next-20250324
To: Quentin Monnet <qmo@kernel.org>
Cc: Saket Kumar Bhaskar <skb99@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com, 
	williams@redhat.com, rostedt@goodmis.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DNb-VSmTsdUBG25nXIngyf2MtJ2GkVXMDr6aYTbt5_0_1742914799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Quentin, Venkat, Saket,

Thanks for looking into this.

=C3=BAt 25. 3. 2025 v 13:12 odes=C3=ADlatel Quentin Monnet <qmo@kernel.org>=
 napsal:
> If you talk about tools/tracing/rtla/Makefile failing to locate bpftool,
> it's another matter. As far as I understand, the RTLA Makefile assumes
> that bpftool is available from $PATH, this is why the commit introduced
> a probe in tools/build/feature: to ensure that bpftool is installed and
> available. So here again, I don't see the motivation for changing the
> path to the binary (And how do you know it's /usr/sbin/bpftool anyway?
> Some users have it under /usr/local/sbin/, for example). If the intent
> were to compile a bootstrap bpftool to make sure that it's available
> instead then it should replicate what other BPF utilities or selftests
> do, and get rid of the probe. But the commit description for
> 8a635c3856dd indicates that RTLA folks prefer not to compile bpftool and
> rely on it being installed.

Yes, that is correct. The reason why I opted to use the system bpftool
is that bpftool itself has a lot of dependencies, and they would have
to be available at the time of building RTLA. Since RTLA only requires
basic bpftool skeleton generation, and the only "special" feature it
uses is CO-RE which is already quite old now, I don't expect the build
to fail with system bpftool, so I chose to use that to make both the
build dependencies and the RTLA Makefiles simpler.

My commits sets BPFTOOL to bpftool since otherwise, the feature check
would fail, as BPFTOOL wouldn't be defined, since it is not passed to
the feature detection make call. I observed we are doing the same for
Clang and the LLVM toolchain in tools/scripts/Makefile.include;
obviously, there is no problem there, since neither of these are
in-kernel.

Shouldn't the selftests always test the in-tree bpftool instead of the
system one? Let's say there is a stray BPFTOOL environmental variable.
In that case, the tests will give incorrect, possibly false negative
results, if the user is expecting selftests to test what is in the
kernel tree. If it is intended to also be able to test with another
version of bpftool, we can work around the problem by removing the
BPFTOOL definition from tools/scripts/Makefile.include and exporting
it from the rtla Makefiles instead, to make sure the feature tests see
it. The problem with that is, obviously, that future users of the
bpftool feature check would have to do the same, or they would always
fail, unless the user sets BPFTOOL as an environment variable
themselves.

Tomas


