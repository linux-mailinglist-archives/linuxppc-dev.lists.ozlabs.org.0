Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9965440
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:58:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ks203gHTzDqGP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SIh85Idm"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45krzP3MyTzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:56:01 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id q4so2683052pgj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=q4aTVXnmJvx0+ZI6UEfBVpgkZHcZDIxsB4G/ZiMf9pM=;
 b=SIh85Idmmnmu84Er31UhNLbVafgqi0UkV82OpvVm7rtrxdNqU0AhgtRNEDYXqq1Rnd
 ugoF2aZF4eWlgQOGXYnlVOibsauiHFEV10Ne5Io7r7KiKdqT4/Zbq/e97dKABlp2y/JK
 rim13rddkbLQIxqq6Ue2WPkqomeZg+m1Umlth521X+2g4GgLgREy/079n7cdVwiRR8kE
 CP+XnaBtURhybFsdjMQjhtImN2cnppq3JBkuHelKJSc0HRvYBnYEg6DBuEMzbtug3iS0
 SCZ8IVEyQcU3kuZdSkRE9cPSfELrqMZY3JoiNNYaRHuJ0Sil5qisb5/bBUcP7Bwi6jBD
 FNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=q4aTVXnmJvx0+ZI6UEfBVpgkZHcZDIxsB4G/ZiMf9pM=;
 b=hwKibFK/zubneX8CIRDHxZ7fCAJKsjJr6uqb68v1GBExQVebq70pYx+CX8W0+2Vaf7
 EnVvBINjTtKzhwA6nPHvhs4JdvlIq9ff1IIAXHvJqStgCVdZKGF/qxPAkVNkKpzT3emh
 cXXgu+bWgGQGYuNzyTRZFpH+lNDaPQxRxbxRFtPsrx+K9jJKf3NKs06PjP+twQbvHVEC
 LLRGo+6syKUUx3FRNV+fuv/rhI+wQIZiRUM49mpIRL0wTEUbR+iOPmdKOu74dOD0zQNh
 ZTcx7+DE4zGHhRQ3MgappRQNNFykill5KODgyB3vRtITR+xPFzxh5lbaAdwRKk8mjrep
 2Jnw==
X-Gm-Message-State: APjAAAX8osJj+WZkNRG/VhcmdOXFiszls8aZKbG0BB/KvdKlUMjqqq1m
 d6aBCTD8DYVLhHGgu407+RQ=
X-Google-Smtp-Source: APXvYqwvy8CZPo/ZKAxkPcg+J1VB346XgSM3stuTnmFgdJfcOxtjIO4tApyo1mgLo+tzQKgwBPC0UA==
X-Received: by 2002:a63:181:: with SMTP id 123mr3550274pgb.63.1562838958158;
 Thu, 11 Jul 2019 02:55:58 -0700 (PDT)
Received: from localhost (193-116-118-149.tpgi.com.au. [193.116.118.149])
 by smtp.gmail.com with ESMTPSA id f3sm6828140pfg.165.2019.07.11.02.55.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 02:55:57 -0700 (PDT)
Date: Thu, 11 Jul 2019 19:52:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v5 5/6] powerpc/mce: Handle UE event for memcpy_mcsafe
To: linux-kernel@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
 <20190709121524.18762-6-santosh@fossix.org>
In-Reply-To: <20190709121524.18762-6-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562838616.xzrha67fy6.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 9, 2019 10:15 pm:
> If we take a UE on one of the instructions with a fixup entry, set nip
> to continue execution at the fixup entry. Stop processing the event
> further or print it.

So... what happens if we take a machine check while we happen to be
executing some other kernel operation with a fixup entry?

Or the other way around, what happens if memcpy_mcsafe takes a page
fault for some reason (e.g., kernel bug it tries to access unmapped
memory).

Thanks,
Nick

=
