Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35F1AFF34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 02:31:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49570k5dS2zDqkK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 10:31:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mccchVGC; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4956yP54vBzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 10:29:17 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id hi11so3092132pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 17:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=imCIcolOR7B1A4TEDHO6HBkSJsW1cQgUD3JjwK/tiPg=;
 b=mccchVGCJNZYIZZ9rqUjgkTFBG+sKlFlhH4+pV77FU2GWxyzmpWJC6Ado3L4YeHovj
 FvGMpiWLQ2QXHBjLNPO4hg+e0OUxveGv+R6yX22gzIs1gi6eS4RmWai98/DkE7OA1IwK
 H6rgAvyGPa4mpqfJB0fx5EiTOq9ydS/QVIH1rr2FB1nDaBqIhlKTlVGX1YO35brHgQsL
 0pMtu9kjTWp+vKYUodCZgCOApGrX0fIoeQGPl1EETfn4OAe3M84odpRKWTjyQTxs8yhy
 tamjiK3ZM6bvu0qyZIHr7BwAYT/6exppY3Tk8Lle8LFVKzhk2UY0sCYEG2n8jh6/iF5T
 88Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=imCIcolOR7B1A4TEDHO6HBkSJsW1cQgUD3JjwK/tiPg=;
 b=AtN9JpOtJqTaEhekQM95zlSeXa18CDgjdQr1nPcSBK1aHdJW7IutguQFKLS4qACzlZ
 Y8Vlk/qc20JnGlQQzYbkVgn9EH5SFwJCjzuHcOpKIH2jwwAqdgv/UuAJhfaAK467K2kC
 74I4tpPbDprCuL+OkwEyWuqUo4bsZv4bkWZdfG/rdHm3ng0DXuNHpvKYaYP3IxJigmRQ
 oNOLHdSNGcXQ66b3EW42MG9ksdX1Vjf87Kwhri9vmW5ZlcE+jtj917lNXT80B4hhciWA
 dWm3KWmi5m5R7Vu9Eiinz2VhCv0OPUIDB3yo01XpZrsqDs8aDpUk0i/LpSpeSqM/1yQi
 AEoA==
X-Gm-Message-State: AGi0PubXh3gv67VABW9do2D1XpBuypsF1AKxcLhi0Fbb1moW2IjLysMa
 n5IKcFmoY3ZuUN5cB2Wl7bg=
X-Google-Smtp-Source: APiQypJ1Dfo/ScPKElMBVsp9hDMItwSA9AWQX4RGON7Z3pxE56GCUuB8+mvbqjlGodVKxXO4eQlAHw==
X-Received: by 2002:a17:90a:23ad:: with SMTP id
 g42mr17605654pje.35.1587342553985; 
 Sun, 19 Apr 2020 17:29:13 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id t12sm19938251pgm.37.2020.04.19.17.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 17:29:13 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:27:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>, Szabolcs Nagy
 <nsz@port70.net>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416095800.GC23945@port70.net>
In-Reply-To: <20200416095800.GC23945@port70.net>
MIME-Version: 1.0
Message-Id: <1587341904.1r83vbudyf.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: libc-dev@lists.llvm.org, Rich Felker <dalias@libc.org>,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Szabolcs Nagy's message of April 16, 2020 7:58 pm:
> * Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> [2020-04-16 =
10:16:54 +1000]:
>> Well it would have to test HWCAP and patch in or branch to two=20
>> completely different sequences including register save/restores yes.
>> You could have the same asm and matching clobbers to put the sequence
>> inline and then you could patch the one sc/scv instruction I suppose.
>=20
> how would that 'patch' work?
>=20
> there are many reasons why you don't
> want libc to write its .text

I guess I don't know what I'm talking about when it comes to libraries.=20
Shame if there is no good way to load-time patch libc. It's orthogonal
to the scv selection though -- if you don't patch you have to=20
conditional or indirect branch however you implement it.

Thanks,
Nick
