Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426C971E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:10:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cy2454X5zDr1X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 16:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="reHp+aUs"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cy0L0p52zDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 16:08:49 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id x4so2190875iog.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 23:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S5NqQrU2lGJm2TfELqtdloWg5/NpdZQt47xr5cHEQRg=;
 b=reHp+aUs9+YZfbATtvNdcdngvAETHTwDLNMn7jQVMNcWEgIWr2SikrGaGccp+aosUR
 nDNC2RnlZMc4ltynztvcNmLNLDIYvHaxp1MXTdQlR/FNnHXsWH9KdZrOBZgP9FIqWgVW
 IqmBS7tl4WyEng+ICppMwDrMAQEohMHC3PFztbA+VH9j79Vz/SqGDExPVgqZFLfAKIq6
 844DEq/PyJEpJ031kNj9p2YvLifMqCKG4/WdgXerEEqn3HkIFk3BqJiOdGy1X1dFt3w/
 quvtQes0DxJF85G3WdpLqu9ypwmTfqCflJcvkvwp78R1Ybo3WaSgZLdBBoaLoDkMnQIP
 001g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5NqQrU2lGJm2TfELqtdloWg5/NpdZQt47xr5cHEQRg=;
 b=TkYaUmrUD9513Xp/+WnOvZ+bEXaU+4ySAtxHtTP+wdaMYrn7bDhRA4ynPNkoaUejhJ
 0uGu68BDOfALlO1EO6t1VBIrX6cotIcOf6jnyEkjqdqmiaILH5JxVvPWY2Q6Xj9tJcZM
 vLehH/b9A1aZ1iFYyQjnbMvuxGHoUYDFBiPhjk4Pmu9r+kA6DyyAh4sCvUT0hYvQSyxJ
 /3EK46GUZomXNsMoAWewfrco8wwMg5cdalUypf/p6SGCqYFgbTBp3a0RE5mxE4Pe4mfH
 24C2vauI1PApGHkfYr8KXeiQeF/fHWdXuvD7FdsYxsgn4nKHhHxkLGVD0moucLQDKyQr
 6kxg==
X-Gm-Message-State: APjAAAVu3IpnZn5EqKmYFbf0pto38AAOjaiRSBNX2VaiNTL4Qibmbq3c
 gava5eDP98ophkRVgbXbQ3fQvikrjEF0mFG8+ZhNM6H3
X-Google-Smtp-Source: APXvYqxsJv34SH9hH2POroilaR4MD4UXOfV4Pq8jaGwZncUOvz6LSGgbs3x7XTGWaVtYBFxWVlWtAhb8bUpOwPbgEQI=
X-Received: by 2002:a02:ac84:: with SMTP id x4mr8062206jan.2.1566367726357;
 Tue, 20 Aug 2019 23:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190821040935.13071-1-anju@linux.vnet.ibm.com>
 <CAOSf1CGj1k3nmfBYp9-TWo+V4sbLRXBcFzrbq25hm2YWtW4MWA@mail.gmail.com>
 <94672ed1-59fc-3a51-658d-364481418d8c@linux.vnet.ibm.com>
In-Reply-To: <94672ed1-59fc-3a51-658d-364481418d8c@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 21 Aug 2019 16:08:35 +1000
Message-ID: <CAOSf1CFPrhJoXYmV6E4rHZSSeFbYO3bYV7=r4v1x4Vwz19=0KA@mail.gmail.com>
Subject: Re: [PATCH] platform/powernv: Avoid re-registration of imc debugfs
 directory
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 3:37 PM Anju T Sudhakar <anju@linux.vnet.ibm.com> wrote:
>
> Hi,
>
> On 8/21/19 10:16 AM, Oliver O'Halloran wrote:
> > Is there a reason why we create the debugfs directory here and not in
> > opal_imc_counters_probe()? There's logic to remove the debugfs
> > directory in _probe() already so it seems like a more natural place to
> > it.
> >
> Good point. But we can only create the parent directory,
> i.e 'imc' directory in `_probe()` function and the entries can be
> created only here.

I know the entries can't be added in the probe function and I'm not
suggesting they should be.

> The reason is, this debugfs entries are only for
> IMC nest units. So, to get the imc mode and command values from
> the nest memory region we need the relevant offsets from the control
> block structure.
>
> Since imc_get_mem_addr_nest() function reads this address
> for each chip, we invoke the function to create the debugfs
> entries after this values are populated(i.e export_imc_mode_and_cmd() in
> invoked by imc_get_mem_addr_nest()).
>
> Also, if we create the parent directory in `_probe()` function,
> we need to track whether the entries(i.e imc_cmd and imc_mode) are
> created or not.

I think you should be tracking this anyway so you can do proper
cleanup if a debugfs entry can't be added. The current approach of
nuking the entire debugfs directory is pretty questionable.

> Regards,
>
> Anju
>
