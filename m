Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CE945FFF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 17:11:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l1AgEe6A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb8Rm5FCzz3fRV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 01:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l1AgEe6A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb8R24HG1z3cjX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 01:10:37 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-709339c91f9so3493108a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722611435; x=1723216235; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w18rli39zrBz+z69vr4j7Cv9UgiGlYDlbgAiJhn3mtc=;
        b=l1AgEe6Ase4f2Aq6KACtbD6k/znJIsvUWLHWBFntRYMCk5aTkLyYyBbpIWXCxrEFOp
         ZrZ5uPm/AvkIA04bzUVkxWyB4aQV5xLcoV7BmRGspbOTfCwELtFLIixfB5+iwev9h6+8
         Kuuot+e85vlIUCEPPvnLV3TgeKwdBieRpVA3Iy10400FyOenrCHBiR6hMbecHN5IS9xD
         6tBZfAlaRWb/tYmpAS8PLAA/GOeR1AiMna+i+cDluWVRPpLZlM9K79iW7TsfkJB8pJb8
         tPlNsNa6xgWk1ywna9foUDAYg7DMWhGiRUr5e3zbw7HmXIefqSYthakWpcjkj3HXUX/G
         DshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611435; x=1723216235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w18rli39zrBz+z69vr4j7Cv9UgiGlYDlbgAiJhn3mtc=;
        b=iyWzbxU2qgzzDju+l6P9CnZheAEzOTSKyimZ+Ps/60AY6BYpwcPZ+IUrQ/xcEH8Mxz
         0VOsdyGvbqAl2VcI4VumVNeqsoOOucfEXM421secMm87EtcRfunQF6FZbfZfBYHuqFPy
         9ZXrlMGRLm8sswBJQFEyDTsX/PvaHjADtv37BYmwS1mM9cMgacjxJBjavR9u2+rA31AE
         SeU2WkqTw+ixmLztnfyC4hV+7/oBveqpGoa2/0ksW0H72j1STMvswzSOn9G9mshrIBfa
         4ZfBv0hnUJ7jvVtLdk+/axIY3kzUtkkkVZf95OnZOd9Z4CQ5IDcOMm5P3VroZada+oIW
         OsMA==
X-Forwarded-Encrypted: i=1; AJvYcCWvT+srLYaAk7XLMhlmZnI0SzeeOmGK+nH99cqBbTe8hcZnlbQSnL9Tk0e8TLQ/IzZc2lu57w070pJ8UvQVHXPSvIIud6LPjwrR8QPLuw==
X-Gm-Message-State: AOJu0Ywk9F1klz5U3pI6rjUrAMCMDpKMRjIq+d/KV/oKv6ot+Jxjwv8J
	tk8Gle2FmDQuJlvWn/YopBnvZRdDd6BQW7KPl6EETVPOug4FdQBAyUoBHp4n27k=
X-Google-Smtp-Source: AGHT+IEXh16YlP37pNnz5n5eqHLMvKkfu8xPB7W6l/8KbQXft81x0EHBKA3Iyswcj6jlByZidCHXSA==
X-Received: by 2002:a05:6830:2656:b0:703:6845:ed89 with SMTP id 46e09a7af769-709ad85200bmr5072675a34.5.1722611434763;
        Fri, 02 Aug 2024 08:10:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a31ec1f73sm536258a34.42.2024.08.02.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:10:34 -0700 (PDT)
Date: Fri, 2 Aug 2024 10:10:31 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH] crypto: ppc/curve25519 - add missing
 MODULE_DESCRIPTION() macro
Message-ID: <ee8c4cc2-c266-4a46-a8be-7c189f14bd10@suswa.mountain>
References: <20240718-md-powerpc-arch-powerpc-crypto-v1-1-b23a1989248e@quicinc.com>
 <ZqzcApbJomFTnc30@gondor.apana.org.au>
 <75a526e3-3101-4319-b42f-4482ba188abc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75a526e3-3101-4319-b42f-4482ba188abc@quicinc.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 02, 2024 at 07:27:09AM -0700, Jeff Johnson wrote:
> On 8/2/2024 6:15 AM, Herbert Xu wrote:
> > On Thu, Jul 18, 2024 at 06:14:18PM -0700, Jeff Johnson wrote:
> >> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> >> description is missing"), a module without a MODULE_DESCRIPTION() will
> >> result in a warning with make W=1. The following warning is being
> >> observed when building ppc64le with CRYPTO_CURVE25519_PPC64=m:
> >>
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/crypto/curve25519-ppc64le.o
> >>
> >> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> >>
> >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> >> ---
> >>  arch/powerpc/crypto/curve25519-ppc64le-core.c | 1 +
> >>  1 file changed, 1 insertion(+)
> > 
> > Patch applied.  Thanks.
> 
> Great, that was the last of my MODULE_DESCRIPTION patches!!!
> 

Horray!  Congratulations.  :)

regards,
dan carpenter

