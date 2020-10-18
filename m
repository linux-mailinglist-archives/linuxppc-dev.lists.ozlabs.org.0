Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE048291575
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 05:52:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDQv31PPCzDql2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 14:52:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hxq2s5R7; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDQrn1N0hzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 14:50:16 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id j18so3945880pfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 20:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7vDXU9ifoi0WuNyoHN2eIP6cIJ4RR2aqpnMNqijwAnY=;
 b=hxq2s5R7z/2xW7AsNBBlZxDM21FFeyr4ejNhOsJ4AOIZWz4mFi0Bu6AGhl18CwDJMZ
 K1loNfx0hbwHVm+PNJUK/dWsyQMp/X4OuaFNepKMtACd3d1J2r/X8jq0eYwFAm5XwAkG
 PYClDkLvh+JkV6kdi69CdoD0KJgFYpGc+Q49e2KvxyBAsj24513ieOSXb8UnEQUEVViZ
 1V07RI3u5ppAuOpKi3GAJ2QGK73c9pyjlo8uFclWByOKHsjqigGM43Y4G9fNbvQUI6XY
 vieLcGfgsb8H3fyJqWIO0NV7T8umsQV/dLCe7kdOEL6WEAooDU3MkPxJH9yOIpnyZ+m8
 K9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vDXU9ifoi0WuNyoHN2eIP6cIJ4RR2aqpnMNqijwAnY=;
 b=hvHPIHf7vxt/nVbA/Z8qea/a3gU6m22sAsm4CRYQyT7A80J3vEwRJzAr/TBWo4miXX
 ghBEXVjdPf9dctpOwYLyTgstoUCF9u59F35AfKEuye0aKh0XCZqmGEmI3X7CybkJ/rwk
 sll81e0UJM6BeGJHSYiPeUCExRrbBr0wQQHjFum4/m+TmVu/55G5340UM1tsATxm1MFu
 OuWnhmHvoozbORh/hOt77eV4Ms7V/Z0QMWjQas5cJNGSpnfgGzaHMQKixqQxzUgUAA8z
 Uuscf/S3dHyO1u2BotAn+aGnsoIe1Tf/HM3fEdJLIm74zwkyDsCZs+SiE+egszP+aLXP
 Nwxg==
X-Gm-Message-State: AOAM532gnhQvMAg6enC13b5/q4bG/R15FjHcDqj7hdW0w6g2qZTVEaKu
 wPnw8aMYUkWu/LsuYo2Y90yzQWve1Mo=
X-Google-Smtp-Source: ABdhPJxiVr5Le5UCZuamnHBOM/6UWlf9Fxi4FO+SsT6Rmp7CJQygxgxMNu+AIRjAa9fyXhYQlNKLzw==
X-Received: by 2002:a63:191b:: with SMTP id z27mr9326134pgl.373.1602993013490; 
 Sat, 17 Oct 2020 20:50:13 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id j6sm7288044pfi.129.2020.10.17.20.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 20:50:13 -0700 (PDT)
Subject: Re: [PATCH v5 13/23] powerpc/book3s64/pkeys: Reset userspace AMR
 correctly on exec
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-14-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <454561c6-733d-7ef0-e6f1-47c983486e48@gmail.com>
Date: Sun, 18 Oct 2020 09:20:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-14-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/08/20 9:39 am, Aneesh Kumar K.V wrote:
> On fork, we inherit from the parent and on exec, we should switch to default_amr values.
> 
> Also, avoid changing the AMR register value within the kernel. The kernel now runs with
> different AMR values.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pkeys.h |  2 ++
>  arch/powerpc/kernel/process.c              |  6 +++++-
>  arch/powerpc/mm/book3s64/pkeys.c           | 16 ++--------------
>  3 files changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
