Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E921176A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 02:48:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xzxD3l6rzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UZ3i4lz4; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xzvC2Yc7zDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 10:47:01 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id b185so13527198qkg.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=QkFpAqHIEwjnDZzlaTT8UYrxvp33BFcnJrcQL30nIPA=;
 b=UZ3i4lz4YGIqh8LxR98d8rkht9xMQ0quD9UlveG9LZH2vjLD9qj3oSfRuxQwi6SgW7
 7KjIBPlRzgQVKjuRbeNPX/dSjtoRbW+wR3qT+me1d1SKHMec7LFbkT/nwJurndd8wtFx
 h0wvGYiX3LSAhqfKBXk7+Xk7a5fEYYAiZrzY3XwmyBtM0RuCPU7B2ir2r1gn6Iwa+gAn
 Xz8woox1ZNCq0tr25hZygYEW1QHbGoSF07QYS0GBCZKXt98E8b53isIUMePGv3wuyrcw
 mlQwAPuiu7B/VH2K/rnFVDFq9P/xaMWdWLPTfrqCF6EX2XOV2n2XoVZfjVNEnEQcZ6iq
 SIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QkFpAqHIEwjnDZzlaTT8UYrxvp33BFcnJrcQL30nIPA=;
 b=kj3Au1P0VRYk3+R/FyahegygBJA6Bd7BA1dE6o5Cuyxfyp6MS3rBkVVlgx00r9SITS
 uIDkEj2/0VuSrAlDfKXMsgLkZbxIuyRFYH2MtBmUqyCS16oyuHaxRDL+pk0svb+A1sd0
 Em/GpTlAsvriWwvn8iwoAKTKKIbwbp1IONY3ndHrat1C2dqGVvi6XyX7VM8aNyHNwirm
 fWHXdQzz6QBLrOsHzO4wCfE0nOBYaeZqMfkD29BG8chIFrXraBNhLgbtK8ofria1kl9x
 IQgLPB60xbWpHa91LcD4XPn2GemBYCbEa1jNpN7XFJYD3+BvphbWVLjJHC7Z3XTwcvTh
 S7QA==
X-Gm-Message-State: AOAM532Dju9vf1+/rBs0CfOhYqDUAs5ou5AlhhEau9Kt5okuTx4IgLBU
 5xCUF3Lnr/MIOON1UgSudBk=
X-Google-Smtp-Source: ABdhPJwM0hUcN8GwxMqMSwDdQ+uVuPc9qd1xHZ8avHfJ4mP4hIDMt0ZTFiItRktTT17lKMzeGATKWA==
X-Received: by 2002:a37:b206:: with SMTP id b6mr28062822qkf.22.1593650819671; 
 Wed, 01 Jul 2020 17:46:59 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id q32sm7306960qte.31.2020.07.01.17.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 17:46:59 -0700 (PDT)
Message-ID: <6ed28aedbad029f107721e2ea4701e5b05233dd9.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] powerpc/pseries/iommu: Create defines for
 operations in ibm,ddw-applicable
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 21:46:54 -0300
In-Reply-To: <0d3ee444-f528-673e-48f9-633138398543@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-2-leobras.c@gmail.com>
 <b0caaaa0-14c9-51de-bb92-5be8ccaa418d@ozlabs.ru>
 <01443a2f1d58a595ddff03fd14fd56f4c26171bf.camel@gmail.com>
 <a884da45-7778-95cf-d65b-a6c82d2024a7@ozlabs.ru>
 <f1f0563dae4c81620b53bcc258f2960a7948a583.camel@gmail.com>
 <0d3ee444-f528-673e-48f9-633138398543@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-07-02 at 10:43 +1000, Alexey Kardashevskiy wrote:
> > Or should one stick to #define in this case?
> 
> imho a matter of taste but after some grepping it feels like #define is
> mostly used which does not mean it is a good idea. Keep it enum and see
> if it passed mpe's filter :)

Good idea :)

Thanks !

