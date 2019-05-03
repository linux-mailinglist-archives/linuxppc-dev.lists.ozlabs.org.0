Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C99129F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:35:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wQS11Wn8zDqWv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:35:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wQQh6GHDzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 18:34:04 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id w6so4605104otl.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 01:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xkA4rUZid498zuZlBKXewVkWxOql+ECkNVlns8NAUFM=;
 b=K1wVMUi7hOqav+5k51TAPJLDi1+gGnhxqDUG1KSmlz14ZWvPaSjj930QEmQZhVLk3y
 +YA427WatZ36MZMCcYk+hxcQ68BD3aGOl/2zZqZ2NBuPAckpRMhVaN+mfvlrzcTorCtI
 35eTMHSBdXoCwlbDzcevhRCq/uZB4V9KUaLOtQ/RfI/gWePMjt5K4ixk1Pzb1n/16KDq
 g7OQbXJ/LMXCUaAO3UtMvBABYcGGmN4oMYXurN+yP0pwgolM/F7KNsxFzRWebNg4wFLn
 SzQSCJpfXa79V2jfY1x9LEiwsz9dMCmYGIyShKhF7grj8M2QPFz1iIcHPRDmsj1DLXxV
 T40A==
X-Gm-Message-State: APjAAAUNl6hbgNZfuaKsvwsaOKU80sxiRKH2bompqrmIA4vzXGbh061x
 R/N+Syitwh7GpKKvYxyPrRckdPPDHkE29DHMcms=
X-Google-Smtp-Source: APXvYqxqFvOYZDyLSgY47TFcZH0BVRefctqjJ3IDvv/aFeXORlTO/ktwgTtKvHzK0w8/WXJ8EgoK2SVU7/XJofFa++Q=
X-Received: by 2002:a9d:19af:: with SMTP id k44mr5500477otk.300.1556872440898; 
 Fri, 03 May 2019 01:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <44wNKc0KZFz9sPd@ozlabs.org>
 <cf6948fb8ab8e395e139a3440f3600a6050c1efa.camel@perches.com>
In-Reply-To: <cf6948fb8ab8e395e139a3440f3600a6050c1efa.camel@perches.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 3 May 2019 10:33:49 +0200
Message-ID: <CA+7wUswrvpt7CmU0m3Di0W4-NVivZMGNqqoWNnHa-vhgMAVq_w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/ioda2: Add __printf format/argument
 verification
To: Joe Perches <joe@perches.com>
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
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 3, 2019 at 10:21 AM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-05-03 at 16:59 +1000, Michael Ellerman wrote:
> > On Thu, 2017-03-30 at 10:19:25 UTC, Joe Perches wrote:
> > > Fix fallout too.
> > >
> > > Signed-off-by: Joe Perches <joe@perches.com>
> >
> > Applied to powerpc next, thanks.
> >
> > https://git.kernel.org/powerpc/c/1e496391a8452101308a23b7395cdd49
>
> 2+ years later.
>
>

Can't wait until someone compute stats about largest delta (author
date / committer date)

;)
