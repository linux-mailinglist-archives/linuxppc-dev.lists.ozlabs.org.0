Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B982E888
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:28:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g1BjxNAm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDbbm0vxpz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 15:28:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g1BjxNAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDbZx1389z3039
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 15:27:35 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-20503dc09adso6410264fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 20:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705379247; x=1705984047; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqjuXL8OqrrC9M320WLttRPXjOmwFto71dtJpm4tHv4=;
        b=g1BjxNAmoVr02pFipZBcPkcTDPiqyAJt7/bKKhS+qP0Kltf9XOfkjMSjYVzrnx3BdM
         oKCsIMzAecyShXprP6gJEJwhRNziZjiWvs/JUkX/0eR1cP2fEzlxq5slhLa38sDXfJSO
         GfmN6hM0RANg0rVQpKFYzep2gqwbW3CJ9m/5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705379247; x=1705984047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqjuXL8OqrrC9M320WLttRPXjOmwFto71dtJpm4tHv4=;
        b=cMxLK8d1yYXSzJAndivtoK7XIadXEWuevFe88GM8xvQKywRempv8Kxqs0IpjgBWCes
         +8SKC0/5E5UwOjje2adE9BH2+rBBMp0MdGCK6YXjXCq7yU4KzoDV6+HK08C/wTUTHsM4
         HPZWFqngTwAqE7mg4klgpSWqmYQ/qh64qrTJ1BjCcoK7H9xJ39CD5W/ViO8bZFa3hWzy
         Fvl6FVkiXU86KWyoPm8ezNO0fw+95rw2A787GsmiwRHp1m01NbROzQ5AwiHCR3i4rKHY
         jVfKrQDA3APgDXTnyuxFZbLCh87ekRx4jGNNam7rYeiv9V/L6Ws5ucHzHWpDFPat6DAQ
         FSrA==
X-Gm-Message-State: AOJu0YyaYSI08eRpMisP8zjPqIQbOeFxTMvWb2cHZwsXAM9JQf/TY9h0
	AVuOmmXHgbjkplrj2O7J28YTcfG1opm6
X-Google-Smtp-Source: AGHT+IEKf3oZ1OyldxkJrYtd3QFGyBqZgw+BXzpyShS8QFhIlO8rlQgC9SE1dtT9pO2Z8HvTr+U7SA==
X-Received: by 2002:a05:6871:e007:b0:205:ee9e:f39f with SMTP id by7-20020a056871e00700b00205ee9ef39fmr9987896oac.6.1705379247190;
        Mon, 15 Jan 2024 20:27:27 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:e69e:52c4:fc3f:2b28])
        by smtp.gmail.com with ESMTPSA id e3-20020a636903000000b005aa800c149bsm9218065pgc.39.2024.01.15.20.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:27:26 -0800 (PST)
Date: Tue, 16 Jan 2024 13:27:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <20240116042721.GA1983292@google.com>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
 <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (24/01/15 08:47), Yosry Ahmed wrote:
> > At this point I NACK this patch. We're about to submit an allocator
> > which is clearly better that z3fold and is faster that zsmalloc in
> > most cases and that submission will mark z3fold as deprecated. But for
> > now this move is premature.
>
> I think unless there are current users of z3fold that cannot use
> zsmalloc, the introduction of a new allocator should be irrelevant to
> deprecating z3fold. Do you know of such users? Can you explain why
> zsmalloc is not usable for them?

I second this. I believe "do we know whether z3fold has users"
is a legit question that means no offense.
