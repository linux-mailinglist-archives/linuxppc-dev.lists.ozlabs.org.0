Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F926BF839
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 07:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdr931PYvz3f5J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 17:06:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=GkkJPsXs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=GkkJPsXs;
	dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdRnl70D1z3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 01:48:09 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id m6so3609039qvq.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679064486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y00W2vlLuMTbF2Huj0Es001wY7aldQjIanbtN1YOkHg=;
        b=GkkJPsXsxAnJCR1XPtQdP3YFkyJOXudoVpKmeyKidWxq5/F+DaHJ50CBo/SM2CWZkd
         q0OfIHgh3368j1WUWO3ddvm5pg1ZPrQ7Y25LxtVhO5uIs+c4Z17ucftFryTjJES78N04
         41InlRoIBySZWbfAhx443i5LGCYhFQQKuCerE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679064486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y00W2vlLuMTbF2Huj0Es001wY7aldQjIanbtN1YOkHg=;
        b=npMIAYA4jQ1THYetfzA/HCb9X3W4/b/sFnU9hz1M2wCraVpMME6Kbb31cHNV8AHD68
         z9/JEyzL0Y12guErbZdiCAqDTVDvZa973bGGuhEc7xt7GW9v0lc3kha6GtpLnFj2pNe9
         w1H6BMHmX51o9d0uW1U01+AWrM01uWHH96KvIBMk5CmliYe+/aR54BFupYJCpMaBFRWH
         LV670GdG/vkJ/2UQbVzi2F85U/PrFypf550Dz4iP0ovW9lBjvpT607/SnjVUTb8WNvUO
         EktMf+d8gri+FOxsXPj+czkU5Q9moYwAgo57EeyeBcbPKf2jq0Lcqp/uH8dMx8exdbZ3
         FUaw==
X-Gm-Message-State: AO0yUKXTnu3b8a6bhnou52GHPpWnIP86yxVJPxgk4NNq8lri32lIe5j+
	gXm7H1yNDhISVaOXckD0jHfjAA==
X-Google-Smtp-Source: AK7set/8JqWEiXgvw/KNL4eR/Drm+OM2J6X6b3kpVOvGlbkjiNe1G4th6mtxiSnoXVzd/sVarz3FZw==
X-Received: by 2002:a05:6214:528e:b0:5a1:d92e:5cb2 with SMTP id kj14-20020a056214528e00b005a1d92e5cb2mr23731115qvb.10.1679064486364;
        Fri, 17 Mar 2023 07:48:06 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84a01000000b003d4008dccb7sm1408824qtq.48.2023.03.17.07.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:48:05 -0700 (PDT)
Date: Fri, 17 Mar 2023 10:48:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Message-ID: <20230317144803.kktahbp4fhmkutsq@meerkat.local>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
 <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
 <64126d113d163_2595222942@iweiny-mobl.notmuch>
 <87lejxmax8.fsf@mpe.ellerman.id.au>
 <641340e2998b4_2695182944f@iweiny-mobl.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <641340e2998b4_2695182944f@iweiny-mobl.notmuch>
X-Mailman-Approved-At: Sat, 18 Mar 2023 17:05:29 +1100
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
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 16, 2023 at 09:16:34AM -0700, Ira Weiny wrote:
> > It's also much easier to run git-send-email HEAD^^^, rather than running
> > it three separate times, let alone if it's a 20 patch series.
> 
> Exactly.  And I'm using b4 which would have forced me to create a separate
> branch for each of the patches to track.  So I was keeping them around in
> a single branch to let 0day run after the merge window.  Then I forgot
> about the idea of splitting them because b4 had it all packaged up nice!
> 
> > 
> > I wonder if we could come up with some convention to indicate that a
> > series is made up of independent patches, and maintainers are free to
> > pick them individually - but still sent as a single series.
> 
> Maybe.  But perhaps b4 could have a send option which would split them
> out?  I'll see about adding an option to b4 but I've Cc'ed Konstantin as
> well for the idea.

Yes, I plan to introduce the concept of "bundles" in addition to "series". The
distinction is that when you send a bundle, each patch is sent as individual
submission and we generate the change-id for each patch. It's a bit more work
to send a v2 of some patch (you have to do a "prep -n --from-thread <msgid>"),
but it's not insurmountable and should help with queuing up individual patches
for sending post merge-window, like in your case.

-K
