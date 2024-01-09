Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2B828ABA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 18:10:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkuDHEeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8cr41czFz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 04:10:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkuDHEeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=f.fainelli@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8cq06nm1z3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 04:09:16 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso1448237a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jan 2024 09:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704820150; x=1705424950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I/UzxeeSAED7iM7HDuJTONIJ2KKw54eiBxBJsUAF1c=;
        b=JkuDHEeQN7bz/vJGa+2B8x1nUfYV+aL/M9SWkJAfQg5IfvILXjApFvUKEqZL4HU/nY
         NJZBr0zEdZuM1SqSQNuJIvsIo9naCYWc/zJPC1zKv7ygnyLl1R6wPE2uB8U9Tc9NPUN9
         Gg5xLn6wRUaVUfVIS2bBZx6qkkdtePb57ZIhBDe8Yt4L4kgeEUkpL4HhgOiFyRnNc7Uo
         C16NoQOW8k6Xf/2ggP8oBd7oYFeIqoczEhNeIgCcI6ip0FPRZCekVdxCN9fsZQ4k7PD9
         WsF73EeR1re3D6CCYwGbxmS/jXkTzgg9bUqPmfPfcc3TUq4QJRWqm20dSZXR+iKkTUw8
         HJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704820150; x=1705424950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I/UzxeeSAED7iM7HDuJTONIJ2KKw54eiBxBJsUAF1c=;
        b=l9q4E8txmG6UiRBnGxSibHhiMg6ZxTFqjoa7x362C9bhRqcwSp2+ifJ4QIFdIRcWZk
         BLlST+pSdn77GXY4+PrgK2mKCMhGnY1XfUWrnpyAjp5vODbDdrgl/ZaTOvaxnsly/1m/
         eSY6PPnn0Gwa8wYtnVj7PV9NWH4/8i0hhX1N+T2bYe4G5a5j1GtdjU4WK5zczqagm7pK
         I/42lOelLiKSQRUeVN0HvFGBv0AOlcU/QHpYugT9AGG5m89Cmp0ySOrfKgPd5bhCxQ/t
         S+VoKVYunt8fkBGUMfgy9iMrl9FCdC22AmXKpzOS/1mAb16KEFM8+eX0I/9o+X4htvTW
         oxUg==
X-Gm-Message-State: AOJu0YwyVih7xU9C6UT2oL9/0nKg7I4a9BQMfQNIjArSH41MTw7ECAka
	Jw4/FJKqAxW5EZIv4shsAgE=
X-Google-Smtp-Source: AGHT+IGbHBY87b9+cLnBphbm2WrEUcTqTZw78s+6rmXGcCu4D5i3IsBr6slXU6F3gt+g15APEjnJqQ==
X-Received: by 2002:a05:6a20:a104:b0:19a:13f0:d739 with SMTP id q4-20020a056a20a10400b0019a13f0d739mr166549pzk.38.1704820150114;
        Tue, 09 Jan 2024 09:09:10 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p30-20020a056a0026de00b006d99c6c0f1fsm1904760pfw.100.2024.01.09.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 09:09:09 -0800 (PST)
Message-ID: <9e1bb616-35b9-492c-be9a-011943b59d0c@gmail.com>
Date: Tue, 9 Jan 2024 09:09:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm: ptdump: Rename CONFIG_DEBUG_WX to
 CONFIG_ARM_DEBUG_WX
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
References: <cover.1704800524.git.christophe.leroy@csgroup.eu>
 <d651269a681150f9bdca8103434fb3f4b509f784.1704800524.git.christophe.leroy@csgroup.eu>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d651269a681150f9bdca8103434fb3f4b509f784.1704800524.git.christophe.leroy@csgroup.eu>
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
Cc: mark.rutland@arm.com, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, steven.price@arm.com, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/9/24 04:14, Christophe Leroy wrote:
> CONFIG_DEBUG_WX is a core option defined in mm/Kconfig.debug
> 
> To avoid any future conflict, rename ARM version
> into CONFIG_ARM_DEBUG_WX.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Looks fine, you might also want to 
s/CONFIG_DEBUG_WX/CONFIG_ARM_DEBUG_WX/ in 
arch/arm/configs/aspeed_g{4,5}_defconfig so there are no surprises when 
people pull in those changes.
-- 
Florian

