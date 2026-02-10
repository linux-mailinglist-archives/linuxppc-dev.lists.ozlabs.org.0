Return-Path: <linuxppc-dev+bounces-16758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DwZJWDCimkeNgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:30:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01521171C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:30:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f99B52x9vz309y;
	Tue, 10 Feb 2026 16:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770701405;
	cv=none; b=f4/4kMGVfPj2wfjbEVwA2BPD0IwpfOjuiy/gUZo5+PNw6QQeMKtHnFtrhNeszyZW1bnD1TbAZ7yNGZix4sSrWAXKjWpmLO1u+JnzIwWfHjOpn1CYhIe1uqfZ/iyZnwi/RqskWd8KoGw6L6rmYxvExLkBfMNgdtFr817RhseQqeG0n1q/tFV4lbV1XHxl/RIV0zqsAmeitLH2Vrz871urJSCKOyW3htkIznuQjhBZ99fctL+zl9Q+CeS2R8csjEUGatoiNXmfu4koGj2uQf0muNzz4RBB0jZ80zvciLjwggqKmpEbGtovStNTrSrkWjaek15P1rHjHBGyWyUo4Q46wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770701405; c=relaxed/relaxed;
	bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIef+5QteBg5OZLebfZFZq74/lv/jGPziwL+XmL4lCtZiQ9yl60MM2U/GkI+joF26pcygsipqqzHQXtknnTDwHuFoEdWYMxA5+X4AEswjRFuFGmkj4N6s6KyV6hSGQWPzLe3Ux74hsD2n1jHJDTOXBrHpFhVPuQDup/rpkjZ2jQszTcnQCg9s2hrHMPcMAiQnv12wyV8zd+zGv7Y4gO1uEHLsj7OOv9w+r+1RR7m+cBW2R+GtwN81KVPyWQSWco+TZI8OB+kbnGa/Zekxtm2jqjWv1jKVoszEITZFzzqGRo3xAefeEsQgwaewibB2ClUdosJTOsBkzcOix/8Ez4NNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VSDI0v3v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VSDI0v3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f99B43HjLz309N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 16:30:04 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-354a2a7d90fso270917a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701402; x=1771306202; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=VSDI0v3vZYmycpLKQZcuXESH8tTWODEfwlmWbuBAiFL8NhVuchxA9G5W1iokq+E38y
         CaspSNFibdtUb89TtUttEKekSZ0a36OJJjBOyeeC1T8I4q80RN4VpPrlk25KmHfl807X
         c1ssII+hSv5SVflBHCJbSgLoQ9xJTtjjcDJzc8newellH1MR04KY9xMgWPa0yOISSrBd
         30GjfLveES8BaU4Ilc22uTPus/3MO9n3apA02y+UeespLQWuKy8H7DPNikjEMUQRBXtu
         rVNgodePgGU7/UwrzibOdO9vzouCB8n8Mt/W4lo1aymApeHMYRVwjyqsXocNoUFF6Em+
         EYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701402; x=1771306202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=lZGynhAxmrp4OjzDK4sEanGfSr5czxLKtcLsHBxUCgnA7L90akn0+yg5fvB7j60Ii+
         m3++yZx7x1hPNcaF8zicjRe3TUJXNKLMlHweuoYxSag+QX/0JaWsNNJN3clpXXLhkANy
         qPzFd6R2AliRNUN0SJajHMcB3P4R1ya0fzJ9VaDcMkHbgc4Wkc3mPdHnN7YR5tyWk2Fm
         2ig2OfxmbTnc3UGbuykxJA0PWAbCDZUEuOVzW5CU/PoakXuHmmQ75fMs+5SJ63pOmJ2G
         6KED2G+FNYTUT+xdcOzLl7gb+EI9yO0wzyLarteQuFSw9ju0spjW1bhB559My89PHXga
         XW6A==
X-Forwarded-Encrypted: i=1; AJvYcCUlKEQxgZxrhr7+4b3vd2zdQr1ze5UNvh2dHVyW8YYEMdDiJCtFUF7NkTCe+7ZZqIYOK5OiHaktbl/mZlg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbRwmxY5f0kyDrAlhxyhrQSQhQe1PHB5KP2S49kx7t+NvzBH42
	GrbNKkxlzej1/YN3Mf4vumQliQAv8Ac+Non7keMqEmIWLUKcOavSClmP
X-Gm-Gg: AZuq6aLgHLFC8HeOMROa1SevZG/fkDVn7NWDmqJ549H0vQuFQ2nSbvZ1eLObFMvovy2
	2CogLWJQ3mwbWe0fcC0t2Yv69aM26+hRqwoWPrMQ3umu1/hesS+wwVo09C9eoCf6ZX0mixYb/+Y
	B8RrA82THlCRgx5nGMInBVoxcQCKxfLS9NqXJZPe8jS8cdp0yImCppK0lAMpqModZzG9mhH57+R
	1/zFx1219dUgdrFIdxEEYdtkIrcgJ0AieZEFZ1unEXZDuBX+W92FTL96ljWgzRTYlOKe38Qy+k1
	PAeDGuii+WXjAVXZ5F1d43Ft65RC3bxw0xnuz4zZNzLge9ufTpnIqsEWJnwC+LgAkpSlyBDK63q
	LHuYV4rf+Ep752SMXPbm69kWAupHHbZ1ke3qv4/cftqwrkrPwFG0hheCrIzCjW+0PQGOwzMYvIR
	y51j6JKpcAqotAg7p0vCzAqrhgJPIN8nh7bdsZGxE/RoEzlqzKfYWSZEMnC8ouxmNnSVE=
X-Received: by 2002:a17:90b:3fc8:b0:355:35b0:8b88 with SMTP id 98e67ed59e1d1-35535b08f56mr8262973a91.32.1770701402185;
        Mon, 09 Feb 2026 21:30:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b465df46sm5168250a91.7.2026.02.09.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:30:01 -0800 (PST)
Date: Tue, 10 Feb 2026 10:59:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrCFCg2yEpCMPS9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-4-mkchauras@gmail.com>
 <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
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
In-Reply-To: <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16758-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B01521171C2
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:52:26PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 11:55 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..14febe9c7643 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,7 +392,15 @@ BINDGEN_TARGET_x86 := x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64   := aarch64-linux-gnu
> >  BINDGEN_TARGET_arm     := arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> > +
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> > +endif
> > +else
> >  BINDGEN_TARGET_powerpc := powerpc-linux-gnu
> > +endif
> > +
> >  BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> This looks reasonable.
> 
> My only nit is that we could trigger an error in the nested if since
> you wrote the if already. Otherwise, we could remove the nested one
> until ppc64 is supported, or am I missing something?
> 
I will remove the nested if till we have support for the ppc64 big
endian.

Regards,
Mukesh
> Either way, for the Rust bits if powerpc maintainers are taking this:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Thanks!
> 
> Cheers,
> Miguel

