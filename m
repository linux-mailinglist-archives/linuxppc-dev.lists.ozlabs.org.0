Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61F1F8813
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 11:27:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49l8JQ5Gp7zDqSn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 19:27:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nMR4K/Mq; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49l8Gd5KZFzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 19:26:17 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m7so5567552plt.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iwrVWbIqEV3s+7RFsDYwNIYHhfGqPzI2P1CNqw2alCA=;
 b=nMR4K/Mqy3PRx+ALb0wSOCgfj2S27/GQsy+gft4Tt9G7IIDoBJWqkfEWvdLq7Mno+c
 qHeFLRK9JVqJi9g+sG7BRdachupsVK6zNNeama6V7Kem7Qb8KbBrgG/ZEtjsXWj44NbI
 h0U3451Ast3krN3qKBz9b2Zhvpsva/MOHtwiQ4sweU8Ulxo0vvCM3pPYZJjYyF0dNctP
 BRwTQHaaYwdVy7QASoxWyD+wPXrcKMRhiKgAbc39xoN4WdXZ4wQG0tdRavDjWTWdAEV/
 a1ck6NiQ4KllivNeW7csw885uU76kWCJFmUo8KXfhFTLocVmWzxggESP3fNz1YAIbJHk
 CEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iwrVWbIqEV3s+7RFsDYwNIYHhfGqPzI2P1CNqw2alCA=;
 b=pbZzEjwz/RklEUD6x1YllIOuV8N9oveenLhrZnD9rywMShYRY5V4L1bag5KBbiX3Bx
 avmLWNOHCJn1VZsqHFdeTP4pYkbFpE7/ivv3RE8LX4V+O26DZhkvPwzO0Qsd7djoBJxp
 ZTJ0CsmcFTAWw3HU0/HRNQkWISfSZGjFCHZ1AioyI+hot5IHVK5EiNUKkhbqBFt4wPNJ
 wdrKvxn1m9Tk9CCNsp006Imy3JP3+B9b7CexfQGerdJarEHUZrTNSBlan5Tn63Bl2aea
 ZEcayN4EYAxOrOId74ocCIkTAmAY1/EqWPHSMx+9dUki0ZaaPMXpprsO17RBo7fevHQr
 tL+Q==
X-Gm-Message-State: AOAM531cFU/+S0XUAp0rMqNiGbJQjGw+RKM1y9EN2SNenzvl2LJddHp3
 CQ8aZLvZc721IGYCHT675dY=
X-Google-Smtp-Source: ABdhPJyFqXqjBDwwikwmkiIchCvnrkZX7lREZ3x6s2VU5MZ5m6VjbNN+BDnw0N7aKFLlFyyRC8ReyA==
X-Received: by 2002:a17:90a:a62:: with SMTP id
 o89mr6206780pjo.188.1592126774348; 
 Sun, 14 Jun 2020 02:26:14 -0700 (PDT)
Received: from localhost (193-116-108-230.tpgi.com.au. [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id j184sm11173246pfg.131.2020.06.14.02.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 02:26:13 -0700 (PDT)
Date: Sun, 14 Jun 2020 19:26:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20200611210230.GH31009@gate.crashing.org>
In-Reply-To: <20200611210230.GH31009@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1592126681.37ybf0zhke.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, musl@lists.openwall.com,
 linuxppc-dev@lists.ozlabs.org, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of June 12, 2020 7:02 am:
> Hi!
>=20
> On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>> Calling convention
>> ------------------
>> The proposal is for scv 0 to provide the standard Linux system call ABI=20
>> with the following differences from sc convention[1]:
>>=20
>> - lr is to be volatile across scv calls. This is necessary because the=20
>>   scv instruction clobbers lr. From previous discussion, this should be=20
>>   possible to deal with in GCC clobbers and CFI.
>>=20
>> - cr1 and cr5-cr7 are volatile. This matches the C ABI and would allow t=
he
>>   kernel system call exit to avoid restoring the volatile cr registers
>>   (although we probably still would anyway to avoid information leaks).
>>=20
>> - Error handling: The consensus among kernel, glibc, and musl is to move=
 to
>>   using negative return values in r3 rather than CR0[SO]=3D1 to indicate=
 error,
>>   which matches most other architectures, and is closer to a function ca=
ll.
>=20
> What about cr0 then?  Will it be volatile as well (exactly like for
> function calls)?

Yes, same as for sc (except for SO bit). Which is a bit unclear in this
section.

>> Notes
>> -----
>> - r0,r4-r8 are documented as volatile in the ABI, but the kernel patch a=
s
>>   submitted currently preserves them. This is to leave room for deciding
>>   which way to go with these.
>=20
> The kernel has to set it to *something* that doesn't leak information ;-)

For "sc" system calls these were defined as volatile (and used to just=20
leak information), so now we just zero them.

Thanks,
Nick
