Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D157179E49
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 04:36:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XxH70D8TzDqgp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 14:36:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ch2eoYup; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XxFN47BHzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 14:34:32 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c144so2052308pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 19:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=BZ3p8l6U8yJ6zF4IR3EmVsxcP7Qe7QtUrgQRw9PX2L0=;
 b=Ch2eoYuplJPbqfOQPzagKgdo4BN1/1moN3pI3RwOaYfIMJzQPUac/dVzJvqhCumC87
 RYC6FjycapHLCLXy6TlOtliYcOkOUh0VZARH/aofxGkaT6P2s6iLfWFLddtnKZF7HW2j
 z3XhKd1+vakMZNIpEIZEg1t22NXlCYnLEGFGsgs2UQbVDQ3cpv3fESGgfrmfCZx5usE0
 29523hODzcTJnBAmwc9+XjyEsEg3U6M4Pw6/x4lML7omjLGVtys0TkufwV0sYZvwkryl
 /XdOCOfvsIgDsleljyFkGLqC4aCl1pHQYq+r+Ir8D/d23VGbrzS0nTqZXPTOYc+3cFBE
 Z1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=BZ3p8l6U8yJ6zF4IR3EmVsxcP7Qe7QtUrgQRw9PX2L0=;
 b=PlJfUXmliFBe+Z47JMqJLvtejikWzizxrhEhduyjRJSKq7g5vQizIi7T2Ir+39cZ95
 vnfclay3odFrvsUsu5ch9TkBj1g1/EliwN1/mJI8qmOLhv3g0DZS34POMDHHt2q/DKUY
 ZNlR3CQxaFPae2yArWiOiS+r/TyX7uSKvQE+8+cASHuvIsqYU6pTu1XlPmM0AdLcxMhj
 eogQXhXorqnIfXynqYRnIsKcey6NGL5bOQfVhGaRa0S0T+guLJZtwaQaZBctFXlcAw55
 M/mhHtELEZfY5nCOrKzzIv0ZmC97SzG2tPHE5GXpdHtAxlQP3gnz9SV1BY8kEiqLvDHq
 R2CA==
X-Gm-Message-State: ANhLgQ0/I5k+32ZLG5ZlK5/92YHQoAzdUBjSAlc6bVxyLa6L4RL0bO8E
 4shCHeN6xkSXsD9SVhkUeD4=
X-Google-Smtp-Source: ADFU+vvL8LCh1z/HsfVd7HIoON2f3qh0ry6xlc7cNuOh1oJsQBcdslO1YESwbCkvEysz2NG6078p5g==
X-Received: by 2002:a62:ed0b:: with SMTP id u11mr6107855pfh.46.1583379269589; 
 Wed, 04 Mar 2020 19:34:29 -0800 (PST)
Received: from localhost (60-242-0-37.tpgi.com.au. [60.242.0.37])
 by smtp.gmail.com with ESMTPSA id y23sm10518774pfb.76.2020.03.04.19.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 19:34:28 -0800 (PST)
Date: Thu, 05 Mar 2020 13:34:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200303014527.39377-1-npiggin@gmail.com>
 <20200303230950.GM22482@gate.crashing.org>
In-Reply-To: <20200303230950.GM22482@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583379060.p6od1jalr3.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on March 4, 2020 9:09 am:
> Hi!
>=20
> On Tue, Mar 03, 2020 at 11:45:27AM +1000, Nicholas Piggin wrote:
>> Provide an option to use ELFv2 ABI for big endian builds. This works on
>> GCC and clang (since 2014). it is is not officially supported by the GNU
>> toolchain, but it can give some useful advantages of the ELFv2 ABI for
>> BE (e.g., less stack usage). Some distros build BE ELFv2 userspace.
>=20
> It is not officially supported in the sense that a) as a host config,
> it does not exist *at all* (this isn't relevant for the kernel, it does
> not use a libc or other libraries, of course); and b) as a target config,
> it is not supported in the sense that no one tests it, so we cannot say
> anything about what quality code it generates, if it works at all, etc.

Yep.

> But we *do* allow "-mbig -mabi=3Delfv2", it's just a chicken-and-egg
> problem to have this properly tested.  If someone would regularly test
> it (incl. sending the test results to gcc-testresults@), I don't see why
> it would not become a supported platform.
>=20
>> +override flavour :=3D linux-ppc64v2
>=20
> That isn't a good name, heh.  This isn't "v2" of anything...  Spell out
> the name "ELFv2"?  Or as "elfv2"?  It is just a name after all, it is
> version 1 in all three version fields in the ELF headers!

Yeah okay. This part is only for some weird little perl asm generator
script, but probably better to be careful. linux-ppc64-elfv2 ?

>=20
>=20
> Anyway, looks like it will work, let's see where this goes :-)
>=20
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>=20
>=20
> Segher
>=20
=
