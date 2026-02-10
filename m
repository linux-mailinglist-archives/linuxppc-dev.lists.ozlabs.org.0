Return-Path: <linuxppc-dev+bounces-16771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PP9FzYAi2nJPAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:53:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86D1192D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9H2V1lLMz30Sv;
	Tue, 10 Feb 2026 20:53:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1336" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770717234;
	cv=pass; b=B73Fliye+U2ZFnas2AN51M6ThqMQG0QgxS/Ik8TXjI93HxtjAJICjndTXAkhEbcWiXupCq5D6SomVB13090v7DufktsXZjthHPs/U381epRCe8sTfGrPUs2diBNHcO1N5AabE+F+VcwvnYDjGc9+jqV6j/RofvnzR+p8miESawG8aGgemk77gnc2dQGma0nnkUmECekPsnwWh6MpGXhFepsbBpv1V6cvco6VF9PnP/j0DUQSaeHR8MsfFdUmwn03ZViRT+odgGJ1lXzdNYvHROoZWu7P+FBR3ERSJt7ygOubq84lw+ukhBgjEc1Y9OWH5AAGAhEvTg1b/Al9EDMBbw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770717234; c=relaxed/relaxed;
	bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGssCfeMCDk3eLQEkEyLbhbs11uxld0/ZmVNwzkWh+G26KDyRjmfnKS7Z7oFglIwlae1fxAdewVuIK4pjbCsg3c040ArEF46OwIGCbVcqhQ0eK+uwksny3Xww7lBxIz7BS5By4dGKUoumiKCII84ZdROGHE8+QfHkY9xF/aJ4zL4pKpm6ix/+HzhJSf66fi+BjT4K+UANIaYmE4AKTdtkxpI2wDWLH0JElTWilbJl0nTQvYCeByEipnX7HoYfEnnsJ1DrgN1CJK4l/n7YQ5hqYaM2nX63yMlebkipd4y7smcQjVz5XaQwJmIo2EiFbg6kfY8J02w8v8lSmqAVhhppg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+ZUIqly; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+ZUIqly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1336.google.com (mail-dy1-x1336.google.com [IPv6:2607:f8b0:4864:20::1336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9H2S4DLSz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:53:51 +1100 (AEDT)
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2ba9324f461so2605eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717229; cv=none;
        d=google.com; s=arc-20240605;
        b=bNZk73a6ttNvOjk8mvJUuoX+P/aAKEtw9k483nJpiNF53KDEIDTNS1zhn6AU5m8Jhk
         2ohjJzapstfF1rDCjf3bIAuQFpU0PGwETQ8jzO/vbxYm7bHH8gMLeXtEsvlNuFZBvYPp
         WNtkYcLcsr7bywudmEqk4udSgYjtRzms1c+ufWJ2EF+50YEC2yTEGcHFO5Xpykk6SExb
         hGQmz1FGLk5XGbx5R6qkK+3pWfKLSGP0pgLyfcDcRQa40gIBcgnVoYYxcqaS5Srm9gDc
         t3DNpHNQCrZ+1GHbRcy+ZzQbBb5feQzVRNmmCiAWcgCr9jTxe8OV697ivxj7dFdzmIiF
         iPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        fh=oDcP7Bc6JGvNajaBoOlXrH7V69KFxoWXbFODJc3aJ18=;
        b=QhPvLjgQVD5kPq3GcTL0R4GYRSwEU8AbohMe/mBez+uuHiPnaRGOHNWI7JYQ6tTtlQ
         EZzaOVWwbIow7R5KfGztuPhR0tCuHWegrP3r+xehOxf/Dt2ym6fNwABUoi8ElAIdODjW
         uEGLGsL1TiQSUbGo7idbnv+mYiEadAjctVktgapqU1USfQq5xL+1IQZofXEMKNZkCa0I
         S2KPnZo/RTBX3DIosRkrrVbzQlb5tq8ZmAOziyBK44KPCKM2PdrxHbwKBBbfVSYQcZsA
         AKzjgeA9DDmkTkxQUaxbCwu46xDTsF612zq5+mjSnbJIOgxERbXEvyVEUMQC1rSnWKXS
         1XSA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770717229; x=1771322029; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=b+ZUIqly1kkDv8+caiv7IFdjt8I1TnI1Ye040/fviLaxhX9Aa+IhaWJWae9/omWL5g
         x34k4X+fYjiOtUXeXjSCO313pZYT6+CIsWg+rzhb9Pc7zvjv5+LMT1M27EE0e7lON4e8
         F0tX6/NNwgShRnt0nfzTivgsxppvkN37YazqXljp/1gc1YtU5PqQJshg8bJd4Ic34rji
         V4jvQGQuGkW40zJGVxxVAxV8yUnvJhM/2au3BWiEGqJAbddkY3ucEfWoJiM9De8QExX7
         sEluTLiWvTnfhSev/hgYcekQ3w2CG4VMN7HykGrATJA8pxyh+y3xbVQB4ecBIoJtK+2y
         Zejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717229; x=1771322029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=G7lPVJuvEjMLpqLDYrQbfvnmXepTVQRCexSzllubcjMwFxEDQ8K4b7Dvadw2uhvB1q
         b5Bh9ngs2I6zUUxeCo1WTque9SxqFKclxyIloOtdH6SWyrXYbVVX6WzTeUgnV+LOiQKK
         0wOzjjJtO3Bw8IcwdT61gbgihi7z25BQLNmN7zmDn0XWNuwbM851hkw6eUUNshxr8X6L
         zozfWNbtCsb6EFf4v1C3K/PJ1DpU/zYAFMzB9etfmCz9M7Yt7ikptMU/tvc37C3lmXHs
         hefOSOO3cURrd7PNZPzhiQCJY0Bnzp4q74WRI4hcnjwmRNX8rMGdHIrCddSn4ilQmw5E
         Itqg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6sofYqXrGkwDq3bg//vwnIXdaJtqfgNDsQ+YCot/j+gwbLoq8oI1UKSUQ8znFMtTLeN7K7cYLlFZ4O0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy426W6W+jeN1i9v2L8rZlu68nLCxWnaDx9ki0LQuhXQb1R9f2+
	5Qmh3d8jB5EBe8Sm7qIWrgdWRbGut/bAtG/G1KsmVGagsBqkPbkEau0RPF782Em111EecBTMBni
	T/hV0UK3y4id9d07injagohLhE+soVHY=
X-Gm-Gg: AZuq6aK394BB3R/Js2uJUK4BF0N2X2J+mpq4KCOWknx4BdM4Pa3ZseuUbSfhfh1coGV
	YTcUVmSjrjD5KGgsiYZDpS3Svv1LYD1q8r7ySD2uiKmPlkyKQhGqwDYgqRPt3d6FeZQUHZ0i7Xd
	sqTEX5JaY9XOCwhbRLpWYVxZYbwBP2O+aE76sw6SahhkXseOa3uy3/XzBle/DUia7XYUI8WUtQ2
	K/IwaWDrXgJyZ8I0srMz5Z6PsiWZ21jZq7lFkbfQVtxF48f1N2PHhnjABmdm4qbw+ZuBv/tedpP
	OKVcrHHuhz7lkM1hjy/mlFhtyR+cfRCS8pLqvuf6dyNJofmXfBjBIrpQbGzcIfi+xZDmT34DH6V
	VqE0+nZcuUZJ2qYLIT0v1gw4M
X-Received: by 2002:a05:7300:d506:b0:2ba:674a:dbe8 with SMTP id
 5a478bee46e88-2ba8cdbea18mr186901eec.8.1770717228681; Tue, 10 Feb 2026
 01:53:48 -0800 (PST)
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
 <aYr9c90CWAXZ3AVl@luna>
In-Reply-To: <aYr9c90CWAXZ3AVl@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:53:36 +0100
X-Gm-Features: AZwV_Qj-Kgu9bLoO-gKQAEhUKyeEsXtfDicIFD8WGPBwV1O8UBQ_YNqmy8D86Ug
Message-ID: <CANiq72nrmaczPQQrf6xjQrT4j_TVghE2k3CrwJRs=R1tZgiR5A@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
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
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:chleroy@kernel.org,m:mkchauras@gmail.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16771-lists,linuxppc-dev=lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,linkmauve.fr:email]
X-Rspamd-Queue-Id: CB86D1192D9
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:42=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> I=E2=80=99m just an unemployed contributor, with no ties to any of that b=
ut
> sheer interest, would it be ok for me to join that call as well?  I am
> interested in resolving that issue in core, only three types have that
> issue and only in their formatting code so far.

Sure, invited -- and thanks for wanting to solve it! (I asked Mukesh
due to the IBM affiliation -- I didn't mean to exclude you, sorry).

Regarding the issue in `core`, for context: if the solution involves
adding `cfg`s, then we will need to discuss how to approach that,
because years ago we wanted to add some to cut down things we did not
need and they preferred to avoid to keep adding more conditional
compilation, so we only got the `no_fp_fmt_parse` (ec7292ad3c35
("core: add unstable `no_fp_fmt_parse` to disable float fmt/parse
code")). At some points in the past we discussed a targeted
`cfg(linux_kernel)` one (instead of several different ones) to avoid
that.

Cheers,
Miguel

