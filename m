Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BB4FBF2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 15:46:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WtxB3GrYzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 23:46:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CM1bPRz2"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WttS2gc6zDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 23:43:41 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id a93so5383726pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=/fW8MyFzuj7NpV0pnJQQTOZMS5efeSM18R6T3FiLtho=;
 b=CM1bPRz2X0i/naPm2VcpNyRTqjDfDmxGu1UfLZ7nLPlfLW8ZZyD403D52hvjT9QI0L
 ckMK9prCK6WVB2/ET+hn33RHeVjyumjRuLSjUNccvdHDoDQ+tfMf6qvX/KAalbJA+sFI
 VMCIvraINSQGn+DzYkXYzvPXt2AUiwNalJE2TO8l/Tz3kleDI69cXhGuorYl9Z9/1Bew
 x6QW1/1X6oIsqhGRu0Kqi6R+G1j5CbtBVIbRoBKYo166e8DL5nvvVljZnRdnSPHt9tbN
 lq5ZbrGljK3zG/tdCjiVUMBPsoZ3yDQ/U+xsrNVmRydqSz36XI8HLgJznPJWMg4Hvl0x
 AOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=/fW8MyFzuj7NpV0pnJQQTOZMS5efeSM18R6T3FiLtho=;
 b=nwqBrbugoZpC6d4LdgbpYwGWIyYd7NFIyWq7jFlleB7Mr6LgyJMDbDkcNk+mtmT41i
 +B7BzSNK35MRHRiqr8HSEGlmq1hcU3kt+b337xOm7kdW7/cz5knS1exrOk1EVwz8Tgbf
 uevFyl5Aa28VbrLWjNKNOHf6jp8FeBIUMb5/HWt4fIJNVKrS0hybsVZcGYk0O3++rNmd
 jnqS6ABRiGuPefUbHpKQcImsxcS9H5B/NzSjOHrdwU+9ZiFGc7fdhdEEe0MemNwfdl+n
 JXOfw/YYcSxxm7sKOB5sfFOADjCIaNPlKGUbQIw6DEm6zheNcMYcrMLNF3u8bq3CJJmw
 9ZxA==
X-Gm-Message-State: APjAAAVTw+/dy9TijJaSN8VJThPgClA/+XtFGPn6Yn7u5D7JAYoeJZaM
 hy5wI26Mfcmo8hDaoH0nKhA=
X-Google-Smtp-Source: APXvYqxwBlq4iphRCZIKJytT6dxbOSH5x64lraSq1zOEZD9cvZ7O1/8tc/Wb4Clr4Nvi51PQZ/KLcw==
X-Received: by 2002:a17:902:4222:: with SMTP id
 g31mr65518531pld.41.1561297415803; 
 Sun, 23 Jun 2019 06:43:35 -0700 (PDT)
Received: from localhost ([1.129.243.157])
 by smtp.gmail.com with ESMTPSA id 1sm8238503pfe.102.2019.06.23.06.43.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 06:43:34 -0700 (PDT)
Date: Sun, 23 Jun 2019 23:42:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Rename PPC_INVALIDATE_ERAT to
 PPC_ARCH_300_INVALIDATE_ERAT
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20190623104152.13173-1-npiggin@gmail.com>
 <20190623120332.GA7313@gate.crashing.org>
In-Reply-To: <20190623120332.GA7313@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561297021.pyb7y0yjt7.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on June 23, 2019 10:03 pm:
> On Sun, Jun 23, 2019 at 08:41:51PM +1000, Nicholas Piggin wrote:
>> This makes it clear to the caller that it can only be used on POWER9
>> and later CPUs.
>=20
>> -#define PPC_INVALIDATE_ERAT	PPC_SLBIA(7)
>> +#define PPC_ARCH_300_INVALIDATE_ERAT	PPC_SLBIA(7)
>=20
> The architecture version is 3.0 (or 3.0B), not "300".  This will work on
> implementations of later architecture versions as well, so maybe the name
> isn't so great anyway?

Yeah... this is kernel convention for better or worse. ISA v3.0B
feature support is called CPU_FTR_ARCH_300, and later architectures
will advertise that support. For the most part we can use architected
features (incompatible changes would require additional code).

Thanks,
Nick
=
