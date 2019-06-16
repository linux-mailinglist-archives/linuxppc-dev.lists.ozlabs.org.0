Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4194776D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 01:57:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RrrG2RnJzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 09:57:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RrpV4ccNzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 09:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="mjFgfEh9"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45RrpV3Pw6z8tFV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 09:56:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45RrpV2wQbz9sDX; Mon, 17 Jun 2019 09:56:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="mjFgfEh9"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45RrpS4fMqz9s7h
 for <linuxppc-dev@ozlabs.org>; Mon, 17 Jun 2019 09:56:15 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n65so264345pga.4
 for <linuxppc-dev@ozlabs.org>; Sun, 16 Jun 2019 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eKbpzEiJylVko/AqUmYGdm35tR1kAF8kyTrOQOn/LZY=;
 b=mjFgfEh9DpnUyYJnmm10xCAA44rjQ5vM3POmL21L1yxtntOM4gCLmgenR1CUMVLdRK
 bKJ5vWJRNlNGEcrq4IdxzCEHcpIe7vlLMfhuxhzjrr57rEblFOm2QshpZwxJlJUsK8FS
 r9C0ItB6L+JRovFIxzCuNpKzuioK88/Kll0kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=eKbpzEiJylVko/AqUmYGdm35tR1kAF8kyTrOQOn/LZY=;
 b=hXDAB0f4OsJqy9rsJOCqMsIjqmpJEZfVybT0Hg+n/MawDq9fcKJFKxT/3tJJnA71fd
 eRgga2niSye0xyr9SR/F45/9MmrxKnW9kQim3zYVMAW6nbBGag64h0CfiZBRFnGaz413
 BITHuHU/7pJzLPg7V0qc9mNDjLeaU3MnlJucGiciTdm/eeL3f3f4M46HCr+gAkREHxfX
 HVBkyCIxCi2QNOUrRM0lRQHecUCG6kdRRvf6cF5/yaAVUS6xpT4V96ckrLuSoBey2B+u
 QuqUenH+Nwyk+F0ehus1JyZCrkOezwx48cxM0wYJMW7RyrUR/Sulue5RYrjmJANGZckj
 KO/Q==
X-Gm-Message-State: APjAAAXbFBQ/5+pD8fFrCybmwisyVrFyihnMZHHbn5y2VCyiErHSesBI
 tEOx4VFmMwfIGcAZEI8mUiLAxw==
X-Google-Smtp-Source: APXvYqzVFXwvbw+h8Vy5oNuVgOROK+vJF9NO7ccBNAEWTkL02XdJ05Npe6ZqjRHegh2kVzPtwd85kA==
X-Received: by 2002:a63:6981:: with SMTP id
 e123mr22346754pgc.136.1560729370570; 
 Sun, 16 Jun 2019 16:56:10 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id v4sm9131345pfb.14.2019.06.16.16.56.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 16:56:09 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc/powernv: Add OPAL API interface to get
 secureboot state
In-Reply-To: <b2cedb05-6373-b357-f35c-bc112c78a6fc@linux.vnet.ibm.com>
References: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
 <1560198837-18857-2-git-send-email-nayna@linux.ibm.com>
 <87ftofpbth.fsf@dja-thinkpad.axtens.net>
 <eaa37bd0-a77d-d70a-feb5-c0e73ce231bf@linux.vnet.ibm.com>
 <87d0jipfr9.fsf@dja-thinkpad.axtens.net>
 <b2cedb05-6373-b357-f35c-bc112c78a6fc@linux.vnet.ibm.com>
Date: Mon, 17 Jun 2019 09:56:05 +1000
Message-ID: <87tvcp2iga.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Richter <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nayna,

>> I guess I also somewhat object to calling it a 'backend' if we're using
>> it as a version scheme. I think the skiboot storage backends are true
>> backends - they provide different implementations of the same
>> functionality with the same API, but this seems like you're using it to
>> indicate different functionality. It seems like we're using it as if it
>> were called OPAL_SECVAR_VERSION.
>
> We are changing how we are exposing the version to the kernel. The=20
> version will be exposed as device-tree entry rather than a OPAL runtime=20
> service. We are not tied to the name "backend", we can switch to calling=
=20
> it as "scheme" unless there is a better name.

This sounds like a good approach to me.

Kind regards,
Daniel

>
> Thanks & Regards,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Nayna
