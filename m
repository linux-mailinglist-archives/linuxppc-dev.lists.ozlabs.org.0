Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D459211780
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 02:56:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y0682lNrzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:56:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QiO7osuZ; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y04C5vG4zDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 10:54:50 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id l6so24138271qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 17:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=hO91gN0h/Yr5xSJfWsTPMl5yb7ckd6xh7ekWQ6cvBIA=;
 b=QiO7osuZ0V9urEG1lVlw4WEcRNR0F3Sdnl9NjD89hK4dpbaR8xm137hAqFW/blgQNX
 pLY7xwYaz3WeauXhs62baAWCiVeILKiIwi6q1dLxDWtzYvEhCj3oezBGt1Pr9ETLdfUY
 QPTkp0SjYMIoCkgmc0bL2hy+MfPtlas1Ar/F5fSJaRkzeOIcVqWGQrqiuMFZAE7+E4SR
 IB8tO6wfQH+eotybHY5E/+Wm/Euywh5ZpIxyf9lOg4z72fP+DyWgqcbST2E9PRDS7fV7
 KMuVqDMQnTgY2pVF4+UPq6XxpL0yXn4kTThRYpLN/ntDmT+kIIyKtezb+zXlfb3Yz7QV
 9prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hO91gN0h/Yr5xSJfWsTPMl5yb7ckd6xh7ekWQ6cvBIA=;
 b=pi7hqJcAEHQ/nWHByHfBSmDISyLMlS8Sb9tS04PIp7lD8oG30Q6Fi1Sb0kJyAEc2FT
 dMMp2MbfeduezmMQaeWuMYLu0ZBt4PUpxSzQTbReZOczEkQTnKj++dnvqRa8oSJFAvW2
 mhUjKCriWkiT2F8WqbmvAgvSo4gKDW42qhict+RIGVCn6BeS/d6oN2gKH09EiQoexoLO
 6Xmyag8iD6lZhTgpQi5L7RLjQMdjI86vptkQFzhgKnNMvjiptUnmS21mKJwXd+LlU5pk
 EahYQp0L5Nok10J1VQBl3ajJNdSK7gqkbmfvWFN3LdnYVZx2hYPFBM5lm7qXwqd4ZdoH
 av7g==
X-Gm-Message-State: AOAM531UttQ4l4Relmt8jmkC8ewqAb1qJ065dyP6oC+paf73jG7U5auz
 AlkMFfF2A7oSxjsw0VArT9k=
X-Google-Smtp-Source: ABdhPJyXc53Sx1YOZSJEC1jfR/nuKaGgvtLyvG53K2V1rEfpc4caHt1WAHF+YCSvxu+w8B1RG0Gssg==
X-Received: by 2002:a37:9b01:: with SMTP id d1mr29385611qke.65.1593651288027; 
 Wed, 01 Jul 2020 17:54:48 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id q189sm7224509qkd.57.2020.07.01.17.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 17:54:47 -0700 (PDT)
Message-ID: <3049147914a4a04a095a3f3bd74a7c7ad4d961ad.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 21:54:41 -0300
In-Reply-To: <2c5dc8d2-f379-5a5f-844a-f4eea233f265@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-6-leobras.c@gmail.com>
 <18df09c0-ef83-a0d8-1143-1cb4d50bf6b7@ozlabs.ru>
 <0e8bcc38614ec80c7816c07dd4dc70854c2b901d.camel@gmail.com>
 <0c3de45dfb612745aa2ee4126b3935303d8e8704.camel@gmail.com>
 <2c5dc8d2-f379-5a5f-844a-f4eea233f265@ozlabs.ru>
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

On Thu, 2020-07-02 at 10:31 +1000, Alexey Kardashevskiy wrote:
> > In fact, there is a lot of places in this file where it's called direct
> > window. Should I replace everything?
> > Should it be in a separated patch?
> 
> If it looks simple and you write a nice commit log explaining all that
> and why you are not reusing the existing ibm,dma-window property 
> for that - sure, do it :)

Nice, I will do that :)

> (to provide a clue what "reset" will reset to? is there any other
> reason?)

That's the main reason here. 

The way I perceive this, ibm,dma-window should only point to the
default DMA window, which is guaranteed to always be the same, even if
it's destroyed and re-created. So there I see no point destroying /
overwriting it.

On the other hand, I also thought about using a new node name for this
window, but it would be very troublesome and I could see no real gain.

Thanks !

