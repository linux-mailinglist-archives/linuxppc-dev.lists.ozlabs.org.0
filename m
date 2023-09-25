Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F907ACED1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 05:55:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hiHuml4U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv8Cg6krSz3ddF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 13:55:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hiHuml4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv8Bm3nyhz3c28
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 13:54:24 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d81adf0d57fso6562507276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695614059; x=1696218859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITTBpzczqd4LSWTAD9aZOIvJ8J7Zcd7g95EdndUh4GE=;
        b=hiHuml4Uw4iU/HmjE9dcy2fGocvhVrYX88JGAoH1iIyHH+691LPPtKJVibjhd9SSM1
         sJxAiQB0p8OaC9Mw3aE7uvukKGkCNPO0eJpuUi7v3gye4xr6k8P45Zs8K9h1kfGtqa9E
         uhGG33i1nS4IZftZh+X1I7Mtt/C5S5ienyNgJ0ESzA9p4mXHN/53C2FESYSit0aeRWC9
         kI1MxAFWEOc/5QhtA0lQhn8BkXHLFNpHK01LT1dl0FPSrCMMEM+ChnYII01A2yLSDjj4
         K3px0eW8FiWI/P/2l7+rduSiAn3rgc1cB5/o5p7gAGjPUWGwOHCRAiSFuzs5/V8goH4+
         Ngxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614059; x=1696218859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITTBpzczqd4LSWTAD9aZOIvJ8J7Zcd7g95EdndUh4GE=;
        b=qgtoNqMEW3XJcNIaMkXp4JKA57Ekm3D/ZsPwkFoKeYChE9Pjy8UmwoUPJ3goT5XmtK
         7E3tK2Ech2B65vSx70OooXpWA80dmEHbSCTYbesf6+jixx3QHCqK/V5mE+GZhjr9o7ua
         YMODJqGF3U1oijL8zEgTH4pBW9q117FnAa6+f4TybE9ngk44NdPq4BUmx47nLT2kE/RI
         S3w/+wa4kM2DN+nSM5/rbb9L/bO57poCMB8xQne5BSJArrq+iHWXbUTvZjQRly9VyTp0
         dnYgDxUie6V4Zt9HT2NAhM4Ae8hzokJnIBSMSH+f4I7s4IIOYpI/CJVBtDCXf6mSUsJ/
         Kj4A==
X-Gm-Message-State: AOJu0YxdanaNAHrxAVor3TFHAzJ/DHmcybMt78/KaRW1VwH9bxv2RJuA
	DEABZwLskulOOnnc7DEqWV/gqFRV2hvVls+eUis=
X-Google-Smtp-Source: AGHT+IEPOLAmcobHAk1T8K+we8QFLN4PFzlGhEPu6UIp+fRvfWYf2Xav/jX3C/IYkXWacdxhlKDFU1i+P3s28fkvDpw=
X-Received: by 2002:a25:4106:0:b0:d78:be:6f02 with SMTP id o6-20020a254106000000b00d7800be6f02mr5161748yba.11.1695614059628;
 Sun, 24 Sep 2023 20:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <e486db16-d36d-9e14-4f10-dc755c0ef97d@linux.alibaba.com>
 <20230920230257.GA280837@bhelgaas> <625cdd6c55994bf3a50efd8f79680029@AcuMS.aculab.com>
In-Reply-To: <625cdd6c55994bf3a50efd8f79680029@AcuMS.aculab.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 25 Sep 2023 13:54:08 +1000
Message-ID: <CAOSf1CEML1s0pOpi92By9Ms4nnq5onSX-d7wCY4jXXAviXO_qg@mail.gmail.com>
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "james.morse@arm.com" <james.morse@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 8:23=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> > It would be nice if they worked the same, but I suspect that vendors
> > may rely on the fact that CPER_SEV_FATAL forces a restart/panic as
> > part of their system integrity story.
>
> The file system errors created by a panic (especially an NMI panic)
> could easily be more problematic than a failed PCIe data transfer.
> Evan a read that returned ~0u - which can be checked for.
>
> Panicking a system that is converting TDM telephony to RTP for the
> 911 emergency service because a PCIe cable/riser connecting one of the
> TDM board has become loose doesn't seem ideal.

For kernel native AER the default reaction to errors is
reset-and-reinit which probably isn't much better for your case.
Sounds like you would want a knob to suppress everything except error
reporting so you can handle it in userspace?

> (Or because the TDM board's fpga has decided it isn't going to respond
> to any accesses until the BARs are setup again...)
>
> The system can carry on with some TDM connections disabled - but that
> is ok because they are all duplicated in case a cable gets cuit.

Well that's a relief :)

Oliver
