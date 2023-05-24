Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B382470F7CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 15:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRC3v3lxDz3fJ0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 23:40:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UerkxAe1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UerkxAe1;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRC302nhMz3fF4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 23:39:23 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d3e5e5980so1023919b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684935561; x=1687527561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPsAoeioL5fBV6oESCE3p4zCum2vadqzjSJd4gAo1As=;
        b=UerkxAe1cuAxMa0tMwzHRnm4yoFoo00xmDBj9EJfjTIpxnl1u9y/hQqnjm8YEhVTT8
         MMUWAqbxySMSY+RpXGj5k7H2lEU5qkq3UiFziaJqOIZHRGjSQL5ihhcNaJf5my3W5Twk
         fiIwWjmlRLOgCf5ICcpGIxE3vlIEqiIzZsIbie8lsr9T41dAEasU1oKiTlkgpEcKE1aS
         nAKi6S1P4xSLNyKwAUctQiHvx3FZ3W0uVxsNKW3fe1hTf6pDPTRSXwVuYAJOKhUxnoop
         Rpl+MgcRgmRRD3DkGdSnUJCMBT9cr9nqhVXPAbQPOt+uU7HrcDIizGzIC+jz1kzQlk/H
         58oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684935561; x=1687527561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPsAoeioL5fBV6oESCE3p4zCum2vadqzjSJd4gAo1As=;
        b=NO/STakzmf0na5DqudeaB8W2fczntpMXMFCBSBGq/Az423c9iFgVpqyxbVTnba0rWs
         otGjStuUSLclf+4uv58J4oRwTbGiYh2SU25rpKgjavLT6VPWiA5s6mRu9ziCmc19qKyX
         ELjyBBS/RdtULg93fVcp+uJrD/UMHUoQ2Bijg1oQvGNuxedyoE5galGE7ojyiQxvcmhG
         7dHFet0q6slD5HFhNUcd+qeX4U50rcE9efELdIhocw/+lsItXCMfVJuTzro0DVCm6vlm
         cs14zMwbBV+Q/oQ1qYcLs7yFRf5zNZWNMtyX7tdGn7VQOk4sklYTKYP3oqPVzFyCg5+Y
         VcQA==
X-Gm-Message-State: AC+VfDzg75NzzoEErwnKQzvVlmeEB9942emjqu5FplW7KwV7RiOWU5wI
	xaHsK/PUMNzUfekWcfLwyupUHSOJx7Y=
X-Google-Smtp-Source: ACHHUZ6+4ecfLPKCvweUFLek2AuikwAHHFdmp7lDN93yiPKuONCVLxG+xoNnfueMOPPVRsYfibfDxA==
X-Received: by 2002:a05:6a00:b52:b0:64d:5f1d:3d77 with SMTP id p18-20020a056a000b5200b0064d5f1d3d77mr3858529pfo.34.1684935561609;
        Wed, 24 May 2023 06:39:21 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-11.three.co.id. [180.214.232.11])
        by smtp.gmail.com with ESMTPSA id y4-20020aa78044000000b0064928cb5f03sm7461051pfm.69.2023.05.24.06.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:39:21 -0700 (PDT)
Message-ID: <5df92692-296e-3956-24fa-2bd439337953@gmail.com>
Date: Wed, 24 May 2023 20:39:16 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Content-Language: en-US
To: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <CA+39qUjOA53UO4oYOzrUJqdYq8A3hbnnxpSV8nfqh0T5KiNL9A@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CA+39qUjOA53UO4oYOzrUJqdYq8A3hbnnxpSV8nfqh0T5KiNL9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Linux Regressions <regressions@lists.linux.dev>, Fabiano Rosas <farosas@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/23 20:11, Doru Iorgulescu wrote:
> Glad to hear it! 
> Thank you

tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top

(IOW, I have no idea what you're referring to. Please stop top-posting;
reply inline with appropriate context instead.)

Also, don't send HTML emails as many mailing lists (including LKML)
don't like it.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

