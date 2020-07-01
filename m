Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CD2116CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 01:50:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xyf20XyvzDqmq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 09:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cCk0GG/Q; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xycC0gndzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 09:48:57 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id e13so24019294qkg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=eWwA839IZ7dq+a29DyXkGmi7dM/v2sHdleLj59LsJvo=;
 b=cCk0GG/Q7j5pgcUJbgaej4solO6bRP1anrWSbOb2EYkbaZxCNkvsDaDv+4+ZfzrJgg
 9cRPJ7yZcVHRhpJwVBBhCE78Dsp3GtXcAfbi2u4jI9ICI+w/S2PSRBa0a8wqjsNmesHr
 7nZsYNfFsiCfc8U/j+55Mva2CqSs8RBxMIG21YNs5+84XsEvvCYKimHcVF2fm+/uJgdJ
 UeLbcYiM27bjGQJ4in7VrEE3JRyVCpaBPx38oTX3zzO7Vv6N/cveyCLl+eKkSxcR2zPU
 GF7Tj4oXuiboudPqmevExnWWH24HrJ8XtJndBXodVjlPyATj1F8NLcMnKnN//QUX3FgJ
 Dpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=eWwA839IZ7dq+a29DyXkGmi7dM/v2sHdleLj59LsJvo=;
 b=Z7nFuCF691mycvdVq2Glk4uhKJxbx8/Pk79mXwpwryt95GPSJbkvTyfkZeMV7D28vW
 tMtaTrwuznrAgVssbkGjBWUy+ieBXU5e0ceD9+PRli/Q1BsfAC60j3WqgCMFYqYyjn+M
 kAhlWfULOQyF6nehFKIhVuWxD2GvkF3P7Q6Gagt9GFkL6tO4P76smcuMCrQWlqPjZqun
 zPFVlMuy95zL++sJKBXKSrd6FU7Qhx/WI/Ku0qUCzqX4k7aF7nt9ehpLR5yO9WeyaKaJ
 gAF8xDSWSSLPcAwoS8m+FCXtah4B8q5aK0qGMHaijC+9Xqr/8/u3l5p85m69ueQQ1O7D
 OgFA==
X-Gm-Message-State: AOAM531wzyDZwd8LOEyulRLmVh7nZ7azVPF4omEZyT/hFAJMYdMxd02m
 PAmCzYnH37R17jIG9zL0Lho=
X-Google-Smtp-Source: ABdhPJw0PQ7LdCWGBl5gstq7lsFeqHSpDXcjrWbUSpr7dI7hbWVIEH2haZKhZCeGWOEo3FhVCBQSqg==
X-Received: by 2002:a37:f71e:: with SMTP id q30mr26753981qkj.68.1593647332002; 
 Wed, 01 Jul 2020 16:48:52 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id j16sm6708518qtp.92.2020.07.01.16.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 16:48:51 -0700 (PDT)
Message-ID: <0c3de45dfb612745aa2ee4126b3935303d8e8704.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 20:48:42 -0300
In-Reply-To: <0e8bcc38614ec80c7816c07dd4dc70854c2b901d.camel@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-6-leobras.c@gmail.com>
 <18df09c0-ef83-a0d8-1143-1cb4d50bf6b7@ozlabs.ru>
 <0e8bcc38614ec80c7816c07dd4dc70854c2b901d.camel@gmail.com>
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

On Wed, 2020-07-01 at 16:57 -0300, Leonardo Bras wrote:
> > It is not necessarily "direct" anymore as the name suggests, you may
> > want to change that. DMA64_PROPNAME, may be. Thanks,
> > 
> 
> Yeah, you are right.
> I will change this for next version, also changing the string name to
> reflect this.
> 
> -#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> 
> Is that ok?
> 
> Thank you for helping!

In fact, there is a lot of places in this file where it's called direct
window. Should I replace everything?
Should it be in a separated patch?

Best regards,
Leonardo

