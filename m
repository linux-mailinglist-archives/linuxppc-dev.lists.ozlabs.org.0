Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3790532643B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 15:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnC6v1ZvSz3cch
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 01:42:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpKzeFXz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=NpKzeFXz; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnC6S65Whz30Hv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 01:42:06 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id w19so9183253qki.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aiCmYhXNlLmYvqysrua9w657uIfuMXAdivhZFAKEpXA=;
 b=NpKzeFXzuOhQbPo6fKVGMdf8+6iELovgUdCKZpMjN2+fdRPxMj98bWKMPa5Y7KF4/N
 vdL3T58tWpe6je0uydaDGpnNIAtNYbCDXb3HxGBOzIghdhU4d87IipH4ECbR6hIuHYL2
 OE4vaDcL+OI76JrDT110BgkIXDKANwC6gCSc9nelFg1RXHfxsTBuTo2BHt3HTkq+empV
 emd0QwJTTpMSsuAj4VMYxzsN04yBeIGuNxeQNqGKbXDSLy2e/LLZE2oB5yAYKcSuV1DG
 aecXjS/f39eZ6dU0YumxMHbEXGM5IPG7jTLpdrY6p3P4TFb7KAt2gn4o2nh2Yv5IT7vh
 IYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aiCmYhXNlLmYvqysrua9w657uIfuMXAdivhZFAKEpXA=;
 b=WyBEs7S3uqDxVg12WEQuVWzIn2Cwl4gSZ2Fn7g8ePgitYDS5/jx2q7drI+yCejyYpl
 4w1b+IJPqjHR0LpK2Dv3LGAFBwuP9V7Zp7wGEZW2StxGKkYm50/4PV7KJzH1AhitfPNH
 pLn/TklsXX0PVOgEB5Pz4gqGalr1u0M0rjpyyQQv8my5DDTrc87LBG6jVWUcfyC6qjO6
 ONDsWm6laO1H/V/dKkEusuVoCf6YjNngkpSnde4plFrrU+XibFk/W/6eZe/LSECYb+RU
 MBgx4zhhk3HQjP6UsFWBpeC7kvulFf7qsEAVh/Rx/R4DC+/x7WqDSUZHR4dU1F+uHLtC
 0piA==
X-Gm-Message-State: AOAM530IfwNPOVNRdulrZ+wBCnisioUKqRsml2K20HW0D6VA+0THMQgm
 IKtnbxoc6iQbpcUbahj45q84+A==
X-Google-Smtp-Source: ABdhPJy2NOOfE5ZleC1vNC6+D2fTtJXEm1J15WIn4t802EjUbQ4eaTkrRyQ86tK+Y+nBiiCdVzv/WQ==
X-Received: by 2002:a37:7c8:: with SMTP id 191mr2908942qkh.53.1614350522094;
 Fri, 26 Feb 2021 06:42:02 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id t71sm6437470qka.86.2021.02.26.06.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 06:42:01 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lFeJc-000tBv-SJ; Fri, 26 Feb 2021 10:42:00 -0400
Date: Fri, 26 Feb 2021 10:42:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: Freeing page tables through RCU
Message-ID: <20210226144200.GV2643399@ziepe.ca>
References: <20210225205820.GC2858050@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225205820.GC2858050@casper.infradead.org>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 08:58:20PM +0000, Matthew Wilcox wrote:

> I'd like to hear better ideas than this.

You didn't like my suggestion to put a sleepable lock around the
freeing of page tables during flushing?

I still don't see how you convert the sleepable page walkers to use
rcu??

Jason
 
