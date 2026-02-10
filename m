Return-Path: <linuxppc-dev+bounces-16769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKPtL9H3imkzPAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:18:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 724DB118C90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9GF94yvGz30MZ;
	Tue, 10 Feb 2026 20:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1229" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770715085;
	cv=pass; b=ZPg1axXZN1pEPkmebyOgkmEUvMVwstpdkSPLp51qLMzyEExdPpUx8PSfhiVoSMIvoZG4LJhOAOGrVjvcMg4mAs3c5p1mBai4P1sf+nUpyCIK6MadBOD+GJi2cxtmqIHIkeOP5yBGVpfZ67p9xa5A+Vt/lFK9tHlt5gLZ+wx03Rvzgs21oBfA3Mspa4CTEYYgvafq+kUpLNTQTHE7sJVQPc8fB1g/RzuJCH1999foETBw5af8pcLLDIOnXYquM1C4UwGypKBK9wZz5inuMgRJW3a50VbkaGvwPZ/9PKfEZQU+mZP54jgwZXzdR2uizu+LXl/uEllhXEoulowpkKsTTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770715085; c=relaxed/relaxed;
	bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCIHOqjJDDfM7ZlcN9kmbcbkvLjyeH4ou41mHRf2vzStwQGGbkQMG0BeYjgO7vkq6S7UxrXc4tCXvjoRo3vBH+o1vm8hJFpC5PY1c5YA7PueQbZX0Ntvzv77w7nERYjzuPolZsEX21F6236CPDQj596ICOXq4ra1REWCx2Wbt2/Z9ubjb9q7vcV+WvY5ikK0pWiPgIaR7cup6JJNZc4qEmyvOiMeovTaiBiThLKhsgD8UGCKRcJEcn0ZxoE5bQAbi/xcReREBGHoDvXdQAyvGGKU70a+K8ttRbVDzE1Ksj3F3lAatKImThcZUyRkjsciXo+1vJFePr5RyQZj9CJ/5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LwU4N0MP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1229; helo=mail-dl1-x1229.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LwU4N0MP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1229; helo=mail-dl1-x1229.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1229.google.com (mail-dl1-x1229.google.com [IPv6:2607:f8b0:4864:20::1229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9GF82Pl9z30M6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:18:03 +1100 (AEDT)
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-124a2dc92dbso328351c88.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770715081; cv=none;
        d=google.com; s=arc-20240605;
        b=ONbHLjKln4dl+k47/ochOCCDrRH8tD3piuG9r967ESWDg8oypZRJcIXJnofTwMEqHn
         EO5ysWa4WyeD5tsMMfep72Qcw0xNE8cj4uai54FfIkP6azK7gPWc8/QGwl9HUcNcF6xX
         Uq/iPHbBXBORXRNi9gEwIh5F1EP/iHNhoslOl2YixjXeK6F74/cX6qfW7ino43rIK3f5
         kDBno6mtVn6F0DTqP7fvdqLfzIWh7dy9Mfmqmrhs9WLN+0uCaf3AwlWIeA6X2jyXTBBb
         LjklJAKc/mTjELiFi9P/wkEIppwjTHPgdiSVXM/x3VjUpkaJojjf44GB7vp2XDcw6sIH
         zdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        fh=lVkIX+BmDq12HMRE7cRittZhau3e1XrMduqzQOsf1YY=;
        b=DWVYOwmlktlq7uLe4CdjF8XAT+Wb3C6tvtnogcAYjPz6fAA/wTtLXpGOj9kAZcxBAS
         GB4aW58qOoEZDsp/ytgKvUZWcoa6M13Qqq9b/7GRa8qMvtuFMfLThQQamjZ1ScH8sjda
         s/N3P3nSs42GqHMhEcEDqg5MluCofMdG5E1vEw09XULjkFAhkbx2KN/8icaMLurhCoKC
         N6DMecZtSf7G4y1ML+RVe1V3RspxZT5RlnmqzyIkkKtNc2x1X/XaPLWbegQyxGbd1VNJ
         e2l3buCWVnJJ6olzBcw7w67ovqWA9QZa5hQeHXbFagSRLFeh4hJsb58X5udgKcyjU0hE
         Qlqw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715081; x=1771319881; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=LwU4N0MPNPQ0ggRsJE+vmVlKHnbHJBpesQfkLyLDbYO4aCMXMn0ZIk9qnFNoGAn0rn
         yvs46O7hVI3Jix5UczvGUn7z4d/F8nebaYzHUB5AgycO/CGZF9+2UJluuoawF/3LsWKT
         9nzlxLrc51s3MxMKRSnLbvfB6ur68ZjvAyNWyHH+6YehEDnifwam1TRvNBZ2H6sapItF
         JmrNFKv3qkdh5fs7YZssqnuCs94MkS89fbRn6LGaeHKDR8F32/dAOkWajODRHStuH7ak
         7pSrGBURcIUljM4wiNz78c9N02diooOw7oAN85K6qYYAIBgg+YAMSgVjL4CFFo/etdcN
         m7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715081; x=1771319881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=JPJiWWgnu7ZXLCdP9DhkacoV/ks8sl5iqUxtabUYh6O24iupg8PSZB6QZjDvCKCr0s
         RMhO+DqvpKcBjeDbV+wozYsm5I9MtWaVmzaU1KStlAdQKDRIZyN4a22by8GZE3XJ6r8S
         h9kbbmnP5rTz1qZe1QVpgl3PmZY3fA2uhRf6YfeinreawAWpA+LIsi7uZ/BvElcn6WFu
         Oq+vY9I3yZlppPGJ84J9MLZEgJIF0DgcnCF7AfNRrHNQtdox4aTZTIVn5ItiYD00syXc
         GDB0MwQwRerMlRNp5k7bYe9qxrvRrkc3PNr1C3LrepN8nQH+rZkkEV4Pupwuv4ASAb5q
         iS4A==
X-Forwarded-Encrypted: i=1; AJvYcCUzDQVC+ucomgksGJQ6j44yaS07/X67HPLpuUK3ngXhb96bQRNYyA+d5lkz7BW8huK+Wh0NWUv+Oo2BAB4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnFYqsGaTGXvSkgAjZ668jd1S0Jsq8mRsOOXLoowLHocEaM96B
	tKUHMGAxtBwCuFtR5V0j0YTu22GWB5vdavjuiZUxshvz1bUVdrH2r8ej1Y6ZQ/Uq4wTKfNrRbf9
	0OfbWdvARuSX9JaRjfqR9TzbFSGz7TvM=
X-Gm-Gg: AZuq6aKN9/pFyw1Mtj4Up4gtWlJd3+NgHMI0bhoQXuZGJZw9ogsyV57kqrQYNCfUrs3
	+ZBvpMg0bV6dTkyH7KJeb7FciJpsqIGZuPqjw9ZkE3bMc6ZhUloS3AyZxaYJPGmvoNbpvLsnXpT
	JrL+K1tMC9KgpDalel9kDZdZbslmKrq04SwGIsaMBroFZd1ic0DIWibS4oHVIGBhjVJUE+LFC2S
	4jpjZEoLnrRXXoQRvwaH6JARwUHm1xUTy048aZTYFH4tiFvAZ7M1P17Md3PU3huJJvNauAPfXxs
	Ose+qRcoRwlzaYe3cMg8DOoEPHBeluRa+IMdT2mzgaEyrn2mr8u4lfZMJTCJkoK1jo2txTtPEFi
	yUsFTtwG60/xC9EsU7jM55bTN
X-Received: by 2002:a05:7022:a92:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-1272494f67dmr219752c88.7.1770715080987; Tue, 10 Feb 2026
 01:18:00 -0800 (PST)
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
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org> <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
 <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:17:48 +0100
X-Gm-Features: AZwV_QjkDsbIYoiftCtGkfNW-taiiY4Gt3cD7LsM0k76oSccc34AX2xXNP97awU
Message-ID: <CANiq72now=ymUnmqV6ckaynKgSW7xB_3QpWpFmiG8Hvm_yV--Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:chleroy@kernel.org,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16769-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linkmauve.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 724DB118C90
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 6:27=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure, i'll try to join the call and bring this up.

Thanks! Added you to the call.

Any of the weeks we do it should be fine, but if the time zone is bad,
please let me know.

Cheers,
Miguel

