Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF73AC4E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5r3D44SYz2xvf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 17:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MgJa/mVt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MgJa/mVt; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5r2h2J4Xz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 17:21:47 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id g19so211625qvx.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AseZqmRRFSAWxlkl2H15IzgmyWSQsQrTGUE3obWRyrM=;
 b=MgJa/mVtq6XWZKn0imgyglg6ZDupmBYLsc6nqx+ZO1zknwhEReGKbW0bIN9kjCm914
 7E0WAR6WoiSOPVxaB4Sadr237fXQYjs9EIPdgHjw9yI7oCPSKi4s9wk8qO8viYfzO3j3
 oX+nQ93PDsxTTWGmQ+zEoHHEzIbrkCpmblgepC5prfbUg/gCfpWMcO/C4y9jHTrhS7J9
 aDBO2TOUCs0o7DhFQLYvBcSNaj7d6xtPRM96we9l/KZVn0ibRSkALFFBsZamfIFH6mcS
 yO9FBRCXYYW6AVbx1b8Fo3NeTpoSHj0kqJzDZ75OBnVurCO3pnFCMY6pcN+WXE9z1ab5
 BNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AseZqmRRFSAWxlkl2H15IzgmyWSQsQrTGUE3obWRyrM=;
 b=eVlE4xjmDeJXHxFt6RnTk2roCxsPjwJmti+PKH/2I3hKS3U5rHCud+WgwddzAwO7m6
 hHlQPNetpCC3qbWMrKSN1e7XvRSKF8xkvVuJa0/GNYTQ3+6jQo0+tElWa/wMTjhm/Xby
 AwpMCtHznZJkbUtu8rGYwqS4YAdeCEAZp8wltT6rzw0FINOr7Q05oOGIaztTUo+/CLje
 DgE/TPhjjDVD7JSZE+sKmyvdWbC4nxMn3rWxcVCNa6nCsjConxFCberX62FpQjRY+1ed
 xL4znNgH9ZysGxRTJ7F2HNL6jirLSeZFJBQUZ+0xOiOQtj5G0P+RlpbQ7oG4/YVilCfq
 18TQ==
X-Gm-Message-State: AOAM533Dk/ZT5RsRUToqjC+8z+ifjQyGkwY+keMWDdTbWxuHFJbQCWVy
 vi2nQKAMqsPqy8WfhxVguw6POOO+TjGeOqnp4mg=
X-Google-Smtp-Source: ABdhPJzI+iK7/41znGGgZl/dbRcTtghUb49l1y3drihvMzNc/ZojRa6nxa5QP29LX6atdU7DeSKN+KsCA9Lpx5XaGQY=
X-Received: by 2002:a0c:f982:: with SMTP id t2mr4206794qvn.28.1624000902896;
 Fri, 18 Jun 2021 00:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210618060446.7969-1-wesley.sheng@amd.com>
In-Reply-To: <20210618060446.7969-1-wesley.sheng@amd.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 18 Jun 2021 17:21:32 +1000
Message-ID: <CAOSf1CHaLCAsnB42Je+ynJ6xv-M8qmScbfOLSHVze7D4fEh66Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: PCI: pci-error-recovery: rearrange the
 general sequence
To: Wesley Sheng <wesley.sheng@amd.com>
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
Cc: wesleyshenggit@sina.com, Jonathan Corbet <corbet@lwn.net>,
 linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linasvepstas@gmail.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 4:05 PM Wesley Sheng <wesley.sheng@amd.com> wrote:
>
> Reset_link() callback function was called before mmio_enabled() in
> pcie_do_recovery() function actually, so rearrange the general
> sequence betwen step 2 and step 3 accordingly.

I don't think this is true in all cases. If pcie_do_recovery() is
called with state==pci_channel_io_normal (i.e. non-fatal AER) the link
won't be reset. EEH (ppc PCI error recovery thing) also uses
.mmio_enabled() as described.
