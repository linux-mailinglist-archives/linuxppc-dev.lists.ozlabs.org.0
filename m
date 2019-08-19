Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBD92648
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:15:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bwtv4cQmzDqvg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hAn16Ept"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BwlL3Sb6zDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:09:02 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z3so1029828pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=GSLHXu1mOtlkzdO0Aoy6ALFWdjQmUSGB2auJNt7fmaY=;
 b=hAn16EptkwYbIsimrtCVoLm3Vy2/0maL2p4sTLH/uJOqrzgirMoRwVwobxhbxRutWh
 Hoj/J+0xMDQQ+DRUIjfbV6AyjSf9wPse+GBYiR7P21FBQHEarrOe62Oti+ue+vs+3QIR
 1ExfSZZC/TKj6jUNxFScZ86jbWp98Z2VfasIRWdrhAHCkJdZncoo06ryvn8WpySQw751
 V+fss1tF3DpVSyjKRwkpPZ+fQ9EksfRmL8tqpVyiDVQs4SvyK7q2aLnABiNjdxSvIBHF
 lqsQfmxVD5MU+L+Ey2i1jAJ57tedIzgJ06XZ6WRhOQvaGWqDX8CGZ7vuZ/VIGDJqyHK4
 uxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=GSLHXu1mOtlkzdO0Aoy6ALFWdjQmUSGB2auJNt7fmaY=;
 b=R6lROkq53A2teAr+nCIIkndFgQ18RKPzF58BnSbiFFExeH3v/zFHfnUlKYx5HXZQfB
 CHgpSWJX2e9QUNNmafJYO5ZOx1zaGWRFod8KxZJRVqcAeJIAoxghSEcEaqvmFsOuQQXW
 GpIm5ZnF/2vefc3wmsmS8ELxFM1nvID7lcjSgssYH9U/EdT56YnRCK9N+HGJzXddCmTJ
 DNd3jLBubm3RcYmU2SKOKo37P8lbDC4ncrv0TyHeV+yllU+nvfQT1DGnV4c2bK++Y1a6
 3s9enqWWN9WSaHhPKTjULti+QWFTAE0ILxtJn7O5BKG6gQBvtA1U5ZNRzBdW5VJvp1V/
 9JOQ==
X-Gm-Message-State: APjAAAXIjicSuCsg+aLhqezMEwc5E/JAveaBgaUrxZdSPiVsuep+FQ+2
 /dQ1+uiNfxG57Lf1VYkeQbA=
X-Google-Smtp-Source: APXvYqzFRu4lTXAtTaDQiAyQr6JuJk/LzOC6VfLDOvSW4lLPPVsn2jAzVwCGW6lZVtESwmhasPcgDQ==
X-Received: by 2002:a17:902:b702:: with SMTP id
 d2mr23407917pls.259.1566223738387; 
 Mon, 19 Aug 2019 07:08:58 -0700 (PDT)
Received: from localhost (193-116-95-121.tpgi.com.au. [193.116.95.121])
 by smtp.gmail.com with ESMTPSA id d6sm14454537pgf.55.2019.08.19.07.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 07:08:57 -0700 (PDT)
Date: Tue, 20 Aug 2019 00:08:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 1/7] powerpc/mce: Schedule work from irq_work
To: Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
 <20190815003941.18655-2-santosh@fossix.org>
In-Reply-To: <20190815003941.18655-2-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566223307.ypgtanp5uk.astroid@bobo.none>
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
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, stable@vger.kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on August 15, 2019 10:39 am:
> schedule_work() cannot be called from MCE exception context as MCE can
> interrupt even in interrupt disabled context.

The powernv code doesn't do this in general, rather defers kernel
MCEs. My patch series converts the pseries machine check exception
code over to the same.

However there remain special cases where that's not true for
powernv, e.g., the machine check stack overflow or unrecoverable
MCE paths try to force it through so something gets printed. We
probably shouldn't even try to do memory failure in these cases.

Still, shouldn't hurt to make this change and fixes the existing
"different" pseries code.

Thanks,
Nick

> fixes: 733e4a4c ("powerpc/mce: hookup memory_failure for UE errors")
> Suggested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Acked-by: Balbir Singh <bsingharora@gmail.com>
> Cc: stable@vger.kernel.org # v4.15+

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

=
