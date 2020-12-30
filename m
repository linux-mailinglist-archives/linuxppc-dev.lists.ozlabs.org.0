Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 152022E7CF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 23:18:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5m045z3HzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 09:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ru2Ww/Wh; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5lbl4M8WzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 09:01:03 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id q75so5908029wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 14:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5S7hiS0D1Nz3L10rmwrKZxQbbBpU1CmnpvlYUU/6LEU=;
 b=Ru2Ww/WhliK61JsKemTEPiZMM1R5SNt/H3Soe5qqYF8/m/wlNro6WCA2lIECbrOFEf
 NGDoDylsZZlZSqsYRzWLAK1Y4Y+FVGJAY8O2tpiMBTtZx72k4VX10jphaMpw2nMEVRQ1
 P5TdqwLoDRdFrxurvPJBYXY29RPJwDl5P2RwDqaxayHIeCuRKl94O6PyVnpO/YaOUDoe
 jCNilYYk6J9IV/HFHp9dk1vvuiAqnYKycJDasRi8wTQm/6jGp6qJxtYiC/vrhoeYEfLb
 wSdhObcKgqW7yLVW8N/nic92TXIjLu6VHhDOuQEj+D5BQO0IZ0fLW5o7JXgqh6K04oMX
 vxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5S7hiS0D1Nz3L10rmwrKZxQbbBpU1CmnpvlYUU/6LEU=;
 b=oJKYNlVP8BASOpaPzIagNR3rBUDS12mmtLhyoy6gOkMKox/nyoQ76c+8sXGafGoZ9Z
 IYcnea8H/COfbRMf9LFPLOhu8ficooq01763rzCjqsQoPEtIs6ymL9JMdm+hAfJIeOOQ
 B+nUSYSHVbsnJJoqopl8Xsl4Exw1tO+NVFhBGlpjds6UHsLZOyVmfZTsBkeQ2LwF0XPg
 LtlnYvZ3CXusAFQxD2zDvhZhAFdkxNph38OEtepFJQk32tJieAyhYWd8V3YSCpI/Jyam
 6BN037pj7kJ2SHFf2yb9MSdm+5E+76/C4TTa5M618yl1QLDFtfG6sSVgNcrUgU1p1RHz
 12lw==
X-Gm-Message-State: AOAM532DHyS/XZ9EpD/fsIcFZm7zlxbcQggAu9e8L46sEhAQKolwRiOR
 oGDzYsQ+XKCv267ZTf/pEQYgAfTsWd/lo1a5Uqo=
X-Google-Smtp-Source: ABdhPJxrO8bxLi/LAgoYnCE/bMU6bLerAGt+vc416K51PT7VCLFUUMgtmrVv0KmUcTUaO6NjCMm22d74MXLpliAaaYY=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr8968721wmj.159.1609365657658; 
 Wed, 30 Dec 2020 14:00:57 -0800 (PST)
MIME-Version: 1.0
References: <1609312994-121032-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1609312994-121032-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Wed, 30 Dec 2020 16:00:47 -0600
Message-ID: <CAOhMmr4QaJY6Mr=TByXaR5OHh-LxaV2w77dXtopdsHFAOZuuHg@mail.gmail.com>
Subject: Re: [PATCH] ibmvnic: fix: NULL pointer dereference.
To: YANG LI <abaci-bugfix@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 31 Dec 2020 09:17:16 +1100
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
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, drt@linux.ibm.com,
 Jakub Kicinski <kuba@kernel.org>, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 1:25 AM YANG LI <abaci-bugfix@linux.alibaba.com> wrote:
>
> The error is due to dereference a null pointer in function
> reset_one_sub_crq_queue():
>
> if (!scrq) {
>     netdev_dbg(adapter->netdev,
>                "Invalid scrq reset. irq (%d) or msgs(%p).\n",
>                 scrq->irq, scrq->msgs);
>                 return -EINVAL;
> }
>
> If the expression is true, scrq must be a null pointer and cannot
> dereference.
>
> Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
> Reported-by: Abaci <abaci@linux.alibaba.com>
> ---

Acked-by: Lijun Pan <ljp@linux.ibm.com>
