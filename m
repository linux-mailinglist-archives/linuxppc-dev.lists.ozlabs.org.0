Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D762C1CA095
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 04:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JDVj3D0gzDqv5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 12:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b6ZZlDm1; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JDSb2QXFzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 12:15:25 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id r66so7150398oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 19:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flhd9uT6pMTHVGHU0uST5lnkBYN/vNN7GQMBcC/WgSs=;
 b=b6ZZlDm1NlrLIC8t2ErBilM/pedPOh9HypVrr/vhBzGiZSFlRqtQuXOLUcdqw+guND
 HqDn33K63ZAIHkc6r/1pGhc32Nals5DZMjd1jtqVJUqo3l8DNdZ+vw2HOMSYGygzAcAl
 tlp+PJi/939s7m+DiidaZ7EpwjE5yjAQsAARaGob3av46hkUivs7XEyaoJYGz59c6CDK
 Xo/sha2Ztzlu26NPVjAP5xz0rzM1vcZOdBr3V8Ar1kRo34fn5RwkHjh0hUVh1xZR+PDM
 TscxcyJN6njWEvpPmjig4+D2uk4hjtLwMawLCHJyglkmyNI8ZP23Pq9cmb9BiFsSknsy
 Pduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flhd9uT6pMTHVGHU0uST5lnkBYN/vNN7GQMBcC/WgSs=;
 b=W7UFZP9wC9tofIUg11frbuC1W8aX3pH+2cwUwtIX24lW3R7pel0XRsa3SYzbSOD3re
 clG7pf8JAWtdld3ecYkdM1AIo7QEHnnCrZiJ/nYtXZQwdQJY2vFyaGuAApVBhnVdERRE
 +oVxMvafhxX9NPRFZqPvmB13p5mo0LAte8AzYPZeGfmYz4daQCwCVleTRyDuQkiCx3Vm
 bDNyhAW4tIWAF39dctAsHVMPzrI50EHVmCYFw8Cwi923UCsuu0tjlAmulIBD+yNtHqpK
 UlDQQmDElpgaHtRgGRUBM7+wqePlHkcLP8+fk9TpgFKxlPCEKEzH/z0CzcyqlUAW9ySY
 4xuA==
X-Gm-Message-State: AGi0PubkUBJTfcRPK5yg4Y5lIlA7rJxqAn/bbVdC8ZVg1BTgyJ7eTyZK
 drWt5w75t9z/xZ+pyCcy2ATeaxW5/G407sF6lcHeZiPXdHc=
X-Google-Smtp-Source: APiQypKOY+AARB1KA04HKftYRnr8M4anK8xS4kxxi8EZRbMOZ1EDbhGZSiN3GJ89Bv1HnL78ZWRtnTxpfs0Wv/wkyK0=
X-Received: by 2002:a05:6808:3d5:: with SMTP id
 o21mr9294837oie.40.1588904122952; 
 Thu, 07 May 2020 19:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-12-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-12-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 8 May 2020 12:15:11 +1000
Message-ID: <CACzsE9pdhYE0fqWT6TcgaOudG2S0u1eE55MDn0XxsDNbUFnWdA@mail.gmail.com>
Subject: Re: [PATCH v8 11/30] powerpc: Use a datatype for instructions
To: linuxppc-dev@lists.ozlabs.org
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi mpe,
On Wed, May 6, 2020 at 1:45 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Currently unsigned ints are used to represent instructions on powerpc.
> This has worked well as instructions have always been 4 byte words.
> However, a future ISA version will introduce some changes to

s/a future ISA version will introduce/ISA v3.1 introduces/

> instructions that mean this scheme will no longer work as well. This
> change is Prefixed Instructions. A prefixed instruction is made up of a
> word prefix followed by a word suffix to make an 8 byte double word
> instruction. No matter the endianness of the system the prefix always
> comes first. Prefixed instructions are only planned for powerpc64.
>
> Introduce a ppc_inst type to represent both prefixed and word
> instructions on powerpc64 while keeping it possible to exclusively have
> word instructions on powerpc32.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
