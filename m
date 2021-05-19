Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2680389293
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlcGR0CtSz3brt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:28:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gxC+ShG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gxC+ShG+; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlcFw5ZNFz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 01:28:19 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id v4so10396191qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t+Qf8jBffPJDUSlKRZVMI8zX4NSNOwtmPk0wyLsEYn4=;
 b=gxC+ShG+NpGHpTZL/MrzZTdrhoD98Dy7r+epu3GJOUGxy8HV2fUwvcbqrl4NwH9UMm
 LIEXDLzwm03nY0X9S3fn74RbkPPpQfNmnO/xDritCY5hJRTjU37cs3HZ9fzsi2QjEwOM
 v2w0fhhEDhvykuV97BBVUPps+dHVyv/woHKaGJ57JO9axQK4Y9Exka7tvt4u2O5uN/RT
 f9W8WQe3fJvv8PJngNvbGTZxCdFfiKg/X7sGG+0QIjNyl83PPNHLMK8aguCjZ7RZYiPR
 02n0r4AHmmYpm33dBuSrBs0n77eEEkTGxUsaVawtEfuM9m5RkOSPDLhUMHkXLnN7+R9Z
 zWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=t+Qf8jBffPJDUSlKRZVMI8zX4NSNOwtmPk0wyLsEYn4=;
 b=nOzoO36y3CxpSYhPMH0UOwud6J3Ns3Z5XICnrb51zh6rwf4dBFYmlisjH6iOsgmVJq
 +vasBpKMTT1Z2LYZf5qFDKwdmpct3g5SRRb7OfNIak+3g/jI+LBM9WWEb5fW4GXruDvZ
 mSA2lJRpruof2CkqSsctI3jZMpCUW+FchZcX6XNQcAeBw35PYNjz6VJlHWP0skV3+sWF
 vojlz3Cy8Qpt/5MTMCQ5yMy3ZXFFX7iH6NJBskpPlF8EEN8qkVvoDeRUltCN8sRVlQXh
 oUpT+YYjtw/IuYWTt/+0hJeClMNzt/i+muFeh0O+7NB4UE7bGzPYyZJDBDLoo0YmdaOK
 BO2w==
X-Gm-Message-State: AOAM5318hsJVrAHRi5cXnBoiiPFofuRJME6T15IldFCCcvRxfNwzzHof
 R5+Y79BFpwroyzOJqS8oLqw=
X-Google-Smtp-Source: ABdhPJxp9sbb8rs6CsjQCKcMq6IeId9cBid9WMvSf6pGtqtW66sTZFk0wWLorHY0bYP/AqF9OHLdzg==
X-Received: by 2002:a05:622a:392:: with SMTP id
 j18mr259202qtx.29.1621438095831; 
 Wed, 19 May 2021 08:28:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 64sm2207536qtc.95.2021.05.19.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:28:14 -0700 (PDT)
Date: Wed, 19 May 2021 08:28:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <20210519152812.GA3109563@roeck-us.net>
References: <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <20210519004514.GC10366@gate.crashing.org>
 <20210519120306.GD10366@gate.crashing.org>
 <46cedc01-bca7-236d-9f74-a9cc24391512@roeck-us.net>
 <20210519142038.GI10366@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519142038.GI10366@gate.crashing.org>
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
Cc: npiggin@gmail.com, linux-mm@kvack.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 09:20:38AM -0500, Segher Boessenkool wrote:
> On Wed, May 19, 2021 at 06:37:44AM -0700, Guenter Roeck wrote:
> > On 5/19/21 5:03 AM, Segher Boessenkool wrote:
> > >On Tue, May 18, 2021 at 07:45:14PM -0500, Segher Boessenkool wrote:
> > >>And it actually explicitly is undefined behaviour in C90 already
> > >>(3.6.6.4 in C90, 6.8.6.4 in C99 and later).
> > >
> > >... but there is a GCC extension that allows this by default:
> > ><https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wreturn-type>
> > >   For C only, warn about a 'return' statement with an expression in a
> > >   function whose return type is 'void', unless the expression type is
> > >   also 'void'.  As a GNU extension, the latter case is accepted
> > >   without a warning unless '-Wpedantic' is used.
> > 
> > In C99:
> > 
> > "6.8.6.4 The return statement
> > Constraints
> > 
> > A return statement with an expression shall not appear in a function whose 
> > return type
> > is void. A return statement without an expression shall only appear in a 
> > function
> > whose return type is void."
> > 
> > Sounds like invalid to me, not just undefined behavior.
> 
> I don't know what "invalid" would mean here other than UB, it isn't a
> specific defined term, unlike the latter, which is precisely defined in
> 3.4.3/1:
>   undefined behavior
>   behavior, upon use of a nonportable or erroneous program construct or
>   of erroneous data, for which this International Standard imposes no
>   requirements
> 
> This is the strongest thing the standard can say, it is not Law, it does
> not prohibit anyone from doing anything :-)
> 
> "Shall" and "shall not" X means it is undefined behaviour if X (or its
> inverse)  is violated.  See 4.2:
>   If a ''shall'' or ''shall not'' requirement that appears outside of a
>   constraint or runtime-constraint is violated, the behavior is
>   undefined.  Undefined behavior is otherwise indicated in this
>   International Standard by the words ''undefined behavior'' or by the
>   omission of any explicit definition of behavior.  There is no
>   difference in emphasis among these three; they all describe ''behavior
>   that is undefined''.
> which also explains that what you call "invalid" has undefined behaviour
> just as well, most likely.
> 

I'd have assumed that "shall not" is syntactically wrong, but I stand
corrected.

Guenter
