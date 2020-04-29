Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144941BD180
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 03:03:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BgJ46z3mzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 11:03:48 +1000 (AEST)
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
 header.s=20161025 header.b=oQNJmiw4; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BgGK1ZnjzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 11:02:16 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 18so254305pfv.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 18:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=hoHhaE9rJgMcBbU516mloJZ88i5m7onu7oPT7IreNEc=;
 b=oQNJmiw4ZnOn/Q5jI0RtCg0Pa+TGGX8Z/P9gFkTcJjp3kATOKE2lZa3mRiI3cQZc3X
 n5ELM6aB45vHAxMXOKPWEPTB81OGkwlscpVoMcv+1V4o2WQVB51z6QslE7aYJA+IiiSX
 12TrsWRQ9BIShARh25om4JCRnSm2+qUaHe5BjSjfkj+64ht2FaGNMvj1nKbMpSCps4Pk
 OFGQVw6MRMdDhkSY3N8RC2hPDmY8uhABeRCExH2f8tX9OP7iUG30eXPOTf8PZnOhxvpc
 ke8fke+pg0msRE6eDfICRwhRZZzO2s6wSfhmn26Sjg9Oaz0dYGN2zsvcIVgpWA8dhiaZ
 4I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hoHhaE9rJgMcBbU516mloJZ88i5m7onu7oPT7IreNEc=;
 b=EU/KPoH+MLPyzo0chcFQtyDN6/yFXoJStZhDG3kO6LZIaYIm0sb5HqntajI/K4S4/Y
 wIZc6XBAv3I4tGTHh69sFS6JsXZQXqZiPZWG2nsHsfxKfFCKssNWlFF3/h78BkbHlPrA
 CvwaadYRj6zFoNzw3GoM0pCZTK8UQ4uo03kLtdLqSjx2xm8NxZi4paZOqEeOytJgGppx
 EfBUgg8sjbz2aAKEGB+4LEp04lDLOVld06ePeIL/nXIprL9TYeL3NnXHc4avLcjuj1bk
 WJCG4OGNrZmQZnn8kAD7iXrDO1ksNftzjdAUseU0k4Tp00bB08DLKUB7gPeZ83pp9s7d
 zZ6g==
X-Gm-Message-State: AGi0PuYoDYwgNohVCBi/gIKf5MNekc5jo3203HBV3Q95YvZT/V9AYD2U
 tRIPD0ED3cMhIndX6MvbQy8=
X-Google-Smtp-Source: APiQypLu7ImvCf59D8zDjdNyBso1TUo8EWcqF5tTk81mMmfAV2aMrDZqsSarWOabUZA5tSGoXyg24g==
X-Received: by 2002:a63:1645:: with SMTP id 5mr3380003pgw.145.1588122132637;
 Tue, 28 Apr 2020 18:02:12 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id p189sm16518953pfp.135.2020.04.28.18.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 18:02:12 -0700 (PDT)
Date: Wed, 29 Apr 2020 10:57:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20200428234046.GP17645@gate.crashing.org>
In-Reply-To: <20200428234046.GP17645@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1588121596.7zej1imag0.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of April 29, 2020 9:40 am:
> Hi!
>=20
> On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
>> +config BUILD_BIG_ENDIAN_ELF_V2
>> +	bool "Build big-endian kernel using ELFv2 ABI (EXPERIMENTAL)"
>> +	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
>> +	default n
>> +	select BUILD_ELF_V2
>> +	help
>> +	  This builds the kernel image using the ELFv2 ABI, which has a
>> +	  reduced stack overhead and faster function calls. This does not
>> +	  affect the userspace ABIs.
>> +
>> +	  ELFv2 is the standard ABI for little-endian, but for big-endian
>> +	  this is an experimental option that is less tested (kernel and
>> +	  toolchain). This requires gcc 4.9 or newer and binutils 2.24 or
>> +	  newer.
>=20
> Is it clear that this is only for 64-bit?  Maybe this text should fit
> that in somewhere?

Don't know if it's necessary, the option only appears when 64-bit is
selected.

> It's not obvious to people who do not already know that ELFv2 is just
> the (nick-)name of a particular ABI, not a new kind of ELF (it is just
> version 1 ELF in fact), and that ABI is for 64-bit Power only.

I blame toolchain for -mabi=3Delfv2 ! And also some blame on ABI document=20
which is called ELF V2 ABI rather than ELF ABI V2 which would have been=20
unambiguous.

Kernel mostly gets it right (in the code I didn't write), and uses these

#if defined(_CALL_ELF) && _CALL_ELF =3D=3D 2
#define PPC64_ELF_ABI_v2
#else
#define PPC64_ELF_ABI_v1
#endif

I can go through and change all my stuff and config options to ELF_ABI_v2.

Thanks,
Nick

