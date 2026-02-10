Return-Path: <linuxppc-dev+bounces-16764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE7rAOXqimlEOwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 09:23:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E004A118386
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 09:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9F1W4pZVz30Lv;
	Tue, 10 Feb 2026 19:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770711775;
	cv=pass; b=gg7tuXgsBgck+1/i9Whqw7/fCXyiVa1lmaM0wOMZY974mN32uMGGK/ODRKFinCB5HYjYgo3HVBm5XAlCFXoiEUWe4FqYWQU6P8cw1FOiw5jYYaLjMikFuJRO6M3TMm3uTPZee74vizqZfIJb0fUWTZQHEwTjJp7KcySPpdX6AuzXAlr6S1ZvU7zJx1RgyOMI9r7BYyIVz/PTrQHohqegFuRcDoKUuV+Uxn1PWOi3sgnCsQRwHu3oLxulju4YffVjibV5GTLs66HF8rrpH+V0S6IInzeaveH/6tUfGdK8FIRX+3AB4+RS2bZhJ9/De3HRPZlKYbB7+6va0Nd4m7V0Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770711775; c=relaxed/relaxed;
	bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OolUFw+39oLWGjVll+BeN4vWZvfIfJDpTpVrq7mov+Dt6tNP70IBVz8XbVR0p2AryedLidZ0bA6cDWQrKVkpCd/W8v1oKYK6AgAagjQRV1GnQnPj6vA/dFvNGbpJ90/wsPgy6pKnG/haRSQfdJbkTt7AqKUI/Cuc8LfeDtCLRgBzHeCm9y/KlhQQIeJgh/LIf3MqK1ukRBflcBc1E8uxYZb8VDkRbrUJwKQWRnfo27e664jzZf7mEK4O4Imp9b+UCHxfd/uXU7CSkw94zR7YT48bKmm+q992wOZdc4XDACj9pXVup1fsawSNDrlvCyF8kKcdSvRaMp/jv5r/V/fHaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F/m/YuPc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F/m/YuPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122a.google.com (mail-dl1-x122a.google.com [IPv6:2607:f8b0:4864:20::122a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9F1V0nwZz309N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 19:22:53 +1100 (AEDT)
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12714f01940so179223c88.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 00:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770711770; cv=none;
        d=google.com; s=arc-20240605;
        b=HQ2L7gpcD9W8qin53ysy42HFbWVMJiGmeQlLUafiCBKmLeGuIHpnu+3dB/udMS4yBi
         apm+xUilEN4DLz+rfV2zYq1BODf5lFQqSXxxgJ1hMhmxzEHL1vyuEt1CWMbEGnWlx9Q8
         pHnkGx/pJY1zaMxrG5k8Haoq4/RLEw2dF2ZjTdAfyZUbxnhQWVSLli56aOHXDkUuQZMA
         hmUIeJTqX3hd2GBkNJUZWCAZwdam5yQFCe/O/mAIRweIoOTFiSUXODHGLKMiyskJPP9C
         ib3+D2ZPekycqFoYfi0xhTsgUkkui+TBggtVRYVki3+vlgaR1bIqAqh9HXzcJwd/QDGm
         dMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        fh=HfJFOyXV0XH+W+74fySmrtl6Efljrnt2nq6zY/J3kOQ=;
        b=BrCeMgWYXNE6iqSJvc3xln/XZIgi/3c6SSdWn/shUem5ddU4frbE7sRg5By8y6zYkn
         ieaQCwlnwtNbOzKACenI6P7xeJqHGSULzTl1m+IDgmbu0UIbUVuT10DIC5EQeOKj20qB
         MhyyXoAh0pU7AQZQqiRY6pqqyheiz3Gi75ZnCZfZjLjzEoQsbl+sCfDElZVeMGK2jADl
         sN8z7ansfxkOW89bGsuVZpx3Ei4mOlH7VzDDDCG2OhEJ/HErCtWNyOMCSsMS6/MUF0GM
         KSoIzAWLxzEqCBRnEqtfk24SvLRnu9WTIeffEjpo4CfJYnZuWGj2L8fFRDMVLRgjq3TP
         kK6w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770711770; x=1771316570; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=F/m/YuPc9GyEM7zD8MU4P9Z1WN29Z0jxoV3tV++Sh4SV3qFHQdrlyyb7JLK/Lot+NT
         w4Tl2KLBSI0PP3oPlZitMqWDnf9x0vrUVFysgWc5Lb7TocU5rZTspy4uZXXQctTQ9RtJ
         +A/b+GZE2y5ICtXZuwpJfj+jtpQ56ivsjaizp0JdmiCbaG2EVoCS4GFycH0zM1BRRSeZ
         T2kuKHeMagmzlNANKfnHHOPN8jjjl6ar2+fpVVxvA9f5Xw1ZXZMNKi5lESJtRbsk6wJM
         q97AkfarzXVt3jxFP9mA0s0hLRy6JSmfKZAVAlSjXMHyveeRxOxcnGEeUz1IURJQDDTx
         Vp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711770; x=1771316570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=ImrHfmp1t625dlgiZXfSWHfgCbic8FXTdErIFRDAjra8eYIjmbP3pQJy7vKGFFLHo0
         ODRtHZkY21LPwojw2t0DHHHHbqvnlmKc90Tha4jsfxFWYxAqT2LCaeYqTzVUMz7sCQQx
         Yp9VBHY+ISuQTAca1fI2ExHnDr6kvHEkzdiFHML/CzD4EhHxHVW6p/3PTsiYFIW47AI4
         CprfIXne8i4NDKJWSMSbxsgd0zaKkzJkKf97rsBUP2ZtVy8xi8/wHLKQEJxci8yHjgEL
         WfA+nVOiCDZIMZT21RD5EPvZLLj+b2uVI6lDbU9ZTR9YcQSlX75+wsYhel+NDqU9T5A+
         0lqg==
X-Forwarded-Encrypted: i=1; AJvYcCUarcHxs02y90hi2OvIXsMahXs8ldddsC3gRKl+AiCmK32+5skTFXpyb9HPR/Fss1Jeev/QWMzZRoHDjtA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyY8uJWGnihH0foPGkAchOT+R15XeiOVeGpFHFG1B5EAO3dbsAK
	ZLUz86isf7P/2y1RX2y+Zmm5zHDTlX2BMzqZBpPrdV0oa24IO9COd9phKmE+v2mINgjcGc/T02O
	R7WXyyvezpcwMK74dtrFa5FIfC/apF2U=
X-Gm-Gg: AZuq6aL3OoAcgn0ySpEy6JZizJIRaVtvzKkAure+Pe4j9TNgk8XR2lVF0EYONH4CK8N
	dr8hJDcht/x2IDfIQ9eChofjZoBajVGgAEbk4eJVlOQzN2ffHhNJE4nPozq0GIxbRCReruJViNT
	Oo4HztC0oSogSE9HeceNm1cMcL/8Z71qq8zX/V3+iLtchhU9t/utFcf2HNwalW81nDSIKGvfGkE
	/e6eeUsfkVQ8RqMnSsZaUBtxotw8CRgl2nsjFIXahEO5YUFEKl8b1y+atSBWXRGzyCNkn6sincH
	faZPD/rPcoxP6e8x6VplEPO8HZZS/OU3zfWVoa+5aUL7YNS0i6X7TMWACi4BiyzQp2kGiAGkaWR
	yRFidcSsl1uRW8Xf5hsRF42sC
X-Received: by 2002:a05:7300:3721:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2ba8cc89047mr179670eec.3.1770711769563; Tue, 10 Feb 2026
 00:22:49 -0800 (PST)
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
References: <20260210053756.2088302-1-mkchauras@gmail.com> <20260210053756.2088302-4-mkchauras@gmail.com>
In-Reply-To: <20260210053756.2088302-4-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:22:36 +0100
X-Gm-Features: AZwV_Qj75jgKNxxldUxP7x9MHEjb0UnbouefGOQsNNhG76ZuqB3-iYmqrnpWbNI
Message-ID: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
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
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16764-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E004A118386
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 8:18=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> -``powerpc``    Experimental      32-bit Big Endian only.
> +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian=
.

As I mentioned in the previous version, this is not a valid level
(same in the previous patch).

Thanks!

Cheers,
Miguel

