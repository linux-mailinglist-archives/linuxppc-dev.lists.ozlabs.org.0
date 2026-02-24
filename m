Return-Path: <linuxppc-dev+bounces-17087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOcsGEQwnWkDNQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:59:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE17181C55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:59:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKlrZ2rcMz3cDt;
	Tue, 24 Feb 2026 15:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771909182;
	cv=none; b=OInqXiHWMJWmq8IN/XvniNLE4FqL3e/N1pXbfCkyth4tlqxkO1vgyFU6shAuR4N4xi65FMc6Nu5z0vhh18+ag2VOTTB7CyDHYI4pBIa1Ui0ns6wwjM1qsdFWDFley2H1/1J7WsP7w+Gq/nxthRXkiFZulyzxOi9S7T4gzvKymgbAnoTpPvqMSjJUoOivqZD4/Pp0r5Ix6qeH4M/Xvif1RjjLILOit24eqigxgshK11kyW3RBB4B4OydhHBBUK01L298X/j21p8NuFqZ71RH40CUyXGUozctVoj/qk569LJRO2DSwtwmd81+75ZaOy1m9m9Ms5BCOBkbJsp+b5tK8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771909182; c=relaxed/relaxed;
	bh=Ou4URiguCEIHQD6BF6MkSWLcHXyR9MfBfXSYfwsYE5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSLVxGF0JFuOCX4Lc9tx3XaxHCgZC09aOr4kQrH1ytq4UIvYQaW5W07P0RcY6Qwx77IyFUVOQ3bmFID/Lq8N3u+i3MVeVcQXP+1xeZHJoHfA0fVE8kV+9uRWzgRsBRjVxKfxlMRx/M2QjPmCkJ0a1aw9zkzTHLf8UJKkQOqWY51R1aEe3jCimjD3L/wXZb3Z9nn+A83hD80pd5qqERGFFrtoYFHVAkIeVRt0vXvIyyb+Sb28xCsd+Gwlr1yja0qCbYef4GeA5U91I5+b2oXQMPLP2cAv2wPW5T+xn2PEMqZKqYubMVSqBqIinTRl90Hdd+ShGKG8jtoUCKtOc8vvMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jDHngT0D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jDHngT0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKlrY4LBXz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 15:59:41 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2aae146b604so35638015ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909179; x=1772513979; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ou4URiguCEIHQD6BF6MkSWLcHXyR9MfBfXSYfwsYE5A=;
        b=jDHngT0DAesJixDwderTzyIOSn47yIzrWmY2e30u0ule+NxY1/jhzSpTncUl00kEiM
         b3TpSpqpTK+K+HyQ89hO5i+K2uyZagwR3Fn30G0258GKo0A+5mt934SzOmfTSwi3n/fV
         xjUZPg0/V2V85qdZPbQPn3PU8jbADehMa5sZidScl/HvLrC7BQzNROscijILIHBUw84l
         MFwZEU7CrbihsUHyUA3M4ktkmJzVmjPXwYrWVKRbG0qGlZoftTb2VwItuSXLuAImeZrC
         jmZmXn6NIJaDV69nFZiCYA0pDJpbC4w7VNwupttrtOxa+NT9dEDos3lOW1nSctKZl4rL
         UGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909179; x=1772513979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou4URiguCEIHQD6BF6MkSWLcHXyR9MfBfXSYfwsYE5A=;
        b=fxmvjZQ36U1kUwiyWlv9yRk+25sFvaNM9m5K+Ki34H2G5jNVlbP/wPigCPhoat4uWE
         q9a97H5jsGyTpBm6dkuebPBT0i3u6ocbivSilas9sTyXiopEJ6kWbKDEG79MNSATFhy4
         yNTIkea3Ar/hk0++Yk0Mpe/S/UfxYBn9zwfjBYjkiuhNUdGqXOYLEPyXeE3P8uoqlbKE
         l3HeewjKiHbp5E6U0jggvlpT+BpPqXc3uvu/JW2X15luszJyEqdkwtWgCzvp4NVM9q1X
         SXWJbLOta410fJ+R63ZNXDkLN5wfm39rLbhT8sGTaDFN2tMkZnScXjciyf7iIynmckOP
         NJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCW5C2GETR8pyqXZLoeFEi1HvwLeqTA3L2L2WdU+JNtTKunAKLewHqW6iZDg+Jwq5mkHi7pl8A7c4brk+/A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya0LxU5eUDzMxHCe5SIz3zco88EggOkBO8o7XqrHG3JDnEdKGZ
	f6fOKAReeTRsdbWFNGVZEY8R5VjYLLp/y0YI7qQjslOemWvP2eGEwCIJ
X-Gm-Gg: ATEYQzy9/L3zEaeE8wU+iBsBIABkLjlj8yvr/hoLX3Iu2/0kWQvm44/EEe2Eem33Io2
	sO9zc8OBdD9rDsdBnQghfY0psQ+/DTxzJIWOd8JZZfk3uNesYFtS0RBfhOm/CMW8FmKilXZTRQ7
	7ab7OPQgz1pCWOK+ZOuCuThTIkEE0JEhbAjAJ3jLEJw9eGx7M/qzYoz+qtFI+tFEztCSMqpnBgi
	pi83r46+Gt28MA7t6xysSy7xOg2muydSokt94zyhJ43q4poCUzKrD9J8Kcm3Dbjl/gy7Y0iWh2e
	32zLHdlYTD/GFGKd3Amns8i+bkHcZffOND/FVVb08x7fGvmMrKjqraU/OD1Wu8lIz9qWO8vCPxz
	ZI4cPlbQovbDSP/3c2WYxx2Rw6UCyP7OVr0vkhDYV2b50u9VPdT1+8NuBz+HybiGl2ELc5udIoT
	G3tG2JTxDJ96SIBtsMtnwfHR2oDeCR6h8grv5fUdiJ1dO50yRcjujW7XO5D5Jp20iS1gEc
X-Received: by 2002:a17:903:37cc:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ad744683e8mr101466305ad.25.1771909179489;
        Mon, 23 Feb 2026 20:59:39 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.77.1.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad9f1d4b03sm7780005ad.29.2026.02.23.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:59:39 -0800 (PST)
Date: Tue, 24 Feb 2026 10:29:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZ0vxHY9MGndIDPQ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:post@ralfj.de,m:workingjubilee@gmail.com,m:mmaurer@google.com,m:david@davidtw.co,m:wwiser@gmail.com,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-17087-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,ralfj.de,davidtw.co];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6EE17181C55
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:31:36PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > I think, disabling altivec, fpu and vsx with compiler flag will work.
> >
> > What are your opinion on this?
> 
> It is really up to upstream Rust -- for us, i.e. the kernel, it
> usually doesn't really matter much how things like that are
> accomplished: whether via flags, a built-in target, a custom target,
> etc. However, we need to know what the path to stability is.
> 
> My understanding (but I may be wrong) is that upstream Rust prefer we
> use built-in targets for softfloat instead of disabling via
> `-Ctarget-feature` (and that the other options may go away soon and/or
> will never be stable) -- at least for some cases. For instance, for
> arm64, please this recent change kernel-side regarding `neon` as an
> entry point:
> 
>   446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> 
Aah, that makes it clearer.
> So please ask upstream Rust (probably in their Zulip, e.g. in
> t-compiler or rust-for-linux channels) what you should do for powerpc.
> They will likely be happy with a PR adding the target (or whatever
> they decide) as Alice mentions. And until we reach that minimum
> version (in a year or more), we can use something else meanwhile. But
> at least we will have a way towards the end goal, if that makes sense.
> 
Yeah makes sense. Will work towards this.

Regards,
Mukesh

> In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> involved in some of that discussion in the past, plus the compiler
> leads.
> 
> Cheers,
> Miguel

