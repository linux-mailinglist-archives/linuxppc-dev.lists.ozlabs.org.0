Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E535B242
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 09:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ3xs35tQz3c28
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 17:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SYmOP/+F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SYmOP/+F; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ3xR1Bf4z2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 17:52:26 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id i9so4626625qvo.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=ZHL5Soq7GXxkbink8aOs79DAE+cm2nszFnoS5U3vqyk=;
 b=SYmOP/+FniIMLhCqzp4yQzjnm66+MmXDagDWgYiwysFsyaL47/saSlbCi81cm8/kbZ
 1FwLXN+/xofCmhv+UcnhNOgVhYSOb2qCBhTB3JlhzgE0JgUBG2biasEv/YmfdihvT/ik
 Qirj/0gyrpzbO0mH8rnVsaY3w/SxuEgvUmiT0Lx6U0/snv0v/Bv3Hftv9t5e0dXNv84R
 xXMXluKmxsTREpoLL68QzvXtLzOzEMz1TbN6auRKtFFYxVhvAjEkJGh7pgouR3Mn+Kdc
 B5g6C/oXFSFnzW2gHJ2vPBoiJEP46WhbWaJhW3tnCSKKxyyUcBt/2Co4jjtDBxVAb9gK
 wQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZHL5Soq7GXxkbink8aOs79DAE+cm2nszFnoS5U3vqyk=;
 b=JfcO2u7EUxIHbfFFuk32g6cqDzkDhbrxZi+LsnJRzMthQPZAqsFC7SRdghTu0UJtvf
 SMxamDQJxbnY6TtnhFnvZrvPaWCvUTz/Xs1qd4xikAJYJNMNftNGYCi5KAsdBOJmZK66
 pbO1hHvt3L9KqXglrbtDFoPqJmwY+9Oh4AgMcR8cd3XqNbNfEeEWNl2sfNQuOT6D5soe
 x2dteN+sC1JFS4vl+iJ39+eBFlfs8ekkam6roedhzW/158/4Rua18hP0LueOdHENJXaf
 8M7nHrGhtDVd/sVUlynbhRXwaEHsn7ut0WxChvbpB73ddMfTOFBnyTxJXk6PYIPec8rF
 Wq+A==
X-Gm-Message-State: AOAM530uehhlzDTrxgYiYJ9RA6fHXGgedV1HtBQvtFFJRJxIycJEM3zu
 2279Tj+2b0Dgh6wK6/6vx/E=
X-Google-Smtp-Source: ABdhPJy6HJcz04P0d0K9zmViDhOirsec0RfIVOe1q0BvJ2/ZL9A4BuxXOlQNf/MqQtXIsLpX585aHQ==
X-Received: by 2002:a0c:ee81:: with SMTP id u1mr22060154qvr.14.1618127542966; 
 Sun, 11 Apr 2021 00:52:22 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id a10sm5537644qkh.122.2021.04.11.00.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 00:52:22 -0700 (PDT)
Message-ID: <d14e85a37b66916eee283c3b5560077008230581.camel@gmail.com>
Subject: Re: [PATCH v2 09/14] powerpc/pseries/iommu: Add
 ddw_property_create() and refactor enable_ddw()
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Sun, 11 Apr 2021 04:52:16 -0300
In-Reply-To: <8442d9df-d9f9-f919-211b-e94cc1822e26@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-10-leobras.c@gmail.com>
 <8442d9df-d9f9-f919-211b-e94cc1822e26@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> > 
> >   	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
> > -		  create.liobn, dn);
> > +		create.liobn, dn);
> 
> 
> Unrelated. If you think the spaces/tabs thing needs to be fixed, make it 
> a separate patch and do all these changes there at once.

Sorry, it was some issue with my editor / diff. 
I removed those changes for next version.

> > -out_free_prop:
> > +out_prop_free:
> 
> 
> Really? :) s/out_prop_del/out_del_prop/ may be? The less unrelated 
> changes the better.

I changed all labels I added to have out_<action>_<target>, I think
that will allow it to stay like existing labels.


Thanks for reviewing!
Leonardo Bras

