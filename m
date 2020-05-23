Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 070011DFAC9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 21:51:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tv9Z4mY4zDqg7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 05:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HNaqQKaQ; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Tv7k1SMqzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 05:49:21 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id p123so2872137oop.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xgndOloRKNtdK78AcW7sPC8a95QIlm+mmZmaumtncUc=;
 b=HNaqQKaQLUq/APhlvRG5lP97ykP8CBcnuAYjOTG7XC4H2V0b5eeS37jqC7zF6xLlYm
 foOBDqbvVO2DAq8XZA6JpiXF3NIubfy+UV3xLKrKl4UH2Oi/uoEKDJ2N4bGt2zhddAmb
 bbkbXOUBbEtGl4ygvFnj2jcUabvJadmQdd7MM0UjJ43zZeVv4KuM+nulK3xCoeQaNJyi
 9S2/7/6ibmJnAOjqDkKDG+5n4wnwYYfad2zUihlZmcHbw1j9Y2kvjIo8GP0pVZ2IAd7n
 51+4Fh28KADZOpOkrkL7ZZXthJrwEePYdArCTEYp0YjAS1sGMU6vzwfl5/fM0KmCRl4s
 K7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xgndOloRKNtdK78AcW7sPC8a95QIlm+mmZmaumtncUc=;
 b=JG236srgaEdaP02zVA4cRDsZ5MsntM23zb1dgE2WBKA7aV9vLMb/8pG7+DygA/s9I3
 zHZaa6DmNJf/j4dkhzNg+N40HbcVujYz71QwJxowDbf3jASrnbFQtUaQDUPGjcfcTwCl
 FBFPMoQYzQ7e6rtFnjLH2LSNayJUvmDUQDO/jFm6asNH1YsFFED8iFAHwTQ4j+XZzA/M
 q52iontW4qt+58PYdNF4GGuIvYqN+Y9zdCikD8TyCGc79j34OERX1h1Ojptvy0Qh9mR8
 FZIr7SWvtxUenSGW/bGh0kOhA+Unt0q11Alz8iWIaS6EBcerjAZte+VYVoBk+XvLXwov
 fieQ==
X-Gm-Message-State: AOAM533yRpONWF0TfxuxwR3MBGUlonUhaDFRh3S3grsJowc15qVPUKwT
 RRXyA6NRtvjtInHOjn0loRLNXGO1
X-Google-Smtp-Source: ABdhPJynQMgmdSbexmBIKI9HyUyaz2y7BNMfUh8s5jiveBpjiP3p1GJ3PwgKIWZsbD1dcAVcgSl1xw==
X-Received: by 2002:a4a:9624:: with SMTP id q33mr8038927ooi.53.1590263356529; 
 Sat, 23 May 2020 12:49:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id t13sm447468oie.34.2020.05.23.12.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 May 2020 12:49:15 -0700 (PDT)
Subject: Re: Kernel bug in 5.7 for PPC32 on PowerBook G4 - bisected to commit
 697ece7
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <2c361d8e-5e2a-cdd9-da8e-aa49a4f93cfd@lwfinger.net>
 <3e3e2343-d674-02e0-7b23-81636b472641@csgroup.eu>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <94639869-c744-2879-9203-21cea664a563@lwfinger.net>
Date: Sat, 23 May 2020 14:49:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3e3e2343-d674-02e0-7b23-81636b472641@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Paul Mackerras <paulus@samba.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/23/20 12:30 PM, Christophe Leroy wrote:
> Hi Larry,
> 
> Le 23/05/2020 à 19:24, Larry Finger a écrit :
>> Hi Christophe,
>>
>> Although kernel 5.7.0-rc2 appeared to boot cleanly, it failed on my G4 when I 
>> tried to generate a new kernel. The following BUG message is logged:
>>
> 
> [...]
> 
>>
>> This problem was bisected to commit 697ece7 ("powerpc/32s: reorder Linux PTE 
>> bits to better match Hash PTE bits").
> 
> Being reversed in new -rc , see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/87sgfsf4hs.fsf@mpe.ellerman.id.au/ 

Christophe,

Thanks for the update.

Larry


