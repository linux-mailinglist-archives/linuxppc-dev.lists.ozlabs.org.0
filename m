Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8E34029A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 10:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Mv81MT7z3bcm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 20:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Vj7ACMfG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vj7ACMfG; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Mtj69m9z30GT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 20:59:08 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id t5so2870179qvs.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ugoImGwp95nq6Qu0+USUZNlxcutSAYxGNReJnYxIJsM=;
 b=Vj7ACMfGXMU6u//Q93crCDyJFNpzKgdEYcP9cjsuuRd2eovwxzbgxTfzEOtFI8Xbzz
 e08FZcRiNNQm/jUG8WUKmTPGGmVGo8jWbiGQbFJJ6z9kj0Rd/0S1aXa8heBUPdG+WH4l
 DFTtKt67gKvzkAlF34D1Pp+vjc9p7kQGHCZ0z18K5otF856JbgaOjG4oAromExhvAZmT
 vmvBduvbH/6+YGCSnfQe73L2HnWw3cEapDVzWCPvuP2ExyuqW43VZOVi+JNmEb35VlDF
 HXrKcBLaFcr6RXpv8oAOVBvs5KZSuhEVESyrCqjET98/OKJW2Nenzyb0ciQT730Up62a
 3r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ugoImGwp95nq6Qu0+USUZNlxcutSAYxGNReJnYxIJsM=;
 b=WCClZkq/3FM/SmJCndlGNjq/GsGyOPMwFLdCoprwlVEVzRC4OTG8otuaSAhvDkcSOA
 D7BGqgvr6NwWrrFPLGoRgyi5FUlW+5SyixV8E2L3I+wDJT3DacM2iFRY1LV78Jy29I8r
 eaS8NeD0DrRJtcbXSXyMBSq9Wca8VmMPB1NFxS4Ur1Djt5PO0T/29SHAxI7Byt29T/WP
 bXvtnrCNWCByDf1HthYqFRCt20mK9D6A7Ueol5baIaWMSIlN2f+k9773Y+6rbhBaFEFC
 SdkSyZqSzLu3BQE9/xZGGgv2hscm+pMYZHvljJv8n+f7HcqJpGBQO+3OiuiOssbBXinx
 T/vg==
X-Gm-Message-State: AOAM531D953NtrUUj3CgyPaLpRndBF5XgsCb0tb4Nm9O5or/7g4WtSc7
 WTpy98XLQ9TpzqxJd9Jh8sM=
X-Google-Smtp-Source: ABdhPJxLx1t1XziH8StBnnRv2bK3k/cDAfwg42w5BeEc0CkSwda/m3K+fjJe+bQ8hjd342ADZXRo3w==
X-Received: by 2002:ad4:44ef:: with SMTP id p15mr3478136qvt.25.1616061545181; 
 Thu, 18 Mar 2021 02:59:05 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id g21sm1382268qkk.72.2021.03.18.02.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:59:04 -0700 (PDT)
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210312143154.3181109-1-clg@kaod.org>
 <871rcdp577.fsf@mpe.ellerman.id.au>
 <b9e259d0-0d28-d5bf-bc85-05d42b352943@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <534b5b65-2267-2032-4490-9a5ae14a5960@gmail.com>
Date: Thu, 18 Mar 2021 06:59:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b9e259d0-0d28-d5bf-bc85-05d42b352943@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/18/21 4:28 AM, Cédric Le Goater wrote:
>> Also we've been using it for several years and I don't think we should
>> risk breaking anything by changing the value now.
> 
> I guess we can leave it that way. Please read the commit log of
> the second patch (not tagged as a v2 ...).
> 
> But we should remove ibm,chip-id from QEMU since the property does
> not exist on PAPR and that the calculation is anyhow very broken.


I am a strong advocate of getting rid of ibm,chip-id in QEMU. That said,
we need to make sure that the current problem with CPU topologies, that
I reported in that other thread, can be fixed without it.


Thanks,


DHB




> 
> Thanks,
> 
> C.
> 
