Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC795065AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 09:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjFdX1Fxnz3bcg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 17:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBhzozr5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBhzozr5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PBhzozr5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBhzozr5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjFcq2vb1z2xrb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 17:22:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650352947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZr6M/RZmb6/46Ixt/CqkBe4H7W2TOgxImOhZARYVog=;
 b=PBhzozr5SXHm7hSfEVdyYAIorcErJRfZrxyZUQCxJfYp2vrr3DaZv6WfE8Fg+1Jrp/AXwg
 SE0AzGW7J3DsnMpmQ+PelmDh0hGLVvqUzffXyXZRXO27dkYLLcXi/0EHJG9oOyOMIH2ket
 V1oKYumibe5jCL2diTMjG1A/f158FrE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650352947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZr6M/RZmb6/46Ixt/CqkBe4H7W2TOgxImOhZARYVog=;
 b=PBhzozr5SXHm7hSfEVdyYAIorcErJRfZrxyZUQCxJfYp2vrr3DaZv6WfE8Fg+1Jrp/AXwg
 SE0AzGW7J3DsnMpmQ+PelmDh0hGLVvqUzffXyXZRXO27dkYLLcXi/0EHJG9oOyOMIH2ket
 V1oKYumibe5jCL2diTMjG1A/f158FrE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-0NBhQKCyMEG82elaNIEb1Q-1; Tue, 19 Apr 2022 03:22:26 -0400
X-MC-Unique: 0NBhQKCyMEG82elaNIEb1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 p31-20020a05600c1d9f00b0038ed0964a90so803388wms.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=eZr6M/RZmb6/46Ixt/CqkBe4H7W2TOgxImOhZARYVog=;
 b=lMivhTa60+PJZaeZpKayttPaVxuQ7h5NE8fVgfQbFfVXas1a4x6Qxv83Z8KBYqWehc
 Zo1SNP7ZiDBExW6mj13Cy99YmEmlHWWqHb6WSBOwTdInLlUiSGThkW6/UIJvqhPYB3Ug
 6ejjX3Xklzt1h589T1tKLMI8VpZiThNiAv827Xw4O2BFBdKV3d8DXhVuJ2l73fDyXHZj
 rxT6yve93UTZYGIqH3p6/dAw+7HnT1FPZuFAZ6T2+IESDMD40Q0arH/ih2m/bQfPZFo5
 ZsgMSZDmQQC+ohUCtdZ9Xrxs9XAl2bLhpRBQZyR+G25qpLPbhHrWVvYsaBHDYgb2wjVe
 4RLg==
X-Gm-Message-State: AOAM530Sg9nOZyTs2rVIF59OwFVzFA5Wet3Z0Wg05zZegsuiWNbTelcm
 /6RRjozeVXggOfODkDU8oY8B4U8bkIXFkKE+EJf5ov5MoKhqsEU/rY6su3DekWc86fL6YjuJTkC
 51RE03pGnQOYDP+3JR56fCS7bXg==
X-Received: by 2002:a05:600c:3582:b0:391:e041:f3a2 with SMTP id
 p2-20020a05600c358200b00391e041f3a2mr17301832wmq.126.1650352943534; 
 Tue, 19 Apr 2022 00:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/UeOtJ/J4radpq0TyJONOLz7bLBbt8qoF30bJsYeesbS32A7rfqg+FAUl2auACvPnfCtwWA==
X-Received: by 2002:a05:600c:3582:b0:391:e041:f3a2 with SMTP id
 p2-20020a05600c358200b00391e041f3a2mr17301814wmq.126.1650352943276; 
 Tue, 19 Apr 2022 00:22:23 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-96-237.dyn.eolo.it.
 [146.241.96.237]) by smtp.gmail.com with ESMTPSA id
 f4-20020a7bc8c4000000b0038ebbe10c5esm18408233wml.25.2022.04.19.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 00:22:22 -0700 (PDT)
Message-ID: <5cd406e8f8e77f6025d77ec1e0e46296694002d4.camel@redhat.com>
Subject: Re: [PATCH net-next v2] net: ethernet: Prepare cleanup of powerpc's
 asm/prom.h
From: Paolo Abeni <pabeni@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Douglas Miller
 <dougmill@linux.ibm.com>, Dany Madden <drt@linux.ibm.com>, Sukadev
 Bhattiprolu <sukadev@linux.ibm.com>, Thomas Falcon
 <tlfalcon@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Ishizaki Kou <kou.ishizaki@toshiba.co.jp>, Geoff Levand
 <geoff@infradead.org>
Date: Tue, 19 Apr 2022 09:22:21 +0200
In-Reply-To: <f995b36fc3f2a3793038300388f06d1c3dd7e69a.1650011798.git.christophe.leroy@csgroup.eu>
References: <f995b36fc3f2a3793038300388f06d1c3dd7e69a.1650011798.git.christophe.leroy@csgroup.eu>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Sorry for the late reply.

On Fri, 2022-04-15 at 10:39 +0200, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.

It's probably my fault, but I really can't parse the above. Could you
please re-phrase?
> 
> In order to clean it up in a further step, first clean all
> files that include asm/prom.h
> 
> Some files don't need asm/prom.h at all. For those ones,
> just remove inclusion of asm/prom.h
> 
> Some files don't need any of the items provided by asm/prom.h,
> but need some of the headers included by asm/prom.h. For those
> ones, add the needed headers that are brought by asm/prom.h at
> the moment, then remove asm/prom.h

Do you mean a follow-up patch is needed to drop the asm/prom.h include
from such files, even if that include could be dropped now without any
fourther change?

If so, I suggest v3 should additionally drop the asm/prom.h include
where possible.


Thanks!

Paolo

