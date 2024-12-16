Return-Path: <linuxppc-dev+bounces-4150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6A9F2EA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 11:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBcM30KWSz2yVd;
	Mon, 16 Dec 2024 21:56:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734346590;
	cv=none; b=dbKqSELS80mNIZmgWrjj0weCNg8ujRmfpNqa8a86caLIz80TmY0HV/pW2WumjnlBtdelfMAZnwo8BxHWsIVExIxxi7qFp4DATsxQxqksyyDU6H7oVyiLrICl56sRLqxSPW8hzzsHiS0Mjx5o+q+1DZnbGQapFnViqWPQXz/iSR3Cbu+7m5VOB3IqDGGTzSJvIkyA2Vdj8NY/33w8f/yRLhcgqKF+bVxcFVBjNInMrHbzl37VgP58OMDnwdHfPNo8yLbcNllBHXB/fpWoIM6VFS89IzYrqVWVQY+GRYSRXSn18EkKkipVXMmjyuvF7rZslpHiRlOIan1V36HFLY3oNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734346590; c=relaxed/relaxed;
	bh=pnug43zVwuHgF5ksLoeaIclgiDip3wakxrlun38CpQ4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=WQBayamy19we93jgaChMNso9hZ6aTQCcRWo9t7MiiJGsc5DlPF8zwFzTG4X0cTxuWZjD/gAfmGcJhKxcd0edZyZ6NXXPsh61Yy2BMYK4amQTc8KckVnWip+CqWooulLLGZMR4+taVIYvCsf+nxWACE58qdblYfkocZo7UyQyIhYKf+wOKj/tvV0xxbA4yRVZlPzlUorU9Kl4uKInzsW/+W8DkUnfLFyMEsL8UJdkgIEg9UYgcNh65LjK4ZLGq8A8Tu8gUaaVvoci8HjGXxZB34cARzKmAvdMDCXRssESm3S8bZXeVg7Uj+Kl6dJXFO3kNEmyp5Yz6aqXb/fBaLVkew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fJkCTX1b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fJkCTX1b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBcM20TV2z2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 21:56:29 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7242f559a9fso4979322b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734346587; x=1734951387; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnug43zVwuHgF5ksLoeaIclgiDip3wakxrlun38CpQ4=;
        b=fJkCTX1bC/+DKG8qEG3RTq6rQ9UBb5GJAHOxaFNpGOKWH1B/SAsTUl3rWjhsT1wFS5
         tbmGURmsCMbSTEhaHcsgjsLisBVvhBM0u+oLUkdrBL2rZX2l4QqkDaNZHmx1q/Dnw+dy
         /8kGoG1vfHfuHNpCND2j8IYzAC1pT1dUaH4BCpLaHYfzwsufYnrxWpKTgeFtzDeyOahT
         /9aX6K731XrOAnTkr9Xe57cMF+VgiZCxHelsRu7vTYmPIihFUAn/a8GP2/rBDvXym5DH
         qIteX+FpnWxywxxhuIQw8QmkaJCkYNnwZtaBtopnK8cKDyEbEib4bC1rEcDcI9tTyM0h
         qLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346587; x=1734951387;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnug43zVwuHgF5ksLoeaIclgiDip3wakxrlun38CpQ4=;
        b=i14xj1gIXEqZ3fxQy7MxcoIC96heccd5wpE7vVnURUTeKmYTo62zA1+go0X/HkwMlK
         BsD49k6RMbPtfCNhhgZLB0rspfEWpxmGLhQBtcIhoTtbfb5favKcQfP5PDh1bbVknJc/
         WjyBEN/7EEPGmnmDwKhhFbxHJOPaKFnDmq9VPvMYMijtM5oExrdCkJHYYTxPCXsecujK
         C9FOwamSh4CuNff1O4yQLnZG1V4TXkVje2HyEbD+XihLa7W6PRKujl3F3LeMoudLIrTn
         0oK8TE5H6fm73q95oS/d+e6NuSOaILPu4TTC21eXRCQ9/1prbFpLjx10SOzufT8r9Djf
         VCRw==
X-Gm-Message-State: AOJu0YwHZJWFeBJRT1WRC07DmC7l1wEzvv3tpaRrZmg74R5z9JMb7bbT
	Em0CaytwyMc8Eeq1eTbUNDwI/OZTDnNAFDC8DIJ3tBGYXJ44NCAR
X-Gm-Gg: ASbGncs8aGplPlER7cDxjn/1wcaKumloFyd39B6IP0mWJS953Gyrt/IITRlVW9Q+95O
	zXS7s7v24MROEIuDPAExLszEZ2Dhq1+nLHvo9eKDAPISBnQwg42FlaP/wZjM7XtJihBSUDQfuQk
	7wsW5xJdNBd7ac9CScLa5yZ5HlNkXDlxpowppA2sBQLqDCwnzwpa+1gPigGJkhpVA9I0/Qahi2a
	iG7HxeEXAtVDEfZEWMWX6kz6vQg6wWCI/915jC1rzaPCMyVww==
X-Google-Smtp-Source: AGHT+IGqJ95IRtz/8wfjaNkt3SAtl9YnDmEtN2MogEjuhbLNQEajw73seuM7YcR6hnG8b6iPyL0I8g==
X-Received: by 2002:a05:6a20:a11f:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e1dfd3d97dmr20475205637.11.1734346587306;
        Mon, 16 Dec 2024 02:56:27 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c0effasm3867778a12.60.2024.12.16.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 02:56:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com> 
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 2/3] selftest/powerpc/ptrace/ptrace-pkey: Remove duplicate macros
In-Reply-To: <20241209151418.348085-2-maddy@linux.ibm.com>
Date: Mon, 16 Dec 2024 16:24:50 +0530
Message-ID: <87msgv524l.fsf@gmail.com>
References: <20241209151418.348085-1-maddy@linux.ibm.com> <20241209151418.348085-2-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> ptrace-pkey.c test has macros defined which
> are part of "pkeys.h" header file. Remove those
> duplicates and include "pkeys.h"
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  .../testing/selftests/powerpc/ptrace/ptrace-pkey.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>

Similar to previous patch. Cleanup looks good to me. 

Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> 

-ritesh

