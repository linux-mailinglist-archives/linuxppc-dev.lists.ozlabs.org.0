Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55765434
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:55:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kryQ67BjzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2Y9bC61"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45krw20cLGzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:53:05 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id k8so2760838plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 02:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=6NtT6DZ7mBm/hq/33Gk2DQ42P0ZV+m78SQV6jVayLo8=;
 b=Z2Y9bC61KNVqyZKEhedmB5wwt4BD/sH6nP68A2fdBC05YFOlOPgvObOfNMhx87D0mV
 NXqLmNH0r4NdnSRf0VlgVQHSe5wiAtYwIFPUWEYSHT7xccDkxM4D4xMgLd/k3RI+glcV
 fgUlxNimfcOH+iJtp3bccl3mzx/N44IzqAcWN+QaPfETpYbucW9IwitcwsXVzJ3M5vlv
 0W5RaNBNSzTsokzHGxQH08p31GqJJM7sZGqRMx4td2iF475UNCFVMm3L9OPU7+01KS4Z
 siYaFh01HaplwBThr9IQkVYt5XbM5TjnZOfgm/WNY4DwXV+Jnfb1A68f5Ak4RB+kbkur
 /ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=6NtT6DZ7mBm/hq/33Gk2DQ42P0ZV+m78SQV6jVayLo8=;
 b=TDvYWrQ6CRNWUHqxuvjEMNnqP8Of38jBjNx3NTzt+VficVe9YjbCqXKnspo6+4YvRQ
 DPr/6f8kezdcvMOQpAexBy9LHOTk5L8zaOZt/DB3aS9U6TB3mHf+Iv9G8TOHWJ1UjbWA
 j+RIn4jNmSAIppq5twI0JWTRwyuK+nDZiVGEzjNH9F4adjekx+o0ve6NaEdRxVhlrxeI
 rxaPid3fpCnzFXU8ZrZpVsSpkZ2UtYk9J1GWIb+Wrlq6YC93Cb2vnK9QKLHfn6lvMHHC
 ny8Z69VOqqEiLuy0rE6xzgX2f33W4UwXcW7H3BkSFQM54GWxXmDOT37nfWna9S20TG4x
 dLHA==
X-Gm-Message-State: APjAAAU+8Bedcv+II9bv45gPefHHedEuptN0VcTWheuP+irQb7UzWpRt
 mwOGXGg4k4Zzl/+FsPq86ko=
X-Google-Smtp-Source: APXvYqxwj8f3cqPOLxu+gRyG5fvLWKETGlbpKXGYJFLFIGvk8Xz3Dgr/RmnZ4HUIN6hy+IAAZYpkoQ==
X-Received: by 2002:a17:902:b603:: with SMTP id b3mr3687188pls.9.1562838783694; 
 Thu, 11 Jul 2019 02:53:03 -0700 (PDT)
Received: from localhost (193-116-118-149.tpgi.com.au. [193.116.118.149])
 by smtp.gmail.com with ESMTPSA id 131sm7518856pfx.57.2019.07.11.02.53.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 02:53:02 -0700 (PDT)
Date: Thu, 11 Jul 2019 19:50:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v5 3/6] powerpc/memcpy: Add memcpy_mcsafe for pmem
To: linux-kernel@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
 <20190709121524.18762-4-santosh@fossix.org>
In-Reply-To: <20190709121524.18762-4-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562838505.oes5qb0f1o.astroid@bobo.none>
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
> From: Balbir Singh <bsingharora@gmail.com>
>=20
> The pmem infrastructure uses memcpy_mcsafe in the pmem layer so as to
> convert machine check exceptions into a return value on failure in case
> a machine check exception is encountered during the memcpy. The return
> value is the number of bytes remaining to be copied.
>=20
> This patch largely borrows from the copyuser_power7 logic and does not ad=
d
> the VMX optimizations, largely to keep the patch simple. If needed those
> optimizations can be folded in.

Shouldn't this patch go after the exception table stuff now if you
squashed them together?

Thanks,
Nick
=
