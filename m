Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA3930FBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 10:28:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BVu7FyE+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwMN39c9z3cQf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 18:28:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BVu7FyE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMwLV1838z3dJq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:27:45 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7928d2abe0aso355624a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721032063; x=1721636863; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wkUY0TLiU0e6n58LpHN87VKdeUeX7NPc3fuLII6KMA=;
        b=BVu7FyE+Q2Wvu2jFNWPWiG03bx7ziX9OsLQKJbQjIjAOy9BmcgwK1H1ziT/9wSUb0H
         BXX4xuEQxPsgce+znjr3CfTrQ7bYBJl0XFgZVRY/Nf32dt3My4+AJbp2W/dhVFohvF38
         HLTza2PKU1qkQar5NItqNP0c0FOjWGa7V7yQIGEtPV054g4asb5h5rsgURdKwjManX4O
         HxMyk+egJaTXbbQOI6ZuNqIfUJ17WjtqTf8lgDGmJNkg9wktHUCiQBp0QDoaWYVR2ao5
         XK98Gb7zVlshDpVX0Im78R1QkkeFuf6tvGdWL9xe0OUbQcoDlxOsnJhZcU856H9zhK18
         JqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032063; x=1721636863;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wkUY0TLiU0e6n58LpHN87VKdeUeX7NPc3fuLII6KMA=;
        b=XmMjSH4+z3qepili40pW6Dgn+HPLDqk6z/kvnI94eAp6qgMFm6G+0mBQ2OIWkvqTzz
         duKQT6wJ1vmxb0vN1BaXwKNG1b/q9VwoPd4GmFEwKnckftJGwB3xaMzpDqJbvgaJYL8w
         qRULjSKQlpQdpjdaYribyjg8LbMjlI2zG4hBQcsTcnzSi7ZHX+cWp+QGIxE4AFoxT/tC
         5TX4nV0u+W+U0efVTAbIYGJI1TQhAXmp0d50bhyiILVpL2UZyWoV361zweViaXWa12KQ
         XRYH5WKEBw1pXdmjqpSo4c0G24+ecyAyJEnwA0YCc5snRQHmdrHdPITqu1Bmlu7POhA5
         UyCw==
X-Forwarded-Encrypted: i=1; AJvYcCUWNy8jTho3ewCINuQLT+BnJYrgiA3JYanQdBcffuGJIOWJcbqfWfOFykLOrwMR/cYJ7lVb/Q/vGZgFerCsXNQ6kNtoKuLe4g71NeMfvw==
X-Gm-Message-State: AOJu0YyZPhHlCmnCF0K898toV1nU9KyQVENV/TPKgYBNoYBjGMht3ki9
	dqs9LxLvtPGKRSieZcYCAgt5OfnxZ1VTlML5YAoWVAOemC2KYNsiYaeuag==
X-Google-Smtp-Source: AGHT+IHwqr+RXaxTe3zvOZmmoOk7k5D4/ZZfHGZDbpE+MX+vxW1lQni5wQo11I/QfXXSlIqhThZ8MA==
X-Received: by 2002:a17:90a:fe05:b0:2c9:648f:f0ef with SMTP id 98e67ed59e1d1-2cac4ce5611mr14582715a91.9.1721032063467;
        Mon, 15 Jul 2024 01:27:43 -0700 (PDT)
Received: from localhost ([1.146.120.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedc1709esm3724475a91.34.2024.07.15.01.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:27:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jul 2024 18:27:33 +1000
Message-Id: <D2PYY2N7SOGR.1KKNYAQTUWL89@gmail.com>
Subject: Re: [RFC PATCH v4 13/17] powerpc64/ftrace: Support .text larger
 than 32MB with out-of-line stubs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720942106.git.naveen@kernel.org>
 <f4faee243f85eec691f2d72133fcb8e4aa9912d0.1720942106.git.naveen@kernel.org>
In-Reply-To: <f4faee243f85eec691f2d72133fcb8e4aa9912d0.1720942106.git.naveen@kernel.org>
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
> We are restricted to a .text size of ~32MB when using out-of-line
> function profile sequence. Allow this to be extended up to the previous
> limit of ~64MB by reserving space in the middle of .text.
>
> A new config option CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE is
> introduced to specify the number of function stubs that are reserved in
> .text. On boot, ftrace utilizes stubs from this area first before using
> the stub area at the end of .text.

[snip]

> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kern=
el/trace/ftrace_entry.S
> index 71f6a63cd861..86dbaa87532a 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -374,6 +374,14 @@ _GLOBAL(return_to_handler)
>  	blr
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
> =20
> +#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> +SYM_DATA(ftrace_ool_stub_text_count, .long CONFIG_PPC_FTRACE_OUT_OF_LINE=
_NUM_RESERVE)
> +
> +SYM_CODE_START(ftrace_ool_stub_text)
> +	.space CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE * FTRACE_OOL_STUB_SIZE
> +SYM_CODE_END(ftrace_ool_stub_text)
> +#endif
> +
>  .pushsection ".tramp.ftrace.text","aw",@progbits;
>  .globl ftrace_tramp_text
>  ftrace_tramp_text:

How are you ensuring these new stubs get to the middle of kernel text? I
guess you just put it in regular .text and hope the linker puts it
in a good place?

Thanks,
Nick
