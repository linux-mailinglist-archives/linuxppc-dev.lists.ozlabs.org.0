Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2232F19EF2B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:42:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wYDs23brzDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Db1mD337; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wYC151CYzDqgw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:40:29 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id k5so6806684pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=JfqoETVUbeVhuWCheUwvSsR2etx95rp9fIXx0CAktnU=;
 b=Db1mD337TDZnTFi/Tz73h/PVt4R2aQ1DYIK0G8QvmocwEW5tlUl1tlDREyJyzjZ5SQ
 1YzVCx7wvDtmYmYnfKkcR9F0FlN+CeErACSUwUqfTIHsq4tjv02yFfE/RL8TxcosgLVn
 W8Q+mt16/0FYjQHTdWW+qG9kKZfMzNWIb5yDifxtA+wpJ3Ps8UU0QFgTvdm/zhDh/dkm
 hqYWSd3RQWQhkh0eS6CfWFWNs4TPgc0mahNUlsv7TPIm9ySpO+vOZa+MnD8JXFS/2r8o
 Ciej7DSXJx5KA4BtnFnWTXDoFQx5JC9vdlf3Tfnh0KKYRKJJprxAhs9z94D+O6vkKydE
 XHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=JfqoETVUbeVhuWCheUwvSsR2etx95rp9fIXx0CAktnU=;
 b=Fstj7uqvkHCr2MXOstAMNq4j3Np5cU9kcpul6r6s1uebkQLAOqjglXO7RxGzBmpRHs
 BSbCIpPn94HmlZ3s2YeTmjCTqz8Dvxo/sLsIuwwz0mtAki18UTCu9WvjOuvEhp7NUwfH
 QPozNBUveGvjVvcN7whl9yRQsnQNxBiXWG2ngqj1GF4ytVHaMUxtm0UaIZP+7AVnXHRW
 uKBP+BXjzqljp+OUbSLWHXGJ0T+h9LkuqoMgardjmtjeoytS8zjCkW6ot17Y+z4IZrS4
 TutCudC6jRGOxbaRk94U7o+bLWdFBgHH7ZGEtKRHFuTGxT7GOmNc5s151oxgEi7eLLZx
 qmSw==
X-Gm-Message-State: AGi0PuZcT0cmMs+Cc2QIiBOyfwHIOJhTEzHnMdD1C9qNGRep2mpKRqMV
 tgSgMgnqX6u+7Q0m+X/nNKw=
X-Google-Smtp-Source: APiQypLNW+UjSKA27NgGh3BBUC9+7L3ENfp9aWDYv0xjAvUXTTfG6+lCmp2h+1lXbOHFzeuojRpYSw==
X-Received: by 2002:a63:e558:: with SMTP id z24mr18572992pgj.368.1586137227327; 
 Sun, 05 Apr 2020 18:40:27 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id 21sm9761512pgf.41.2020.04.05.18.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:40:26 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:39:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 13/13] powerpc/kernel: Do not use READ_ONCE() to
 access current thread_info flags
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <3b9257ea1f3e107b81437671fa9d3942e31c6735.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <3b9257ea1f3e107b81437671fa9d3942e31c6735.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586137083.v4cw2k5x9e.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 6, 2020 3:44 am:
> current is a volatile pointer hold by r2 register.
>=20
> READ_ONCE() is not required.
>=20
> Before: 327 cycles on null_syscall
> Before: 325 cycles on null_syscall

Patches against Michael's next-test branch have a few small changes=20
here. I need to look at the fallout on 64-bit code, although most
likely it's not measurable so if it saves you a few cycles we can
lean toward what ppc32 prefers.

Same with the compat test.

Thanks,
Nick
=
