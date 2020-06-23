Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9020476A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 04:45:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rVxd3y3XzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 12:45:09 +1000 (AEST)
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
 header.s=20161025 header.b=FbwdEUS3; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rVvn5m3LzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 12:43:33 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id e11so8299923qkm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=kogeuzYaTU35x822P/lH4bJd4mEjWVYLr7oYj41vm0o=;
 b=FbwdEUS3+pvBEN3kjdTEyyToae78/LPr/MS6xOSoYMjtVFDz0LqgWMzSVHwE9xRwE6
 t2cJEA3tFkcLe7Bg0WPowXzPxjBNwPJNtxBEUFpXZ43SqgaHTg8T1TdYMT9aSMs/yA1x
 iW5Rt2EAHdGunKLZRwqS0bJDjB3/oVTt1FouC3SbhagSc68pufilxApKwKjq+vSFKy8U
 oUrSjfWyvoDh7FKb11HAMwFCSxBDMKLfLDHW+Txc79G56N8Bk0Kf1RzrW4ulJQPJrj//
 Sr267BhXc2/nYuapGLoK6nMAmoz/4h1dZE0PYD6JkaTwpeEmSy1CQkbKiRneTipN5cxe
 Yx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kogeuzYaTU35x822P/lH4bJd4mEjWVYLr7oYj41vm0o=;
 b=PKfDbjVa5oZW872mT89msETpTLJd5EMy/uKc1jUvemMF7g9/HngMcTJbzjufrAnmEM
 AW8Z9lYTpR4zEyQIT9+sPYqcj0uM1HYrvvZuYISVhZCckNz72YwEX88f2dzs2IQtC+Bk
 0Cre+c0Xq/R/ho68D+Qqo+f7tW+DoUB//75aQyN+370Vzl14QEeCgpJrSCnp4Lndp5rN
 ArxdJfpKqW20Hrq0FA+Tpkdzy1Lv/rr2YbykhpQMHgqr7fEcw0jKsnoVz+pT4wM/cP1g
 vmqdlkLWsTznamhMQu5ySqRczjFyQRAcoh1/dHUtEdXIrzjlrSynR5EXo1NqaI0uz1x7
 oPQA==
X-Gm-Message-State: AOAM532+NjrJzaNcl/1DOa72agSFaI7imcKTuvQmc1x9x4TI9dIqPkmB
 zgPVVdnpJ4Deqp0it1HvAG0=
X-Google-Smtp-Source: ABdhPJyqVq577kVGHv0tkWWZY/8JKIkFv8YoUyYcWXpJR9RpKWU/YTGByz8MrLPIpD0Mh8qeFVOAjQ==
X-Received: by 2002:a05:620a:1408:: with SMTP id
 d8mr18735138qkj.110.1592880211071; 
 Mon, 22 Jun 2020 19:43:31 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id 18sm542902qkh.40.2020.06.22.19.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 19:43:30 -0700 (PDT)
Message-ID: <03e82e1a1bcf516d01ca472546d8b31e468aba8b.camel@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Mon, 22 Jun 2020 23:43:24 -0300
In-Reply-To: <cfb197e1-c608-71f9-5c98-c120a3496266@ozlabs.ru>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-5-leobras.c@gmail.com>
 <ade15776-61d1-b660-db74-7aeba4eddfdf@ozlabs.ru>
 <4bf1d32da3d13a44e3c2e4b04f369fe52c24a023.camel@gmail.com>
 <afd1c5ac-d291-5281-1592-a345ee3c0c8c@ozlabs.ru>
 <205edd45b7bbf39d2fc1d2d75fd7e35336f109ac.camel@gmail.com>
 <cfb197e1-c608-71f9-5c98-c120a3496266@ozlabs.ru>
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

On Tue, 2020-06-23 at 12:35 +1000, Alexey Kardashevskiy wrote:
> > I am not sure if this is true in general, but in this device (SR-IOV
> > VF) I am testing it will return 0 windows if the default DMA window is
> > not deleted, and 1 after it's deleted.
> 
> Since pHyp can only create windows in "64bit space", now (I did not know
> until a few month back) I expect that thing to return "1" always no
> matter what happened to the default window. And removing the default
> window will only affect the maximum number of TCEs but not the number of
> possible windows.

Humm, something gone wrong then.

This patchset was developed mostly because on testing, DDW would never
be created because windows_available would always be 0.

I will take a deeper look in that.

Best regards,
Leonardo

