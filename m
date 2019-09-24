Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5BBD294
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:24:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dB385Vh7zDqd2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 05:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Nm7UWbP8"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d7YP1sxPzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 03:32:23 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id e18so2404632oii.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vufHR4gTNWqyAPqOkAFSdaMG9FRPmHMMrJOcHYZrZnQ=;
 b=Nm7UWbP88ZdsRNTHKyz/5IW6/lRTd7wGMUWUxRFB0NN2Nlwz29YClrjuWcASt9RI7b
 W5TS10WfepT9X9E4Nx33P7aaCacWJnBE6/d3XXVUxKLXGZZY+QTp+RVfFFZSEpqouwfa
 oD+yTjHI/eI5iCDRdIuhTe+Cs8aBWta5bf4fwOU7UUQO3f8SLaD/vUOEnwORWFe72F1f
 yGmXKBW5wrQNnn6tqxB93uWgYAi0uaJFKlHm/tcwY2fn8fFEEZ6rEm9TLFwvzL/W2z7c
 abSspao32/yeGBlTck+Y5HlJHU38NqSW/6PfzyVXj/2QNon+k2zuzadCbCT8kPQyiebs
 AUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vufHR4gTNWqyAPqOkAFSdaMG9FRPmHMMrJOcHYZrZnQ=;
 b=HPdLlwYidlkGolD3HIsVYP1QTjhk4NxPslRdO4pBI4OekbMRf/wbxa10cottopuGUn
 yPI+ZIBEqESK+VXOIVvxCNxN5ZG+j76h0l5EWA+QzWWbkn3mAzY+DYxBo7u3GHDfGBhM
 an8zwr4FXqdM6aDIxRxbLbd24ArzWfYpCf5eLEBXPwk62aX9TL8bX/TOwl0CpdgcJaCi
 EVmBgAIuJRVUaFg3+PyxaUDQQQwhBnZghSplbl7nYN0OmiCKVegnGdsVkpCyIDJvpym+
 rF/2d1oCsCrAhlXY7ch+qHuSG7yKE3rd0ngLaFUs4wvhZI4sUB0+/D7Ix1gOt+Muj3iY
 ROGA==
X-Gm-Message-State: APjAAAVnw98/noLdNubMy2GgRhsBKJ5FsCfNAxK/TTc6LzWqHTwzjuTb
 hxMWz44jCEc7uCJc40w+Vx26X6wdDoBrWAfftXq54Q==
X-Google-Smtp-Source: APXvYqxGZn5csplKhSkggqH2B3a79gmO0I8UtOCpk5iIxx+1/zvqH3OzQp2h54EgO/JbZcmQV8+gYjTIbwm7mg3zVfI=
X-Received: by 2002:aca:eb09:: with SMTP id j9mr1173051oih.105.1569346340355; 
 Tue, 24 Sep 2019 10:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190924042440.27946-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190924042440.27946-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 24 Sep 2019 10:32:09 -0700
Message-ID: <CAPcyv4i8a3jLUgMYp8_G9nRxtBJzrz=e4P6T+q_tJSVkhVmi=Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/book3s64: Export has_transparent_hugepage()
 related functions.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 23, 2019 at 9:25 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> In later patch, we want to use hash_transparent_hugepage() in a kernel module.
> Export two related functions.
>

Looks good, thanks.
