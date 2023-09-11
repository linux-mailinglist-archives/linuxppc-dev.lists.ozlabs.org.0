Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5279AC06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 00:20:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dvbekHO6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rl1P558z2z2ygX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 08:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dvbekHO6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rl1NB5flqz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 08:19:20 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-273e3d8b57aso700362a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 15:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694470756; x=1695075556; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiUitO1C45IpsjxwGwdvQemaaRHBGSkxcQvlW7NOoGw=;
        b=dvbekHO6yDsOrDuxlL1rx9Owt2YSQH8P6j/ir0I0wxP3eb2ux4dLTYYT3DorksJh+m
         I7aXo14a2ZF4/UveVlb6qDnXf3knfqBcYc2YPmmJ703jfl1mKydWMOiPWgXzfXkCYGnZ
         AxSeEA1e0XFjYizg2cDF849hYzBzmEC5nsbLMh7YESgVNzYTStx7sBb63SiyXFHCEFzL
         jy/jYb2bmiEiArXgMWwCX9NcLLZ81IPB/Y1AB7gwTGdwV8kCOjKmAha88NvBApd4CanP
         tjV615SyrZmFl7dZpIFZ4N1tAJ8N7mUIMD6NX+EY010FKrfybiAX0udWzAnUBJME2VLL
         3fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694470756; x=1695075556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiUitO1C45IpsjxwGwdvQemaaRHBGSkxcQvlW7NOoGw=;
        b=Mn4JK5D9e1uZ7kWbBNPtnBvokiELArZJVoim69DQEL64Dih8PIf65uqezyRkrh2wG6
         hzY43zi+Io0zP/nDC+so+vr4UQGsYfHzfsGOh7XKAWfPgDSMusfos4F0FCZMYUlQOar6
         8DdQqGzNZxiCSCySZ6npJvDt3nTAR6GQw1TWzi+OrpAg/kvcthpg8U8zL4NF3JwPwJCn
         QTuN2pH69ho6j0TTaXkV9AAcc+PL814whOgqcFcPzw0DifyzoMBcm8BmVp95OALnwKzW
         gTAPvr64Znk9d0nLHL0Wz5Y8KuIeJ4g06KlCm1uk3icO4iQaie0GEJ8GM8ldd4SvgSj6
         e7iw==
X-Gm-Message-State: AOJu0Yy93kp9k5me2/xfPf1jN+kwkKc/KGgrdcVrTGzQsBDYCoCny48u
	Amr2PAepTsICepkOI3PU12YYvw==
X-Google-Smtp-Source: AGHT+IEIG7J/4uQXyapv3ec696MJuuJpu5Z5SUZiYUFG6GJOQa+L0fXAy+FH7WO2a2Nx/sq9gGkHJA==
X-Received: by 2002:a17:90a:3ea5:b0:268:ca63:e412 with SMTP id k34-20020a17090a3ea500b00268ca63e412mr10497992pjc.4.1694470755891;
        Mon, 11 Sep 2023 15:19:15 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id rj14-20020a17090b3e8e00b00268032f6a64sm7850906pjb.25.2023.09.11.15.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 15:19:15 -0700 (PDT)
Message-ID: <1a8f8c46-a048-4bd7-90f1-e5378b81968b@kernel.dk>
Date: Mon, 11 Sep 2023 16:19:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3 RESEND] generic and PowerPC SED Opal keystore
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/8/23 9:30 AM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset extends the capabilites incorporated into for-6.6/block
> (https://git.kernel.dk/cgit/linux/commit/?h=for-6.6/block&id=3bfeb61256643281ac4be5b8a57e9d9da3db4335) by allowing the SED Opal key to be seeded into
> the keyring from a secure permanent keystore.
> 
> It has gone through numerous rounds of review and all comments/suggetions
> have been addressed. The reviews have covered all relevant areas including
> reviews by block and keyring developers as well as the SED Opal
> maintainer. The last patchset submission has not solicited any responses
> in the six weeks since it was last distributed. The changes are
> generally useful and ready for inclusion.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> Generic functions have been defined for accessing SED Opal keys.
> The generic functions are defined as weak so that they may be superseded
> by keystore specific versions.
> 
> PowerPC/pseries versions of these functions provide read/write access
> to SED Opal keys in the PLPKS keystore.
> 
> The SED block driver has been modified to read the SED Opal
> keystore to populate a key in the SED Opal keyring. Changes to the
> SED Opal key will be written to the SED Opal keystore.

Applied for 6.7, thanks.

-- 
Jens Axboe


