Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F33FC1FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 09:57:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DFjv6DmFzF55k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 19:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="fmnpwAJE"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFgX6lhXzF79t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 19:55:35 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id e9so5742312ljp.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 00:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Yha/Jq+ZFQjtGyiO5rUc6KyiAaRy2IYHugA0slnRKs=;
 b=fmnpwAJEY8GNrGE9anOHfwVKoipdKrgLR1iOYFzBsD9kaxaEe0UKTTvstTn0CQD5Jv
 kBlb3kU6U71mmLvUAx8y5bzM1W5GYgs91XI2PEJVPdlaoXjQUYsmi0CUn53ZT04RkXtj
 OMIsyIx4Q3flxHoYZKaCn7Qh8bHpnYYK1XmLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Yha/Jq+ZFQjtGyiO5rUc6KyiAaRy2IYHugA0slnRKs=;
 b=KqoHI15yWb8xw843PzVQIwqbPiHJr0RVcOduyCE0zou0HjdjM6qZq5Mzf58toTQGoH
 /yVCT/SNeaCLOAJOohE3GI4nuXcm9tjOpJHA07KbE1MAM0SCNdEGVUqfbJfM3j1/yNQE
 XtlF2uAC/mCMm7WbqoCllXQ4Qtc+/oByh2vofqtQQwUC7Od2UDt2gq9/ICQd10ccOxqO
 cbX9Y8vqmiGbWjLAFalf4mI1vIEwhH010GHE6jucpObcUVgPbJEW0VoCM/fxljxcLayV
 aR6PiOjzsdej3DQ5NDjnP3jKkgJm+OG/zdBkTrw0KD7UBTjZo61+blH5N+6A5jayfVR9
 zREQ==
X-Gm-Message-State: APjAAAUE69DhUqTbPDuBVnM7SDETX35o+T2YNYX5x2Wu7GeVI99AFBuV
 D1KZ4IV6LyRgY8B+wA6LqoQUIw==
X-Google-Smtp-Source: APXvYqzqg3aGYow1vlq3tQPQhPBivdAM8jYV30pHK5iJmyQtydaEA/+ygPKZ92IqgkK8EwdBreBjrQ==
X-Received: by 2002:a2e:890e:: with SMTP id d14mr5652232lji.6.1573721725489;
 Thu, 14 Nov 2019 00:55:25 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id e14sm1984603ljb.75.2019.11.14.00.55.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 00:55:24 -0800 (PST)
Subject: Re: [PATCH v4 04/47] soc: fsl: qe: introduce qe_io{read,write}*
 wrappers
To: Timur Tabi <timur@kernel.org>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-5-linux@rasmusvillemoes.dk>
 <CAOZdJXU35+G5CMrS3247mgMjQH7__MxP8wpW6yjn1_MLD-sGqw@mail.gmail.com>
 <e37d24c5-6d4f-c8bf-1c38-f3e8b8e85eeb@rasmusvillemoes.dk>
 <38d87cf8-5945-61d7-80a7-c8374cbe729b@kernel.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4592eea6-1ba6-5c08-0500-6ccf030d7929@rasmusvillemoes.dk>
Date: Thu, 14 Nov 2019 09:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <38d87cf8-5945-61d7-80a7-c8374cbe729b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/11/2019 06.08, Timur Tabi wrote:
> On 11/12/19 1:14 AM, Rasmus Villemoes wrote:
>> but that's because readl and writel by definition work on little-endian
>> registers. I.e., on a BE platform, the readl and writel implementation
>> must themselves contain a swab, so the above would end up doing two
>> swabs on a BE platform.
> 
> Do you know whether the compiler optimizes-out the double swab?
>

Depends. It's almost impossible to figure out how swab32() is defined,
so how much visibility gcc has into how it works is hard to say. But a
further complication is that the arch may not have, say (simplifying
somewhat)

#define readl(x) swab32(*(volatile u32*)x)

but instead have readl implemented as inline asm which includes the
byteswap. PPC being a case in point, where the readl is in_le32 which is
done with a lwbrx instruction, and certainly gcc couldn't in any way
change a swab32(asm("lwbrx")) into asm("lwz"). But ppc defines its own
mmio_read32be, so that's not an issue.

>> (On PPC, there's a separate definition of mmio_read32be, namely
>> writel_be, which in turn does a out_be32, so on PPC that doesn't
>> actually end up doing two swabs).
>>
>> So ioread32be etc. have well-defined semantics: access a big-endian
>> register and return the result in native endianness.
> 
> It seems weird that there aren't any cross-arch lightweight
> endian-specific I/O accessors.

Agreed, but I'm really not prepared for trying to go down that rabbit
hole again.

Rasmus
