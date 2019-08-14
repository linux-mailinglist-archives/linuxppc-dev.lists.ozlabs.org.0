Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 842728CEFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:05:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467kDm4XxGzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:04:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AUrbF4Gx"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467kBq1HGfzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:03:11 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id z3so3634378pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+xayDP2oypqDVXTm/RH82wgRTkmtKwwjJXMVRTlgmYg=;
 b=AUrbF4GxYP1s1KQrRCOaA8ks7gKQwS1xC10NQXqkVLagBjt5EQcwJgZVd3GlZktdGn
 P06ovTLVoEmSDD6+Eoh6Cp9+vlFkxjBhfDN3hjECcKw/W9aF2wn4gXcti9vSpiAzqZkb
 E1+W+AoxiB8w/g0St/9i/lORg0LE32jIclhkdtzj9/uHsq0rJuVUATlHiGozXirQ7uIm
 47FvGgq1mQ8FuyPClAxm6QzMvmFjmyFvjhj1eXt5LZblicwly4thclRRocrGPmBgJYOf
 hzbEWJU4fZSe5peZTXX5k8OgEwYumZxq2ka8F20LQcvToi3SIOea4+ptiwmfB9ifQ79/
 j7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xayDP2oypqDVXTm/RH82wgRTkmtKwwjJXMVRTlgmYg=;
 b=l+APqquF7JeR2bdfCvRa4ikNGfft4yjEK9qujEnVpa0zowqaK1a1Uk+oPq70FnRwoG
 80vAE7acxyXrwWf7F7UYUmcrqd0KtefYE9OVcpaOYOA+NI/wtwfQTv5Sk6TDnGeb4uGM
 JeJ4f5cs+PEI59VCPI09f5k5IT2xC4DiJGe2LqW+yEnxQO75Fv39mCiOuuiQaK0EtwFu
 lOiG4+6BOGsTlzOK5NC5Z8FnaIo+xqS9/fUOVLCcTyC+YLDoFUAsStSpDlsnDtO0sx/4
 fLvG/PSOajYSRQGQvAiFtsLZJAkyyN0bHJer7swyP55N2Y3MJL7KYnAiuEuNg/K4NZHC
 586g==
X-Gm-Message-State: APjAAAVQWqFmeWKLSwPtOHWHelf+R1LKIBqtIwbizix1oMzPW3cryWTR
 LEbygqKy6nQ+G1mPeHuRGL0=
X-Google-Smtp-Source: APXvYqwkDH7HjHvSzr/Gy4L3yRkRgLxGCrIVojIgFFlPYrKL0oB+Qcqvd0VeMJpiLf+z/Fof8EZleQ==
X-Received: by 2002:a17:902:8d91:: with SMTP id
 v17mr23960022plo.88.1565773387060; 
 Wed, 14 Aug 2019 02:03:07 -0700 (PDT)
Received: from [192.168.68.119] (203-219-253-117.static.tpgi.com.au.
 [203.219.253.117])
 by smtp.gmail.com with ESMTPSA id j6sm10350514pjd.19.2019.08.14.02.03.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:03:06 -0700 (PDT)
Subject: Re: [PATCH v9 1/7] powerpc/mce: Schedule work from irq_work
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-2-santosh@fossix.org>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <f82b6fb7-23a9-7400-6c29-74701455a8dc@gmail.com>
Date: Wed, 14 Aug 2019 19:02:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812092236.16648-2-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>, stable@vger.kernel.org,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
> schedule_work() cannot be called from MCE exception context as MCE can
> interrupt even in interrupt disabled context.
> 
> fixes: 733e4a4c ("powerpc/mce: hookup memory_failure for UE errors")
> Suggested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Cc: stable@vger.kernel.org # v4.15+
> ---

Acked-by: Balbir Singh <bsingharora@gmail.com>
