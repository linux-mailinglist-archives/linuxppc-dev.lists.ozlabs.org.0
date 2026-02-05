Return-Path: <linuxppc-dev+bounces-16633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HN9FNvwhGkU6wMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 20:34:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085DF6E02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 20:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6S8z0Svfz2yFb;
	Fri, 06 Feb 2026 06:34:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1232" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770320082;
	cv=pass; b=mhQXZgdEqD/DyH4JkB4gnQpbHCVZsmyaaWBbgD4PPFJxG6ck4q3wei2W2q06aC6g2U70Brz0vI398LlWu72OcI24/Wpuy0I4VRLCfkcvDDUVkF88qiztrZmPHKVsaB+tAFAB/oOkAwZs6HFupI4sxKtF5kO4nH6gWPq/Qdsvtjl1/GWSIqxCGOHX+Tm4pq28c56uwyCNGDRr1EHwRAL4lcIls+4+tnGuH5/jn1QRa5C6zOCM1qEsxv0lvnks7kZdlq15c+mMveSmvbXpA5bC0IATG2d4n5kp5ohK8Obq3Jfa8rDhD/4HqS5X3vXI57omq/KriWnT1Oyn+aXpJb28ww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770320082; c=relaxed/relaxed;
	bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH8XWjD8JNyCiDjxNBaF8WFrD+GIp4H+mJ1BxhR0u/u9PJ+mBtuhCaFCFtgqXhlsIJgmXF394MCHXf98uDkBLeRXFpLgG9zza1/Ng2k8VidRZKd3xCbq6Ktboaw3met5bI56KGjWtv/5wIZUYLa5XLLiASbf0+/C14efQYgsgcSDtQOyE4RzknGDkW2FZn4v8ANHRp9B9ZoCi3YvfJIlVSLNQW92uzR7quW5XxOioyccFvArPugVtJJ6u9esUHr/lFfdmDtwLNsbSibBJQ/3v2i/rbrCr26nYb0vqWClU0b05/bSJy/jCskF8yK6hSER2vxdh3yI107+OXjQdVqXJA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=StHX7TKX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=StHX7TKX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com [IPv6:2607:f8b0:4864:20::1232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6S8y1VdDz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 06:34:42 +1100 (AEDT)
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1233ad1b4cdso69960c88.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 11:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320080; cv=none;
        d=google.com; s=arc-20240605;
        b=Vr7Ykc7DnDjTqVS8wKxnmemxdsd/IP1sK1Vbg6hMMAnp2sGjuOKYDj8zYWspo6Suih
         ay2mv+kR9SRUr8dqXWeMgAGSS+Hxegz/k7aVuONvTmE9VpKzPbY8gMlgJ3Bhj9UabS8o
         oU7KsbPJJ3VwvNVNLiOYJYTJzEeC6OBPHhn4JdeScMdaW7q9Jq8tkBkCKpuiw7NkqzzJ
         +AZlPx02m+pt2u3rjTAu5Pjapkhvk3ZOCLeTxuXmvw83Wzp1z1SU8gA92wxS3Oa7NjpD
         +2sbMxSRy1qjHWOi6uUw11IesoH1zXjwc2DoVz4bK1eRIZ2mnRlEXLNdQ//U/2VouO/o
         iMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        fh=zatsNOivt7uOkjEygSB8tsU94sYt4nvmfcXlshmjSlU=;
        b=Em2zuQRlXgqcqUpCXWCSMVP0oIqHIwE5Nhpsq2lbycOBlKcKidzJbOm2Vto6dkSjq6
         IFscVIWOxCqKgE/waZEI96HMqtmbr2edl/d+cHtxu40J3nsrK9+lCTcVcNeOhelNX5Ul
         Iyg/THzNyH6ljqN9MNGRYnt7Nz/nFLbKhq3EhB6ke9aeT+yLnNMsxKGvJ/RoB1att052
         Pv8EUyoImAQ23PinIV6vJ+T2SlV7S6B2CPLMKeO+E4IzXveNIG5XnTWuuyxP6rmxWkjf
         PZNjXPZ6Yw+Qa7l3yzDkEklw9xuyqhFQZgky2tXIVbZ1RdDMBsDi7vh4oJlTsl1Zd+Uf
         9FCw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320080; x=1770924880; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=StHX7TKXHivbNewuGBxSeJ/qValHfg0YeRuL9eCFIMlmuF4p1x4jbWKz+s3Y4NuB1c
         TwBYbaAmgWf9G8gyhhsaRNrKQ3TEy9dKwAn2kQyky3MO+SfQL9cZTOitKKHLdX0Dz8ks
         HTWStx7RMqU0khc4FqxC+zhGOSHHX2yNHAfvs0fFf1cuqEsjnIf9C+kzi69zvgUxm95l
         Jq2M+SQF5bqgHat6E5be0w26HHDnA9gV0jNI6Sxsz9VZ8i14gPnjmUQd+LM2Z1IPjgPD
         /pwXgUHQVnMuzi5FJWx+CA1BOBFiyZGp/eNWRVYaeEgWdTsGs44PEncEhqTKHjHOvLVA
         PppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320080; x=1770924880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=ii4cBFqkp+6U5nUhRtJ59C/nMpXfHqCdruPj/a61q6Opf3TjfDjo4+1hOMnv+rWyeI
         kZDJZ3/cBor1Bs6M5r8lH0aPWvyTCe/5LX9RUFwxFNdUT/bFIaZk0GXIjbXDgEXYNucl
         LCvaG5t9IHTLTiFFEVHukIpTsItKGBGC9h2ce47JXfSKn2WiWYpE6dng93q3KHjfHMf2
         WtXSWXoo0BQu8Xi1Z9h99EQInHU/pHztcG8K7p2sMDhsHjIzWF2sOa2Yx1aTVMwGWKdu
         PM1zWu7xbxOC4Cy+UDRRalt5iJIlA7XustVnhGsEKkHOZ4fNFa5rs1PDw73ny2d/X1x0
         0dkA==
X-Forwarded-Encrypted: i=1; AJvYcCVY4VepPPZLcHCYNcSrP+Bd5N0ZHU/GYReR04ZFKX05BQWRN4bbhOT/FQDwvlQtCxTFXYEukFHuDtrZGbw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmTEiwiF3/hlRH/XYwrEA48HEcTnN3GOhELSFA5krxt5GA9tSw
	ACYFU3J8x8dp1LSX0jImdoIeskX0tRNOQI8CEbLmbRUpfLass0/kt7A2sl31iZ2SGg8aK4YwLoE
	aKAvzqUCAbVvdjezcVUDfnf4bDdD/INQ=
X-Gm-Gg: AZuq6aJIp4omhDmv2YqJazVpOQJITq8lmVxW/xrtvKovgOJCAM0YcNSsyI/Wfq+XEC8
	7PjmaNaHIr3qhbD0qDCSb01hXQ7wkFkwfdfMCcnmZfpj8aOqtQ/52Au86/vJxUCb93JvgszZgDi
	W/WoNuwiXlC710UhqihpIQgzn1C6PfWOy2HlB6Bhx6jDzAzXQx4Cs86THdl0+auqDlJiZxisLxz
	9/Jy2L8eRTFokgFuMa2NC6AF0v7E79UaJBZh1fUJVBe5ZmUpUcBgiDWWykuFGmiTEwWPYtvrOmZ
	FrIumI1FDmq12+QgJ9J/MH7s5E2q5wzPJOIS77jeH+c/r+1ed5rfkTo2fBEA7nCsebb7QCkEf6a
	bZBy/wkhv0iUa
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr38975eec.4.1770320079827; Thu, 05 Feb 2026
 11:34:39 -0800 (PST)
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
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com> <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 20:34:27 +0100
X-Gm-Features: AZwV_QiXdOwsA6Cs9ikWk94o2hhbKT_np0MzoS_FXf6_Mvy8gIUKQAkUYwzBM0s
Message-ID: <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, clang-built-linux <llvm@lists.linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:workingjubilee@gmail.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16633-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6085DF6E02
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 6:29=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> use rust version nightly-2026-01-28
>
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>
> [1] https://github.com/rust-lang/rust/issues/152177

It appears to be a bug in LLVM 22 for ppc64, not present in 21.

If I understand correctly, then it may be fixed in 22.1.9 if it gets releas=
ed.

Thanks Jubilee for the quick reply there!

Cc'ing Clang/LLVM build support, in case they didn't hear about it.

I linked it in our usual lists.

Cheers,
Miguel

