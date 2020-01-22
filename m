Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08F144AC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 05:27:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482XSB2rYQzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 15:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=B5xvv8pu; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482XQK4qjvzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 15:25:45 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id d5so2499938pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 20:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p46K/p7jyUoEmoJcNjNXBHco0qcUxklws/5FMtIPmj4=;
 b=B5xvv8puH6bKb5FnJqYIuZj2YH76W1Qv5xBhn+QqL0Mpye8LTbYUpvMp7erkb9Fqrh
 C06ZdxbYE2N2TIUm7vug4Tq7Mjzu8unyuDtDZzHCgjh5/MMCMcqK5B413/PDc8DoEeSK
 RuW68Mt8V7aVC9CAGFxRRzYrxiLmdM02HTK8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=p46K/p7jyUoEmoJcNjNXBHco0qcUxklws/5FMtIPmj4=;
 b=ldbNIKR3CasMPUbonXWj/ZWTGnPRa+P7fn6YnEdZfdvQkatx+/xQmn355aeLn+Wznu
 3JCS5d9hgBrELREPtqvMxjvf9TFxyJ5fzQIsFga75GVITGhgmlKjBH5eSw2ysjwOSJUE
 Hq2ALFbbfvhgCGKwYdKkK4aNlsb2yiMny3Eg3OegkZeiptvH/Cv0Styc3XcvWPLmQFBx
 NqQzzpy1Sa1oOFK5198YCRB/Hqs8Ng5e0SVH5kze+VpTXQtxorg+UByiH/Br+GBLmTDT
 kDXlMYRPc2ijaRBjYHU/bVIOS5eWqkoNhUpQleydEOvmeCH2zzdIkpFZTXIOdjAxhKmf
 XWnA==
X-Gm-Message-State: APjAAAVaoKZtGmmIHVkWRcUZln4mFFKZPxxZpiF0zniln8pgemOj+dbg
 TajDejzIMLr5AbpgOcjIPEgXgw==
X-Google-Smtp-Source: APXvYqwSAhz6EmTD4AjqpgZAR1Z7cqCItOlpDxGIvjZDC0pBDNWWXj5pVrAKXL1pHjqPtwPDRvnYrQ==
X-Received: by 2002:a17:902:8484:: with SMTP id
 c4mr9022713plo.43.1579667141754; 
 Tue, 21 Jan 2020 20:25:41 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-cc3a-f29a-38f6-dc23.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:cc3a:f29a:38f6:dc23])
 by smtp.gmail.com with ESMTPSA id d24sm45845707pfq.75.2020.01.21.20.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 20:25:40 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v5 0/4] KASAN for powerpc64 radix
In-Reply-To: <8a1b7f4b-de14-90fe-2efa-789882d28702@c-s.fr>
References: <20200109070811.31169-1-dja@axtens.net>
 <8a1b7f4b-de14-90fe-2efa-789882d28702@c-s.fr>
Date: Wed, 22 Jan 2020 15:25:37 +1100
Message-ID: <87muagjewu.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 09/01/2020 =C3=A0 08:08, Daniel Axtens a =C3=A9crit=C2=A0:
>> Building on the work of Christophe, Aneesh and Balbir, I've ported
>> KASAN to 64-bit Book3S kernels running on the Radix MMU.
>>=20
>> This provides full inline instrumentation on radix, but does require
>> that you be able to specify the amount of physically contiguous memory
>> on the system at compile time. More details in patch 4.
>
> This might be a stupid idea as I don't know ppc64 much. IIUC, PPC64=20
> kernel can be relocated, there is no requirement to have it at address=20
> 0. Therefore, would it be possible to put the KASAN shadow mem at the=20
> begining of the physical memory, instead of putting it at the end ?
> That way, you wouldn't need to know the amount of memory at compile time=
=20
> because KASAN shadow mem would always be at address 0.

Good question! I've had a look. Bearing in mind that I'm not an expert
in ppc64 early load, I think it would be possible, but a large chunk of
work.

One challenge is that - as I understand it - the early relocation code
in head_64.S currently allows the kernel to either:
 - run at the address it's loaded at by kexec/the bootloader, or
 - relocate the kernel to 0

As far as I can tell book3s 64bit doesn't have code to arbitrarily
relocate the kernel.

It's possible I'm wrong about this, in which case I'm happy to reasses!

If I'm right, I think we'd want to implement KASLR for book3s first,
along the lines of how book3e does it. That would allow the kernel to be
put at an arbitrary location at runtime. We could then leverage that.

Another challenge is that some of the interrupt vectors are not easy to
relocate, so we'd have to work around that. That's probably not too big
an issue and we'd pick that up in KASLR implementation.

So I think this is something we could come back to once we have KASLR.

Regards,
Daniel

>
> Christophe
