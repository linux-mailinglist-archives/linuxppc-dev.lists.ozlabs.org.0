Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C55ACC44
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 12:53:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46R7Sx2lcVzDqXP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 20:53:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oC7J9Awy"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46R7RF0j7PzDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 20:52:24 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d3so5288026plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Sep 2019 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=m1gigJll4qdxvkZU2vss/9XDKLBMvxhVE3YkZCnT2M8=;
 b=oC7J9AwyOPD7F0tu4VwxIOy9iRtUlKVgOwUuf+a4KvceVvkskewasYs+uNqszBd6Q0
 OxsxQ4LgDGOwElFWVGF6tZ96I7jv1gfcQpck1eSsB4VAO5AIZ6FYQiYPmvg253XPLoNX
 r5eLefvqucDIrFNVxrJ8hYeiAjWaA2KL3IfhSEGAEerpLLCrzyqzd3f4Je7lugGkmsr0
 PLoIDbE4nBV9YtE3euYDDMSuetJP3W3Cr0vMopWBKJjLWJK3GA+qIA2F8mGW+J3nscbj
 DAsuS8qGQsfwho+l3xfAZktri0vG5VlAqNIOu0MR3YGNMCjOxNLGony/Nq4CUt5kWWZ9
 74MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=m1gigJll4qdxvkZU2vss/9XDKLBMvxhVE3YkZCnT2M8=;
 b=eivRs0VhbCEWXys//Iz3MZLlyI+SBHnpoJGIedlA9oVCGrT++fNpH3F0TnR/o3pHxp
 JFztZ09tEqTSKwS8trxKWefJ53yEJxCrrzTzs4MR+Lz7Bjr/2o3KgA1ZgrHzY9EaxSNk
 hpLdi82QmAE2qRF82+wX5VTyIX+8X+TnXKM0Rk2K6Un7gXDUk2PD1jfOat98ufGPgkzk
 EYoeGD2Qvomn8iCiYh43A5UwXqustX6fI/qh1eZVPPKXXWvTOD7R7e0ePTTMW5nMeFPf
 QR5lUDTnsiWNMDQAonnZven5iUKZ0nuEKHzkvuzne9jZnf5nl1lrrDyYhVsWokHHmhOG
 Blrg==
X-Gm-Message-State: APjAAAVA/C5Max0o0I9ybri5bm1B/wChoIrdWiKJcyxjJSJzCXzXMW7y
 IzkM351s/DxNRjJCaCpYu2Jm3AO+
X-Google-Smtp-Source: APXvYqyPw1pmSWo2H8+k+cmSqW/YHdI74z+rLslQaXNoN4yBB0oT7nHG64xCFvwwmBntYm+ZsCj77g==
X-Received: by 2002:a17:902:8b89:: with SMTP id
 ay9mr6373868plb.2.1567939941256; 
 Sun, 08 Sep 2019 03:52:21 -0700 (PDT)
Received: from localhost ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id em21sm9322702pjb.31.2019.09.08.03.52.19
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 03:52:20 -0700 (PDT)
Date: Sun, 08 Sep 2019 20:50:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: interrupt return in C
To: linuxppc-dev@lists.ozlabs.org
References: <20190828090606.5028-1-npiggin@gmail.com>
In-Reply-To: <20190828090606.5028-1-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567938684.jsvbj3jz78.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on August 28, 2019 7:06 pm:
> This is a work in progress that goes on top of the syscalls in C patch.
> It's not quite complete, 64e low level exit is not taken care of, and
> the new return is hacked into the existing interrupt handlers pretty
> quickly (e.g., full gprs handling is still ugly and could be cleaned),

In performance testing on a POWER9, page fault latency is about 1.1%
faster with interrupt returns in C which always saves NVGPRs. So I
think the plan will be to rip out all the NVGPR save optimisation from
the 64-bit code.

Thanks,
Nick
=
