Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB2911ECFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:39:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZPFH1thFzDrGt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BkJUDoxm"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZPCN68lbzDrFn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 08:37:34 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id h23so221318ljc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6Cel1cpD0Jtu0AycJ47huuRD/DgMmGpodkanI6OR1bo=;
 b=BkJUDoxm4UTj76qbb34bMW8fVbz7oLUiI7HX3/57fDHmH3Uv+GHq3VcDR+vHKaAg5U
 MRvB2yJVN7+A61+KCixPlGkUzaVMQiuVTIlI172XVT5x+S7mtRuVBdgZMlZ52VvAd6w5
 8DS69v4jrJn0jMy9a5+r0cCy2lYUVl4XLKLiepprazD+qKqkNHo0ECt0YCpdRVGTyHz4
 VjAzgEPu/D/m8aE66lLDO+FNBU7D7ZHpuDWXX8Fl352r0ij5bbjS4FbTOJxn+TYzVZO7
 Bj3w9oapQScyHyiAMtgvC+M5Mq1e2F52BG03GzWhSggUR+7xTx4IhJagsXPmx1ye6JJI
 O/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Cel1cpD0Jtu0AycJ47huuRD/DgMmGpodkanI6OR1bo=;
 b=NakVDvEGOJ9lb/zPZd9foQB2nTftRUCj0aKaA+gP1svnHJ/qWPEn1Zr2TFWm9rpRgo
 RrkfxgeMuea6t/cakmbFxhZbaLcvwvG5bDfTaYA/uSRDH/hwAsdm083TaskSLDwTbjIX
 ZR7+RKm1V8ab2mHeI488v29BwJrrTQUn07de0N1G8F5wwshEhBG43YHz6yhmUY9lWbyD
 YEwzJpMB8tkdOkxmmBjMb/2FhgO64Mq/uJFhEa9jR2q6xp+hN750g6tbAneCVgzTT7do
 +Gvvj44WhqBGgn1eshuvWDB0aBR4r6Gesq5yK93QnEbqvyJ09DfMMFsLhvnP/3ptM1yK
 awJA==
X-Gm-Message-State: APjAAAWNICi+rsQpGkQpWsY5UJpsDlaVTCCdCgw+wu2w3zxkopCTrkKP
 R342GaeyE1Ld4cYl9eqoqt4=
X-Google-Smtp-Source: APXvYqxsM40YoG7z6ZiJtPbz7asvMlxZ1g3vpJyflgNEYbZa2GiRD4WWokcH+Epr1Can0FbY1J66HQ==
X-Received: by 2002:a2e:165c:: with SMTP id 28mr10631069ljw.247.1576273048447; 
 Fri, 13 Dec 2019 13:37:28 -0800 (PST)
Received: from [192.168.68.108] (115-64-122-209.tpgi.com.au. [115.64.122.209])
 by smtp.gmail.com with ESMTPSA id
 z7sm5774631lfa.81.2019.12.13.13.37.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Dec 2019 13:37:27 -0800 (PST)
Subject: Re: [PATCH v3 1/3] kasan: define and use MAX_PTRS_PER_* for early
 shadow tables
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com
References: <20191212151656.26151-1-dja@axtens.net>
 <20191212151656.26151-2-dja@axtens.net>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <37872cba-5cdf-2e28-df45-70df4e8ef5af@gmail.com>
Date: Sat, 14 Dec 2019 08:37:20 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212151656.26151-2-dja@axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/12/19 2:16 am, Daniel Axtens wrote:
> powerpc has a variable number of PTRS_PER_*, set at runtime based
> on the MMU that the kernel is booted under.
> 
> This means the PTRS_PER_* are no longer constants, and therefore
> breaks the build.
> 
> Define default MAX_PTRS_PER_*s in the same style as MAX_PTRS_PER_P4D.
> As KASAN is the only user at the moment, just define them in the kasan
> header, and have them default to PTRS_PER_* unless overridden in arch
> code.
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Suggested-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
Reviewed-by: Balbir Singh <bsingharora@gmail.com>

Balbir
