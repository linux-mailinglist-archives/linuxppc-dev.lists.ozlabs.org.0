Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6C7CC766
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 17:25:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xGW9fXPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8yV33tDLz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 02:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xGW9fXPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8yT82brGz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 02:24:41 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7a66555061eso4044639f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1697556278; x=1698161078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qh7Q8NUAv2rVsPdN7yhSbTMeWDBAoGpGghDSC62x+GQ=;
        b=xGW9fXPm/eqFgQuhOHcaVQyrt+Mp14lzaCvkTueH3L84zCgZB+g7jjNBJoDv+CPTdg
         h9RYbNsqAhg42Pg9RKjCkKOsd2bIuADqDdbpQe4AyeI+lTjdxmmeJDPQiVTSaudBXrUB
         2oN0Csvu6hPuNof2FHNXezICJ5iVMxgo/Q00IvjMD7HzEiuqlLmtVZxvbHZ1jEtN0llu
         SQPzh5U2csM5hm0ifCzHRADsndEd7/OyLn85/7TY23eZny7vcN4lz8AH2bduI2ZQZR5g
         s+T/ufrYqGMziUUT48lRWrFZWn7Itni5KQ2aU8NDNFa5e3291untC3Gz/XEBolzpR7I5
         HyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556278; x=1698161078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh7Q8NUAv2rVsPdN7yhSbTMeWDBAoGpGghDSC62x+GQ=;
        b=j1qtIA5Ttp1QT6mLX6DHXFdyxsyz8I4JxcpOh1kY8qBmUACy+1/tkg0Vw/5tb55cE1
         vtNd2itgsmb917U02A0MU0CENEp9yQ1ULpGcJFYpJY60XALAIUctaUU3M21/TMADk9pM
         PJ2GSfS4lzCHe6MElok4nRKce4P24u5n0zNNOtSfRy+gAB+vWVg+QXQsMB43CeV36H03
         OOk+OIHZKyCFB18rq4Ls/oHuTSNTSqE8OknjTZDsXL3TxHEM1ik50nwNNmCQftJBSFaL
         QNlilo0G+Ut48i8cfDUiSph7413N24ITTImLgwC1ZRC6ox9o3XbiAp/XSx3tek87R8ja
         zOqw==
X-Gm-Message-State: AOJu0YwiQY7hwhUndQDWtt7U1ZNI4HJswKRZImz68dEk4Zw3RU+D4ZGQ
	qt5XBLvPKVENg6qmZiZ+L7X1Bw==
X-Google-Smtp-Source: AGHT+IFDsW8aivD+8dzqg0AXOBp975s0XTijDCNFV63puh5wNtaiHflHX1oTcEA2/GCt5AB8SnUOuw==
X-Received: by 2002:a05:6602:340f:b0:790:958e:a667 with SMTP id n15-20020a056602340f00b00790958ea667mr3377208ioz.2.1697556278674;
        Tue, 17 Oct 2023 08:24:38 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id m8-20020a0566022ac800b0079f7734a77esm482778iov.35.2023.10.17.08.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 08:24:38 -0700 (PDT)
Message-ID: <c3e0e9dc-b4d5-4ccf-b647-61add2f6ec58@kernel.dk>
Date: Tue, 17 Oct 2023 09:24:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] generic and PowerPC SED Opal keystore
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
 <8fa5c9fdebd07f654c511d80d41a35817bdc3d4d.camel@linux.vnet.ibm.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <8fa5c9fdebd07f654c511d80d41a35817bdc3d4d.camel@linux.vnet.ibm.com>
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
Cc: nayna@linux.ibm.com, ndesaulniers@google.com, nathan@kernel.org, okozina@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/17/23 9:09 AM, Greg Joyce wrote:
> 
> Hi Jens,
> 
> I've addressed all the comments/issues on v7 of the patchset and
> haven't received any feedback on v8. Is there anything else that you'd
> like to see before this can be included?

Let's give it another shot!

-- 
Jens Axboe


