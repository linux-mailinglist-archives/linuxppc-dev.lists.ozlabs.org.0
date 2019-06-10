Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDD3AEC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 07:53:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mj491lTkzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 15:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ap3P9Rv1"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mj2Q2NVqzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 15:52:13 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f97so3185229plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=yYBt1hcQRQ0spSrpHXNNQXBu1ZghSIdq4bfDYf+JhQs=;
 b=ap3P9Rv1D8aQHfClkdMrAIz0lJEB90foHbKNELFbvjYgglPGaYhZZDEGactmqxDbB3
 i+m5J8ngAGhJZb11iW+5E/vyO7uT254K24ZGbAxYTF7kz8oo6GsGkNjAKS++f130U4UR
 UUbpTGlCkup21/YPprv1FmY2NFCj/Zkl1wv0sV69bIiM8DgpcagIQO+vQGgQO8/2r7AN
 ZcZYFC0bQfmpDEP9Hc9VA/8BQKHEy9UviztpTRgHAfrNzLiuj0WS59rfT1892jQBYNk6
 /Xn43QCihdD3QMiH3u0Xv0VsizSFc1kAVU0z5uCFs1IvO2bJKtZnzNfvUepQZoQDkA0i
 Xa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=yYBt1hcQRQ0spSrpHXNNQXBu1ZghSIdq4bfDYf+JhQs=;
 b=BCsCZQuyO3UEpA9lt89cVFOoyci47/v0/vJUMEe4bvfXHJ5PdHF47PGE1yhn+nOtrb
 z8z8mBVw0tlkeCrdfD1o9RhBNYMmDO74iCyMsbqY/Wbl874X8PcqDzQ/wLCGtUrHSkC+
 djGO+pg7qvQTbsXs4xr5D5cB3jLEtsVemESN0h0rbOhHWRm/IMul1m+vuKIX9MOHQnXg
 yakOu738uy1870FezHh2XGeKM8hVdZBksVSaz5PZwsfaGQLJSmi00ZgAxJVt3qd2u804
 Ic20nZ1CN/gENAHkpbOozY76aTpy/sZckemQ4W+H/KJgPC5KFhmdV3wM8dUeivlcPovv
 JfMA==
X-Gm-Message-State: APjAAAUDfsHIIwFfhgrDxfzHC8WBmW90RsOPK5Qy/2iCij8BPqnhBE/X
 EehddXgLzTo/PCyVfzqER60=
X-Google-Smtp-Source: APXvYqwEoxXM5FQzuBBvwT6FbXqtViBTtkOAbbFjME16dv8NldZlQjn3iDQ3dOMqqHq0nrc6FYbq4Q==
X-Received: by 2002:a17:902:2983:: with SMTP id
 h3mr24952866plb.45.1560145930521; 
 Sun, 09 Jun 2019 22:52:10 -0700 (PDT)
Received: from localhost (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id k1sm8446233pjp.2.2019.06.09.22.52.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 22:52:09 -0700 (PDT)
Date: Mon, 10 Jun 2019 15:49:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
In-Reply-To: <20190610043838.27916-4-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560145722.obq2bpepl8.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on June 10, 2019 2:38 pm:
> +static int vmap_hpages_range(unsigned long start, unsigned long end,
> +			   pgprot_t prot, struct page **pages,
> +			   unsigned int page_shift)
> +{
> +	BUG_ON(page_shift !=3D PAGE_SIZE);
> +	return vmap_pages_range(start, end, prot, pages);
> +}

That's a false positive BUG_ON for !HUGE_VMAP configs. I'll fix that
and repost after a round of feedback.

Thanks,
Nick

=
