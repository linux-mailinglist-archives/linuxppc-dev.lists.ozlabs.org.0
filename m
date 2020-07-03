Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16A21343E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylbn2dbdzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:36:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m1MRi+xr; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylPG4jcpzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:27:14 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id x62so23168299qtd.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=bt5K9XtO4LmaNxjZqwWNBKUIx68FUKBArV0VTR0P1tY=;
 b=m1MRi+xr0n+zOnLQxXEmEVq+ZcH6RpRlw8z74GuOZAGBPWvWm9fm1xfXrGo/M/Iyjx
 5/3tlXePjZODGcMmpSG0qjYLz5YpBQEul5CWIRPjBVI+y63ZEIVkPHvFt4vUQ9sAw7se
 izukHid+jBmwTICNAksbWgdQ1C4qJMQ3YgFXveggrGwIyeaujoFb10R4i+YxzW7cW3R3
 GavY6hZgyllhtZBIT1tAV3AJA3lfh4yrDuX030m+EXIQemQV1Y+9kUmzpBAVrNO1+vrS
 PydCHu8K89X6mHVSfYkKIrPNKWPhO4VJbI2xLDYRnYRM1VL2hRTd5H7VrTWrOaeVLhiy
 GpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bt5K9XtO4LmaNxjZqwWNBKUIx68FUKBArV0VTR0P1tY=;
 b=OE/uT5cyRSk0efliZvVS6+ODaXBMxgJbLxUDSCU8eQ5SuYa04kdYLMzexhDHr6mRhC
 HwomaD9bKUblJBubLLEtEw+uHo7dYy+rZEyn/7CBj8FgXX63KfKWeh4337euBBWbJl0N
 enRDgE/0GVXVyRtT9GUAvrx34iFElO8Erv+nA0DPOE/7NWxn2qAB5Tc4LaCK9xWZ+DYI
 AoIGi/JFnUAYtJtGuy9Xm55C2b/lwcy8WSU4flLQWzEmw0aABsU7SHkJYBw90bJITUy3
 TrQ0nZGK46jucmqXV1q9ZTEfmpTDNb3k4kRwZBxSY3dmA1UrFEYveN42fTSBkYZyjUT6
 Z4ng==
X-Gm-Message-State: AOAM531FfKyWz8myt+mb+RKtuSwD0CVZdTFW1opOsC5YvYYK8l8X9a3z
 8QkX2nROAXhfyc4r2cAifbY=
X-Google-Smtp-Source: ABdhPJxUxn9Zk+mz//5V0e1yuEBIBvzhAuaXiY+i3MFSy1R30ijJEoE7d1WlyIqDbtoEyw+xiRnU1w==
X-Received: by 2002:ac8:408c:: with SMTP id p12mr34184171qtl.332.1593757632167; 
 Thu, 02 Jul 2020 23:27:12 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id h197sm10113548qke.51.2020.07.02.23.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:27:11 -0700 (PDT)
Message-ID: <e9edda01a21f7144cf4781132df070feea04f767.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Fri, 03 Jul 2020 03:27:05 -0300
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
> 
> On 02/07/2020 09:48, Leonardo Bras wrote:
> > On Wed, 2020-07-01 at 16:57 -0300, Leonardo Bras wrote:
> > > > It is not necessarily "direct" anymore as the name suggests, you may
> > > > want to change that. DMA64_PROPNAME, may be. Thanks,
> > > > 
> > > 
> > > Yeah, you are right.
> > > I will change this for next version, also changing the string name to
> > > reflect this.
> > > 
> > > -#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> > > +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> > > 
> > > Is that ok?
> > > 
> > > Thank you for helping!
> > 
> > In fact, there is a lot of places in this file where it's called direct
> > window. Should I replace everything?
> > Should it be in a separated patch?
> 
> If it looks simple and you write a nice commit log explaining all that
> and why you are not reusing the existing ibm,dma-window property (to
> provide a clue what "reset" will reset to? is there any other reason?)
> for that - sure, do it :)
> 

v3 available here:
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=187348&state=%2A&archive=both

Best regards,
Leonardo

