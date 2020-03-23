Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF38118F0F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:37:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m76r09NnzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bg5dByMq; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m74x49NxzDqn5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:36:01 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id ck23so5759542pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=jQgBNOBetT+Yt9L1iBVToV2z/HpT1STYDN2GnLPUbZ8=;
 b=bg5dByMqk4E50hNtbCGMlTCXC+I0n8bJZ9aiwyEplK2n7k9vgIaCOpIo3QClPkMKz/
 85ciSI97m1kFKD05Ooad8bX73r+jiCvd0EAaoODmKHv1dABp3eMmND+0KJQTpnQEaiFs
 +IEUliXpab40z/XgujvQTd47DVYDSCAXLtVNfaEpx31AP9Tc5m0tueizkvs+mktm4I18
 mvLFQ5GxeLFZVlSgkMiqIgLjNOECvpJWrh5xEb+/I5YREitAWtiunmnjm3EIo5cu+v3u
 +H/oybtYojuw+y4tVERBq0gOsQ5ZDwxGBDqY2BrUtwYyoSyW4R7d0Ejx6aqufybfYHqb
 iwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=jQgBNOBetT+Yt9L1iBVToV2z/HpT1STYDN2GnLPUbZ8=;
 b=AhHr9xJG9iQtUsNkcukqtcos6rgPDc4BAzv5IdHeCaCVes0ho8cuskUzj98dwX7U7W
 m0tlNDUR8WRn9pzerQ3cf+dYjB0EUWVSQvGx2LcWfjz5Vd0jp8GETZuSuvZvvWXEDeDw
 lvQyiihuarJRifktAR/+VGhH9UoJtu4i7hx/6I+6+NzB26u2EURZc55ggQftS+s7Dr1w
 vefLMM3KrA0Jow2sGdd/paZ99kSb7s2BrfoPkzsRL+Z+yD3+x3DrQcBLDYNV0IS4Ew9f
 DKoFMaumwfxryrRabp23XGFiPKyU0dAdblAkKqrg3gxOXRaStE9spblFp0zu/ymir8nC
 +Qxg==
X-Gm-Message-State: ANhLgQ3w5sqAZoGr2znYq/nG5XgBU8TqGI6emZVGNo/w6BNTB4+R57in
 DbOezTNM+laEJSWKeacfkDM=
X-Google-Smtp-Source: ADFU+vtupVzZlv9Wxpzbv3+cZe0iswidB3CHNo7sIqsXoz8TGh6+KBE0yoI525zLJ1j5YLwnlRkUkw==
X-Received: by 2002:a17:90a:a795:: with SMTP id
 f21mr23950941pjq.29.1584952559231; 
 Mon, 23 Mar 2020 01:35:59 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id h132sm12937462pfe.118.2020.03.23.01.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 01:35:58 -0700 (PDT)
Date: Mon, 23 Mar 2020 18:32:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 9/9] Documentation/powerpc: VAS API
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au
References: <1583540877.9256.24.camel@hbabu-laptop>
 <1583541541.9256.50.camel@hbabu-laptop>
In-Reply-To: <1583541541.9256.50.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584950507.6q5ilutvon.astroid@bobo.none>
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
Cc: mikey@neuling.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 7, 2020 10:39 am:
>=20
> Power9 introduced Virtual Accelerator Switchboard (VAS) which allows
> userspace to communicate with Nest Accelerator (NX) directly. But
> kernel has to establish channel to NX for userspace. This document
> describes user space API that application can use to establish
> communication channel.

Agree with Daniel this is good documentation.

But I don't see mention of the word 'signal' anywhere. The signal stuff
is one of the trickiest parts this code being added. It would be great if
that could be documented and even with example code or at least a
description of why it's required and can't be done some other way.

Does something like io_uring require signals in such cases?

Thanks,
Nick
=
