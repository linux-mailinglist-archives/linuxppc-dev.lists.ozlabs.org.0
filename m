Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC980798E53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 20:39:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nWAGgLb1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj4dM3cWFz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 04:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nWAGgLb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj4cS0lKvz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 04:38:13 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-56f8334f15eso206186a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694198290; x=1694803090; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNgNOfTdYwbjd4PNLanFnphvBlBTZnc77El/quqL3m8=;
        b=nWAGgLb1i4HEjHSamRq10Tv6p/osfHoQEnavFmaLl4rBma3dk0301bAcIbrDCvQpf0
         ni13ldseRnni/8liipW9NwdsF5alHbrxnm27qaUDiWpLg/FjpkthgvtfMlrBYwgJx63L
         uyocNEdO2P9MZg0up0ZsU9JljSXrJhRmJMJtgAQRCKCDhm0OQhVF5GJI/YTVEVpI9X0Q
         Wt7VhCLFgrQLnqdpwKQr+HGHwypo7A2MZSxYgqEHb12RtST7g3WQI6kySxzRwxyXroLG
         GLI/yWk++vyulcdj+zZ0PaGCxSeS7cojQO/9MBym4fvMrCRgNoSOlk5ynHdwq1E0v1Ug
         h0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694198290; x=1694803090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNgNOfTdYwbjd4PNLanFnphvBlBTZnc77El/quqL3m8=;
        b=BnAi9vOl4fBJUiZ5FVqAqNT1zAKiYJKxdWslyYL37RITCCnTuyFS5XP8N/LFgwB24o
         uGxoWUPz7bx6sIfsq/Sg52knEmZ3wZ1RPE4oH+8CX/LMKMqu52jeL7D+LHFghnKqcaPC
         /WIyfOEV0XWTm40WIHtqITXVz33Oqzz7PoTEYf6JaG9C3UYJtqpOXkRd4iNocNvzmsGN
         s/xrjzFcljwtwERxQlilds8lf7GTLHtaQt8Fn3qmTfLQ1XnzST6ForHhSlZpkps1sDkU
         UMOSTolWMe21FutS8/pKQ6lxHfkVWJmQ5tFFrbc8Ku4aIf7LON8vWOPuiB+aBhkRB/aG
         i5Ag==
X-Gm-Message-State: AOJu0YyXurDqOyebLeF5anJsoQlMvDbjvEp0KOj9ZvbyGnBIdfRNYV2e
	iLlDEM0gH8eXCqlmxW5zEeRKYQ==
X-Google-Smtp-Source: AGHT+IHTX9ZZx08YvuQBTs1uYS/lar+KHBch4uy/fbt1CHDwQT9BuSsbxjk6CIFexr8qdwmGJFQFzw==
X-Received: by 2002:a05:6a21:194:b0:13f:65ca:52a2 with SMTP id le20-20020a056a21019400b0013f65ca52a2mr3924171pzb.5.1694198290545;
        Fri, 08 Sep 2023 11:38:10 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b00687a4b66697sm1669127pff.16.2023.09.08.11.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 11:38:09 -0700 (PDT)
Message-ID: <e1910f8e-5bcd-4c1c-a751-e4a530282b6b@kernel.dk>
Date: Fri, 8 Sep 2023 12:38:07 -0600
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

Best time to resend is generally once the merge window is closed again,
as I won't start applying patches for the next release before that
happens. I'll try to remember to pick this one up for 6.7.

-- 
Jens Axboe

