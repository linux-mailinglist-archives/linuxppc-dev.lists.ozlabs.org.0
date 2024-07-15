Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5073930E5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 08:53:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BfhVfPso;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMtFV5yZWz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 16:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BfhVfPso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMtDp0Cklz30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 16:52:40 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70af4868d3dso2881425b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721026357; x=1721631157; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOUBnyacfrZf8eVlFcm0/q6B+wJPrQJ79e88GPN7rB4=;
        b=BfhVfPso3KTqr6XpRbgefm8Ib7piQ6X5cg72GTbP8BKpG7aoN+x19Q22w4yI4NBOGU
         5x5XCosL3LmYcSz1noq3owYYEp/NlHC+YAiXWZ8nMO4KJznedZdNULUqjSYR+MhalvEE
         g+g9Ouw8klWztX6/DyqNIupSQAzC+YZD2nPR/LZFzBHIv17FtlBVPLdNzA8PEyso4Z7z
         poRmql9A0htw2OVDnaayw/Kb6BllXRMKVeoVXpcmmrTVA+KLUy6mdEwHy8O3lcwovkMR
         go9e8JeHanNfg1hunYdHj6R3QfxcumspqBlSDhT7cR6sItRY9Wrwe/6W9vv2jjZ9NUqT
         ndew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721026357; x=1721631157;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOUBnyacfrZf8eVlFcm0/q6B+wJPrQJ79e88GPN7rB4=;
        b=jKpjeM0eneuM1B0THIIiiTHnk1QWAxJjscDx0lgqRB6AIUrAWROzL9s3hzBn6p3s36
         WfHTnVeMN+fyMNs32F0i1S32CeaRKaJTQtxRy05w30x+qFzxD65W/4GrJr1ipqexTStp
         IDYpnapSOWQkqzmEu58nh9GigD6FWfAwgSTnfqbHUd40VqAWyqIOBSHbaHCa4bAM4ft/
         AscwY8UOOmmMFSjK5RRJZpJdzdszF7AQIgxBTxmDTlK3S2lwQMI/knZY2J1Cf2okPWYK
         0HTWu0Z/tmZpqTWPPkjqDI8oHjBYLt7YVKw4LXN6ahAc6bpiDtTd7Rw0uaWc59iJkUkW
         EBag==
X-Forwarded-Encrypted: i=1; AJvYcCU24bZafejFEqe71pzjfBLdrcMPTlNY87M46m3guDan6sLusIsVjpKQbtm/wzDTOoicgCb2qmenplPKMdnOGongAmCV964uRpQaqfY9gQ==
X-Gm-Message-State: AOJu0YwLFolrJUi7fB0QSXw+NzZcBDNUdYJVk5pUXHkZ5kKu6NfV+4IH
	4QHz2xfbiDcxUomWP7jaC4PsABrdPhi6Ob+B78Gvpm6Ib/Xzl/it
X-Google-Smtp-Source: AGHT+IFh6bSn4V5kPfc1+LrO3cOGjERs8h1Xg/TGnhJOuvCkDfri4xK1SmxC19x+mql3WPQIZcGfoA==
X-Received: by 2002:a05:6a20:a125:b0:1c2:8949:5bb3 with SMTP id adf61e73a8af0-1c2984cf1f6mr18562950637.42.1721026357378;
        Sun, 14 Jul 2024 23:52:37 -0700 (PDT)
Received: from localhost ([1.146.120.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca3c74eb5dsm6027391a91.0.2024.07.14.23.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 23:52:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jul 2024 16:52:26 +1000
Message-Id: <D2PWX8QDYFXB.B2LUK0XGNIYF@gmail.com>
Subject: Re: [RFC PATCH v4 08/17] powerpc/ftrace: Move ftrace stub used for
 init text before _einittext
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720942106.git.naveen@kernel.org>
 <ce15b4bfe271a49b5edad8149be113bc78207fda.1720942106.git.naveen@kernel.org>
In-Reply-To: <ce15b4bfe271a49b5edad8149be113bc78207fda.1720942106.git.naveen@kernel.org>
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
> Move the ftrace stub used to cover inittext before _einittext so that it
> is within kernel text, as seen through core_kernel_text(). This is
> required for a subsequent change to ftrace.

Hmm, is there a reason it was outside einittext anyway?

Does it do anything else? Other than symbols, on some 32-bit platforms
it looks like it could change some of the initial mapping/pinning. Maybe
they jut get lucky and always map it before the change anyway?

It looks like the right thing to do even without the subsequent ftrace
change though.

Thanks,
Nick

>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmli=
nux.lds.S
> index f420df7888a7..0aef9959f2cd 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -267,14 +267,13 @@ SECTIONS
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
>  		_sinittext =3D .;
>  		INIT_TEXT
> -
> +		*(.tramp.ftrace.init);
>  		/*
>  		 *.init.text might be RO so we must ensure this section ends on
>  		 * a page boundary.
>  		 */
>  		. =3D ALIGN(PAGE_SIZE);
>  		_einittext =3D .;
> -		*(.tramp.ftrace.init);
>  	} :text
> =20
>  	/* .exit.text is discarded at runtime, not link time,

