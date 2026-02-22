Return-Path: <linuxppc-dev+bounces-17010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKXzGYBGm2kpxgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 19:10:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8A1700C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 19:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJsTP5M0Wz30T8;
	Mon, 23 Feb 2026 05:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::336" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771783801;
	cv=pass; b=RciVPW+1ra/jXgg4NJrSvtI4MegdMYo0YS815fmABJ6dfneqsSCwoW5x05PQSwF8PSU8ob46H3ybrKpJbJ0CoJEoZyW5lvt2kN6Anbkd3pH1+2SqqDL1Z20CkAKuXO9CCWJHmd9h42qR4+zTJ36epL5tMXrcKkSV94PAagPfulnlSrirIsN+H8ViebgmPhIkLA4JLhzzqITDAgFhec5aPXjqoBbmTKIn3Dbfu+QySbKwePVJmHAfcBlhB4WQKNfG0XWJqKB0B6KFPN/qYJ6R4yo81NrVC2EVw2hTJKLSipEFb98I4qAl5HGxivvVqoMlq0t3BrHuwvaqAbmp8bMyYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771783801; c=relaxed/relaxed;
	bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gig1ZLVUdw5yGy8LNY8nlPiBsXo4BtVXXl2nVZekBt6NxMssRZTCh1zf9CM00nBnZvXWBWh7gxblHaSrMSuG4HWwmACF1FKCTpH3ENZE/kUArFPCW3Bs1QSSTgTd8PLxMHX1PiKVVpBt6L11X6kosIZewGPPHMi+U/iQs58yg4pjzA5SBpeMdyfWBc3UKWfoLpEdkUtIg2ud0NR6SxzuzOEQ/ljo64S7HATwvG2i4qtQFlw1VH9lT1VEEbLbcm8k1u235W348qB2sly1YGHIV8QStYdQa/BkAy9uO5L23hVwkMHzS8ejd13VXEOpxAOmYi38BOMrM4HKmrGcX09QCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S7S8N1Hw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=aliceryhl@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S7S8N1Hw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=aliceryhl@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJsTM4tDNz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:09:59 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48374014a77so37549315e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 10:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771783791; cv=none;
        d=google.com; s=arc-20240605;
        b=Fa8078uyzH8ltDPJ8uJlQFfY7/OMlR/XnTjLUoA0HYKhWM1RfJ9aTAc9HsPACNRwKN
         KAqupzMEkoS60wlZv+HpczRPT3lLhGGPeJfNS4uJBwHYTCdHm3c3q+zV+BYi48m/5KtY
         ejsQ0Xtf07gdoeKFh/139mYgoeWVRcNKxu+QvuyUUi3LrWuZqp+f5zRTHSRtE01bZk0d
         Ks+fOJSfCONIa+OeKYb0S31NJzZqZXn/yQ02vpWo9BS4u13xcmPt6/q4ZjdYr+OJeYTq
         r7VXNCLSjjklGHJ0t2niObY2bS7HzOrekbB51WuFVP+suwPYlbcJ8Py4hKLSHuDUJDje
         y72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        fh=yJomTowgT2/7chJyd9ITnuF2hmsrt0ibSsh6wMiSHEU=;
        b=jgko2C5hheV65vFmQ6GsH8mN1qa8T6KMPuUXTtF9i8hcHfs2ThO1yzGXOJGzdQpxzi
         ZyT+CJRu0Up9YwvB/7q4le1B1wvDsjDA6xFmcUbMYEmeQ9Ut2/CW8qSnn/XATiJILbPE
         EfCCM5jLJcS8HBUphMO1Uc89CZfnG0CfMrw02Q2rreKAR74+CrZ9KX1Ul7uEpXp8NlXR
         IBmLaL16YcehH8ikaY1NJdEO9YlFbj4jen/6W5KIajAVyZe+5OFTj7/+9nvOfnyA3Cr0
         e8oJbpWJmfGV9Png5RPnVxkjHxVBURzeXZR/wL1w5M2ymgvV6pmVWQPGpPDID/zJwGE7
         KIqA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771783791; x=1772388591; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=S7S8N1HwNwLj9wEYD8LDK6l0RzFHmaYtUBz64MHlyJ6+qSpGq6XdlIws/5qf1q8zm+
         rsE+Z3+lZfFIuVbHnpMxKayDCR7Gju6Xz71OcbyIKtnlxQf9CfQDUsnh+zRLu0egGlV2
         TEzkfogrKVwDaN1iE51nzWhlCVH8rwXNMcUtQ545AGi5MLZv3b1IIjDfCsDBzaVRtD8g
         pjCgbXcrnYN9U/ZoOukPb+lmWKDxyjsgXlXZawa+ZI0nv3Duf+MylzFBPvgiOODENz2G
         8WhXnrTGYGyu2T+EQr7hpHfXwg97axpyaCQCuaqYNyxifR0Uab0MqrhR1kR0O68XQC61
         gahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771783791; x=1772388591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=gIDp2MShwbGU4l5cGylrHYiRYVicbUbosW6w6mA2b3KzzZmnNffqRmBgMeQluVWULP
         fFIB1ZObFmduiqcMXdX65vZ9mEPvuSu3vOeWWIkT5W08A/Ds14BqKXyDE1h4OGFBfIk0
         HPvAzorQiWZ6/gmdsnLnx0wWCs9iFVcmmgKMFoYF/kvR+3amPYZ8dsTtPksap6vc8ZtN
         zC6epBUbH0/hVHnuwxn0IdZ/BEpWyvN55zIcUSXytACP7x9Wbm9ZALed7kjppSPZ+qlz
         fwFMES2yzQQno4emmRPpNLJW42OU0+3QaoihskSQrM0qQwS3aOlphYhXXO+2g32NGroB
         kE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdGKI3CI6LTIfFICfxUSamBmtA1mEqPZb/vAZdfKw9Ccsksv1RttwoJvkWyCl+T+Z8sdxPKD0eRHWSt0A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLfqe3RrRpy5SD25CHXN8YDpIb/iotgexnYu2gVX5tpJoVTLFD
	0+K/osLFvwczt/EVJ756T9au+R9CgHcls3E4bUwuDranJ+FxrFOI2YiQiHP9HTsAPsM+JsduyMw
	G19w+8KuRTE/BRH8mmeUnxVT3ICdr/pY2EO9sk0pw
X-Gm-Gg: AZuq6aL+w92PqcCREmiFVSm5PENWoEu22q3QR7lSq9ft2SfDDymLJTCrsefPfouo+LO
	wJrHT6NvBko4cStt+U+4fN0a4qaxXeY8SeIoZmz3KEQcQy3VjxxTxVNtyvPYSOXGBwnHTR5IkLt
	/eUM3XMR81JcbNL70T1PPTy1HcjsefI1CrgGzurixdEoEB+0QYnJcNMuZQqqAHl998+Y6/Pnlfv
	9cj6j/fbNnehXZgjn2TrJKq7REnpAyqlHF5M0qqT1snUam5ocC40l6oX7+q9IwXh1GfY90QMInt
	VdTImhyuaMNCzEkt7VnKewMZhpoHo38gq6CvQNCMpPe40Xy/
X-Received: by 2002:a05:600c:620c:b0:483:43d8:8d68 with SMTP id
 5b1f17b1804b1-483a95f8988mr99041605e9.28.1771783790563; Sun, 22 Feb 2026
 10:09:50 -0800 (PST)
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
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
In-Reply-To: <20260210090023.2587534-3-mkchauras@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Feb 2026 19:09:38 +0100
X-Gm-Features: AaiRm52Q8m3SEnrLH6jkyBDSVsN1hOKBCoLoWD_xybQBz668Fl6X4XkBu3NwbWo
Message-ID: <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-17010-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 45A8A1700C7
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:00=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> From: Link Mauve <linkmauve@linkmauve.fr>
>
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE +=3D $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>
> +KBUILD_RUSTFLAGS +=3D --target=3Dpowerpc-unknown-linux-gnu

This needs to be a softfloat target.

Alice

