Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11129157E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 06:05:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDRBB73gzzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 15:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LNx33XwE; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDR5t0qNMzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 15:01:38 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id y14so3920995pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 21:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8rGOKLGuRQNPcyMczskkdoxaYG78HVGom6kgLBGar+A=;
 b=LNx33XwEgOXeVYgx4/LZyQNaaTtAvIEoMIfyy4godOyhhYPr/+QQ1+Ivsnkm6N/tkT
 cMkkibSeZ51RVprhNHqPznTrV03UOPBwRYJ047ACJhEDiwoWNOOYRV4zCyBtOfqu0RJs
 zAGPlHfc5bTbzHs9Nnp9pPDOCzP9n6piR5u0KWdJ8GRMGAOvtMvIULRycY8lRvsu8lPb
 7E8BV0mZwx/wfDC+g4ajPsCqRUnIEranmBFBXXZAJFhD2ayKo5HtaWy7ITYYDHVLPq7O
 TZ8SyJlJCAUpdXpzcX6mi4pVNwpmJaoJ870wmHDRDcQNcpRyKquIDKJRJR7YoqAoJdyL
 AcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8rGOKLGuRQNPcyMczskkdoxaYG78HVGom6kgLBGar+A=;
 b=i+ORPoSBj7FT84RCA+zIe0A/PiwJ3vZnzgTHiBjIocrQP7mJmjPI2VXszOoNr5aL+X
 i4TQ0Tjz/udj34LzZ+v2cD8ZRmTSMGhb94sjJOx8Gdfl26yzGqHsvWWapkcf7NC+kC6M
 1PQu8JMu2zONwVulYD63OLFwrAUyJMNc10879g9qym7w1MghzeCN8TQhpsaSdEDd4qhX
 Wxs7mgkISxyEk+OA15drfVkKMSlWXQfqLXzmFyFVz9hh+yoiuZKfpYZ1F993Zw/NwA4E
 X2XXeZTzfw413f8LraForPaRlXOW0slCVnnP6lV7IcdO7VhSC1IySC4i4al30UN+9YcU
 qGWg==
X-Gm-Message-State: AOAM53307w2n9U+E3eKD5ZQ5NsvHQSFRBzHsvjvpmWliPGiNX5MrOSzj
 HRHTFWk+5/pGfm2ucaTKRo47cUt3O9I=
X-Google-Smtp-Source: ABdhPJxYpAEnltmiJnbJCVsrXeexo+thXO07+fGRYjaRoRI/hscSCPRuXGdlg1E0LO0VPeapgTXpDg==
X-Received: by 2002:a63:f815:: with SMTP id n21mr9606162pgh.410.1602993696275; 
 Sat, 17 Oct 2020 21:01:36 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id w6sm7192261pgw.28.2020.10.17.21.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 21:01:36 -0700 (PDT)
Subject: Re: [PATCH v5 19/23] powerpc/book3s64/kuep: Use Key 3 to implement
 KUEP with hash translation.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-20-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <3f9c6eb1-d45f-24cb-fdff-cd51b67f1b28@gmail.com>
Date: Sun, 18 Oct 2020 09:31:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-20-aneesh.kumar@linux.ibm.com>
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
> Radix use IAMR Key 0 and hash translation use IAMR key 3.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
