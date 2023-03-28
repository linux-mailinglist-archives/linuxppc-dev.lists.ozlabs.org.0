Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829C6CB65A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 07:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlzN93T8rz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 16:52:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JU4Gu9NA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JU4Gu9NA;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlzMD0WSJz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 16:51:19 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id u20so7175458pfk.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679982677;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0p4ixhTd6b5jVgRsZIOjd7BwC+TPVoJfAG7lUf3rBY=;
        b=JU4Gu9NAimvufu50Pw+CPY3Iy7Y0b+ybf4XCU61lNTm/ph1BCaU7MkBtYAlqOad8jy
         vsmlPsRLk8H5YGRVi3tsRa9V58zOZzz5Cqw2WCkO1qqVFTyhodG4gwj2bVN7sOyMaXRH
         9NsxQsnZKnlwbLvSiZV4sH3MtKC5ovBKE3GwYdL51XWnw/q82QX2Sm4r1/EFHOI5ob8D
         9A1S049jTfbkdQWKDfhVQag2GqICOo7c0gXUQF0bASMpskBiAYgj5QH0NZZ8A4AT0007
         2thg9RJMBprzVbRU2krN3yvTQyaqtff9zW1M/H4OCyf5jaKaCyDNwQuq/9YEXhgM8jrf
         ew/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679982677;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0p4ixhTd6b5jVgRsZIOjd7BwC+TPVoJfAG7lUf3rBY=;
        b=h7Za6WGZDwafGu0cdj79aNfddQS0fkTOuqi5Ib/ZF70LXCxzpY3gkQlQ774qmn+cl5
         zA02q50XHlctQsq+Moh3Dkm7dH0+toeiH2P7Ue6hQJla4fzBT/THBviHrjtRbvOQlh09
         r6aN3EkbKWUQjd0jlPywZ3Y3FPiRwMgv35UBFkNvjhtIUx90OtZciq+mJtcSSM2X2px8
         xN6d7dmHi9RxFjA/ZNlj5p3AkYO/71xhpbwl7HUl2+6/2Xd/icfhE9+3eRp2EhBGvSUA
         C6u3Zal5C+X5CNK49h2OxHqeVTHq98PSyxNsNdm5GZr46pN2/7BwzSiN+8gc57SA/a2o
         xhRQ==
X-Gm-Message-State: AAQBX9cpnJwBRF8tr9DsOy6AhFe467CyPLinYObPM8vHZVctHB5+2zDd
	VLl8OwunyNFMgr4QjRzzen8=
X-Google-Smtp-Source: AKy350Yhtu+F0IU7bMowfDHM2Xn7jCJuWxNCMCDu4LngT0KEPIH2xst3usO3eSbnk406ssstaKfdXA==
X-Received: by 2002:aa7:9553:0:b0:628:163e:48b3 with SMTP id w19-20020aa79553000000b00628163e48b3mr14447042pfq.5.1679982677197;
        Mon, 27 Mar 2023 22:51:17 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id e15-20020aa78c4f000000b005a852875590sm20068928pfd.113.2023.03.27.22.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 22:51:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 15:51:12 +1000
Message-Id: <CRHS5LDYSW5X.VQQQ7FLQKMVC@bobo>
Subject: Re: [PATCH 1/2] powerpc: merge 32-bit and 64-bit _switch
 implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
X-Mailer: aerc 0.13.0
References: <20230325130651.2457266-1-npiggin@gmail.com>
 <0dd771db-bb07-420e-8372-b021cbfe22fd@csgroup.eu>
In-Reply-To: <0dd771db-bb07-420e-8372-b021cbfe22fd@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 28, 2023 at 3:46 AM AEST, Christophe Leroy wrote:
>
>
> Le 25/03/2023 =C3=A0 14:06, Nicholas Piggin a =C3=A9crit=C2=A0:
> > The _switch stack frame setup are substantially the same, so are the
> > comments. The difference in how the stack and current are switched,
> > and other hardware and software housekeeping is done is moved into
> > macros.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > These patches are mostly just shuffling code around. Better? Worse?
>
> I find it nice, at least for PPC32 part.
>
> For PPC32 generated code is almost the same, only a few reordering at=20
> the start of the function.
>
> Before the change I have:
>
> 00000238 <_switch>:
>   238:	94 21 ff 30 	stwu    r1,-208(r1)
>   23c:	7c 08 02 a6 	mflr    r0
>   240:	90 01 00 d4 	stw     r0,212(r1)
>   244:	91 a1 00 44 	stw     r13,68(r1)

Hmm, this is how GCC seems to emits stack prologue code for ppc32.

On ppc64  the mflr r0 comes first, then the non-volatile register
saving, then the LR save, then ther r1 stdu.

Seems a bit pointless to have to different implementations. I
think we'd like to have LR saved before r1 though, otherwise you
get an unreliable backtrace in your last 2 stack frames instead
of just the last one, don't you?

Thanks,
Nick
