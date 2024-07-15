Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A4930FA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 10:26:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=avtfMnlU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwJV5H3tz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 18:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=avtfMnlU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMwHn2TpLz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:25:23 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7fd3dbc01deso192388839f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721031921; x=1721636721; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW2thNGYkRyZe8HIPJ8rpQcN6uYkUSeuH9TVqbqQqOM=;
        b=avtfMnlU/h50JYeI92XGQ2moOYK0aUR8F+gP3eQCfGY3z3KwXa0+OWZBfmf9zvjDQT
         m9LgBAxqJyeVr6jKwbCsEaxHbU1o80wksNnj58f+XRng9buc5RToOgtHFa1pdKp1HTA1
         0EsZJ4goVw+f6VZqoDgxfbeYXoogLifwaXxQnAngYOjhN/Py3gu50pdejVJ6SQygWET4
         loUhhioc1SLRA5IssPbFeQAssc6b3EIBirxCKtgJgM28Wyyzkq+J9pUWFOBtP6eZEbm6
         JnE0+5JVscNInIF7eXf1FL6FY0kjtmST9KLDMhJKEQY+ZbCKplWQdq0l9HdOMdytT9YT
         OdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031921; x=1721636721;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rW2thNGYkRyZe8HIPJ8rpQcN6uYkUSeuH9TVqbqQqOM=;
        b=fKjWtukiA771yqmrFSOU7uHCLmQtzG8D/VsXb3oQrEocDh7sB8/Zj5Lr98DcqmWpGj
         MV6RiIG6RYeAYNkxEnJRoD4Nba+CRMANSRHcgGkMiyw8GVijDr4SeehO53TEws5W5HlJ
         M2/0upxVAKafdY13e2Xdd1SAR0kdQbHColdKcFWP3xj3R9dYncagK6soKEeIHARSy2Vt
         NrvGeSY7ohsUCtH68NrWf4DUQMhBZGvc44tUfnyT2cdMVGWEPOaseJ12v66JqCBsNayo
         N96cSIAtESCM19CflWrKONOsFdilCO6XYPpWuwhpfwKF1Au4lg2llyF5RbHiRy+r7kt3
         vUlw==
X-Forwarded-Encrypted: i=1; AJvYcCVrKMHYcYs2rfU5mbL0jqmL5/TAEQr3jFogA4Dasgm7Y0CGZbTog7G6d8SnH1TYA6Xe2ko9wZQq9rYS5QrjppdxXNf/OTBj/P8Rni32FA==
X-Gm-Message-State: AOJu0YxSRc8+bOlLncmjMv1Pi0EVb1JXXDaJkpHiwU6HgHEG7LBLhT3K
	6KRPi/MInm/XQ3edOOPgoR0OO+HXu7KEIrHjIst7UBYwPSswVx58
X-Google-Smtp-Source: AGHT+IEJOtY6h6sgqUX2Zqpq7jO4aSc5SbNrF10Bl+Cu1roWxg+N/2mw68X1fDSEsPnU5o1cPk9G6A==
X-Received: by 2002:a6b:db0d:0:b0:805:e2bf:f303 with SMTP id ca18e2360f4ac-805e2bff70emr1391622039f.8.1721031920882;
        Mon, 15 Jul 2024 01:25:20 -0700 (PDT)
Received: from localhost ([1.146.120.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7eed2sm3770443b3a.116.2024.07.15.01.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:25:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jul 2024 18:25:10 +1000
Message-Id: <D2PYW90LRVAY.3PCE9P3NE2NEB@gmail.com>
Subject: Re: [RFC PATCH v4 12/17] powerpc64/ftrace: Move ftrace sequence out
 of line
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720942106.git.naveen@kernel.org>
 <9cf2cdddba74ec167ae1af5ec189bba8f704fb51.1720942106.git.naveen@kernel.org>
In-Reply-To: <9cf2cdddba74ec167ae1af5ec189bba8f704fb51.1720942106.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Jul 14, 2024 at 6:27 PM AEST, Naveen N Rao wrote:
> Function profile sequence on powerpc includes two instructions at the
> beginning of each function:
> 	mflr	r0
> 	bl	ftrace_caller
>
> The call to ftrace_caller() gets nop'ed out during kernel boot and is
> patched in when ftrace is enabled.
>
> Given the sequence, we cannot return from ftrace_caller with 'blr' as we
> need to keep LR and r0 intact. This results in link stack (return
> address predictor) imbalance when ftrace is enabled. To address that, we
> would like to use a three instruction sequence:
> 	mflr	r0
> 	bl	ftrace_caller
> 	mtlr	r0
>
> Further more, to support DYNAMIC_FTRACE_WITH_CALL_OPS, we need to
> reserve two instruction slots before the function. This results in a
> total of five instruction slots to be reserved for ftrace use on each
> function that is traced.
>
> Move the function profile sequence out-of-line to minimize its impact.
> To do this, we reserve a single nop at function entry using
> -fpatchable-function-entry=3D1 and add a pass on vmlinux.o to determine
> the total number of functions that can be traced. This is then used to
> generate a .S file reserving the appropriate amount of space for use as
> ftrace stubs, which is built and linked into vmlinux.

These are all going into .tramp.ftrace.text AFAIKS? Should that be
moved after some of the other text in the linker script then if it
could get quite large? sched and lock and other things should be
closer to the rest of text and hot code.

Thanks,
Nick
