Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543E30D205
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:15:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmyr0DSSzDwt6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sjnb/xpg; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVmg84KLhzDwmD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 14:01:55 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id d2so3697031pjs.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=1D1lbt3Rz38vk3ZD1aJTQKM02Emv7JinCawTwnh8mas=;
 b=sjnb/xpg2f3ib4neVS501ZZ2+5QYiUqICTfujzksFFyQvYH9TTRQ1OHrQ42QsKAXSw
 bYeMWQeeyhhJ2MqhVAjE/WET+Lr0Z5huKLrYJ8ysoXbZDvjSBYqrbZV2uDM/7yce2mp4
 xqiKORJgRDQ2BObp815Hkg/jms8ML0Waag35kaQiy4qmqOHdGz92PvVy8Q7IB/VJMguq
 lHOoJy5FAmrj4d4B6yT8Dc98F4Lvm3ysZk3pWiatccBV6pgOgdhhBhtMFa3uP5o4RDHo
 MYU9ebBwx4j4daf2bNPsakaE9OJcuDEYdJ07eo99qx2mYqdjYpE59yOSMBlWXXOBZ5ui
 FWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1D1lbt3Rz38vk3ZD1aJTQKM02Emv7JinCawTwnh8mas=;
 b=g7xjtMw4xzlycY2wF42CvyQqCvbLc15IX+yS5IIrCfczy7F08ZKye+G+OLKXYeHmPm
 PRU3iVPujkebQoRwGk5NcOxrrgB75+RU047K4Xk5X+fkVPVC3APeepBU+lioDoaaMdaV
 3sSw1hx5hjjLbmXQPBIERQkSeUX6q26ExcYKBiZK13+eWvb85mLn3hp8BBpaKhAl7RwR
 bDZgJrozRrCWcI7SyWKq8/W0SWk7X5ESaAB6SFKr9MKD2viQJU+2AHlju4+wYO0I+x+S
 1hfUjUAEElxBbQSpr1B+PHKuAMdEdhVuHQAcqkO36EYDuFIl3EPoGFGsQpdO7mp5DH8f
 N+Gg==
X-Gm-Message-State: AOAM533atIVttf34Mth1NNDBcSQRrjGx+mq4G3GF0l+boVEaOekNoW5n
 5Jj0M6hZGdPYAwIHRKVxzH0=
X-Google-Smtp-Source: ABdhPJzMyqDrlccGlrZjTkYB9avc7WfWGiiIvH2N7+xa6oX+t0dwLupW2e+1/RqMFKXpP4AxmXtK+Q==
X-Received: by 2002:a17:902:a40b:b029:e0:1096:7fb with SMTP id
 p11-20020a170902a40bb02900e0109607fbmr1125710plq.40.1612321313502; 
 Tue, 02 Feb 2021 19:01:53 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id 78sm322545pfx.127.2021.02.02.19.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 19:01:53 -0800 (PST)
Date: Wed, 03 Feb 2021 13:01:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v12 01/14] ARM: mm: add missing pud_page define to 2-level
 page tables
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20210202110515.3575274-1-npiggin@gmail.com>
 <20210202110515.3575274-2-npiggin@gmail.com>
 <20210202111319.GL1463@shell.armlinux.org.uk>
In-Reply-To: <20210202111319.GL1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-Id: <1612321006.e59gckigqu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Russell King - ARM Linux admin's message of February 2, 2021 =
9:13 pm:
> On Tue, Feb 02, 2021 at 09:05:02PM +1000, Nicholas Piggin wrote:
>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtab=
le.h
>> index c02f24400369..d63a5bb6bd0c 100644
>> --- a/arch/arm/include/asm/pgtable.h
>> +++ b/arch/arm/include/asm/pgtable.h
>> @@ -166,6 +166,9 @@ extern struct page *empty_zero_page;
>> =20
>>  extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
>> =20
>> +#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
>> +#define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
>=20
> As there is no PUD, does it really make sense to return a valid
> struct page (which will be the PTE page) for pud_page(), which is
> several tables above?

There is no PUD on 3-level either, and the pgtable-nopud.h which it uses=20
also passes down p4d_page to pud_page, so by convention...

Although in this case at least for my next patch it won't acutally use=20
pud_page unless it's a leaf entry so maybe it shouldn't get called
anyway.

Thanks,
Nick
