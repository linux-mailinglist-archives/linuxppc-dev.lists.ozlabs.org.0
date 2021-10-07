Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3146424BCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 04:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPwD243Mdz309K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 13:25:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fVpVXChA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fVpVXChA; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPwCG5Wf5z2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 13:25:13 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id m21so4165897pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 19:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=fVpVXChAwZh74Yak5ikdgyaoheURY4K/ccbznO6zTnIB1AbJR+bIgOAW5/cSxWFoOZ
 cY0eBdVYRQP1/jK52zezVr0uzpqaKqL4UT7RQvBZyhmKIcoiByFnE72l/T/lAzTh60PX
 2ZZ2YfXaMMnXi99HoWBLG5uUJUaMAp+mwPmSs0A9L0wSZq5MBqIGrLe/fQpBMPOxvPnK
 4rfWTUo7RKXBeIwus/mUrNTfwOqbla5PIcLbJRJuwd6IvqLGvZcPe9NmM60QdmCBRqmR
 sMF0mjWUQFOWNx2GTwfCL5Ktgovulw8+KnJ+87QvW6vVfTE6IVfRZKsoah2Gd8VJ0NWK
 +Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=7iJEfkhuOSq8IqhPcrBPImfm4kvNkpxCZ/VRqmxdAB7Pt2NR3AkWPTV5q9pksWGhmS
 gnIbA8auUiDHiPPY5/BKu9bi5D+fAzbD50ukMgy/Q2LELagV/hXBmaqaDDqeahYB5lN5
 eaykOdzNa5pviR7u3/T3MUbhh4bNIdG0IlpYvgnothWV31ECM8r+1q2lMAcy/wdi+lOx
 HROS+32L/BRJ/1pLrBBxcfRUfcT2M4EvM8Kd0hVlNzif4G2wjYsFIcXUWMjxi3c+rv56
 VNAZdJ6poL6DN9Rejzb0QD62nPtOK6vwuu41wYueB6t3ql2sFdu0dna9ux5U3r7uwDVM
 TR2A==
X-Gm-Message-State: AOAM530iwcEFT/Hs1erqtZa54B9sJbLFb6hy4tmNoh2ucG2hTXk73WrD
 bVUCAm6c0i352msd3Tzia0A=
X-Google-Smtp-Source: ABdhPJys1HdOqewyun+C+iToAvx9hnErbBSMfwtBGQraooU+JJaijDbgzG5Y0UhUonum+9KpDmz8JA==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr1303051pgk.448.1633573509317; 
 Wed, 06 Oct 2021 19:25:09 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g23sm22285369pfu.71.2021.10.06.19.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:08 -0700 (PDT)
Message-ID: <1a15bbef-cf3d-33c6-b6c1-3dd607d71d1d@gmail.com>
Date: Wed, 6 Oct 2021 19:24:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 00/12] DT: CPU h/w id parsing clean-ups and cacheinfo id
 support
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211006164332.1981454-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/6/2021 9:43 AM, Rob Herring wrote:
> The first 10 patches add a new function, of_get_cpu_hwid(), which parses
> CPU DT node 'reg' property, and then use it to replace all the open
> coded versions of parsing CPU node 'reg' properties.
> 
> The last 2 patches add support for populating the cacheinfo 'id' on DT
> platforms. The minimum associated CPU hwid is used for the id. The id is
> optional, but necessary for resctrl which is being adapted for Arm MPAM.
> 
> Tested on arm64. Compile tested on arm, x86 and powerpc.

On ARM and ARM64:

Tested-by: Florian Fainelli <f.fainelli@gmail.com>

lscpu -C continues to work on ARM64 as before with cache properties 
provided in the FDT.
-- 
Florian
