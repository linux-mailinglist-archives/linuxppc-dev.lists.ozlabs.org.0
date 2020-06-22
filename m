Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0F202E42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 04:17:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qtNc4g1PzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 12:17:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nNqac6fz; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qtLs6XFrzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 12:16:21 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id k6so6909064pll.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jun 2020 19:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=1dIOJFZd/CtaZIPaW6aH29o9AzidXSiyQxJc6oKehM8=;
 b=nNqac6fz4cFe3GJP8PgIPDJEfC9evX0jx7iNFw5gZMxL/y87QsUgobMIjW8F1Mii/0
 osmQqmhkhKAr0ukLkYDMes/VTkd49OgKaXkWjExnu04NZrbV1x8ssfKhX8qG0Y/pdXNN
 TiOxirQWx0XkIyLToIuG0yWwaVab5yAVYsvIw6xJ9RuKgL3ag+beHiU+6ngWQ6+J0kSV
 49HW+dsfvn1TUf1aNKXv/6wKKV8xYP3NethxH+zLiJjt2m7N3OJOfx4UaM2e5WfMqbRu
 NS063d+WK/x7SmdbfStndDT6eZmLKyu85oky+IDbdrRno+hLL1jsnVgnsIeCF3nwg39d
 XrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1dIOJFZd/CtaZIPaW6aH29o9AzidXSiyQxJc6oKehM8=;
 b=aHiuJ8lBV/q4u2sKZoPPhDTRGYSkULAfXZcUrnvif1JonzjGp9gKaSlDCyT96tx+LR
 e2SgvXHg2C1ghzvRT1IdAdk+tk6/mCwRpXEYCscMFOLXQ11Ldo1/l6fluMY5xUiVQd4L
 BTgj62WjVkpJM/0fxKrA6v7kKCoLu6aC1Gi2xdF9yKkxAvuY/K9vyQqnv1LlptvJSKra
 LSzJ09YJWqOboevqB6z4m2e5WG1AxpQzTvwjygd9jPEh9YhE44LFpPinFrh2H/UTfAEa
 Nb0p0woEnz+opf8AT2ubed8r2I72gY+UI+5Yuh09yBUJkL61A6qFkSFJl5LXeLZNeP9z
 z8Qw==
X-Gm-Message-State: AOAM531KtqPJb0sXgB4KI9wF0rTJc1YF1o4Ontkykcek87m13epQmybn
 tb4FgasflLQNH1IWylWK2Q8=
X-Google-Smtp-Source: ABdhPJzzkPOEp4Z+0cWTLHEon4VtIgn1XQdGua0rXSk1TFjbEcHZsT9S5c+LAXRSuSlCr61kQqBypg==
X-Received: by 2002:a17:90a:2622:: with SMTP id
 l31mr16685127pje.18.1592792177935; 
 Sun, 21 Jun 2020 19:16:17 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id w6sm11307016pjy.15.2020.06.21.19.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 19:16:17 -0700 (PDT)
Date: Mon, 22 Jun 2020 12:16:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mce: Avoid using addr_to_pfn in realmode
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200620124435.9900-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20200620124435.9900-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1592791213.eqbgr0cksa.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of June 20, 2020 10:44 pm:
> When an UE or memory error exception is encountered the MCE handler
> tries to find the pfn using addr_to_pfn() which takes effective
> address as an argument, later pfn is used to poison the page where
> memory error occurred, recent rework in this area made addr_to_pfn
> to run in realmode, which can be fatal as it may try to access
> memory outside RMO region.
>=20
> To fix this move the use of addr_to_pfn to save_mce_event(), which
> runs in virtual mode.

I'd rather this be done in the pseries mce handler rather than
change bare metal, and leaving save_mce_event as purely recording the=20
event, decoding remains in its caller.

Radix guests also don't have an RMO, we could probably restrict that
pseries hack to hash. I want to get rid of it but it will take longer
to fix things properly.

Thanks,
Nick
