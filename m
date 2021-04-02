Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B275635243F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBL4Q4ss4z3bt8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 11:08:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MfwNQI5H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MfwNQI5H; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBL412Ny4z3bqq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 11:08:16 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id w10so1004697pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=TjZFJ/jiE4hyJ0wDhmUN0lOgew0goUXGPWz316MpjMU=;
 b=MfwNQI5HhOqUMd8PUmdZOeMX3jJ4REhmnSB8kxLzl/tSa86T58Mg9dif+FEGCkkzd1
 m42dO1+V9JTciOnbxpaTS6pXFDQwI8oA2eQ8NK6MgHuW0sLce7wY0yEOQYzinGhclyZT
 RCfBnQJ4L1QS9qqSXnGFa0feM0SNsjMf6oOBH3ddTLXAuY2ucAohBuP9anAoKnRIwO1+
 SEHC17XpcxgI8Jd3RIPZEPPVsyB6VZzz/QXAZjwXUBOiAMiQG1fhs0k+3BGNkv69aZW+
 XbUEqs0GTyx7JssnnRMTPSAzap52bHrt7YKGNGPWqUhciDPbY0L3OfadY6Ng9/Ga+aE0
 0bPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=TjZFJ/jiE4hyJ0wDhmUN0lOgew0goUXGPWz316MpjMU=;
 b=rOYjJj5UBye4a9WBym1GupsrOGMNdJ6SSxxEL8g2h7rT9Xm3RLQ9Ugc87aVCPAGDmW
 z5YvfmqK4vP/EV6loLLLMq9Zs7M15Y8ng8aJEMrK3uIELAVGqyNsy8sJhHetR4itl5RH
 RpfJcXOFSwO7aKLWKIVhp+LUo0XBwXmPJr/TEAZu7BSJYiraU3MDVBQQQPI31XeIjzsM
 /P1adEqH78aGL4hqbGT5UpHZ0MaWbJR+j1UxoZmONiYSKz24H6UHux7WAefJc9z2nw8M
 OLjPQesFe6dbceU00hFVR9D/lY7MGdDA/mMRA5SpuqBWCJeRPB0UQPyPjFYBnmdcc75q
 10hQ==
X-Gm-Message-State: AOAM5323rbwdFi01JKuUus1POlVsfMeqeDhNXpQ76ljqC+QoQ0+2B0Gu
 3lq4mmCGO/4vNE7nbDFvhO0=
X-Google-Smtp-Source: ABdhPJya8iyB3S5J3LYyRYA559frJsgIyppIVxik21hbdM4U6DVQUq/6cku91AF/RQoqe6J7S8n/qw==
X-Received: by 2002:a65:6a43:: with SMTP id o3mr9667932pgu.297.1617322034459; 
 Thu, 01 Apr 2021 17:07:14 -0700 (PDT)
Received: from localhost ([1.128.154.184])
 by smtp.gmail.com with ESMTPSA id y7sm6340701pja.25.2021.04.01.17.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 17:07:14 -0700 (PDT)
Date: Fri, 02 Apr 2021 10:07:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 42/48] KVM: PPC: Book3S HV: Radix guests should not
 have userspace hcalls reflected to them
To: kvm-ppc@vger.kernel.org
References: <20210401150325.442125-1-npiggin@gmail.com>
 <20210401150325.442125-43-npiggin@gmail.com>
In-Reply-To: <20210401150325.442125-43-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1617321866.blku87d7ps.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 2, 2021 1:03 am:
> The reflection of sc 1 hcalls from PR=3D1 userspace is required to suppor=
t
> PR KVM. Radix guests don't support PR KVM nor do they support nested
> hash guests, so this sc 1 reflection can be removed from radix guests.
> Cause a privileged program check instead, which is less surprising.

I'm thinking twice about where to put this patch. This is kind of
backwards (but also kind of not), so I decided instead to make
the change to not reflect on radix in the patch that removes real
mode hcall handlers from the P9 path.

And the patch around this part of the series will introduce reflection
for hash guest support in the P9 path.

End result is the same but I think that works better.

Thanks,
Nick
