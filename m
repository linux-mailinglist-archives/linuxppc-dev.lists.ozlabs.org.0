Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E5194B80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:27:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pKPC2yV7zDr40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 09:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=k5fgfGns; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pKMc4CWGzDqjL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 09:26:19 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id u12so3596966pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 15:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O/yC00w391epPPyp6RO8cwTZujVU6RxnjmFTptYooQo=;
 b=k5fgfGnsGkolT/GpHsKH9fWO+PpnSwMNjlvbIOlW344rEyTQF1k0B2kqOWjhOJr60b
 3LhWWhn7aEjQL+kjqvhYVVhgvZA70zo7v3VIren8z/Nnvf3bmKtPpSwVazgCx/yKFte2
 rc4dPu6uwQcSCS0NPVo5NuMFyycV38L0thdSKD6T9i/YMs55tSiwupM0xic5WaJvI5hA
 keTdwLT29OtaiZq9krDz1KnH5AkLHcSctK59tLqjhRMkuSC7bqHirZk+SrVUH0g9DCIK
 kS0aLTrvUGVjEL2iDEcZEMrrss/wnNSjfu6fc8N6o8tz8rVRt6glLo7a14ERVbyBZQag
 6gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/yC00w391epPPyp6RO8cwTZujVU6RxnjmFTptYooQo=;
 b=Ujdp8aNuLhU68EHqZvSAWCrl0iJaKXEkUxF9selizfv76uSDxBkMhnziqdzxKVwDpN
 a/s2dWN5WTlp87oFWuUDWp7ZYE40p17TjGIumUKpo7PzuQABDNRlTpupgpF4FnS8raZd
 vphhcB4vSituiOhL8kA5nFDi1bnneSZEeO95hcVBrjF065fXbBXAopQoUlZat4tzVdbW
 oYPN07ISAKGHP1blyndIwhYTGeLwWaFUWf8CTKoZW5dWldDVwIrlLW3RPHp5Wqw8LG6f
 a+wCioJGa20VS3iIQijSDKbyxUeU+ncKblTH+7tav44qqYIZr5kzUa5MIF4RiVM1SsXt
 fq2A==
X-Gm-Message-State: ANhLgQ0E/nsKkAYj5VVqtaiAEF5qduFtU9qJ8dkvLb96M282EANYtXd6
 KwfCO5RfC7feRZMILi1B9zMR4Q==
X-Google-Smtp-Source: ADFU+vsCApoU/1goKMHSzsNO3JBNtMy28xD6riJEvIS4sHWCSlTmIozuiLLMn8nImW3gBMc+7LK4TQ==
X-Received: by 2002:a63:1e4f:: with SMTP id p15mr11052058pgm.28.1585261576186; 
 Thu, 26 Mar 2020 15:26:16 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
 by smtp.gmail.com with ESMTPSA id x71sm2462894pfd.129.2020.03.26.15.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 15:26:15 -0700 (PDT)
Date: Thu, 26 Mar 2020 15:26:12 -0700
From: Fangrui Song <maskray@google.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc/boot: Delete unneeded .globl _zimage_start
Message-ID: <20200326222612.zbbiyi75emq6npzn@google.com>
References: <20200325164257.170229-1-maskray@google.com>
 <20200326221625.GA22482@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200326221625.GA22482@gate.crashing.org>
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
Cc: Alan Modra <amodra@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-26, Segher Boessenkool wrote:
>On Wed, Mar 25, 2020 at 09:42:57AM -0700, Fangrui Song wrote:
>> .globl sets the symbol binding to STB_GLOBAL while .weak sets the
>> binding to STB_WEAK. GNU as let .weak override .globl since binutils-gdb
>> 5ca547dc2399a0a5d9f20626d4bf5547c3ccfddd (1996). Clang integrated
>> assembler let the last win but it may error in the future.
>
>GNU AS works for more than just ELF.  The way the assembler language
>is defined, it is not .weak overriding .globl -- instead, .weak sets a
>symbol attribute.  On an existing symbol (but it creates on if there is
>none yet).
>
>Clang is buggy if it does not allow valid (and perfectly normal)
>assembler code like this.

https://sourceware.org/pipermail/binutils/2020-March/110399.html

Alan: "I think it is completely fine for you to make the llvm assembler
error on inconsistent binding, or the last directive win.  Either of
those behaviours is logical and good, but you quite possibly will run
into a need to fix more user assembly.

I am doing some experiments whether making clang integrated assembler
error is feasible.
