Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E9723207
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 23:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZmbX6Tzjz3f67
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:15:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20221208.gappssmtp.com header.i=@kernel-dk.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=j8g3Uuzx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20221208.gappssmtp.com header.i=@kernel-dk.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=j8g3Uuzx;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZmZh5hS9z3f18
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 07:14:34 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6439bf89cb7so855086b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1685999671; x=1688591671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oqx+vgT1KOd/rG0v+EGrhyHZcbzQJ8RW6j/ejKPzyV0=;
        b=j8g3UuzxdgTGjVV1y3R5vC/zbawUoqd0GHOEGH735oclZN5uylfFW29k3ALNqymkKO
         zOI9IJNptXyqvXhuDUohGo6+XB+iqAPTdpS8xnzQbyN9ZzCJb2V48dzwfhNnt29AVlKP
         VLFoQVZ/RzXJ4vShqVQv27MswBglmWDfKZPdwKBYEJDj+Bem9CeQfIxfrgTssr6LpEO1
         NWES731IZKMXHlB1inaKp40+GtlmXq369msNQea0Zdy1Az6CPeljXQoJWOQ1BrI3+n99
         B7Jqj4uJoFy0784kDvEhQTE8TUuagtZ+Pp9TRXRtSLou5H05oXjMmV83/lNRGEwjJYGs
         gAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685999671; x=1688591671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqx+vgT1KOd/rG0v+EGrhyHZcbzQJ8RW6j/ejKPzyV0=;
        b=Yz45p+QCKg65dYLEFtD6ygX2lQwmGe7gnGDUIY88dG0UIEnziNygiHtyu+FUQ2N+8Z
         6ka2gQF23XIBJbFdDBfObQZaYP3e6NoWrSTReuGMtchi+zOpXi/yeq0k0CiNOPnl/3wR
         suMddChgmVvstNpw3J53TI6b74mqGPpANcwi53hPe3e1nduVoNChqUID3fhejFfo6a5z
         Wx2TlAW1KwFKb/okz9o0CGh0dYE8qdvqU0hhVadUWiXjbWZ/0+EBSz2AGYUFQBwO6MY2
         blrk1mMgORnJnWz57IxUd0h9+nYruikNSQFWgWxeNPw3K6+JgVxXMYn2kx68/g42/iQK
         PcNQ==
X-Gm-Message-State: AC+VfDwCR/v17gTG1qtswdv70ejX8PJ+h7kX0NmalH9/u/dPJTg2dgbI
	72+TsVmTEo78KTiJt9l0uTk0bw==
X-Google-Smtp-Source: ACHHUZ7F4+qQ0Ki8xUwZZjZ6tfxl9MU00ff9sZzRn2/+Pmuj5tNT2z/CfpIZyNw6H1APR47vxOd/1A==
X-Received: by 2002:a05:6a00:139a:b0:656:39af:5137 with SMTP id t26-20020a056a00139a00b0065639af5137mr6836048pfg.0.1685999671519;
        Mon, 05 Jun 2023 14:14:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c1::173f? ([2620:10d:c090:400::5:ffbc])
        by smtp.gmail.com with ESMTPSA id a6-20020aa78646000000b0064d4d11b8bfsm5604697pfo.59.2023.06.05.14.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:14:30 -0700 (PDT)
Message-ID: <e340332d-ef64-9fa9-b4d6-927a3c271730@kernel.dk>
Date: Mon, 5 Jun 2023 15:14:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 RESEND 0/3] sed-opal: keyrings, discovery, revert, key
 store
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/23 4:37 PM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. I believe that
> this patchset is ready for inclusion.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> The current SED Opal implementation in the block driver
> requires that authentication keys be provided in an ioctl
> so that they can be presented to the underlying SED
> capable drive. Currently, the key is typically entered by
> a user with an application like sedutil or sedcli. While
> this process works, it does not lend itself to automation
> like unlock by a udev rule.
> 
> The SED block driver has been extended so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED ioctls
> will indicate the source of the key, either directly in the
> ioctl data or from the keyring.
> 
> Two new SED ioctls have also been added. These are:
>   1) IOC_OPAL_REVERT_LSP to revert LSP state
>   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> 
> change log v4:
>         - rebase to 6.3-rc7
> 	- replaced "255" magic number with U8_MAX

None of this applies for for-6.5/block, and I'm a little puzzled
as to why you'd rebase to an old kernel rather than a 6.4-rc at
least?

Please resend one that is current.

-- 
Jens Axboe


