Return-Path: <linuxppc-dev+bounces-16741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBipE5bXiWnZCAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:48:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00BF10EFB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:48:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8kyB1Grpz2yGx;
	Mon, 09 Feb 2026 23:48:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::132c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770641298;
	cv=pass; b=FSEXX2o/D3QjPgzw37I09wXbBpKuEllXb8/BXV7vyQSWULIslvZb1guBY1CcSyLV8Mr2RKMgj35wnpE9r7l23WQ4Hq168xUY8jHkqy7YPAfDHFbQxqwxV2iy1XT56zJDfbtrJDafWS/MZBLXHG9WcgaiNDq6yNtOrLyCHJcNTFMXBZB/jozKPT6J9a0o0E+QnJVzHYSpiNV1e5cNsJY5/u1s4ZAzdkQgWtEogpt2/xpPVw0BYxlK/VQ38ehGXxSEHozK+bpBMx+bBxTOq0vvuwfB+BdN1H0L8R404d1itIcP6tj6ABt7NpEqo0d2TDQyiiQckaJg7M2z/UzujC46+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770641298; c=relaxed/relaxed;
	bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVB2UOfSFrDIPw7etQzS4lAKbiG3L9sJi2FOKoV5R/7dSeSpnhEUFaywrdBiqNqbO5EuZc/A/wioYuIakUug8P08S/xs/J5O3gGeZW5XzH3QLn9WiH928H6GaypuMfrN15KMX3uyPNHyOG1B/2daXT7hSaD8fXI1/1bIWYK988ZklYl4w/uG+JhLrkLPeeK7l+DWw/q4PzNpkH0UQ/sctILLn7O++ExX+nMuBBVQEgBOMDDAMqA+g44hlchGc4A1b8Ze1ySKMXe9L3XHfzzIGSF965MRGQ84Cu9jM+IgR0butseYN1SFEGcwgbQ4SwmtdFxAxXdvPcrUaR27cMepPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TCarjdDK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TCarjdDK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132c.google.com (mail-dy1-x132c.google.com [IPv6:2607:f8b0:4864:20::132c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8ky90Xbpz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 23:48:15 +1100 (AEDT)
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b866f98574so129990eec.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 04:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770641294; cv=none;
        d=google.com; s=arc-20240605;
        b=EmrbmG/HEzcmth8xdI1qPnJMa+OhwtF1OxMlrfe0exn6rMKSo9D2X8GmHgR+zEWJka
         h/nRyXNa3Piwl9DDH8Ci5v497hdo0MN7W2xAYsD2vDFWkaKn/CiSgIvWb/qsqVjH33cM
         /tGTiBc9YbmduJMYpYtfClmuBHRpwxSmQElADlUE+DhE5SYlC2+P9HFRSYvwXV7/ZPwA
         mqZQwrPhuatDpxgY85sb82HcHi7/S6Xr1GstfcJJOm9hzeVVgOCSjBrPR2x5WDIA4OX5
         esXb8SiJiBnMsGAqQQ+JsRY416njdJ6cVp73ji0t1KCpYzhccdy8MBvCS5NunKdb1T0G
         ht2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        fh=TdTVUGd6S+FMfil1ap0MCj/IqoHIWajWnZ68qlW8SPI=;
        b=A86kHkYDOK6H8crMHPjwB1cGiIPbbN0PhghgdYPOhRwd6kZKroxdBkzJmhLtlx7kol
         mBPQBLAeEMFmx4uFlLXaT+DcEjbssE42H2xIMdfQ0ulHocDOPPCnmbRSwyGF7xQtJ6Mm
         R9lJPUfQGBxNs5397mMkQVCvwO3aTYAu6hTae1AYHPb2hhcYaPmnx3fL/4TEqYwy10X3
         Yk2DhKEkAeEMxEcxtbXxo2zZy4jGKAOVllPPwHDmC+T4R7AWJgvHobveorpS0at9Xn4C
         3+K/nV4kUI5JtDeED8fxoepBCQ0V1Yi+tF6Nbnv+YDTcuiJ8YC+p3NyM9vXoWseCht4b
         wj0g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770641294; x=1771246094; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=TCarjdDKkwrU7catzuoZfanhKSbxRudDPWqyX2LUGatlpoE9Vx/pBALJiZ3i+w0QsV
         Pp2mFUmKbcDcXE8vezxsw9QDwvQs0/aeExP6sYB8IEK5eefNVPyYzMPT7VQW4cQjdSsN
         olVt6OE2WboO77NM7Be+bkuHK22iWceLTZLz2PROPlrPD+ZLldC/TABN6r9W5GQl/r0B
         UwP6X8urxsFSZbLSN19brgVx9S5iiukI3jPayJmBq6hRXaZXrke21tns05MKngiKV6m9
         XKH1uESHdDUsWqPJig66TGmjM+05W6H3q2oW1bquk1r4/iujSlZQTBYVyh2VYSWp+hsK
         aRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641294; x=1771246094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=wq7z6zYQTBZO8RXODgbYbSeEiXQe6uK3rfp9HG0ZyQc2aKAyBAImcsBwKNHm4Ouqf7
         EfUnX6KFbExxm+CC/q+OnKrtlhNUy3jB2NkzODuywZ106LKtwsIaj8THqA9iLJi3uyDu
         a7dZ5kK13DelujPst1gsQnq1pmQl5GnXHRzQJZdJ5Mz5xIjsSr8CZeGEgIGnA9m29hrr
         ozbsG7w3aeZIvg7vnh5KNiRxCkBkVzbLIeLYURfsEO6SFrud+k022wCVv1sFvg4dJWK7
         F6ESSrqDVQEr8/LOcJrEjYUcaC6s7hAv5hRK89wgiVWAbDTC9I7377zWUzYA1Goe08aD
         BTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjbZ5B+Rh/GFzqsNTBVWm2GMghS+pqbn+GmfkLFXU0L2CTaPavmcBQA4v5j19lAPgtmb+moN+1NouQ2Uw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0L0aGfddHYHVlPo4gnFFAEfwsuR33P1KaIaKUqKJTy6oT+ufL
	Um09cCNYgwFczy1j0Xe53bMJw7FwzoCTPfMiLcsygN0yFfmCvPLeFcysLGG+qEyLP6Ox2HEi4hT
	xc9pGjAmVlUj5NYFI2/AxS3iI0oT9y4A=
X-Gm-Gg: AZuq6aKHiAjmixVxcxJLlH7Ur8XXc5ep0umoLyZtDCllV1JAZ293M3WypeFPuHVcn6N
	xTXy43FiqPN1RusCZEPuEssfYgA7Kzc7sWmXw2v34FPs7nkselAoUkSrFX+c2175LZAgYFugKDG
	PHiWFg3wSr4QLfJn30sgpaC2JKdCpSQrj7p1wcUCj4V+Qke0SX1Nb6wIcMxvu8h/HX0CSGr+VRV
	Cv9uZDl9EBwdiHzW2fyB6menmLMItmN0HL4vhFL4/mJeZEjJLWsTuPQdHQYWqRDH3Vfvqa3LXE8
	RY+9sL1cngCvR+g9j2ival7FiQOuHvw+ThZUzznAFGHN+YISpM/X/uoDUFXXTEx6Cjrp/1V3sH8
	XUm2K1+mt3Qaf
X-Received: by 2002:a05:7022:f110:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1270400d2efmr3145716c88.4.1770641293834; Mon, 09 Feb 2026
 04:48:13 -0800 (PST)
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
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com> <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
In-Reply-To: <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:48:01 +0100
X-Gm-Features: AZwV_QgErW1i3cdVg9NCUS7ajodA3eR57gJ3TzoJcEMEoaMPMOSJAFJmjla3p-Y
Message-ID: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16741-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D00BF10EFB5
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 1:29=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> As far as I understand the patch is complete, the problem is outside the
> kernel, it is in the libcore provided by rust or the rust compiler.
>
> That libcore seems to call __udivdi3() and __umoddi3() which are not
> provided by the kernel. Instead if should call the functions do_div()
> and friends provided by include/asm-generic/div64.h, or provide
> __udivdi3() and __umoddi3() on its own.

Yeah, but what I mean is, should we add this if it doesn't link,
especially without a note or comment of some kind? (Perhaps to your
tracking issue in GitHub?)

i.e. if I understand correctly, you prefer to not add the panicking
intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
By the way, it would be nice if IBM could join one of the meetings
with have with upstream Rust to raise this topic again with them.

In any case, it is up to you, of course. My only concern on the Rust
bits is on the docs side, the rest looks fine.

Thanks!

Cheers,
Miguel

