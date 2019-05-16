Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248721FCE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 03:14:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454D3z3ppzzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 11:14:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e44; helo=mail-vs1-xe44.google.com;
 envelope-from=slandden@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KEhZy/OX"; 
 dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454D1h5XNBzDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 11:12:56 +1000 (AEST)
Received: by mail-vs1-xe44.google.com with SMTP id c24so1197340vsp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 18:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgZoxbTDVyX84i4y+3LndL3NzVvqWHnpZO7p1jkJ7Ps=;
 b=KEhZy/OXDTzbadNUidTvFlWZgU8jMoFElzhTBASPTsAPyeHF5qg/2fgL+RWgvkCjBF
 +bSM4xlnB3fHajXc4oDfg/qLobBEAMgf3KdVTM6uNCZ39rPYSb9AWN6yt9ZsX+aC8P1L
 39+4MdHdW9W4Mn6AxpDC6j2guqosV7XrUkdGXTgPJviZYHDAkLEoS4RzUbdBnOyzvk3h
 703cKvZjxWJ8VkXBrUeltOhSGnRD1vH9i9w9f0+wB0PVPHHXw5+01IF/izFaFC73142D
 WyCyQcQMwpIVHGpp8IDhjXIOms1kW5iMmfU8SWp3H9OOWc8PlbnQOzGVZQ2urMAC0O6q
 Nnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgZoxbTDVyX84i4y+3LndL3NzVvqWHnpZO7p1jkJ7Ps=;
 b=SC4F8iPEV5pJyjvgJABhijEpXY2wR7Y1PKSnlTQQNAesdonzbNIQIuqatE9cm49WU+
 hyz2hg8CFl5owP6g410eT8+OoXuafqBMglZTZorsEfxG6YzBkSUoHfuY+yLUi0ruxzKI
 Q6w9xPML1hb7TXeq7d9OTOyULQSF+iLBIy6bRncgzGhSM6WES40t7qaERFGixSonkWpl
 aKnihFJdpWrME9NN3gihtb0bB2ba2w7yuLB3vTC1KI591JlJcoyg7+DA5jk6zaBByL6x
 3wyFvZ3P1O4rm28t4TyZ1eOt+leeRbiWwXWUWKZ5KXlrUlwAP13zD1pcvubOb4pwqpPE
 3GCw==
X-Gm-Message-State: APjAAAVkNH6bIDDekDoQ4PqIlRew8GijQZ8FaYRFurzg+sgyPEt4wSoU
 HkLA5wCv7ftCPbLlKkU80OX5xoDgTGSzFaMLI2BnGxP0
X-Google-Smtp-Source: APXvYqw9XRCuBb7XZsJlDWqUorPr86Kjma7aG6pLne3VW0+QpztgswBChj0kW6h1O8zSuS0d+ohJybCQZyRp9OnOj30=
X-Received: by 2002:a67:904:: with SMTP id 4mr3206792vsj.231.1557969171638;
 Wed, 15 May 2019 18:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190513005104.20140-1-shawn@git.icu>
 <20190515013725.2198-1-shawn@git.icu>
 <568f62f6-7810-7179-f9aa-03f9df198fb6@c-s.fr>
In-Reply-To: <568f62f6-7810-7179-f9aa-03f9df198fb6@c-s.fr>
From: Shawn Landden <slandden@gmail.com>
Date: Wed, 15 May 2019 20:12:40 -0500
Message-ID: <CA+49okqLO_EHq0CuDgAMJY14eiGpaLoULFw9qutGF0G89vOU0A@mail.gmail.com>
Subject: Re: [v4 PATCH 1/2] [PowerPC] Add simd.h implementation
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 1:27 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Could you please as usual list here the changes provided by each version
> to ease the review ?
A bunch of embarrassing stuff that caused it not to build on some
set-ups (the functions were under the wrong include guards), and I
added include guards on simd.h so that you can use may_use_simd() even
if you don't have the FPU enabled (ARM's simd.h does this).
